package com.github.jees5555.supermarketsysSSM.web.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainView {
	@RequestMapping({"/","index"})
	public String toLogin (){
		return "login";
	}
    @RequestMapping("main")
    public String toMain(){
    	return "admin_index";
    }
	@RequestMapping("showTop")
	public String showTop (){
		return "admin_top";
	}
	@RequestMapping("showLeft")
	public String showLeft (){
		return "admin_left";
	}
	@RequestMapping("showWelcome")
	public String showWelcome (){
		return "admin_welcome";
	}
}
