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
		
	}); //join()
	
	
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
		
		
	}); //checkPasswd()
});
	