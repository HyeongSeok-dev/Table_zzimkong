window.onload = function() {
	
// 	만약 포인트사용 가능한 금액이 결제금액 보다 적으면 포인트가 적습니다 표시 아니
// 	라면 텍스트박스의 value값이 변하고 사용가능한 금액이 0원으로 변함
	document.querySelector("#useAllPoint").onclick = function() {
		document.querySelector("#useable").innerHTML = "0";
		document.querySelector("#pointsToUse").value = "1000원";
		
	};
	
	//전체동의 체크박스 선택시 동의란 모두 체크됨
	document.querySelector("#checkAllAgree").onclick = function() {
		for(let i = 0; i < document.payForm.agreement.length; i++) {
			document.payForm.agreement[i].checked = document.querySelector("#checkAllAgree").checked;
		}
	};
	
	//무통장 입금시 각은행별 계좌번호
	document.payForm.bankSelect.onchange = function() {
		switch (document.payForm.bankSelect.value) {
		case "신한": document.payForm.accNum.value = "111-1234-12345"; 
					break;
		case "국민": document.payForm.accNum.value = "222-1234-12345";
					break;
		case "우리": document.payForm.accNum.value = "333-1234-12345";
					break;
		case "하나": document.payForm.accNum.value = "444-1234-12345";
					break;
		case "농협": document.payForm.accNum.value = "555-1234-12345";
					break;
		case "기업": document.payForm.accNum.value = "666-1234-12345";
					break;
		case "시티": document.payForm.accNum.value = "777-1234-12345";
					break;
		case "SC": document.payForm.accNum.value = "888-1234-12345";
					break;
		case "우체국": document.payForm.accNum.value = "999-1234-12345";
					break;
		case "부산": document.payForm.accNum.value = "1010-1234-12345";
					break;
		case "대구": document.payForm.accNum.value = "1111-1234-12345";
					break;
		case "외환": document.payForm.accNum.value = "1212-1234-12345";
					break;
		case "카카오뱅크": document.payForm.accNum.value = "1313-1234-12345";
					break;
		case "케이뱅크": document.payForm.accNum.value = "1414-1234-12345";
					break;
		}
	};
	
	
};