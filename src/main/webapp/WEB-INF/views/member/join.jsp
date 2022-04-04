<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="100kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
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
			<span class="final_id_chk">아이디를 입력해주세요.</span>
		</div>
		<div class="pw_wrap">
			<div class="pw_name">비밀번호</div>
			<div class="pw_input_box">
				<input class="pw_input" name="userPw">
			</div>
			<span class="final_pw_chk">비밀번호를 입력해주세요.</span>
		</div>
		<div class="pwchk_wrap">
			<div class="pw_chk_name">비밀번호 확인</div>
			<div class="pw_chk_input_box">
				<input class="pw_chk_input" name="userPwChk">
			</div>
			<span class="final_pwChk_chk">비밀번호 확인을 입력해주세요.</span>
			<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
            <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
		</div>
		<div class="name_wrap">
			<div class="name_name">이름</div>
			<div class="name_input_box">
				<input class="name_input" name="userName">
			</div>
			<span class="final_name_chk">이름을 입력해주세요.</span>
		</div>
		<div class="hpno_wrap">
			<div class="hpno_name">핸드폰번호</div>
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
			<div class="mail_name">이메일</div>
			<div class="mail_input_box">
				<input class="mail_input" name="userMail">
			</div>
			<span class="final_mail_chk">이메일을 입력해주세요.</span>
			<span class="mail_input_box_warn"></span>
			<div class="mail_chk_wrap">
				<div class="mail_chk_input_box" >
					<input class="mail_chk_input" id="mail_chk_input_false" disabled="disabled" >
				</div>
				<div class="mail_chk_button">
					<span>인증번호 전송</span>
				</div>
				<div class="clearfix"></div>
				<span id="mail_chk_input_warn"></span>
			</div>
		</div>
		<div class="addr_wrap">
			<div class="addr_input">주소</div>
			<div class="addr_input_1_wrap">
				<div class="addr_input_1_box">
					<input class="addr_input_1" name="userAddr1" readonly="readonly" placeholder='우편번호'>
				</div>
				<div class="addr_button" onclick="execution_daum_address()">
					<span>우편번호 찾기</span>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="addr_input_2_wrap">
				<div class="addr_input_2_box">
					<input class="addr_input_2" name="userAddr2" readonly="readonly" placeholder='도로명주소(지번주소)'>
				</div>
			</div>
			<div class="addr_input_3_wrap">
				<div class="addr_input_3_box">
					<input class="addr_input_3" name="userAddr3" placeholder='상세주소'>
				</div>
			</div>
			<span class="final_addr_chk">주소를 입력해주세요.</span>
		</div>
		<div class="join_button_wrap">
			<input type="button" class="join_button" value="가입하기">
		</div>
	</div>
	</form>
</div>
</body>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

var code = "";	//이메일전송 인증번호 저장을 위한 코드

/* 유효성 검사 통과유무 변수 */
var idCheck = false;            // 아이디
var idckCheck = false;          // 아이디 중복 검사
var pwCheck = false;            // 비번
var pwckCheck = false;          // 비번 확인
var pwckcorCheck = false;       // 비번 확인 일치 확인
var nameCheck = false;          // 이름
var mailCheck = false;          // 이메일
var mailnumCheck = false;       // 이메일 인증번호 확인
var addressCheck = false        // 주소
 
$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		
		/* 입력값 변수 */
		var id = $('.id_input').val();                // id 입력란
        var pw = $('.pw_input').val();                // 비밀번호 입력란
        var pwck = $('.pw_chk_input').val();          // 비밀번호 확인 입력란
        var name = $('.name_input').val();            // 이름 입력란
        var mail = $('.mail_input').val();            // 이메일 입력란
        var addr = $('.addr_input_3').val();       	  // 주소 입력란
		
        /* 아이디 유효성 검사 */
        if(id == ""){
        	$('.final_id_chk').css('display', 'block');
        	idCheck = false;
        }else{
        	$('.final_id_chk').css('display', 'none');
        	idCheck = true;
        }
        
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
        	$('.final_pw_chk').css('display', 'block');
        	pwCheck = false;
        }else{
        	$('.final_pw_chk').css('display', 'none');
        	pwCheck = true;
        }
        
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.final_pwChk_chk').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwChk_chk').css('display', 'none');
            pwckCheck = true;
        }
        
        /* 이름 유효성 검사 */
        if(name == ""){
        	$('.final_name_chk').css('display', 'block');
        	nameCheck = false;
        }else{
        	$('.final_name_chk').css('display', 'none');
        	nameCheck = true;
        }
        
        /* 이메일 유효성 검사 */
        if(mail == ""){
            $('.final_mail_chk').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_chk').css('display', 'none');
            mailCheck = true;
        }
        
        /* 주소 유효성 검사 */
        if(addr == ""){
            $('.final_addr_chk').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_chk').css('display', 'none');
            addressCheck = true;
        }
 
        /* 최종 유효성 검사 */
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck ){
			$("#join_form").attr("action", "/member/join");
			$("#join_form").submit();
        }    
       return false; 
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
				idckCheck = true;
			}else{
				$('.id_input_re_2').css("display", "inline-block");
				$('.id_input_re_1').css("display", "none");
				idckCheck = false;
			}
		} // success 종료
	}); // ajax 종료
}); // function 종료

/* 비밀번호 확인 일치 유효성 검사 */
$('.pw_chk_input').on("propertychange change keyup paste input", function(){
	
	var pw = $('.pw_input').val();
	var pwchk = $('.pw_chk_input').val();
	$('.final_pwchk_chk').css('display', 'none');
	
	if(pw == pwchk){
		$('.pwck_input_re_1').css('display', 'block');
		$('.pwck_input_re_2').css('display', 'none');
		pwckcorCheck = true;
	}else{
		$('.pwck_input_re_1').css('display', 'none');
		$('.pwck_input_re_2').css('display', 'block');
		pwckcorCheck = false;
	}
});

//인증번호 이메일 전송
$(".mail_chk_button").click(function(){
	var userMail = $(".mail_input").val();  	// 입력한 이메일
	var chkBox = $(".mail_chk_input");  		// 인증번호 입력란
	var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
	
	if(mailFormCheck(userMail)){
		warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.")	
		warnMsg.css("display", "inline-block");
	}else{
		warnMsg.html("올바르지 못한 이메일 형식입니다.");
		warnMsg.css("display", "inline-block");
		return false;
	}

	$.ajax({
        type:"GET",
        url:"/member/mailChk?userMail=" + userMail,
        success:function(data){
        	chkBox.attr("disabled",false);
        	chkBox.attr("id", "mail_chk_input_true");
        	code = data;
        }
    });
});

//인증번호 비교
$(".mail_chk_input").blur(function(){
	var inputCode = $(".mail_chk_input").val();	// 입력코드	
	var chkResult = $("#mail_chk_input_warn");  // 비교결과
	
	if(inputCode == code){						// 일치할 경우
		chkResult.html("인증번호가 일치합니다.");
		chkResult.attr("class", "correct");
		mailnumCheck = true;
	}else{				    				    // 일치하지 않을 경우
		chkResult.html("인증번호를 다시 확인해주세요.");
		chkResult.attr("class", "incorrect");
		mailnumCheck = false;
	}
	
});

/* 입력 이메일 형식 유효성 검사 */
function mailFormCheck(userMail){
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return form.test(userMail);
}

//다음 주소 연동
function execution_daum_address(){
	new daum.Postcode({
		oncomplete: function(data){
			
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $(".addr_input_1").val(data.zonecode);
            $(".addr_input_2").val(data.roadAddress + " (" + data.jibunAddress + ")");
            
		}
	}).open();
}


</script>
</html>