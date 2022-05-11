package com.mywebsite.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @name       : 관리자페이지 Mapper Test
 * @Author     : 박상무
 * @date       : 2022. 5. 10. 오후 2:49:03
 * @class      : AdminMapperTests.java
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {
	
	@Autowired
	private AdminMapper mapper;
	
//	/* 상품 등록 */
//	@Test
//	public void goodsEnrollTest() throws Exception{
//		
//		GoodsVO goods = new GoodsVO();
//		
//		goods.setGoodsName("test");
//		goods.setCateCode("000");
//		goods.setGoodsPrice(5000);
//		goods.setGoodsStock(10);
//		goods.setGoodsDiscount(0.23);
//		goods.setGoodsIntro("상품 소개");
//		goods.setGoodsContents("상품 내용");
//		
//		mapper.goodsEnroll(goods);
//	}
	
	/* 카테고리 리스트 */
	@Test
	public void cateListTest() throws Exception{
		System.out.println("cateList().........." + mapper.cateList());
	}
	
}
