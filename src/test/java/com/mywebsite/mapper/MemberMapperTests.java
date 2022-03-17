package com.mywebsite.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mywebsite.dto.UserDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {

	@Autowired
	private MemberMapper membermapper;
	
	//회원가입 쿼리 테스트 메서드
//	@Test
//	public void joinPost() throws Exception{
//		UserDTO user = new UserDTO();
//		
//		user.setUserId("tkdan13");
//		user.setUserPw("s1234");
//		user.setUserPwChk("s1234");
//		user.setUserName("ParkSangMu");
//		user.setUserHpno("01056423493");
//		user.setUserMail("qkrtkdan31@naver.com");
//		user.setUserAddr1("14948");
//		user.setUserAddr2("경기도 시흥시 수인로 3395번길 56");
//		user.setUserAddr3("성진그린빌 303호");
//		
//		membermapper.joinPost(user);
//		
//	}
	
	@Test
	public void userIdChk() {
		String id = "admin";	// 존재하는 아이디
		String id2 = "test123";	// 존재하지 않는 아이디
		
		membermapper.idCheck(id);
		membermapper.idCheck(id2);
	}
	
}