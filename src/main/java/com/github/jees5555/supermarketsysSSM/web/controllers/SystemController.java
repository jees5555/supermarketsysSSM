package com.github.jees5555.supermarketsysSSM.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.jees5555.supermarketsysSSM.entity.Setting;
import com.github.jees5555.supermarketsysSSM.util.ServletUtil;
import com.github.jees5555.supermarketsysSSM.util.LanguageUtil;

import static com.github.jees5555.supermarketsysSSM.constants.OperateContants.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("system")
public class SystemController {
	@RequestMapping("toSystemSetting")
	public String userSetting(Model model,HttpServletRequest request){
		Cookie billSkip=ServletUtil.getCookieByName(request,"billSkip");
		Cookie supplierSkip=ServletUtil.getCookieByName(request,"supplierSkip");
		Cookie userSkip=ServletUtil.getCookieByName(request,"userSkip");
		Cookie billItemsPerPage=ServletUtil.getCookieByName(request,"billItemsPerPage");
		Cookie supplierItemsPerPage=ServletUtil.getCookieByName(request,"supplierItemsPerPage");
		Cookie userItemsPerPage=ServletUtil.getCookieByName(request,"userItemsPerPage");
		if(billSkip!=null){
		model.addAttribute("billSkip",billSkip.getValue());
		}
		if(supplierSkip!=null){
		model.addAttribute("supplierSkip",supplierSkip.getValue());
		}
		if(userSkip!=null){
		model.addAttribute("userSkip",userSkip.getValue());
		}
		if(billItemsPerPage!=null){
		model.addAttribute("billItemsPerPage",billItemsPerPage.getValue());
		}
		if(supplierItemsPerPage!=null){
		model.addAttribute("supplierItemsPerPage",supplierItemsPerPage.getValue());
		}
		if(userItemsPerPage!=null){
		model.addAttribute("userItemsPerPage",userItemsPerPage.getValue());
		}
		model.addAttribute("displaykey", LanguageUtil.getDisplayKey((String)request.getSession().getAttribute("language")));
		return "system/systemSetting";
	}
	@RequestMapping("saveSetting")
	@ResponseBody
	public String saveSetting(Setting setting,HttpServletResponse response,HttpSession session,String language){
		Boolean billSkip=setting.getBillSkip();
		Boolean supplierSkip=setting.getSupplierSkip();
		Boolean userSkip=setting.getUserSkip();
		Integer billItemsPerPage=setting.getBillItemsPerPage();
		Integer supplierItemsPerPage=setting.getSupplierItemsPerPage();
		Integer userItemsPerPage = setting.getUserItemsPerPage();
		if(billSkip!=null){
		ServletUtil.addCookie(response, "billSkip",billSkip.toString() ,Integer.MAX_VALUE);
		}
		if(supplierSkip!=null){
		ServletUtil.addCookie(response, "supplierSkip",supplierSkip.toString() , Integer.MAX_VALUE);
		}
		if(userSkip!=null){
		ServletUtil.addCookie(response, "userSkip",userSkip.toString(), Integer.MAX_VALUE);
		}
		if(billItemsPerPage!=null){
		ServletUtil.addCookie(response, "billItemsPerPage", billItemsPerPage.toString(), Integer.MAX_VALUE);
		}
		if(supplierItemsPerPage!=null){
		ServletUtil.addCookie(response, "supplierItemsPerPage",supplierItemsPerPage.toString(), Integer.MAX_VALUE);
		}
		if(userItemsPerPage!=null){
		ServletUtil.addCookie(response, "userItemsPerPage",userItemsPerPage.toString(), Integer.MAX_VALUE);
		}
		if(language!=null&&!language.equals("")){
			ServletUtil.addCookie(response, "language",language, Integer.MAX_VALUE);
			session.setAttribute("language", language);
		}else{
			return FAILURE.getName();
		}
		return SUCCESS.getName();
	}
	@RequestMapping("defaultSetting")
	@ResponseBody
	public String defaultSetting(HttpServletResponse response){
		ServletUtil.removeCookieByName(response, "billSkip");
		ServletUtil.removeCookieByName(response, "supplierSkip");
		ServletUtil.removeCookieByName(response, "userSkip");
		ServletUtil.removeCookieByName(response, "billItemsPerPage");
		ServletUtil.removeCookieByName(response, "supplierItemsPerPage");
		ServletUtil.removeCookieByName(response, "userItemsPerPage");
		return SUCCESS.getName();
	}
}
