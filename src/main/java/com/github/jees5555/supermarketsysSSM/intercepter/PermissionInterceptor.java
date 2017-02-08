package com.github.jees5555.supermarketsysSSM.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.jees5555.supermarketsysSSM.exception.AccessDeniedException;

import java.util.List;

public class PermissionInterceptor extends BaseIntercepter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (this.exclude(request)) {
			return true;
		}
		return checkPermission(request);
	}

	private boolean checkPermission(HttpServletRequest request) throws Exception {
		boolean flag = false;
		String path = request.getServletPath();
		// 截取模块名称
		String[] urls = path.split("/");
		String model = urls[1];
		// 排除项目
		if (urls.length<=2|| path.contains("login") || path.contains("logout")) {
			return true;
		}
		// 获取当前用户的权限功能,如果是管理员或经理,开放所有权限
		Integer userRole = (Integer) request.getSession().getAttribute("userRole");
		if(userRole !=0){
			return flag =true;
		//普通用户	
		}else{
			//允许修改账单
			if(model.equals("bill")){
				return flag =true;
			}
			//进入用户的情况
			if(model.equals("user")){
				if(path.contains("toUserPasswordUpdate")||path.contains("userAfterOperateShow")){
					return flag =true;
				}
				if(path.contains("toUserUpdate")||path.contains("userAddOrUpdate")
						||path.contains("checkUser")||path.contains("userPasswordUpdate")){
					String userId =request.getParameter("userId");
					Integer userIdSession = (Integer) request.getSession().getAttribute("userId");
					System.out.println(userId+"  "+userIdSession);
					if(userId.equals(userIdSession.toString())){
						return flag =true;
					}
				}
			}
			//不允许修改供应商
		}
		if (!flag) {
			throw new AccessDeniedException("拒绝访问，你可能没有合适的权限");
		}
		return flag;
	}

}
