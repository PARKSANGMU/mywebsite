package com.mywebsite.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mywebsite.model.GoodsVO;
import com.mywebsite.service.AdminService;

/**
 * @name       : 관리자페이지 Controller
 * @Author     : 박상무
 * @date       : 2022. 3. 29. 오후 5:07:04
 * @class      : AdminController.java
 * 
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
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
	}
	
	/**
	 * @throws Exception 
	 * @name       : 상품 등록 페이지
	 * @MethodName : goodsEnroll
	 * @Author     : 박상무
	 * @date       : 2022. 5. 9. 오후 1:54:16
	 * @class      : AdminController.java
	 * @returnType : void
	 * 
	 */
	@RequestMapping(value = "/goodsEnroll", method = RequestMethod.GET)
	public void goodsEnrollGET(Model model) throws Exception {
		
		ObjectMapper objm = new ObjectMapper();
		
		List list = adminService.cateList();
		
		String cateList = objm.writeValueAsString(list);
		
		model.addAttribute("cateList", cateList);
		
	}
	
	/**
	 * @name       : 상품 등록
	 * @MethodName : goodsEnrollPOST
	 * @Author     : 박상무
	 * @date       : 2022. 5. 10. 오후 2:46:49
	 * @class      : AdminController.java
	 * @returnType : String
	 * 
	 */
	@PostMapping("/goodsEnroll")
	public String goodsEnrollPOST(GoodsVO goods, RedirectAttributes rttr) {
		
		adminService.goodsEnroll(goods);
		
		rttr.addFlashAttribute("enroll_result", goods.getGoodsName());
		
		return "redirect:/admin/goodsManage";
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
