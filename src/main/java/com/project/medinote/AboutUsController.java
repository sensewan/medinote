package com.project.medinote;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutUsController {

	@RequestMapping("/AboutUs")
	public String aboutUs() {
		return "AboutUs";
	}

}
