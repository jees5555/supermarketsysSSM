package com.github.jees5555.supermarketsysSSM.web.view;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.jees5555.supermarketsysSSM.entity.User;
import com.github.jees5555.supermarketsysSSM.util.CookieUtil;
import com.github.jees5555.supermarketsysSSM.web.controllers.UserController;

@Controller
public class MainView {
	@RequestMapping({"/","index"})
	public String toLogin (HttpServletRequest request,HttpSession session){
		Cookie userName=CookieUtil.getCookieByName(request, "userName");
		Cookie userPassword=CookieUtil.getCookieByName(request, "userPassword");
		if(userName!=null && userPassword!=null){
			return "redirect:/user/autologin";
		}
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
