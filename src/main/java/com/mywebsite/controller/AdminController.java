package com.mywebsite.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @name       : 관리자 Controller
 * @Author     : 박상무
 * @date       : 2022. 3. 29. 오후 5:07:04
 * @class      : AdminController.java
 * 
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="main", method = RequestMethod.GET)
	public void adminMainGET() {
		
	}
	
}
