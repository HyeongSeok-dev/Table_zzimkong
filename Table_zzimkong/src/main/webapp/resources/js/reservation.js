function checkbox_allCheck(){
	for(let item of document.reservation.check){
		item.checked = document.reservation.checkAll.checked;
	}
}


function submit() {
	if(document.reservation.name.value == ""){
		alert("예약자 성함 입력 필수!")
		document.reservation.name.focus();
		return false;
			
	}else if(document.reservation.number.value == ""){
		alert("예약자 연락처 입력 필수!")
		document.reservation.number.focus();
		return false;

	}else if(document.reservation.agree.value == ""){
		alert("예약약관에 동의해주세요.")
		document.reservation.agree.focus();
		return false;
	}
				
	return true;
}