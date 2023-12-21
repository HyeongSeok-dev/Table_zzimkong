$(document).ready(function() {
	
	//입력 널스트링이면 "입력하세요" 출력후 focus=======================
	$("#joinBtn").click(function() {
	    // 입력 폼의 데이터 가져오기
	    var userId = document.getElementById('userId').value;
	    var password = document.getElementById('passwd').value;
	    var passwordConfirm = document.getElementById('passwd2').value;
	    var nickname = document.getElementById('u_nick').value;
	    var name = document.getElementById('u_name').value;
	    var birth = document.getElementById('com_birth').value;
	    var email1 = document.getElementById('u_email').value;
	    var email2 = document.getElementById('u_email2').value;
	    var phone = document.getElementById('u_phone').value;
	
	    // 유효성 검사
	    // 각 항목이 비어있는지 확인
	    if (!userId) {
	        alert('아이디를 입력해주세요.');
	        document.joinForm.userId.focus();
	        return false;
	    }
	
	    if (!password) {
	        alert('비밀번호를 입력해주세요.');
	        document.joinForm.passwd.focus();
	        return false;
	    }
	
	    if (password !== passwordConfirm) {
	        alert('비밀번호가 일치하지 않습니다.');
	        document.joinForm.passwd2.focus();
	        return false;
	    }
	
	    if (!nickname) {
	        alert('닉네임을 입력해주세요.');
	        document.joinForm.u_nick.focus();
	        return false;
	    }
	
	    if (!name) {
	        alert('이름을 입력해주세요.');
	        document.joinForm.u_name.focus();
	        return false;
	    }
	
	    if (!birth) {
	        alert('생년월일을 입력해주세요.');
	        document.joinForm.com_birth.focus();
	        return false;
	    }
	
	    if (!email1) {
	        alert('이메일을 입력해주세요.');
	        document.joinForm.u_email.focus();
	    	return false;
	    }
	    
	    if(!email2){
		alert('이메일을 선택해 주세요');
		document.joinForm.u_email2.focus();
		return false;
	}
	
	    if (!phone) {
	        alert('전화번호를 입력해주세요.');
	        document.joinForm.u_phone.focus();
	        return false;
	    }
	
	    // 모든 유효성 검사를 통과한 경우, 회원 가입 로직을 수행
		//    alert('회원 가입이 완료되었습니다.');
		//    return true;
		
	}); 
	
	
	//비밀번호 일치===============================
	$("#passwd2").keyup(function() {
		let passwd = document.getElementById('passwd').value;
		let passwdck =document.getElementById('passwd2').value;
		
		if(passwd == passwdck){
					document.getElementById('checkPasswd2Result').innerHTML = "비밀번호 일치";
					document.getElementById('checkPasswd2Result').style.color = "blue";
	//				isSamePasswd = true;
				} else {
					document.getElementById('checkPasswd2Result').innerHTML = "비밀번호 불일치";
					document.getElementById('checkPasswd2Result').style.color = "red";
	//				isSamePasswd = false;
				}
				
	}); //비밀번호 일치확인
	
	//ID중복및 입력양식 검증===============================
	
	let isDuplicateId = false; //아이디 중복 여부 저장할 변수
	let isSamePasswd = false; //패스워드 일치 여부 저장할 변수
	
	$("#userId").keyup(function(){
		
		//아이디 입력값 가져오기
		let user_id = $("#userId").val();
		
		//아이디 입력값 검증(정규표현식)
		// 요구사항 : 영문 대소문자,숫자를 포함하여 8~16자리 입력,  중복아이디 확인 (한글입력X)
		//영문 대소문자 숫자포함 8~16자리, 특수문자 한글입력불가	
		let regex = /^[a-zA-Z0-9]{8,16}$/;
		
		if(!regex.exec(user_id)) { //입력값 검증 실패시
			$("#checkIdResult").html("영문자, 숫자 조합 8~16자리 필수(한글, 특수문자 사용불가)");
			$("#checkIdResult").css("color", "red");
		}else{ //입력값 검증 성공시
			$.ajax({
				url: "MemberCheckDupId",
				data: {
					user_id : user_id
				},
				dataType: "json",
				success : function(checkDuplicateResult){
					if(checkDuplicateResult ){ //중복
						$("#checkIdResult").html("이미 사용중인 아이디");
						$("#checkIdResult").css("color", "red");
						isDuplicateId = true;
					}else{ //중복X
						$("#checkIdResult").html("사용 가능한 아이디");
						$("#checkIdResult").css("color", "blue");
						isDuplicateId = false;
					}
				} //success
			}); //ajax
		}
		
	}); //ID중복및 입력양식 검증
	
	//비밀번호검증===============================
	$("#user_passwd").blur(function(){
		let passwd = $("#passwd").val();
		let msg = "";
		let color = "";
		
		//비밀번호 길이 검증
		// 대소문자, 숫자 ,특수문자(!@#$%)를 포함하여 8~16 입력
		
		
		
	}); //비밀번호검증
	
});
	