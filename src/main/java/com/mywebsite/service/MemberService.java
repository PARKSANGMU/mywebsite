package com.mywebsite.service;

import com.mywebsite.dto.UserDTO;

public interface MemberService  {

	// 회원가입
	public void joinPost(UserDTO dto);
	
	// 아이디 중복 검사
	public int idCheck(String userId);
}
