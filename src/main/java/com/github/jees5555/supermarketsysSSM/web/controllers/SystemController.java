package com.github.jees5555.supermarketsysSSM.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.jees5555.supermarketsysSSM.entity.Setting;
import com.github.jees5555.supermarketsysSSM.util.CookieUtil;

import static com.github.jees5555.supermarketsysSSM.constants.OperateContants.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("system")
public class SystemController {
	@RequestMapping("toSystemSetting")
	public String userSetting(Model model,HttpServletRequest request){
		Cookie billSkip=CookieUtil.getCookieByName(request,"billSkip");
		Cookie supplierSkip=CookieUtil.getCookieByName(request,"supplierSkip");
		Cookie userSkip=CookieUtil.getCookieByName(request,"userSkip");
		Cookie billItemsPerPage=CookieUtil.getCookieByName(request,"billItemsPerPage");
		Cookie supplierItemsPerPage=CookieUtil.getCookieByName(request,"supplierItemsPerPage");
		Cookie userItemsPerPage=CookieUtil.getCookieByName(request,"userItemsPerPage");
		System.out.println(billSkip.getValue());
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
		return "system/systemSetting";
	}
	@RequestMapping("saveSetting")
	@ResponseBody
	public String saveSetting(Setting setting,HttpServletResponse response){
		Boolean billSkip=setting.getBillSkip();
		Boolean supplierSkip=setting.getSupplierSkip();
		Boolean userSkip=setting.getUserSkip();
		Integer billItemsPerPage=setting.getBillItemsPerPage();
		Integer supplierItemsPerPage=setting.getSupplierItemsPerPage();
		Integer userItemsPerPage = setting.getUserItemsPerPage();
		if(billSkip!=null){
		CookieUtil.addCookie(response, "billSkip",billSkip.toString() ,Integer.MAX_VALUE);
		}
		if(supplierSkip!=null){
		CookieUtil.addCookie(response, "supplierSkip",supplierSkip.toString() , Integer.MAX_VALUE);
		}
		if(userSkip!=null){
		CookieUtil.addCookie(response, "userSkip",userSkip.toString(), Integer.MAX_VALUE);
		}
		if(billItemsPerPage!=null){
		CookieUtil.addCookie(response, "billItemsPerPage", billItemsPerPage.toString(), Integer.MAX_VALUE);
		}
		if(supplierItemsPerPage!=null){
		CookieUtil.addCookie(response, "supplierItemsPerPage",supplierItemsPerPage.toString(), Integer.MAX_VALUE);
		}
		if(userItemsPerPage!=null){
		CookieUtil.addCookie(response, "userItemsPerPage",userItemsPerPage.toString(), Integer.MAX_VALUE);
		}
		return SUCCESS.getName();
	}
}
