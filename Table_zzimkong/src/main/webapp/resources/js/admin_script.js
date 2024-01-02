// admin_user.jsp
function user_withdraw(user_idx) {
    var result = confirm("강제 탈퇴시키겠습니까?");
    if(result) { // 확인을 눌렀을 경우
        document.getElementById('user_idx').value = user_idx;
        document.getElementById('withdrawForm').submit();
    } else {
		event.preventDefault();
    }
}


// admin_report.jsp
function report_declaration(report_num) {
	/* 팝업창 중앙 정렬 */
	var popupW = 750;
	var popupH = 650;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	
	/* 각 신고정보로 이동하기 위한 주소 */
	var url = "report/detail?report_num=" + report_num;
	
	window.open(url,'','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
};


// admin_report_declaration.jsp
function report_blind() {
	confirm("리뷰 블라인드 처리하시겠습니까?");
}
function report_blind_not() {
	confirm("반려하시곘습니까?");
}


// admin_company.jsp
function company_info_open(com_id) {
	/* 팝업창 중앙 정렬 */
	var popupW = 750;
	var popupH = 650;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	
	/* 각 업체정보로 이동하기 위한 주소 */
	var url = "company/info?com_id=" + com_id;
	
	window.open(url,'','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}

function company_approve(com_id) {
	var result = confirm("입점 승인합니다.");
    if(result) { // 확인을 눌렀을 경우
        document.getElementById('com_id').value = com_id;
        document.getElementById('companyApprove').submit();
    } else {
		event.preventDefault();
    }
}
function company_disapprove() {
	confirm("입점 거부합니다.");
}


// admin_company_info.jsp
function company_shut_down() {
	var company_state = document.getElementById("company_state");
	var prev_value = company_state.options[company_state.selectedIndex].value;
	var value = company_state.options[company_state.selectedIndex].value;
	
	console.log(prev_value);
	console.log(value);
	
	if(value == "4") {
		if (!confirm("폐점 상태로 바꾸시겠습니까?")) {
            value = prevValue; // '취소'를 눌렀을 때 이전 값으로 돌림
        }
	} else if(value == "3") {
		if (!confirm("영업중지 상태로 바꾸시겠습니까?")) {
            value = prevValue; // '취소'를 눌렀을 때 이전 값으로 돌림
        }
	}
}


// 고객센터
// admin_cs_notice.jsp
function noticeRegisterForm() {
	/* 팝업창 중앙 정렬 */
	var popupW = 950;
	var popupH = 700;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open('notice/register','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}

function noticeViewForm(cs_board_num, cs_board_category_user, contextPath) {
	/* 팝업창 중앙 정렬 */
	var popupW = 950;
	var popupH = 700;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	
	/* 각 공지사항 페이지로 이동하기 위한 주소 */
	var url = contextPath;
	if(cs_board_category_user == 1) {
		url += "/member/cs/notice/view?cs_board_num=" + cs_board_num;
	}
	if(cs_board_category_user == 2) {
		url += "/ceo/cs/notice/view?cs_board_num=" + cs_board_num;
	}
	
	window.open(url,'','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}

// admin_cs_faq.jsp
function faqRegisterForm() {
	/* 팝업창 중앙 정렬 */
	var popupW = 950;
	var popupH = 700;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open('faq/register','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}

function faqViewForm(cs_board_num, cs_board_category_user, contextPath) {
	/* 팝업창 중앙 정렬 */
	var popupW = 950;
	var popupH = 700;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	
	/* 각 자주묻는질문 페이지로 이동하기 위한 주소 */
	var url = contextPath;
	if(cs_board_category_user == 1) {
		url += "/member/cs/faq/view?cs_board_num=" + cs_board_num;
	}
	if(cs_board_category_user == 2) {
		url += "/ceo/cs/faq/view?cs_board_num=" + cs_board_num;
	}
	
	window.open(url,'','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}
	
// admin_cs_faq_register.jsp
$(document).ready(function() {
    $('.csUserSelect').change(function() {
        var userSelect = $(this).val();
        if (userSelect == '1') {
            $('.member_category_select').show();
            $('.ceo_category_select').hide();
        } else if (userSelect == '2') {
            $('.ceo_category_select').show();
            $('.member_category_select').hide();
        }
    });
});

//// 사용자가 선택한 값을 로컬스토리지에 저장
//document.getElementById('memberCategory').addEventListener('change', function() {
//    localStorage.setItem('selectedMemberCategory', this.value);
//});
//
//// 페이지 로드 시 저장된 값을 불러와서 셀렉트 박스에 설정
//window.onload = function() {
//    var selectedValue = localStorage.getItem('selectedMemberCategory');
//    if(selectedValue) {
//        document.getElementById('memberCategory').value = selectedValue;
//    }
//};


// 카테고리 필터
// 1) 회원 관리 - 회원 구분, 회원 상태
document.addEventListener("DOMContentLoaded", function(){
	console.log("시작!");
	
    const memberCategorySelect = document.querySelector('#memberCategory');
    const memberStatusCategorySelect = document.querySelector('#memberStatusCategory');
    const memberItems = document.querySelectorAll('.member_item');
    const memberStatusItems = document.querySelectorAll('.member_status_item');

	console.log('memberCategorySelect:', memberCategorySelect.value);
	console.log('memberStatusCategorySelect:', memberStatusCategorySelect.value);

    // 사용자가 선택한 값을 로컬스토리지에 저장
    memberCategorySelect.addEventListener('change', function() {
        localStorage.setItem('selectedMemberCategory', memberCategorySelect.value);
        
        console.log('1memberCategorySelect:', memberCategorySelect.value);
		console.log('1memberStatusCategorySelect:', memberStatusCategorySelect.value);

    });

    memberStatusCategorySelect.addEventListener('change', function() {
        localStorage.setItem('selectedMemberStatusCategory', memberStatusCategorySelect.value);
    	
    	console.log('2memberCategorySelect:', memberCategorySelect.value);
		console.log('2memberStatusCategorySelect:', memberStatusCategorySelect.value);
    });
	
    // 페이지 로드 시 저장된 값을 불러와서 셀렉트 박스에 설정
    var selectedCategoryValue = localStorage.getItem('selectedMemberCategory');
    if (selectedCategoryValue) {
        memberCategorySelect.value = selectedCategoryValue;

    	console.log('3memberCategorySelect:', memberCategorySelect.value);
		console.log('3memberStatusCategorySelect:', memberStatusCategorySelect.value);
    }

    var selectedStatusCategoryValue = localStorage.getItem('selectedMemberStatusCategory');
    if (selectedStatusCategoryValue) {
        memberStatusCategorySelect.value = selectedStatusCategoryValue;

    	console.log('4memberCategorySelect:', memberCategorySelect.value);
		console.log('4memberStatusCategorySelect:', memberStatusCategorySelect.value);
    }

    function filterMembers() {
        const currentCategory = memberCategorySelect.value;
        const currentStatusCategory = memberStatusCategorySelect.value;

        // 서버에 데이터 요청
        fetch(`/zzimkong/admin/user?pageNum=1&searchMemberType=&searchMemberKeyword=&memberCategory=${currentCategory}&memberStatusCategory=${currentStatusCategory}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('네트워크 응답이 정상이 아닙니다: ' + response.status);
                }
                return response.text();  // HTML 형식의 응답을 받습니다.
            })
            .then(html => {
                // 서버로부터 받아온 HTML을 페이지에 적용
                document.querySelector('.text').innerHTML = html;
            })
            .catch(error => console.error('데이터를 가져오는 중 오류 발생:', error));
    }

    if (memberCategorySelect) {
        memberCategorySelect.addEventListener('change', filterMembers);
    }

    if (memberStatusCategorySelect) {
        memberStatusCategorySelect.addEventListener('change', filterMembers);
    }
});

// 2) 업체 관리 - 광고 등급, 업체 상태
document.addEventListener("DOMContentLoaded", function(){
    const adGradeCategorySelect = document.querySelector('#adGradeCategory');
    const companyStatusCategorySelect = document.querySelector('#companyStatusCategory');
    const adGradeItems = document.querySelectorAll('.ad_grade_item');
    const companyStatusItems = document.querySelectorAll('.company_status_item');

    function filterCompanys() {
        const currentAdCategory = adGradeCategorySelect.value;
        const currentComStatusCategory = companyStatusCategorySelect.value;
        
        for (let i = 0; i < adGradeItems.length; i++) {
            const trElement = adGradeItems[i].closest('tr');
            const companyStatus = trElement.querySelector('.company_status_item');

            if ((currentAdCategory === 'ad_grade_all' || adGradeItems[i].dataset.category === currentAdCategory)
                && (currentComStatusCategory === 'company_status_all' || companyStatus.dataset.category === currentComStatusCategory)) {
                trElement.style.display = '';
            } else {
                trElement.style.display = 'none';
            }
        }
    }

    if (adGradeCategorySelect) {
        adGradeCategorySelect.addEventListener('change', filterCompanys);
    }

    if (companyStatusCategorySelect) {
        companyStatusCategorySelect.addEventListener('change', filterCompanys);
    }
});

// 3) 신고 관리 - 신고 구분, 처리 상태
document.addEventListener("DOMContentLoaded", function(){
    const reportCategorySelect = document.querySelector('#reportCategory');
    const reportStatusCategorySelect = document.querySelector('#reportStatusCategory');
    const reportItems = document.querySelectorAll('.report_item');
    const reportStatusItems = document.querySelectorAll('.report_status_item');

    function filterReports() {
        const currentReportCategory = reportCategorySelect.value;
        const currentReportStatusCategory = reportStatusCategorySelect.value;
        
        for (let i = 0; i < reportItems.length; i++) {
            const trElement = reportItems[i].closest('tr');
            const reportStatus = trElement.querySelector('.report_status_item');

            if ((currentReportCategory === 'report_all' || reportItems[i].dataset.category === currentReportCategory)
                && (currentReportStatusCategory === 'report_status_all' || reportStatus.dataset.category === currentReportStatusCategory)) {
                trElement.style.display = '';
            } else {
                trElement.style.display = 'none';
            }
        }
    }

    if (reportCategorySelect) {
        reportCategorySelect.addEventListener('change', filterReports);
    }

    if (reportStatusCategorySelect) {
        reportStatusCategorySelect.addEventListener('change', filterReports);
    }
});