// 회원 상세정보창 열기 : admin_user.jsp
function user_info_open(user_idx) {
	/* 팝업창 중앙 정렬 */
	var popupW = 750;
	var popupH = 650;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	
	/* 각 회원정보로 이동하기 위한 주소 */
	var url = "user/info?user_idx=" + user_idx;
	
	window.open(url,'','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}

// 회원 탈퇴 처리 : admin_user.jsp
function user_withdraw(user_idx) {
  var result = confirm("회원을 강제 탈퇴시키겠습니까?");
  if(result) { // 확인을 눌렀을 경우
      var form = document.createElement("form");
      form.method = "POST";
      form.action = "./user/withdraw/pro";

      var element = document.createElement("input");
      element.value = user_idx;
      element.name = "user_idx";
      form.appendChild(element);

      document.body.appendChild(form);

      form.submit();
  } else {
    event.preventDefault();
  }
};


// 업체 상세정보창 열기 : admin_company.jsp
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

// 업체 드롭박스 체크 : admin_company_info.jsp
// 취소 버튼 누를 시 취소 전 이전값으로 돌림
window.onload = function() {
	// 주소에 'company/info'이 포함되면 실행 (설정 안하면 다른 페이지에서 개발자 도구 오류 뜸)
    if (window.location.href.includes('company/info')) {
        var company_state = document.getElementById('company_state');

        if (company_state) {
            company_state.onmouseup = function() {
                prev_index = this.selectedIndex;
            };

            company_state.onchange = function() {
                var value = this.options[this.selectedIndex].value;

                if(value == "1") {
                    if (!confirm("정상 상태로 바꾸시겠습니까?")) {
                        this.selectedIndex = prev_index;
                    }
                } else if(value == "3") {
                    if (!confirm("영업중지 상태로 바꾸시겠습니까?")) {
                        this.selectedIndex = prev_index;
                    }
                }
            };
        } else {
            console.log('company_state element is not found');
        }
    }
};


// 업체 입점 승인/반려 처리 : admin_company.jsp
function company_approve(event, com_id, company_open_register) {
    var result = confirm("입점을 승인하시겠습니까?");
    
    if(result) {
        var form = document.getElementById("companyOpenForm" + com_id);
        
        document.getElementById('com_id' + com_id).value = parseInt(com_id);
        document.getElementById('company_open_register' + com_id).value = company_open_register;

        form.submit();
    } else {
        event.preventDefault();
    }
};

function company_disapprove(event, com_id, company_open_register) {
    var result = confirm("입점을 반려하시겠습니까?");
    
    if(result) {
        var form = document.getElementById("companyOpenForm" + com_id);
        
        document.getElementById('com_id' + com_id).value = com_id;
        document.getElementById('company_open_register' + com_id).value = company_open_register;

        form.submit();
    } else {
        event.preventDefault();
    }
};


// 신고 상세정보창 열기 : admin_report.jsp
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

// 신고 승인/반려 처리 : admin_report_declaration.jsp
document.addEventListener('DOMContentLoaded', (event) => {
	window.report_approve = function(report_num, reportName) {
		var result = confirm("신고를 승인하시겠습니까?");
		if(result) {
			document.getElementById('report_num').value = report_num;
			document.getElementById('report_approve_register').value = reportName;
			document.getElementById('reportRegister').submit();
		} else {
			event.preventDefault();
		}
	}
window.report_disapprove = function(report_num, reportName) {
	var result = confirm("신고를 반려하시곘습니까?");
		if(result) {
			document.getElementById('report_num').value = report_num;
			document.getElementById('report_approve_register').value = reportName;
			document.getElementById('reportRegister').submit();
		} else {
			event.preventDefault();
		}
	}
});


// 고객센터 - 공지사항 글 등록 : admin_cs_notice.jsp
function noticeRegisterForm() {
	/* 팝업창 중앙 정렬 */
	var popupW = 950;
	var popupH = 700;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open('notice/register','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}

// 고객센터 - 공지사항 각 뷰페이지로 이동 : admin_cs_notice.jsp
function noticeViewForm(cs_board_num, cs_board_category_user, contextPath) {
	/* 팝업창 중앙 정렬 */
	var popupW = 950;
	var popupH = 700;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	
	/* 각 공지사항 페이지로 이동하기 위한 주소 */
	var url = contextPath;
	if(cs_board_category_user == 1 || cs_board_category_user == 3) {
		url += "/member/cs/notice/view?cs_board_num=" + cs_board_num;
	}
	if(cs_board_category_user == 2) {
		url += "/ceo/cs/notice/view?cs_board_num=" + cs_board_num;
	}
	
	window.open(url,'','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}


// 고객센터 - 자주묻는질문 글 등록 : admin_cs_faq.jsp
function faqRegisterForm() {
	/* 팝업창 중앙 정렬 */
	var popupW = 950;
	var popupH = 700;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open('faq/register','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}

// 고객센터 - 자주묻는질문 각 뷰페이지로 이동 : admin_cs_faq.jsp
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


// 카테고리 필터
// 1) 회원 관리 - 회원 구분, 회원 상태
document.addEventListener("DOMContentLoaded", function(){
    const memberCategorySelect = document.querySelector('#memberCategory');
    const memberStatusCategorySelect = document.querySelector('#memberStatusCategory');
    const memberItems = document.querySelectorAll('.member_item');
    const memberStatusItems = document.querySelectorAll('.member_status_item');
    
    function filterMembers() {
        const currentCategory = memberCategorySelect.value;
        const currentStatusCategory = memberStatusCategorySelect.value;
        
        for (let i = 0; i < memberItems.length; i++) {
            const trElement = memberItems[i].closest('tr');
            const memberStatus = trElement.querySelector('.member_status_item');

            if ((currentCategory === 'member_all' || memberItems[i].dataset.category === currentCategory)
                && (currentStatusCategory === 'member_status_all' || memberStatus.dataset.category === currentStatusCategory)) {
                trElement.style.display = '';
            } else {
                trElement.style.display = 'none';
            }
        }
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
