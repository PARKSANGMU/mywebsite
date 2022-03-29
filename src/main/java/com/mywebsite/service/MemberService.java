package com.mywebsite.service;

import com.mywebsite.dto.UserDTO;

/**
 * @name       : 회원관리 Service
 * @Author     : 박상무
 * @date       : 2022. 3. 18. 오후 4:50:08
 * @class      : MemberService.java
 * 
 */
public interface MemberService  {

	// 회원가입
	public void joinPost(UserDTO dto);
	
	// 아이디 중복 검사
	public int idCheck(String userId);
	
	// 로그인
	public UserDTO login(UserDTO dto);
}
