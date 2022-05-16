package com.mywebsite.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mywebsite.mapper.AdminMapper;
import com.mywebsite.model.CateVO;
import com.mywebsite.model.Criteria;
import com.mywebsite.model.GoodsVO;

/**
 * @name       : 관리자페이지 ServiceImpl
 * @Author     : 박상무
 * @date       : 2022. 5. 10. 오후 2:48:17
 * @class      : AdminServiceImpl.java
 * 
 */
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper mapper;
	
	/* 상품 등록 */
	@Override
	public void goodsEnroll(GoodsVO goods) {
		
		mapper.goodsEnroll(goods);
		
	}
	
	/* 카테고리 리스트 */
	public List<CateVO> cateList(){
		
		return mapper.cateList();
		
	}
	
	/* 상품 리스트 */
	@Override
	public List<GoodsVO> goodsGetList(Criteria cri) {
		
		return mapper.goodsGetList(cri);
		
	}

	/* 상품 총 개수 */
	public int goodsGetTotal(Criteria cri) {
		
		return mapper.goodsGetTotal(cri);
		
	}	

}
