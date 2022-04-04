package com.mywebsite.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

/**
 * @name       : 로그인 인터셉터
 * 이전 작업 중 세션이 완전히 제거되지 않아 로그인을 위해 새로운 세션을 저장할 때 발생할 수 있는 에러를 방지하기 위해 로그인 메서드가 있는
 * MemberController에 진입하기 전 세션을 제거하는 작업
 * @Author     : 박상무
 * @date       : 2022. 4. 4. 오후 3:37:23
 * @class      : LoginInterceptor.java
 * 
 */
public class LoginInterceptor implements HandlerInterceptor{

	/**
	 * @name       : preHandle()메서드
	 * Controller에 진입하기 전에 작업을 하기위해 preHandle()메서드를 오버라이딩한다.
	 * @Author     : 박상무
	 * @date       : 2022. 4. 4. 오후 3:39:48
	 * @class      : LoginInterceptor.java
	 * 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return true;
	}
}
