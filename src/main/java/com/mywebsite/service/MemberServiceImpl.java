package com.mywebsite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mywebsite.dto.UserDTO;
import com.mywebsite.mapper.MemberMapper;

/**
 * @name       : 회원관리 ServiceImpl
 * @Author     : 박상무
 * @date       : 2022. 3. 18. 오후 4:50:18
 * @class      : MemberServiceImpl.java
 * 
 */
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper membermapper;
	
	// 회원가입 
	public void joinPost(UserDTO dto) {
		
		membermapper.joinPost(dto);
	}
	
	// 아이디 중복 확인
	public int idCheck(String userId) {
		
		return membermapper.idCheck(userId);
	}

	// 로그인
	public UserDTO login(UserDTO dto) {
		return membermapper.login(dto);
	}
	
	
	
}
