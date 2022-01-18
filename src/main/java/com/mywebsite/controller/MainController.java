package com.mywebsite.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mywebsite.service.MainService;

/**
 * @name       :
 * @Author     : 박상무
 * @date       : 2022. 1. 14. 오전 11:16:56
 * @class      : MainController.java
 * 
 */
@RestController
@RequestMapping("/mywebsite")
public class MainController {

	private MainService mainService;
	private static final Log log = LogFactory.getLog(MainController.class);
	
	/**
	 * @name       : 메인페이지
	 * @MethodName : main
	 * @Author     : 박상무
	 * @date       : 2022. 1. 14. 오후 4:59:51
	 * @class      : MainController.java
	 * @returnType : void
	 * 
	 */
	@GetMapping("/main")
	public void main() {
		
	}
	
}
