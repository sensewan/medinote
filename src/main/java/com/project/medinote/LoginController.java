package com.project.medinote;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value="/find3", method=RequestMethod.GET)	//GET諛⑹떇�� �깮�왂媛��뒫
	public String Find3() {
		return "login/find3";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)	//GET諛⑹떇�� �깮�왂媛��뒫
	public String Join() {
		return "login/join";
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)	//GET諛⑹떇�� �깮�왂媛��뒫
	public String Login() {
		return "login/login";
	}
	
	@RequestMapping(value="/login2", method=RequestMethod.GET)	//GET諛⑹떇�� �깮�왂媛��뒫
	public String Login2() {
		return "login/login2";
	}
	
	@RequestMapping(value="/find", method=RequestMethod.GET)	//GET諛⑹떇�� �깮�왂媛��뒫
	public String Find() {
		return "login/find";
	}
	
	@RequestMapping(value="/find2", method=RequestMethod.GET)	//GET諛⑹떇�� �깮�왂媛��뒫
	public String Find2() {
		return "login/find2";
	}
}
