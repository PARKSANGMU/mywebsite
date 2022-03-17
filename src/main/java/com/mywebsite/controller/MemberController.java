package com.mywebsite.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mywebsite.dto.UserDTO;
import com.mywebsite.service.MemberService;


/**
 * @name       : 회원 관리
 * @Author     : 박상무
 * @date       : 2022. 1. 27. 오전 10:07:55
 * @class      : MemberController.java
 * 
 */
@Controller
@RequestMapping("/member")
public class MemberController{

	@Autowired
	MemberService service;

    @Autowired
    private JavaMailSender mailSender;
	
	private static final Log log = LogFactory.getLog(MainController.class);
	
	/**
	 * @name       : 로그인 페이지
	 * @MethodName : loginGet
	 * @Author     : 박상무
	 * @date       : 2022. 1. 27. 오전 10:08:40
	 * @class      : MemberController.java
	 * @returnType : void
	 * 
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet(){
		log.info("로그인 페이지");
	}
	
	/**
	 * @name       : 회원가입 페이지
	 * @MethodName : joinGet
	 * @Author     : 박상무
	 * @date       : 2022. 1. 27. 오전 10:08:54
	 * @class      : MemberController.java
	 * @returnType : void
	 * 
	 */
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGet() {
		log.info("회원가입 페이지");
	}
	
	/**
	 * @name       : 회원가입
	 * @MethodName : joinPost
	 * @Author     : 박상무
	 * @date       : 2022. 2. 3. 오전 10:40:40
	 * @class      : MemberController.java
	 * @returnType : String
	 * 
	 */
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPost(UserDTO dto) {
		log.info("회원가입");
		
		// 회원가입 서비스 실행
		service.joinPost(dto);
		
		log.info("join service success");
		
		return "redirect:/main";
	}
	
	/**
	 * @name       : ID중복확인
	 * @MethodName : userIdChkPOST
	 * @Author     : 박상무
	 * @date       : 2022. 2. 3. 오후 4:59:09
	 * @class      : MemberController.java
	 * @returnType : void
	 * 
	 */
	@RequestMapping(value = "/userIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String userIdChkPOST(String userId) {
		log.info("userIdChk()");
		
		int result = service.idCheck(userId);
		log.info("결과값 = " + result);
		if(result != 0) {
			return "fail"; 	// 중복 아이디 존재
		}else {
			return "success"; // 중복 아이디 X
		}
	}
	
	/**
	 * @name       : 이메일 인증
	 * @MethodName : mailChkGET
	 * @Author     : 박상무
	 * @date       : 2022. 2. 3. 오후 6:20:41
	 * @class      : MemberController.java
	 * @returnType : void
	 * 
	 */
	@RequestMapping(value = "/mailChk", method = RequestMethod.GET)
	@ResponseBody
	public String mailChkGET(String userMail) {
		/* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + userMail);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int chkNum = random.nextInt(888888) + 111111;
        log.info("인증번호" + chkNum);
        /* 이메일 보내기 */
        String setFrom = "qkrtkdan31@naver.com";
        String toMail = "qkrtkdan31@naver.com";
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + chkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        }catch(Exception e) {
            e.printStackTrace();
        }
        String num = Integer.toString(chkNum);
        
        return num;
	}
}
