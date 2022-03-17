package com.mywebsite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mywebsite.dto.UserDTO;
import com.mywebsite.mapper.MemberMapper;

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
}
