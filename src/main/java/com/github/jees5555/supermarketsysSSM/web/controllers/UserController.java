package com.github.jees5555.supermarketsysSSM.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.CookieSupport;
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
import com.github.jees5555.supermarketsysSSM.util.CookieUtil;
import com.github.jees5555.supermarketsysSSM.util.Page;

import static com.github.jees5555.supermarketsysSSM.constants.OperateContants.*;
@Controller
@RequestMapping("user")
public class UserController {
	@Resource
	private UserService us;
	
	@RequestMapping(method=RequestMethod.GET,value="/autologin")
    public String autoLogin(HttpServletResponse response,HttpServletRequest request,HttpSession session){
		Cookie userName=CookieUtil.getCookieByName(request, "userName");
		Cookie userPassword=CookieUtil.getCookieByName(request, "userPassword");
		User user =new User();
		user.setUserName(userName.getValue());
		user.setUserPassword(userPassword.getValue());
    	user=us.login(user);
		if(user==null){
			CookieUtil.removeCookieByName(response, "userName");
			CookieUtil.removeCookieByName(response, "userPassword");
			return "redirect:/";
		}else{
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("userName",user.getUserName());
			session.setAttribute("userRole", user.getUserRole());
			return "redirect:/main";
		}
    }
	
	@RequestMapping(method=RequestMethod.POST,value="/login")
	public String login(User user,boolean autologin,Model model,HttpSession session,
			HttpServletResponse response){
		user=us.login(user);
		if(user==null){
			model.addAttribute("msg", "用户名或密码不正确");
			return "login";
		}
		if(autologin){
			CookieUtil.addCookie(response, "userName", user.getUserName(), Integer.MAX_VALUE);
			CookieUtil.addCookie(response, "userPassword", user.getUserPassword(), Integer.MAX_VALUE);
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
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userRole");
		CookieUtil.removeCookieByName(response, "userName");
		CookieUtil.removeCookieByName(response, "userPassword");
		String contextPath=request.getContextPath();
		return "<script>alert('用户已退出');window.open ('"+contextPath+"/','_top')</script>";  
	}
	
	
	@RequestMapping("userList")
	public ModelAndView userList(User user,Page page,HttpServletRequest request){
		Cookie userItemsPerPage=CookieUtil.getCookieByName(request, "userItemsPerPage");
		if(userItemsPerPage!=null&& !page.isItemsPerPageSetted()){
		     page.setItemsPerPage(Integer.parseInt(userItemsPerPage.getValue()));
		}
		List<User> userList=us.getUserList(user,page);
		ModelAndView mav =new ModelAndView("user/userList");
		mav.addObject("userList", userList);
		mav.addObject("userName", user.getUserName());
		mav.addObject("page",page);
		return mav;
	}
	@RequestMapping("toUserAdd")
	public String toUserAdd (){
		return "user/userAddOrUpdate";
	}
	
	@RequestMapping("toUserUpdate")
	public String toUserUpdate(String userId,Model model){
		User user=us.getUser(userId);
		model.addAttribute("user", user);
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
