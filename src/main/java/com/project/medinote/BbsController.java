package com.project.medinote;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bbs.util.Paging;
import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;
import mybatis.vo.MemVO;
import spring.util.FileUploadUtil;

@Controller
public class BbsController {
	
	@Autowired
	private BbsDAO b_dao;
	
	private int blockList = 2;  // 한페이지에 보여질 게시물 수
	private int blockPage = 3;   // 한블록당 보여질 페이지 번호
	
	@Autowired
	private  HttpSession session;  // 조회수 올리는 거 방지도 가능
	
	@Autowired
	private HttpServletRequest request;
	
	// 절대경로 얻기
	@Autowired
	private ServletContext application;
	
	// ↱ 첨부파일이 저장될 위치 만들기
	private String uploadPath = "/resources/upload";
	
	

	@RequestMapping("/bbs")
	public ModelAndView bbs(String cPage) {
		
		ModelAndView mv = new ModelAndView();
		
		
		// ↱총 게시물 수 구하기
		int rowTotal = b_dao.totalCount();
		
		// ↱현재 페이지 값인 cPage 파라미터 값이 넘어오지 않을 경우 무조건 1페이지임
		int c_page = 1;		
		if (cPage != null && cPage.trim().length() > 0 ) {
			c_page = Integer.parseInt(cPage);
		}
		
		Paging page = new Paging(c_page, rowTotal, blockList, blockPage); 
		
		
		// ↱게시판 목록을 배열로 얻어내기
		BbsVO[] ar = b_dao.getList(page.getBegin(), page.getEnd());
		
		mv.addObject("ar", ar);
		
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("nowPage", c_page);
		mv.addObject("p_code", page.getSb().toString());
		mv.addObject("blockList", blockList);
		

		mv.setViewName("bbs/list");			

		return mv;
	}
	
	
	@RequestMapping("/write")
	@ResponseBody
	public Map<String, String> write() {
		Map<String, String> map = new HashMap<String, String>();
		
		// 로그인 되었을 경우에만 글쓰는게 가능하게 만들기.
		// 로그인 안 되어있을 경우 로그인 하라고 알림창 띄우기.
		
		String u_id = (String)session.getAttribute("loginId");
		
		if (u_id.trim().length() > 0 & u_id != null) {
			map.put("chk", "1");
			map.put("url", "writeForm");
		}else {
			map.put("chk", "0");
		}
		
		//session.removeAttribute("loginId"); //로그아웃 안되어서 임시로 만듦
		
		return map;
	}
	
	
	@RequestMapping("/writeForm")
	public ModelAndView writeForm(String bname) {
		ModelAndView mv = new ModelAndView();
		
		String u_id = (String)session.getAttribute("loginId");
		
		if (u_id.trim().length() > 0 & u_id != null) {
			mv.setViewName("bbs/write");
		}else {
			mv.setViewName("login");
		}
		
		return mv;
	}
	
	
	
	@RequestMapping("/write_ok")          // ↱ new File() 때문에 하는것임 (io이용이므로 예외처리 해야함)
	public ModelAndView writeOK(BbsVO vo) throws Exception {
								// ↳ ★★wirte.jsp에서 전달되는 폼의 값들 -> (bname, subject, content, file) 을
						        // 멤버변수로 가지고 있는 ★★BbsVO★★로 모두 받는다.(스프링이라 자동으로 들어감) 
						        // (즉 넘어오는 이름이랑 VO변수 이름이 같아야함) (단! 파일 첨부인 경우에는 VO에 MultipartFile 로 선언해줘야함)
		ModelAndView mv = new ModelAndView();



		// ↱ 로그인한 정보를 얻어내서 writer를 알아내자 (왜냐하면 mapper에서 writer를 입력하도록 해놓았기 때문임)
		MemVO mvo = (MemVO)session.getAttribute("mvo");
		
		// ↱ ip 저장하기
		vo.setIp(request.getRemoteAddr());
		vo.setWriter(mvo.getU_nm());
		
		b_dao.add(vo);
		
		
		mv.setViewName("redirect:/bbs");  // reDirect로 가는 이유는 게시판 글 저장하고 새로운 글 목록을 보여주기 위함.
		
		return mv;	
	}
	
	
	@RequestMapping(value = "/write_summer", method = RequestMethod.POST)          
	@ResponseBody												// ↱ new File() 때문에 하는것임 (io이용이므로 예외처리 해야함)
	public Map<String, String> writeSummer(MultipartFile file) throws Exception {
								// ↳ ★★wirte.jsp에서 전달되는 폼의 값들 -> (bname, subject, content, file) 을
						        // 멤버변수로 가지고 있는 ★★BbsVO★★로 모두 받는다.(스프링이라 자동으로 들어감) 
						        // (즉 넘어오는 이름이랑 VO변수 이름이 같아야함) (단! 파일 첨부인 경우에는 VO에 MultipartFile 로 선언해줘야함)
		
		Map<String, String> map = new HashMap<String, String>();
		
		
		// ↱ 첨부된 파일이 있는지? 없는지? 확인하기.
		if (file != null && file.getSize() > 0) { // null은 안해도 되지만 다른 경로로 들어오는 경우에는 null이 들어올 수 있음
			// 첨부파일이 있는경우임.  ↱ 저장될 위치를 절대경로로 만든다.
			String path = application.getRealPath(uploadPath);
			
			System.out.println("경로확인-> "+path);
			
			// ↱파일명 얻기
			String f_name = file.getOriginalFilename();
			
			// ↱ ★★동일한 파일명이★★ 있을 수 있으므로 변경하기!~ 
			f_name = FileUploadUtil.checkSameFileName(f_name, path);
			
			
			// ↱ 업로드 진행!!~    ↱경로, ↱파일이름
			file.transferTo(new File(path, f_name));  // 예외처리 필요!!~
			
			//                   ↱"http://localhost:8080/ex" 이렇게 들어간다. 
			map.put("img_url", request.getContextPath()+"/upload/"+f_name);
			//                                             ↳ uploadPath를 적을경우 /resources/upload 로 들어가게 된다.
			//                                               현재 servlet-context에서 resources를(맵핑) 지워 놓았기에 resources가 들어가면 안된다.
			
			//map.put("f_name", f_name); // 파일네임 필요없으므로 주석처리
			
		}

		return map;	
	}
	
	

	@RequestMapping("/view")
	public ModelAndView view(String cPage, String idx) {
        						// ↳ 나중에 뒤로가기 or 목록 눌렀을 때 클릭하기 전 페이지로 돌아가기 위해 필요
								//   list.jsp에서 파라미터 값으로 넘어옴
		
		// ★★조회수★★ 만들기!!~
		// 한 번 본 게시물(BbsVO)인 경우에는 -> "List<BbsVO> v_list" 를 만들어 여기에 저장해 놓기.
		// 그리고 session에 "view_list"이름으로 저장해 놓고 -> 처음본 게시물인지 아닌지 확인하자.
		Object obj = session.getAttribute("view_list");  // 게시물을 보지 않았을 경우에는 obj는 null 값임
		List<BbsVO> v_list = null;
		
		if (obj == null) {
			// ↳↴ 게시물을 한번도 보지 않은 경우임 -> 이제 클릭을 했으므로 v_list를 만들고 -> session에 저장하자.
			v_list = new ArrayList<BbsVO>();
			
			// ↱현재 세션에 없는 경우이므로 세션에 v_list를 저장하자!!
			session.setAttribute("view_list", v_list);
			
		}else {  // sesseion에 "view_list"가 저장된 경우 임. 즉 게시물을 1번 이상 본경우임
			v_list = (List<BbsVO>) obj;  
           			// ↳즉 처음 게시물을 클릭했을 때 만들어져 seission에 저장해놓 은 vo(클릭한 게시물)를 다시 넣어줌
		}
		
		
		boolean chk = false;  // <- 반복문 돌릴때 idx가 있을 경우 chk를 true로 변경하기 위해서 만듦
		// v_list에 저장된 요소들 중에 idx가 -> 인자로 넘어온 idx와 같은 것이 있을 경우 예전에 한 번 본적이 있는 경우임
		// ↱ 처음 게시물을 클릭한 경우에는 v_list에 아무것도 없기 때문에 for문 돌지 않음.
		for(BbsVO bvo : v_list) { 
			if (bvo.getIdx().equals(idx)) {
				// ↳같은 것이 있는 경우 (즉 한번 봤던 경우임)
				chk = true;
				break;
			}
		}
			
		// ↱ 클릭한 게시글 불러오기
		BbsVO vo = b_dao.getBbs(idx);
		
		// ↱ 게시물을 한번도 보지 않았을 경우 hit수 증가하기 (즉 chk가 false인 경우 느낌표로 인해 true로 작동하겠지)
		if (!chk) {
			b_dao.updateHit(idx);
			vo.setHit(String.valueOf(Integer.parseInt(vo.getHit())+1));  // vo에 hit가 String으로 되어있어서 이렇게 해야함..
			
			// ↱ 위에서 만든 ArrayList에 게시글 추가해 놓기 (idx 비교해서 hit수 계속 증가하는거 막기 위해)
			v_list.add(vo);
		}
		
		
		ModelAndView mv = new ModelAndView();
		// ↱ 클릭한 게시글 저장
		mv.addObject("vo", vo);
		
		// ↱ ★포워드★로 이동하는 것으로 cPage변수를 view에서 사용가능 or mv.addObject로 추가해도 가능함
		mv.setViewName("bbs/view");			
		
		
		// ↱ ★★수정을 눌렀을 때 edit.jsp에서 표현하기 위해 session에 저장함!!!~ (cf. ModelAndView는 리퀘스트에 저장됨...)
		session.setAttribute("bvo", vo);
		
		return mv;
	}
	
	
	
	
	@RequestMapping("/bbsSearch")
	public ModelAndView search(String searchType, String searchValue) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("서치타입 벨류확인-> "+searchType+"/"+ searchValue);
		
		// ↱게시판 목록을 배열로 얻어내기
		BbsVO[] ar = b_dao.search(searchType, searchValue);
		
		mv.addObject("ar", ar);
		

		mv.setViewName("bbs/search");			

		return mv;
		
	}
	
	
	@RequestMapping("/test")
	public String test() {
		return "bbs/test";
	}
}
