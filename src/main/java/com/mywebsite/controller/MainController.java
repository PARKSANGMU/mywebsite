package com.mywebsite.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mywebsite.service.MainService;

/**
 * @name       : 메인 컨트롤러
 * @Author     : 박상무
 * @date       : 2022. 1. 14. 오전 11:16:56
 * @class      : MainController.java
 * 
 */
@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	MainService mainService;
	
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
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main() {
		
	}
	
}
