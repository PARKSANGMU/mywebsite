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
   				<%@include file="../includes/admin/header.jsp" %>
   				
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
                    				<span class="ck_warn goodsName_warn">상품 이름을 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<div class="cate_wrap">
                    					<span>대분류</span>
                    					<select class="cate1">
                    						<option selected value="none">선택</option>
                    					</select>
                    				</div>
                    				<div class="cate_wrap">
                    					<span>중분류</span>
                    					<select class="cate2">
                    						<option selected value="none">선택</option>
                    					</select>
                    				</div>
                    				<div class="cate_wrap">
                    					<span>소분류</span>
                    					<select class="cate3" name="cateCode">
                    						<option selected value="none">선택</option>
                    					</select>
                    				</div>
                    				<span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span> 
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="goodsPrice">
                    				<span class="ck_warn goodsPrice_warn">상품 가격을 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="goodsStock">
                    				<span class="ck_warn goodsStock_warn">상품 재고를 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인률</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="discount_interface" maxlength="2" value="0">
                    				<input name="goodsDiscount" type="hidden" value="0">
                    				<span class="step_val">할인가격 : <span class="span_discount"></span></span>
                    				<span class="ck_warn goodsDiscount_warn">1~99 숫자를 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 소개</label>
                    			</div>
                    			<div class="form_section_content">
                    				<textarea name="goodsIntro" id="goodsIntro_textarea"></textarea>
                    				<span class="ck_warn goodsIntro_warn">상품 소개를 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 내용</label>
                    			</div>
                    			<div class="form_section_content">
                    				<textarea name="goodsContents" id="goodsContents_textarea"></textarea>
                    				<span class="ck_warn goodsContents_warn">상품 내용을 입력해주세요.</span>
                    			</div>
                    		</div>
                    	</form>
                    	<div class="btn_section">
                    		<button id="cancleBtn" class="cancle_btn">취소</button>
                    		<button id="enrollBtn" class="enroll_btn">등록</button>
                    	</div>
                    </div> <!-- class="admin_content_main" -->
                </div> <!-- class="admin_content_wrap" -->
            </div> <!-- class="admin_wrap" -->
 			
 			<%@include file="../includes/admin/footer.jsp" %>
 
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
	
	/* 체크 변수 */
	let goodsNameCk = false;
	let cateCodeCk = false;
	let goodsPriceCk = false;
	let goodsStockCk = false;
	let goodsDiscountCk = false;
	let goodsIntroCk = false;
	let goodsContentsCk = false;
	
	/* 체크 대상 변수 */
	let goodsName = $("input[name='goodsName']").val();
	let cateCode = $("select[name='cateCode']").val();
	let goodsPrice = $("input[name='goodsPrice']").val();
	let goodsStock = $("input[name='goodsStock']").val();
	let goodsDiscount = $("#discount_interface").val();
	let goodsIntro = $(".bit p").html();
	let goodsContents = $(".bct p").html();
	
	/* 공란 체크 */
	if(goodsName){
		$(".goodsName_warn").css('display','none');
		goodsNameCk = true;
	} else {
		$(".goodsName_warn").css('display','block');
		goodsNameCk = false;
	}
	
	if(cateCode != 'none'){
		$(".cateCode_warn").css('display','none');
		cateCodeCk = true;
	} else {
		$(".cateCode_warn").css('display','block');
		cateCodeCk = false;
	}	
	
	if(goodsPrice != 0){
		$(".goodsPrice_warn").css('display','none');
		goodsPriceCk = true;
	} else {
		$(".goodsPrice_warn").css('display','block');
		goodsPriceCk = false;
	}	
	
	if(goodsStock != 0){
		$(".goodsStock_warn").css('display','none');
		goodsStockCk = true;
	} else {
		$(".goodsStock_warn").css('display','block');
		goodsStockCk = false;
	}		
	
	if(!isNaN(goodsDiscount)){
		$(".goodsDiscount_warn").css('display','none');
		goodsDiscountCk = true;
	} else {
		$(".goodsDiscount_warn").css('display','block');
		goodsDiscountCk = false;
	}	
	
	if(goodsIntro != '<br data-cke-filler="true">'){
		$(".goodsIntro_warn").css('display','none');
		goodsIntroCk = true;
	} else {
		$(".goodsIntro_warn").css('display','block');
		goodsIntroCk = false;
	}	
	
	if(goodsContents != '<br data-cke-filler="true">'){
		$(".goodsContents_warn").css('display','none');
		goodsContentsCk = true;
	} else {
		$(".goodsContents_warn").css('display','block');
		goodsContentsCk = false;
	}	
	
	if(goodsNameCk && cateCodeCk && goodsPriceCk && goodsStockCk && goodsDiscountCk && goodsIntroCk && goodsContentsCk ){
		//alert('통과');
		enrollForm.submit();
	} else {
		return false;
	}
	
});	

/* 카테고리 리스트 */
let cateList = JSON.parse('${cateList}');

let cate1Array = new Array();
let cate2Array = new Array();
let cate3Array = new Array();
let cate1Obj = new Object();
let cate2Obj = new Object();
let cate3Obj = new Object();

let cateSelect1 = $(".cate1");		
let cateSelect2 = $(".cate2");
let cateSelect3 = $(".cate3");

/* 카테고리 배열 초기화 메서드 */
function makeCateArray(obj, array, cateList, tier){
	for(let i = 0; i < cateList.length; i++){
		if(cateList[i].tier === tier){
			obj = new Object();
			
			obj.cateName = cateList[i].cateName;
			obj.cateCode = cateList[i].cateCode;
			obj.cateParent = cateList[i].cateParent;
			
			array.push(obj);				
			
		}
	}
}

/* 배열 초기화 */
makeCateArray(cate1Obj,cate1Array,cateList,1);
makeCateArray(cate2Obj,cate2Array,cateList,2);
makeCateArray(cate3Obj,cate3Array,cateList,3);

/* 대분류 <option> 태그 */
for(let i = 0; i < cate1Array.length; i++){
	cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
}

/* 중분류 <option> 태그 */
$(cateSelect1).on("change",function(){
	
	let selectVal1 = $(this).find("option:selected").val();	
	
	cateSelect2.children().remove();
	cateSelect3.children().remove();
	
	cateSelect2.append("<option value='none'>선택</option>");
	cateSelect3.append("<option value='none'>선택</option>");
	
	for(let i = 0; i < cate2Array.length; i++){
		if(selectVal1 === cate2Array[i].cateParent){
			cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
		}
	}// for
	
});

/* 소분류 <option>태그 */
$(cateSelect2).on("change",function(){
	
	let selectVal2 = $(this).find("option:selected").val();
	
	cateSelect3.children().remove();
	
	cateSelect3.append("<option value='none'>선택</option>");		
	
	for(let i = 0; i < cate3Array.length; i++){
		if(selectVal2 === cate3Array[i].cateParent){
			cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");	
		}
	}// for		
});

/* 할인률 Input 설정 */
$("#discount_interface").on("propertychange change keyup paste input", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='goodsDiscount']");
	
	let discountRate = userInput.val();							// 사용자가 입력할 할인값
	let sendDiscountRate = discountRate / 100;  				// 서버에 전송할 할인값
	let goodsPrice = $("input[name='goodsPrice']").val();		// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);	// 할인가격
	
	if(!isNaN(discountRate)){
		$(".span_discount").html(discountPrice);
		discountInput.val(sendDiscountRate);
	}
	
});

$("input[name='goodsPrice']").on("change", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='goodsDiscount']");
	
	let discountRate = userInput.val();							// 사용자가 입력한 할인값
	let sendDiscountRate = discountRate / 100;					// 서버에 전송할 할인값
	let goodsPrice = $("input[name='goodsPrice']").val();		// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);	// 할인가격
	
	if(!isNaN(discountRate)){
		$(".span_discount").html(discountPrice);
	}
	
});


</script>
 
</body>
</html>