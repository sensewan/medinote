package com.project.medinote;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mybatis.dao.BbsDAO;
import mybatis.dao.MypageDAO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAO mp_dao;
	
	@Autowired
	private  HttpSession session; 
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/myPage")
	public String myPage() {
		//System.out.println("3333");
		return "myPage/myPage";
	}
	
	@RequestMapping("/infoEdit")
	public String infoEdit() {
		return "myPage/infoEdit";
	}
	
	@RequestMapping("/infoEdit_ok")
	public String infoEdit_ok() {
		return "myPage/infoEdit_ok";
	}
	
	@RequestMapping("/myNote")
	public String myNote() {
		return "myPage/myNote";
	}
	
	@RequestMapping("/myComm")
	public String myComm() {
		return "myPage/myComm";
	}
}