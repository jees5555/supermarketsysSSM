package com.github.jees5555.supermarketsysSSM.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.jees5555.supermarketsysSSM.exception.AccessDeniedException;
import com.github.jees5555.supermarketsysSSM.util.ServletUtil;

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
		String path = ServletUtil.getRequestPath(request);
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
			//允许修改账单和系统设置
			if(model.equals("bill")||model.contains("system")){
				return flag =true;
			}
			//进入用户的情况
			if(model.equals("user")){
				if(path.contains("userAfterOperateShow")||path.contains("toUserSetting")){
					return flag =true;
				}
				if(path.contains("toUserUpdate")||path.contains("userAddOrUpdate")||path.contains("toUserPasswordUpdate")
						||path.contains("checkUser")||path.contains("userPasswordUpdate")){
					String userId =request.getParameter("userId");
					Integer userIdSession = (Integer) request.getSession().getAttribute("userId");
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
