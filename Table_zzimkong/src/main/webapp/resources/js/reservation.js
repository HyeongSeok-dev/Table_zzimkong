//가게유의사항 전체체크
function checkbox_allCheck(){
	for(let item of document.reservation.check){
		item.checked = document.reservation.checkAll.checked;
	}
}



//성명, 연락처, 약관동의, 유의사항동의 값없으면 포커스 이동
function btnPay() {
	
  var resName = document.forms["reservation"]["res_name"];
  var resPhone = document.forms["reservation"]["res_phone"];
  var checkbox = document.getElementById("checkbox_agree");
  var checkboxes = document.querySelectorAll(".agree_main input[type='checkbox']");
  

  if (resName.value == "") {
    alert("방문자 성명을 입력해주세요.");
    resName.focus();
    return false;
  }

  if (resPhone.value == "") {
    alert("방문자 연락처를 입력해주세요.");
    resPhone.focus();
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
	  var isConfirmed = confirm("방문자 정보를 한번 더 확인해 주세요! \n방문자 : "+resName.value+" 연락처 : "+resPhone.value+"");
	  // 사용자가 확인을 클릭했을 때만 결제 페이지로 이동합니다.
	  if (isConfirmed) {
		
		//reservation update로직
		//submit
		var form = document.reservation;
		
		console.log("form", form)
    	form.submit();
    	
		//결제페이지로 넘어가기
	    //window.location.href = "payment";
	  }else{
		visitName.focus();
	  }
				
}

function updatePay(){
	
}

// 예약자정보 방문자정보에 복사 입력
window.onload = function() {
  document.getElementById("checkbox_same_info").addEventListener("click", copyInfo);
}

function copyInfo() {
  if (document.getElementById("checkbox_same_info").checked) {
    document.getElementsByName("res_name")[0].value = document.getElementsByName("userName")[0].value;
    document.getElementsByName("res_phone")[0].value = document.getElementsByName("userPhone")[0].value;
  } else {
    document.getElementsByName("res_name")[0].value = "";
    document.getElementsByName("res_phone")[0].value = "";
  }
}



