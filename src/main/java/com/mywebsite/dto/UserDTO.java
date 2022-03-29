package com.mywebsite.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @name       : 회원DB
 * @Author     : 박상무
 * @date       : 2022. 1. 28. 오후 5:17:51
 * @class      : UserDTO.java
 * 
 */
@ToString
@Getter
@Setter
public class UserDTO {

	private String userId;		// 회원 ID
	private String userPw;		// 회원 비밀번호
	private String userPwChk;	// 회원 비밀번호확인
	private String userName;	// 회원 이름
	private String userHpno;	// 회원 핸드폰번호
	private String userMail;	// 회원 이메일
	private String userAddr1;	// 회원 우편번호
	private String userAddr2;	// 회원 주소
	private String userAddr3;	// 회원 상세주소
	private Date regDate;		// 등록일자
	private int adminCK;		// 관리자 구분(0:일반사용자, 1:관리자)
}
