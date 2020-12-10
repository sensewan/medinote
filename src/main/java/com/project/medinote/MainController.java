package com.project.medinote;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.dao.HomeDAO;
import mybatis.vo.HomeVO;

@Controller
public class MainController {
	@Autowired
	private HomeDAO h_dao;
	
	@Autowired
	private  HttpSession session; 
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping(value ={"/", "/home"})
	public String home() {
		return "main/home";
	}
	@RequestMapping("/disease")
	public String disease() {
		return "main/disease";
	}
	
	@RequestMapping("/Body_Symptom")
	@ResponseBody
	public Map<String, Object> bodySymptom(String B_CD){
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<HomeVO> list = h_dao.bodySymptom(B_CD);
		map.put("res", list);
		
		
		return map;
	}
}
