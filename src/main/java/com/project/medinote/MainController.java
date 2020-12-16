package com.project.medinote;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.HomeDAO;
import mybatis.vo.HomeVO;

@Controller
public class MainController {
	@Autowired
	private HomeDAO h_dao;

	@Autowired
	private HttpSession session;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private ServletContext application;

	@RequestMapping(value = { "/", "/home" })
	public String home() {
		return "main/home";
	}

	@RequestMapping("/disease")
	public String disease() {
		return "main/disease";
	}

	@RequestMapping("/Body_Symptom")
	@ResponseBody
	public Map<String, Object> bodySymptom(String B_CD) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<HomeVO> list = h_dao.bodySymptom(B_CD);
		map.put("res", list);

		return map;
	}

	@RequestMapping("/showMore_ok")
	public ModelAndView showMore(HomeVO vo) {
		ModelAndView mv = new ModelAndView();
		String s_cd = vo.getS_cd();
		String[] s_cdar = s_cd.split(",");

		List<HomeVO> dList = h_dao.sympDisease(s_cdar);

		h_dao.addHist(s_cdar);
		h_dao.addUserSrch(s_cdar);
		List<String> s_nm = h_dao.srchS_NM(s_cdar);

		vo.setIp(request.getRemoteAddr());// ip저장!

		mv.addObject("s_nm", s_nm);
		mv.addObject("hvo", dList);
		mv.addObject("vo", vo);

		if (dList.size() > 0)
			mv.setViewName("main/disease");

		return mv;
	}

	@RequestMapping("/showMore")
	@ResponseBody
	public Map<String, Object> showMore(String[] s_cd) {
		Map<String, Object> map = new HashMap<String, Object>();

		boolean loginChk = false;
		if (session.getAttribute("loginId") == null) {
			map.put("loginChk", loginChk);
			return map;
		} else {
			loginChk = true;
		}

		// System.out.println(s_cd.length);
		List<HomeVO> dList = h_dao.sympDisease(s_cd);

		h_dao.addHist(s_cd);
		h_dao.addUserSrch(s_cd);
		List<String> s_nm = h_dao.srchS_NM(s_cd);

		String ip = request.getRemoteAddr();// ip저장!
		System.out.println(ip);
		map.put("hvo", dList);
		map.put("ip", ip);
		map.put("s_nm", s_nm);

		session.setAttribute("hvo", dList);
		session.setAttribute("ip", ip);
		session.setAttribute("s_nm", s_nm);

		return map;
	}


}
/*
 * @RequestMapping("/showMore")
 * 
 * @ResponseBody public Map<String, Object> showMore(String[] s_cd){ Map<String,
 * Object> map = new HashMap<String, Object>();
 * 
 * //System.out.println(s_cd.length); List<HomeVO> dList =
 * h_dao.sympDisease(s_cd);
 * 
 * h_dao.addHist(s_cd); h_dao.addUserSrch(s_cd); List<String> s_nm =
 * h_dao.srchS_NM(s_cd);
 * 
 * String ip = request.getRemoteAddr();// ip저장!
 * 
 * map.put("hvo", dList); map.put("ip", ip); map.put("s_nm", s_nm);
 * 
 * request.setAttribute("hvo", dList); request.setAttribute("ip", ip);
 * request.setAttribute("s_nm", s_nm);
 * 
 * if(dList.size() > 0)
 * 
 * 
 * return map; }
 */
