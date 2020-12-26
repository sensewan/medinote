package com.project.medinote;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	@RequestMapping("modal_main")
	public String modal_main() {
		return "test/modal_main";
	}
	
	@RequestMapping("modal_main2")
	public String modal_main2() {
		return "test/modal_main2";
	}
	
	@RequestMapping("test1")
	public String test1() {
		return "test/test1";
	}
	@RequestMapping("post1")
	public String post1() {
		return "test/post1";
	}
	@RequestMapping("post2")
	public String post2(String testAttr) {
		return "test/post2";
	}
	@RequestMapping("geotest")
	public String post2() {
		return "test/GeolocationTest";
	}
	
	@RequestMapping(value="/layout", method=RequestMethod.GET)	
	public String layout() {
		return "layout";
	}
	@RequestMapping(value="/layout2", method=RequestMethod.GET)	
	public String layout2() {
		return "layout2";
	}

	
	

}
