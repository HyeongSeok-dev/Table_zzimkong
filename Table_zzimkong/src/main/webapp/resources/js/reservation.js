//가게유의사항 전체체크
function checkbox_allCheck(){
	for(let item of document.reservation.check){
		item.checked = document.reservation.checkAll.checked;
	}
}



//성명, 연락처, 약관동의, 유의사항동의 값없으면 포커스 이동
function btnPay() {
  var resName = document.forms["reservation"]["resName"];
  var resNumber = document.forms["reservation"]["resNumber"];
  var checkbox = document.getElementById("checkbox_agree");
  var checkboxes = document.querySelectorAll(".agree_main input[type='checkbox']");


  if (resName.value == "") {
    alert("성명을 입력해주세요.");
    resName.focus();
    return false;
  }

  if (resNumber.value == "") {
    alert("연락처를 입력해주세요.");
    resNumber.focus();
    return false;
  }
  
  if (!checkbox.checked) {
    alert("예약 약관에 동의해주세요.");
    checkbox.focus();
    return false;
  }
  

    for (var i = 0; i < checkboxes.length; i++) {
        if (!checkboxes[i].checked) {
            alert("[필수] 항목에 동의해주세요.");
            checkboxes[i].focus();
            return false;
        }
    }
    
    //필수값 입력 후 결제하기버튼 클릭 시 컨펌창 띄우기
	  var isConfirmed = confirm("방문자 정보를 한번 더 확인해 주세요!\n방문자 : 이재환 연락처 : 010");
	  // 사용자가 확인을 클릭했을 때만 결제 페이지로 이동합니다.
	  if (isConfirmed) {
		//결제페이지로 넘어가기
	    window.location.href = "payment";
	  }else{
		visitName.focus();
	  }
    
    
    return true;
	

//  return false;  // form의 기본 제출 동작을 방지합니다.
				
}

// 예약자정보 방문자정보에 복사 입력
window.onload = function() {
  document.getElementById("checkbox_same_info").addEventListener("click", copyInfo);
}

function copyInfo() {
  if (document.getElementById("checkbox_same_info").checked) {
    document.getElementsByName("name")[0].value = document.getElementsByName("resName")[0].value;
    document.getElementsByName("number")[0].value = document.getElementsByName("resNumber")[0].value;
  } else {
    document.getElementsByName("name")[0].value = "";
    document.getElementsByName("number")[0].value = "";
  }
}



//function checkResInfo(){
//	 // 사용자에게 결제를 진행할 것인지 확인받는 confirm 창을 띄웁니다.
//	  var isConfirmed = confirm("방문자 정보를 한번 더 확인해 주세요!\n방문자 : 이재환 연락처 : 010");
//		  // 사용자가 확인을 클릭했을 때만 결제 페이지로 이동합니다.
//	  if (isConfirmed) {
//		//결제페이지로 넘어가기
//	    window.location.href = "payment";
//	  }else{
//		visitName.focus();
//	  }
//	  return false;  // form의 기본 제출 동작을 방지합니다.
//}