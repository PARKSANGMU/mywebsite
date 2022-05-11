<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mywebsite</title>
<link rel="stylesheet" href="resources/css/member/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
</head>
<body>
<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<ul class="list">
				<c:if test = "${user == null}">		<!-- 로그인 X -->
					<li>
						<a href="/member/login">로그인</a>
					</li>
					<li>
						<a href="/member/join">회원가입</a>
					</li>
				</c:if>
				<c:if test = "${user != null}">		<!-- 로그인 O -->
					<c:if test = "${user.adminCK == 1}">	<!-- 관리자 계정 -->
						<li>
							<a href="/admin/main">관리자 페이지</a>
						</li>
					</c:if>
					<li>
						<a id="gnb_logout_button">로그아웃</a>
					</li>
					<li>
						내정보
					</li>
					<li>
						장바구니
					</li>
				</c:if>
				<li>
					고객센터
				</li>
			</ul>
		</div>
		<div class="top_area">
			<div class="logo_area">
				<a href="/main"><img src="/resources/img/logo.png"></a>
			</div>
			<div class="login_area">
				<!-- 로그인 하지 않은 상태 -->
				<c:if test = "${user == null}">
					<div class="login_button"><a href="/member/login">로그인</a></div>
						<span><a href="/member/join">회원가입</a></span>
				</c:if>
				<!-- 로그인한 상태 -->
				<c:if test = "${user != null}">
					<div class="login_success_area">
						<span>회원 : ${user.userName}</span>
						<a href="/member/logout">로그아웃</a>
					</div>
				</c:if>
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
	</div> <!-- class="wrap" -->
</div> <!--  class="wrapper -->


<script>
	
/* gnb_area 로그아웃 버튼 작용 */
$("#gnb_logout_button").click(function(){
	$.ajax({
		type:"POST",
		url:"member/logout",
		success:function(data){
			alert("로그아웃 성공");
			document.location.reload();
		}
	}); // ajax
});

</script>
</body>
</html>