package com.mywebsite.service;

import com.mywebsite.model.UserVO;

/**
 * @name       : 회원관리 Service
 * @Author     : 박상무
 * @date       : 2022. 3. 18. 오후 4:50:08
 * @class      : MemberService.java
 * 
 */
public interface MemberService  {

	// 회원가입
	public void joinPost(UserVO user);
	
	// 아이디 중복 검사
	public int idCheck(String userId);
	
	// 로그인
	public UserVO login(UserVO user);
}
