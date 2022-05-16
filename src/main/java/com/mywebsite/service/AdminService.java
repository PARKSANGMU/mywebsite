package com.mywebsite.service;

import java.util.List;

import com.mywebsite.model.CateVO;
import com.mywebsite.model.Criteria;
import com.mywebsite.model.GoodsVO;

/** 
 * @name       : 관리자페이지 Service
 * @Author     : 박상무
 * @date       : 2022. 5. 10. 오후 2:48:05
 * @class      : AdminService.java
 * 
 */
public interface AdminService {

	/* 상품 등록 */
	public void goodsEnroll(GoodsVO goods);
	
	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	
	/* 상품 리스트 */
	public List<GoodsVO> goodsGetList(Criteria cri);
	
	/* 상품 총 개수 */
	public int goodsGetTotal(Criteria cri);
}
