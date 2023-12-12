//가게유의사항 전체체크
function checkbox_allCheck(){
	for(let item of document.reservation.check){
		item.checked = document.reservation.checkAll.checked;
	}
}



//성명, 연락처, 약관동의 값없으면 포커스 이동
function btnPay() {
  var resName = document.forms["reservation"]["resName"];
  var resNumber = document.forms["reservation"]["resNumber"];
  var checkbox = document.getElementById("checkbox_agree");

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
				
	return true;
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