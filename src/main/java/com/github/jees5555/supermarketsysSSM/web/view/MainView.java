package com.github.jees5555.supermarketsysSSM.web.view;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.jees5555.supermarketsysSSM.util.ServletUtil;
import com.github.jees5555.supermarketsysSSM.util.LanguageUtil;

@Controller
public class MainView {
	@RequestMapping({"/","index"})
	public String toLogin (HttpServletRequest request,HttpSession session,String language){
		Cookie userName=ServletUtil.getCookieByName(request, "userName");
		Cookie userPassword=ServletUtil.getCookieByName(request, "userPassword");
		
		if(userName!=null && userPassword!=null){
			return "redirect:/user/autologin";
		}
		if(language==null||language.equals("")){
			if(session.getAttribute("language")==null ||session.getAttribute("language").equals("")){
				language="zh-cn";
			}else{
				language=(String) session.getAttribute("language");
			}
			
		}
		session.setAttribute("language", language);
		request.setAttribute("displaykey", LanguageUtil.getDisplayKey(language));
		return "login";
	}
    @RequestMapping("main")
    public String toMain(HttpServletRequest request,HttpSession session){
    	request.setAttribute("displaykey", LanguageUtil.getDisplayKey((String)session.getAttribute("language")));
    	return "admin_index";
    }
	@RequestMapping("showTop")
	public String showTop (HttpServletRequest request,HttpSession session){
		request.setAttribute("displaykey", LanguageUtil.getDisplayKey((String)session.getAttribute("language")));
		return "admin_top";
	}
	@RequestMapping("showLeft")
	public String showLeft (){
		return "admin_left";
	}
	@RequestMapping("showWelcome")
	public String showWelcome (HttpServletRequest request,HttpSession session){
		request.setAttribute("displaykey", LanguageUtil.getDisplayKey((String)session.getAttribute("language")));
		return "admin_welcome";
	}
}
