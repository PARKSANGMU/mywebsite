package com.mywebsite.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mywebsite.model.Criteria;

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
	
	/* 상품 등록 */
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
//	@Test
//	public void cateListTest() throws Exception{
//		System.out.println("cateList().........." + mapper.cateList());
//	}
	
	/* 상품 리스트 & 상품 총 개수 */
	@Test
	public void goodsGetListTest() {
		
		Criteria cri = new Criteria();
		
		/* 검색조건 */
		cri.setKeyword("테스트");
		
		/* 검색 리스트 */
		List list = mapper.goodsGetList(cri);
		for(int i = 0; i < list.size(); i++) {
			System.out.println("result.....(1)" + i + " : " + list.get(i));
		}
		
		/* 상품 총 개수 */
		int result = mapper.goodsGetTotal(cri);
		System.out.println("result.....(2)" + result);
	}
	
}
