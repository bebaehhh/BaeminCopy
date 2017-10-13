package com.ktds.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		boolean isLogin = session.getAttribute("_USER_") != null;
		
		if( !isLogin ) {
			response.sendRedirect(request.getContextPath() + "/user/login");
		}
		return isLogin;
	}

}
