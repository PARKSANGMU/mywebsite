package com.mywebsite.mapper;

import java.util.List;

import com.mywebsite.model.CateVO;
import com.mywebsite.model.GoodsVO;

/**
 * @name       : 관리자 페이지 Mapper
 * @Author     : 박상무
 * @date       : 2022. 5. 10. 오후 2:47:33
 * @class      : AdminMapper.java
 * 
 */
public interface AdminMapper {

	/* 상품 등록 */
	public void goodsEnroll(GoodsVO goods);
	
	/* 카테고리 리스트 */
	public List<CateVO> cateList();
}
