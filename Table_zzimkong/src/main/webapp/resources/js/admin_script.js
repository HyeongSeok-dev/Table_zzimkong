// admin_user.jsp
function user_withdraw() {
	confirm("강제 탈퇴시키겠습니까?");
}
	
	
// admin_review.jsp
function review_declaration() {
	/* 팝업창 중앙 정렬 */
	var popupW = 750;
	var popupH = 650;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open('review/detail','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
//	window.open("admin_review_declaration.jsp", "_blank", "width=400px, height=300px");
};


// admin_review_declaration.jsp
function report_blind() {
	confirm("리뷰 블라인드 처리하시겠습니까?");
}
function report_blind_not() {
	confirm("반려하시곘습니까?");
}


// admin_company.jsp
function company_info_open() {
	/* 팝업창 중앙 정렬 */
	var popupW = 750;
	var popupH = 650;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open('company/info','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}

function company_approve() {
	confirm("입점 승인합니다.");
}
function company_disapprove() {
	confirm("입점 거부합니다.");
}


// admin_company_info.jsp
function company_shut_down() {
	var company_state = document.getElementById("company_state");
	var value = company_state.options[company_state.selectedIndex].value;
	if(value == "4") {
		confirm("폐점 상태로 바꾸시겠습니까?");
	} else if(value == "3") {
		confirm("영업중지 상태로 바꾸시겠습니까?");
	}
}

