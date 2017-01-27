package com.github.jees5555.supermarketsysSSM.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import static com.github.jees5555.supermarketsysSSM.constants.OperateContants.*;
@Controller
@RequestMapping("user")
public class UserController {
	@Resource
	private UserService userService;

	@RequestMapping(method=RequestMethod.POST,value="/login")
	public String login(User user,Model model,HttpSession session){
		User u=userService.login(user);
		System.out.println(user.getUserName()+"  "+user.getUserPassword());
		if(u==null){
			model.addAttribute("msg", "用户名或密码不正确");
			return "login";
		}
		session.setAttribute("userId", u.getUserId());
		session.setAttribute("userName",u.getUserName());
		session.setAttribute("userRole", u.getUserRole());
		return "redirect:/main";	
	}
	
	@RequestMapping("logout")
	@ResponseBody
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userRole");
		String contextPath=request.getContextPath();
		return "<script>window.open ('"+contextPath+"/','_top')</script>";  
	}
	
	@RequestMapping("userList")
	public ModelAndView userList(User user){
		List<User> userList=userService.getUserList(user);
		ModelAndView mav =new ModelAndView("user/userList");
		mav.addObject("userList", userList);
		mav.addObject("userName", user.getUserName());
		return mav;
	}
	@RequestMapping("toUserAdd")
	public String toUserAdd (){
		return "user/userAddOrUpdate";
	}
	
	@RequestMapping("toUserUpdate")
	public String toUserUpdate(String userId,Model model){
		User user=userService.getUser(userId);
		model.addAttribute("user", user);
		return "user/userAddOrUpdate";
	}
	
	@RequestMapping("checkUser")
	@ResponseBody
	public String checkUser(User user){
		boolean isExist=userService.isUserExist(user);
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
			userService.addUser(user);
		}else{
			userService.updateUser(user);
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
		boolean isCorrect=userService.isUserPasswordCorrect(user);
		if(isCorrect){
			return SUCCESS.getName();
		}else{
			return FAILURE.getName();
		}
		
	}
	@RequestMapping("userPasswordUpdate")
	@ResponseBody
	public String userPasswordUpdate(User user,HttpSession session){
		int count=userService.updateUserPassword(user);
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
		userService.deleteUser(userId);
		return SUCCESS.getName();
	}
}
