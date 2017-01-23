package com.github.jees5555.supermarketsysSSM.web.view;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserView {
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
	@RequestMapping("toUserAdd")
	public String toUserAdd (){
		return "user/userAddOrUpdate";
	}
	@RequestMapping("userAfterOperateShow")
	public String userAfterOperateShow(HttpSession session){
		if((Integer)session.getAttribute("userRole")==0){
			return "redirect:showWelcome";
		}else{
			return "redirect:userList";
		}
	}
	
}
