//이메일 직접입력 선택시 
document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('u_email2').addEventListener('change', function() {
    var inputBox = document.getElementById('customEmail');
    if(this.value === "custom") {
      inputBox.style.display = "block";
    } else {
      inputBox.style.display = "none";
    }
  });
});

$(document).ready(function() {
	//생일 선택시 오늘이후 날짜 선택 막아놓음
	window.onload = function() {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    
    today = yyyy + '-' + mm + '-' + dd;
    document.getElementById("com_birth").max = today;
}

	let ceo = false; //사업자번호 양식 검사
	let Pone = false; //전화번호 양식 검사
	let isPasswd = false; //비밀번호 안전도 검사
	let isId = false; //아이디가 양식에 맞지않을 경우
	let isDuplicateId = false; //아이디 중복 여부 저장할 변수
	let isSamePasswd = false; //패스워드 일치 여부 저장할 변수
    let ceoNum = false; //사업자 인증 여부
	
	//입력 널스트링이면 "입력하세요" 출력후 focus=======================
	$("#joinBtn").click(function() {
	    // 입력 폼의 데이터 가져오기
	    var userId = document.getElementById('userId').value;
	    var password = document.getElementById('passwd').value;
	    var passwordConfirm = document.getElementById('passwd2').value;
	    var name = document.getElementById('u_name').value;
	    var birth = document.getElementById('com_birth').value;
	    var email1 = document.getElementById('u_email').value;
	    var email2 = document.getElementById('u_email2').value;
	    var email3 = document.getElementById('customEmail').value;
	    var phone = document.getElementById('u_phone').value;
	    var num = document.getElementById('com_num').value;
   		var date = $('#com_date').val();

	
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
	
	if(!date){
			alert("개업일을 입력해주세요.");
			return false;		
		}
	
	//직접입력선택후 생겨난 텍스트 박스의 이메일
//	    if(!email3){
//		alert('이메일을 입력해주세요');
//		document.joinForm.u_email2.focus();
//		return false;
//	}

	  if(email2 === 'custom' && !email3) {
	    alert('이메일을 입력해주세요');
	    document.joinForm.u_email2.focus();
	    return false;
	  }
	
	    if (!phone) {
	        alert('전화번호를 입력해주세요.');
	        document.joinForm.u_phone.focus();
	        return false;
	    }
	    
	    if (!num) {
	        alert('사업자번호를 입력해주세요.');
	        document.joinForm.com_num.focus();
	        return false;
	    }
	    
	    //비밀번호 불일치할 경우
	    if(!isSamePasswd){
			alert("비밀번호가 불일치 합니다.");
			return false;		
		}
		
		//비밀번호 안전도가 맞지 않을 경우
	    if(!isPasswd){
			alert("사용할수 없는 비밀번호 입니다.");
			return false;		
		}
	
		//아이디 중복일 경우
	    if(isDuplicateId){
			alert("아이디 중복입니다.");
			return false;		
		}
		
		//아이디가 양식에 맞지 않을 경우
	    if(isId){
			alert("아이디가 양식에 맞지 않습니다.");
			return false;		
		}
		
		//닉네임 중복일 경우
	    if(isDuplicateNick){
			alert("닉네임 중복입니다.");
			return false;		
		}
		
		//전화번호 양식 맞지 않을경우
	    if(Pone){
			alert("전화번호가 양식에 맞지 않습니다.");
			return false;		
		}
		
		//사업자번호 양식 맞지 않을경우
	    if(ceo){
			alert("사업자번호가 양식에 맞지 않습니다.");
			return false;		
		}
		
		//사업자 인증여부
		 if (!ceoNum) {
	      alert("사업자번호 인증을 해주세요.");
	      return false;
	    }
	   
	}); 
	
	
	//비밀번호 일치===============================
	function checkPasswdMatch() {
		    let passwd = document.getElementById('passwd').value;
		    let passwd2 = document.getElementById('passwd2').value;
		
		    if(passwd2.length > 0){ // 'passwd2' 필드에 값이 있을 때만 비교를 진행
		        if(passwd === passwd2){
		            document.getElementById('checkPasswd2Result').innerHTML = "비밀번호 일치";
		            document.getElementById('checkPasswd2Result').style.color = "blue";
		            isSamePasswd = true;
		        } else {
		            document.getElementById('checkPasswd2Result').innerHTML = "비밀번호 불일치";
		            document.getElementById('checkPasswd2Result').style.color = "red";
		            isSamePasswd = false;
		        }
		    } else { // 'passwd2' 필드에 값이 없을 때는 메시지를 지웁니다.
		        document.getElementById('checkPasswd2Result').innerHTML = "";
		    }
		}
		
		// 'passwd' 입력칸에 키 입력 시 비밀번호 일치 여부 체크
		document.getElementById('passwd').addEventListener('keyup', checkPasswdMatch);
		// 'passwd2' 입력칸에 키 입력 시 비밀번호 일치 여부 체크
		document.getElementById('passwd2').addEventListener('keyup', checkPasswdMatch);

	
	//비밀번호검증===============================
	$("#passwd").keyup(function(){
		let passwd = $("#passwd").val();
		let msg = "";
		let color = "";
		
		//비밀번호 길이 검증
		// 대소문자, 숫자 ,특수문자(!@#$%)를 포함하여 8~16 입력
		let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
		
		if(!lengthRegex.exec(passwd)){ //길이체크
			msg = "영어 대소문자, 숫자, 특수문자 조합 8~16자리 권장";
			color = "red";
		}else{
			let engUpperRegex = /[A-Z]/; //대문자
			let engLowerRegex = /[a-z]/; //소문자
			let numRegex = /[\d]/; //숫자
			let specRegex = /[!@#$%]/; //특수문자
			
			let count = 0;
			
			if(engUpperRegex.exec(passwd)){count++;}
			if(engLowerRegex.exec(passwd)){count++;}
			if(numRegex.exec(passwd)){count++;}
			if(specRegex.exec(passwd)){count++;}
			
			switch(count){
				case 4 : msg = "안전"; color = "green"; break;
				case 3 : msg = "보통"; color = "yellow"; break;
				case 2 : msg = "위험"; color = "orange"; break;
				case 1 : case 0 :  msg = "사용불가능한 비밀번호"; color = "red"; 
			}
			
			if(count >= 2){ //안전,보통,위험 (사용가능)
				isPasswd = true;
			}else{ //사용불가능한 비밀번호
				isPasswd = false;
			}	
			
		}
		
		$("#checkPasswdResult").html(msg);
		$("#checkPasswdResult").css("color", color);
		
	}); //비밀번호검증
	
	
	//ID중복및 입력양식 검증===============================
	$("#userId").keyup(function(){
		
		//아이디 입력값 가져오기
		let user_id = $("#userId").val();
		
		//아이디 입력값 검증(정규표현식)
		// 요구사항 : 영문 대소문자,숫자를 포함하여 8~16자리 입력,  중복아이디 확인 (한글입력X)
		//영문 대소문자 숫자포함 8~16자리, 특수문자 한글입력불가	
		let regex = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,16}$/;
		
		
		if(!regex.exec(user_id)) { //입력값 검증 실패시
			$("#checkIdResult").html("영문자, 숫자 조합 8~16자리 필수(한글, 특수문자 사용불가)");
			$("#checkIdResult").css("color", "red");
			isId = true;
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
						isId = false;
					}
				} //success
			}); //ajax
		}
		
	}); //ID중복및 입력양식 검증
	
	//전화번호 길이 제한=====================================
	$("#u_phone").keyup(function(){
		let user_phone = $("#u_phone").val();
		
		let regex = /^\d{11}$/;

		if (!regex.test(user_phone)) {
		    $("#checkPhoneResult").html("전화번호는 11자리 숫자여야 합니다. (' - ' 를 빼고 입력)");
			$("#checkPhoneResult").css("color", "red");
			Pone = true;
		}else{
		    $("#checkPhoneResult").html("사용가능한 전화번호입니다.");
			$("#checkPhoneResult").css("color", "blue");
			Pone = false;
		}

	}); 
	
	//사업자번호 길이 제한=====================================
	$("#com_num").keyup(function(){
		let ceo_num = $("#com_num").val();
		
		let regex = /^\d{10}$/;

		if (!regex.test(ceo_num)) {
		    $("#checCeonNmResult").html("사업자번호는 10자리 숫자여야 합니다. (' - ' 를 빼고 입력)");
			$("#checCeonNmResult").css("color", "red");
			ceo = true;
		}else{
		    $("#checCeonNmResult").html("사용가능한 사업자번호입니다. 인증해주세요");
			$("#checCeonNmResult").css("color", "blue");
			ceo = false;
		}

	}); 
	
	//사업자 번호 인증
		$("#api").click(function(){
				console.log("사업자api");
				var data = {
					
				"businesses": [ 
					{
			         "b_no": $("#com_num").val() , //사업자번호
			         "start_dt" : $("#com_date").val(), // 개업일 필수
					  "p_nm" : $("#u_name").val(), // 대표자명 필수
				      "p_nm2": "",
				      "b_nm": "",
				      "corp_no": "",
				      "b_sector": "",
				      "b_type": "",
				      "b_adr": ""
					 }
					 ]
		       }; //var data
		    
			    $.ajax({
			    type: "POST",
			    url: "https://api.odcloud.kr/api/nts-businessman/v1/validate?"// serviceKey 값을 xxxxxx에 입력
				+ "serviceKey=CYbq%2B5t%2F8Jf2FwQcca5NGu4wJMrcTJ83jxrSTNfpTbv8YDkS%2Bi9AWNr0Oa0c4OZLZEY3LPbm806fMYW7x0bBeg%3D%3D"
				,
			    data: JSON.stringify(data), // json 을 string으로 변환하여 전송
			    contentType: "application/json",
			    dataType: "json",
			    accept: "application/json",
			    success: function(businesses) {
			        console.log("성공");
			        console.log(businesses.valid_cnt);
			        if(businesses.valid_cnt == 1){ //성공했을때
						$("#checCeonNmResult").text("사업자번호 인증에 성공하였습니다. ");		
						$("#checCeonNmResult").css("color", "blue");
						ceoNum = true;
					}else{ //실패했을때
						$("#checCeonNmResult").text("사업자번호 인증에 실패하였습니다. 입력하신 정보를 다시한번 확인해주세요. ");		
						$("#checCeonNmResult").css("color", "red");
						ceoNum = false;
					}
					console.log(ceoNum);
			    },
			    error: function(result) {
			        console.log(result.responseText); //responseText의 에러메세지 확인
			    }
		 });

	}); //사업자번호 인증api
	
	//사업자 인증하기 버튼 누를때 이름, 개업일 입력필수 처리
	$("#api").click(function(){
		 var name = $('#u_name').val();
   		 var date = $('#com_date').val();

     if(!name){
			alert("이름을 입력해주세요.");
			return false;		
		}
		
     if(!date){
			alert("개업일을 입력해주세요.");
			return false;		
		}
		
	});

}); //jquery
	