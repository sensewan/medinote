package com.project.medinote;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		System.out.println(testAttr);
		return "test/post2";
	}
	
	

}
