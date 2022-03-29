package com.mywebsite.mapper;

import org.springframework.stereotype.Repository;

import com.mywebsite.dto.UserDTO;

/**
 * @name       : 회원 관리 Mapper
 * @Author     : 박상무
 * @date       : 2022. 1. 28. 오후 6:05:43
 * @class      : MemberMapper.java
 * 
 */
@Repository
public interface MemberMapper {
	
	// 회원가입
	public void joinPost(UserDTO dto);
	
	// 아이디 중복확인
	public int idCheck(String userId);
	
	// 로그인
	public UserDTO login(UserDTO dto);
}
