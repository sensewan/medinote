package com.project.medinote;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bbs.util.Paging;
import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

@Controller
public class BbsController {
	
	@Autowired
	private BbsDAO b_dao;
	
	private int blockList = 10;  // 한페이지에 보여질 게시물 수
	private int blockPage = 5;   // 한블록당 보여질 페이지 번호

	@RequestMapping("/bbs")
	public ModelAndView bbs(String cPage) {
		
		ModelAndView mv = new ModelAndView();
		
		
		// ↱총 게시물 수 구하기
		int rowTotal = b_dao.totalCount();
		
		// ↱현재 페이지 값인 cPage 파라미터 값이 넘어오지 않을 경우 무조건 1페이지임
		int c_page = 1;		
		if (cPage != null) {
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
	public String write() {
		return "bbs/write";
	}
	
	@RequestMapping("/view")
	public String view() {
		return "bbs/view";
	}
	@RequestMapping("/test")
	public String test() {
		return "bbs/test";
	}
}
