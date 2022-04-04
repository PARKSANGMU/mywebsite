package com.mywebsite.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.mywebsite.dto.UserDTO;

/**
 * @name       : 관리자페이지 인터셉터
 * 관리자 메서드("/admin/**")에 접근하는 사용자의 adminCk 1인지 확인하는 작업
 * ("user" session정보를 UserDTO타입의 변수에 담은 후, 해당 변수를 통해 adminCk의 값을 호출하여 비교하는 로직을 작성해야됨) 
 * @Author     : 박상무
 * @date       : 2022. 4. 4. 오후 3:41:53
 * @class      : AdminInterceptor.java
 * 
 */
public class AdminInterceptor implements HandlerInterceptor{
	
	/**
	 * @name       : preHandle
	 * "member" session을 호출하여 UserDTO타입의 lvo 변수에 저장(UserDTO 타입으로 형 변환(Casting)해주어야 됨)
	 * @Author     : 박상무
	 * @date       : 2022. 4. 4. 오후 4:01:55
	 * @class      : AdminInterceptor.java
	 * 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		
		UserDTO lvo = (UserDTO)session.getAttribute("user");
		
		if(lvo == null || lvo.getAdminCK() == 0) {	// 관리자 계정이 아닌 경우
			
			response.sendRedirect("/main");		// 메인페이지로 리다이렉트
			
			return false;
		}
		
		return true;	// 관리자 계정 로그인 경우(lvo != null && lvo.getAdminCk() == 1)
	}

}
