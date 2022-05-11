<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsEnroll</title>
<link rel="stylesheet" href="../resources/css/admin/goodsEnroll.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
</head>
</head>
<body>
 
    <div class="wrapper">
        <div class="wrap">
            <!-- gnv_area -->    
            <div class="top_gnb_area">
                <ul class="list">    
                    <li><a href="/main">메인 페이지</a></li>
                    <li><a href="/member/logout">로그아웃</a></li>
                    <li>고객센터</li>            
                </ul>
            </div>
            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                  <ul>
                      <li >
                          <a class="admin_list_01" href="/admin/goodsEnroll">상품 등록</a>
                      </li>
                      <li>
                          <a class="admin_list_02" href="/admin/goodsManage">상품 관리</a>
                      </li>
                      <lI>
                          <a class="admin_list_03" >미정</a>                            
                      </lI>
                      <lI>
                          <a class="admin_list_04" >미정</a>                            
                      </lI>
                      <lI>
                          <a class="admin_list_05">회원 관리</a>                            
                      </lI>                                                                                             
                  </ul>
                </div>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 등록</span></div>
                    <div class="admin_content_main">
                    	<form action="/admin/goodsEnroll" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="goodsName">
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="cateCode">
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="goodsPrice">
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="goodsStock">
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인률</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="goodsDiscount">
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 소개</label>
                    			</div>
                    			<div class="form_section_content">
                    				<textarea name="goodsIntro" id="goodsIntro_textarea"></textarea>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 내용</label>
                    			</div>
                    			<div class="form_section_content">
                    				<textarea name="goodsContents" id="goodsContents_textarea"></textarea>
                    			</div>
                    		</div>
                    	</form>
                    	<div class="btn_section">
                    		<button id="cancleBtn" class="cancle_btn">취소</button>
                    		<button id="enrollBtn" class="enroll_btn">등록</button>
                    	</div>
                    </div> <!-- class="admin_content_main" -->
                </div> <!-- class="admin_content_wrap" -->
                <div class="clearfix"></div>
            </div>
    </div>    <!-- class="wrap" -->
</div>    <!-- class="wrapper" -->
 
<script>

let enrollForm = $("#enrollForm")

/* 위지윅 적용 */
	/* 상품 소개 */
	ClassicEditor
		.create(document.querySelector('#goodsIntro_textarea'))
		.catch(error=>{
			console.error(error);
		});
	/* 상품 내용 */	
	ClassicEditor
	.create(document.querySelector('#goodsContents_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
/* 취소 버튼 */
$("#cancleBtn").click(function(){
	
	location.href="/admin/goodsManage"
	
});

/* 등록 버튼 */
$("#enrollBtn").click(function(e){
	
	e.preventDefault();
	
	enrollForm.submit();
	
});	

/* 카테고리 리스트 */
$(document).ready(function(){
	console.log('${cateList}');
});
	
</script>
 
</body>
</html>