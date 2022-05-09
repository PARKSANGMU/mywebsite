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
	
	/**
	 * @name       : 관리자페이지
	 * @MethodName : adminMainGET
	 * @Author     : 박상무
	 * @date       : 2022. 5. 9. 오후 1:51:43
	 * @class      : AdminController.java
	 * @returnType : void
	 * 
	 */
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public void adminMainGET() {
		logger.debug("이이이이이ㅣㅇ");
	}
	
	/**
	 * @name       : 상품 등록 페이지
	 * @MethodName : goodsEnroll
	 * @Author     : 박상무
	 * @date       : 2022. 5. 9. 오후 1:54:16
	 * @class      : AdminController.java
	 * @returnType : void
	 * 
	 */
	@RequestMapping(value = "/goodsEnroll", method = RequestMethod.GET)
	public void goodsEnroll() {
	}
	
	/**
	 * @name       : 상품 관리 페이지
	 * @MethodName : goodsManageGET
	 * @Author     : 박상무
	 * @date       : 2022. 5. 9. 오후 1:52:50
	 * @class      : AdminController.java
	 * @returnType : void
	 * 
	 */
	@RequestMapping(value = "/goodsManage", method = RequestMethod.GET)
	public void goodsManageGET() {
		
	}
	
	
	
}
