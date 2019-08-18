package com.github.jees5555.supermarketsysSSM.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.jees5555.supermarketsysSSM.entity.User;
import com.github.jees5555.supermarketsysSSM.exception.MyException;
import com.github.jees5555.supermarketsysSSM.service.UserService;
import com.github.jees5555.supermarketsysSSM.util.ServletUtil;
import com.github.jees5555.supermarketsysSSM.util.LanguageUtil;
import com.github.jees5555.supermarketsysSSM.util.Page;

import static com.github.jees5555.supermarketsysSSM.constants.OperateContants.*;
@Controller
@RequestMapping("user")
public class UserController {
	@Resource
	private UserService us;
	
	@RequestMapping(method=RequestMethod.GET,value="/autologin")
    public String autoLogin(HttpServletResponse response,HttpServletRequest request,HttpSession session){
		Cookie userName=ServletUtil.getCookieByName(request, "userName");
		Cookie userPassword=ServletUtil.getCookieByName(request, "userPassword");
		Cookie cLanguage=ServletUtil.getCookieByName(request, "language");
		User user =new User();
		String language;
		user.setUserName(userName.getValue());
		user.setUserPassword(userPassword.getValue());
    	user=us.login(user);
		if(user==null){
			ServletUtil.removeCookieByName(response, "userName");
			ServletUtil.removeCookieByName(response, "userPassword");
			return "redirect:/";
		}else{
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("userName",user.getUserName());
			session.setAttribute("userRole", user.getUserRole());
			if(cLanguage==null){
				language="zh-cn";
			}else{
				language=cLanguage.getValue();
			}
			session.setAttribute("language", language);
			return "redirect:/main";
		}
    }
	
	@RequestMapping(method=RequestMethod.POST,value="/login")
	public String login(User user,boolean autologin,Model model,HttpSession session,
			HttpServletRequest request,HttpServletResponse response,String language){
		user=us.login(user);
		if(user==null){
			model.addAttribute("msg",  LanguageUtil.getDisplayKey(language).get("login.usrorpwd.error"));
			request.setAttribute("displaykey", LanguageUtil.getDisplayKey(language));
			return "login";
		}
		if(autologin){
			ServletUtil.addCookie(response, "userName", user.getUserName(), Integer.MAX_VALUE);
			ServletUtil.addCookie(response, "userPassword", user.getUserPassword(), Integer.MAX_VALUE);
			ServletUtil.addCookie(response, "language", language, Integer.MAX_VALUE);
		}
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("userName",user.getUserName());
		session.setAttribute("userRole", user.getUserRole());
		return "redirect:/main";	
	}
	
	@RequestMapping("logout")
	@ResponseBody
	public String logout(HttpServletResponse response,HttpServletRequest request){
		HttpSession session=request.getSession();
		String language =(String) session.getAttribute("language");
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userRole");
		session.removeAttribute("language");
		ServletUtil.removeCookieByName(response, "userName");
		ServletUtil.removeCookieByName(response, "userPassword");
		ServletUtil.removeCookieByName(response, "language");
		String contextPath=request.getContextPath();
		return "<script>alert('"+LanguageUtil.getDisplayKey(language).get("logout.msg")+"');"+
				"window.open ('"+contextPath+"/?language="+language+"','_top')</script>";  
	}
	
	
	@RequestMapping("userList")
	public ModelAndView userList(User user,Page page,HttpServletRequest request){
		Cookie userItemsPerPage=ServletUtil.getCookieByName(request, "userItemsPerPage");
		if(userItemsPerPage!=null&& !page.isItemsPerPageSetted()){
		     page.setItemsPerPage(Integer.parseInt(userItemsPerPage.getValue()));
		}
		List<User> userList=us.getUserList(user,page);
		ModelAndView mav =new ModelAndView("user/userList");
		mav.addObject("userList", userList);
		mav.addObject("userName", user.getUserName());
		mav.addObject("page",page);
		mav.addObject("displaykey",LanguageUtil.getDisplayKey((String)request.getSession().getAttribute("language")));
		return mav;
	}
	@RequestMapping("toUserAdd")
	public String toUserAdd (Model model,HttpServletRequest request){
		Cookie userSkip=ServletUtil.getCookieByName(request, "userSkip");
		if(userSkip!=null){
			model.addAttribute("userSkip",userSkip.getValue());
		}else{
			model.addAttribute("userSkip","false");
		}
		model.addAttribute("displaykey",LanguageUtil.getDisplayKey((String)request.getSession().getAttribute("language")));
		return "user/userAddOrUpdate";
	}
	
	@RequestMapping("toUserUpdate")
	public String toUserUpdate(String userId,Model model,HttpServletRequest request){
		User user=us.getUser(userId);
		model.addAttribute("user", user);
		model.addAttribute("displaykey",LanguageUtil.getDisplayKey((String)request.getSession().getAttribute("language")));
		return "user/userAddOrUpdate";
	}
	
	@RequestMapping("checkUser")
	@ResponseBody
	public String checkUser(User user){
		boolean isExist=us.isUserExist(user);
		if(isExist){
			return FAILURE.getName();
		}else{
			return SUCCESS.getName();
		}
	}
	@RequestMapping("userAddOrUpdate")
	@ResponseBody
	public String userAddOrUpdate(@Validated User user,BindingResult result,HttpSession session){
		if(result.hasErrors()){
			throw new MyException("参数错误");
			}
		if(user.getUserId()==null){
			us.addUser(user);
		}else{
			us.updateUser(user);
		}
		return SUCCESS.getName();
	}
	@RequestMapping("toUserPasswordUpdate")
	public String toUserPasswordUpdate(String userId,Model model){
		model.addAttribute("userId", userId);
		return "user/passwordUpdate";
	}
	@RequestMapping("checkUserPassword")
	@ResponseBody
	public String checkUserPassword(User user){
		boolean isCorrect=us.isUserPasswordCorrect(user);
		if(isCorrect){
			return SUCCESS.getName();
		}else{
			return FAILURE.getName();
		}
		
	}
	@RequestMapping("userPasswordUpdate")
	@ResponseBody
	public String userPasswordUpdate(User user,HttpSession session){
		int count=us.updateUserPassword(user);
		if(count==1){
			return SUCCESS.getName();
		}else{
			return FAILURE.getName();
		}
	}
	@RequestMapping("userAfterOperateShow")
	public String userAfterOperateShow(HttpSession session){
		if((Integer)session.getAttribute("userRole")==0){
			return "redirect:/showWelcome";
		}else{
			return "redirect:userList";
		}
	}
	@RequestMapping("userDelete")
	@ResponseBody
	public String userDelete(String userId){
		us.deleteUser(userId);
		return SUCCESS.getName();
	}
}
