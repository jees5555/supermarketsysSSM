package com.github.jees5555.supermarketsysSSM.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginIntercepter extends BaseIntercepter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 排除登录页面
		if (this.exclude(request)) {
			return true;
		} else {
			// 登录验证
			return checkLogin(request, response);
		}
	}

	// 验证登录方法
	private boolean checkLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 如果用户已经登录放行
		if (request.getSession().getAttribute("userId") != null) {
			return true;
		} else {
			// 非法请求 即这些请求需要登录后才能访问
			// 重定向到登录页面
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("<html>");  
			response.getWriter().println("<script>");  
			response.getWriter().println("alert('你尚未登陆或会话已过期');"); 
			response.getWriter().println("alert('DEBUG:ServletPath"+request.getServletPath()+"');");
			response.getWriter().println("alert('DEBUG:ContextPath"+request.getContextPath()+"');");
			response.getWriter().println("window.open ('"+request.getContextPath()+"','_top');");  
			response.getWriter().println("</script>");  
			response.getWriter().println("</html>");  
			return false;
		}
	}



}
