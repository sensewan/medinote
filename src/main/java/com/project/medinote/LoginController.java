package com.project.medinote;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.LoginDAO;
import mybatis.dao.MemDAO;
import mybatis.vo.MemVO;

@Controller
public class LoginController {
	
	@Autowired
	LoginDAO loginDAO;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	

	@RequestMapping(value="/find3", method=RequestMethod.GET)	
	public String Find3() {
		return "login/find3";
	}
	
	@RequestMapping(value = { "/join"})	
	public ModelAndView join(MemVO vo) {
		ModelAndView mv = new ModelAndView();
		
		
		String method = request.getMethod().toUpperCase();
		if(method.equalsIgnoreCase("POST")) {
			//System.out.println("vo : " + vo.toString());
			loginDAO.login(vo);
			
		}else {
			
		}
		mv.setViewName("login/join");

		return mv;
		
	}
	
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object>idChk(String u_id){
		Map<String, Object> map = new HashMap<String, Object>();

		boolean result = loginDAO.idChk(u_id);

		map.put("idChk", result);
		
		return map;
	}
	
	//로그인 페이지로 이동
	@RequestMapping(value= {"/login"}, method=RequestMethod.GET)	
	public String login() {
		return "login/login";
	}
	
	//로그인 버튼 클릭 시 이벤트
	@RequestMapping(value="/login", method=RequestMethod.POST)	
	@ResponseBody
	public Map<String, Object> loginChk(String u_id, String u_pw) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//ID,PW 비교
		boolean result = loginDAO.loginChk(u_id, u_pw);
		
		//로그인 성공시 session에 저장
		session.setAttribute("loginId", u_id);
		
		//로그인 성공 여부(boolean) 반환
		map.put("loginChk", result);
		
		return map;
	}
	
	//아이디 찾기 이벤트
	//이름과 전화번호가 동일할 경우 아이디 반환
	@RequestMapping(value="/findId", method=RequestMethod.POST)	
	@ResponseBody
	public Map<String, Object> findId(String u_nm, String phone) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//아이디 찾기
		String result = loginDAO.findId(u_nm, phone);
		
		//검색된 아이디 반환
		map.put("findId", result);
		
		return map;
	}
	
	
	
	//비밀번호 찾기 이벤트
	//아이디, 이름, 전화번호가 동일할 경우 결과(boolean) 반환
	@RequestMapping(value="/findPw", method=RequestMethod.POST)	
	@ResponseBody
	public Map<String, Object> findPw(String u_id, String u_nm, String phone) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//비밀번호 찾기
		boolean result = loginDAO.findPw(u_id, u_nm, phone);
		
		//결과(boolean) 반환
		map.put("findPw", result);
		
		return map;
	}
	
	//비밀번호 변경 이벤트
	//아이디, 이름, 전화번호가 동일할 경우 결과(boolean) 반환
	@RequestMapping(value="/ChangePw", method=RequestMethod.POST)	
	@ResponseBody
	public Map<String, Object> ChangePw(String u_id, String u_pw) {
		Map<String, Object> map = new HashMap<String, Object>();
	
		//System.out.println("u_id : " + u_id + ", u_pw : " + u_pw);
		
		boolean result = loginDAO.changePw(u_id, u_pw);
		
		//결과(boolean) 반환
		map.put("chk", result);
		
		return map;
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="/login2", method=RequestMethod.GET)	
	public String Login2() {
		return "login/login2";
	}
	
	@RequestMapping(value="/find", method=RequestMethod.GET)	
	public String Find() {
		return "login/find";
	}
	
	@RequestMapping(value="/find2", method=RequestMethod.GET)	
	public String Find2() {
		return "login/find2";
	}
	
	@RequestMapping(value="/layout", method=RequestMethod.GET)	
	public String layout() {
		return "layout";
	}
	@RequestMapping(value="/layout2", method=RequestMethod.GET)	
	public String layout2() {
		return "login/layout2";
	}
	@RequestMapping(value="/layout3", method=RequestMethod.GET)	
	public String layout3() {
		return "login/layout3";
	}
	@RequestMapping(value="/layout4", method=RequestMethod.GET)	
	public String layout4() {
		return "login/layout4";
	}
	@RequestMapping(value="/layout5", method=RequestMethod.GET)	
	public String layout5() {
		return "login/layout5";
	}
	
	@RequestMapping(value="/layout6", method=RequestMethod.GET)	
	public String layout6() {
		return "login/layout6";
	}
	
	
	

}
