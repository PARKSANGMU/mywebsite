package com.mywebsite.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mywebsite.service.MemberService;

@RestController
@RequestMapping("/member")
public class MemberController {

	private MemberService memberService;
	private static final Log log = LogFactory.getLog(MemberController.class);
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@GetMapping("/join")
	public void join() {
		
	}
}
