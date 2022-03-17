<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="100kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="/resources/css/join.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
</head>
<body>
<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
		<div class="subject">
			<span>회원가입</span>
		</div>
		<div class="id_wrap">
			<div class="id_name">아이디</div>
			<div class="id_input_box">
				<input class="id_input" name="userId">
			</div>
			<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
			<span class="id_input_re_2">이미 존재합니다.</span>
		</div>
		<div class="pw_wrap">
			<div class="pw_name">비밀번호</div>
			<div class="pw_input_box">
				<input class="pw_input" name="userPw">
			</div>
		</div>
		<div class="pwchk_wrap">
			<div class="pw_chk_input">비밀번호 확인</div>
			<div class="pw_chk_input_box">
				<input class="pw_chk_input" name="userPwChk">
			</div>
		</div>
		<div class="name_wrap">
			<div class="name_input">이름</div>
			<div class="name_input_box">
				<input class="name_input" name="userName">
			</div>
		</div>
		<div class="hpno_wrap">
			<div class="hpno_input">핸드폰번호</div>
			<div class="hpno_input_box">
				<input class="hpno_input" name="userHpno">
			</div>
		</div>
		<div class="hpno_chk_wrap">
			<div class="hpno_chk_input_box">
				<input class="hpno_chk_input">
			</div>
			<div class="hpno_chk_button">
				<span>인증번호 전송</span>
			</div>
			<div class="clsearfix"></div>
		</div>
		<div class="mail_wrap">
			<div class="mail_input">이메일</div>
			<div class="mail_input_box">
				<input class="mail_input" name="userMail">
			</div>
			<div class="mail_input_box_warn">
				<div class="mail_chk_input_box" id="mail_chk_input_box_false">
					<input class="mail_chk_input" disabled="disabled" >
				</div>
				<div class="mail_chk_button">
					<span>인증번호 전송</span>
				</div>
				<div class="clearfix"></div>
				<span id="mail_chk_input_box_warn"></span>
			</div>
		</div>
		<div class="addr_wrap">
			<div class="addr_name">주소</div>
			<div class="addr_input_1_wrap">
				<div class="addr_input_1_box">
					<input class="addr_input_1" name="userAddr1">
				</div>
				<div class="addr_button">
					<span>주소 찾기</span>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="addrinput_2_wrap">
				<div class="addr_input_2_box">
					<input class="addr_input_2" name="userAddr2">
				</div>
			</div>
			<div class="addr_input_3_wrap">
				<div class="addr_input_3_box">
					<input class="addr_input_3" name="userAddr3">
				</div>
			</div>
		</div>
		<div class="join_button_wrap">
			<input type="button" class="join_button" value="가입하기">
		</div>
	</div>
	</form>
</div>
</body>

<script>

var code = "";	//이메일전송 인증번호 저장을 위한 코드

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		$("#join_form").attr("action", "/member/join");
		$("#join_form").submit();
	});
});

//아이디 중복검사
$('.id_input').on("propertychange change keyup paste input", function(){
	var userId = $('.id_input').val();	// .id_input에 입력되는 값
	var data = {userId : userId}	// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url  : "/member/userIdChk",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('.id_input_re_1').css("display", "inline-block");
				$('.id_input_re_2').css("display", "none");
			}else{
				$('.id_input_re_2').css("display", "inline-block");
				$('.id_input_re_1').css("display", "none");
			}
		} // success 종료
	}); // ajax 종료
}); // function 종료

//인증번호 이메일 전송
$(".mail_chk_button").click(function(){
	var userMail = $(".mail_input").val();  // 입력한 이메일
	var chkBox = $(".mail_chk_input");  	// 인증번호 입력란
	var boxWrap = $(".mail_chk_input_box");  // 인증번호 입력박스
	$.ajax({
        type:"GET",
        url:"/member/mailChk?userMail=" + userMail,
        success:function(data){
        	chkBox.attr("disabled",false);
        	boxWrap.attr("id", "mail_chk_input_box_true");
        	code = data;
        }
    });
});

//인증번호 비교
$(".mail_chk_input").blur(function(){
	var inputCode = $(".mail_chk_input").val();		// 입력코드	
	var chkResult = $("#mail_chk_input_box_warn");  // 비교결과
	
	if(inputCode = code){	// 일치할 경우
		chkResult.html("인증번호가 일치합니다.");
		chkResult.attr("class", "correct");
	}else{				    // 일치하지 않을 경우
		chkResult.html("인증번호를 다시 확인해주세요.");
		chkResult.attr("class", "incorrect");
	}
	
});
</script>
</html>