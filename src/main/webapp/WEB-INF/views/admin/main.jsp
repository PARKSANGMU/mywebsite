<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>admin</title>
<link rel="stylesheet" href="resources/css/admin/main.css">
</head>
<body>
<div class="wrapper">
	<div class="wrap">
		<!-- gnv_area -->
		<div class="top_gnb_area">
			<ul class="list">
				<li><a href="/main">메인페이지</a></li>
				<li><a href="/member/logout">로그아웃</a></li>
				<li>고객센터</li>
			</ul>
		</div>
		<!-- contents_area -->
		<div class="admin_wrap">
			<!-- 네비영역 -->
			<div class="admin_navi_wrap">
				<ul>
					<li>
						<a class="admin_list_01" href="/admin/goodsEnroll">상품 등록</a>
					</li>
					<li>
						<a class="admin_list_02" href="/admin/goodsManage">상품 관리</a>
					</li>
					<li>
						<a class="admin_list_03" >미정</a>
					</li>
					<li>
						<a class="admin_list_04" >미정</a>
					</li>
					<li>
						<a class="admin_list_05">회원 관리</a>
					</li>
				</ul>
			</div>
			<div class="admin_content_wrap">
				<div>관리자 페이지</div>
			</div>
			<div class="clearfix"></div>
		</div>
			<!-- Footer 영역 -->
		<div class="footer_nav">
			<div class="footer_nav_container">
				<ul>
					<li>회사소개</li>
					<span class="line">|</span>
					<li>이용약관</li>
					<span class="line">|</span>
					<li>고객센터</li>
					<span class="line">|</span>
					<li>광고문의</li>
					<span class="line">|</span>
					<li>채용정보</li>
					<span class="line">|</span>
				</ul>
			</div>
		</div> <!-- class="footer_nav" -->
		
		<div class="footer">
			<div class="footer_container">
				<div class="footer_left">
					<img src="resources/img/logo.png">
				</div>
				<div class="footer_right">
					(주) MyWebsite 대표이사 : 박상무
					<br>
					대표전화 : 010-5642-3493(발신자 부담 전화)
					<br>
					<br>
					COPYRIGHT(C) <Strong>sangmu.mywebsite.com</Strong> ALL RIGHTS RESERVED.
				</div>
				<div class="clearfix"></div>
			</div>
		</div> <!-- class="footer" -->
	</div> <!-- class= "wrap" -->
</div> <!-- class= "wrapper" -->

</body>
</html>