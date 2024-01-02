document.addEventListener('DOMContentLoaded', function() {
    var checkboxes = document.getElementsByName('report_reason');
    var reportButton = document.getElementById('reportButton');
    var checkbox = document.getElementById('agreeCheckbox');
    var contextPath = '${pageContext.request.contextPath}';


       $('#cancelButton').click(function() {
        window.location.href = contextPath + '/review/redetail?com_id=' + comId;
    });

    // 체크박스 하나만 선택하도록 하는 기능
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener('change', function() {
            for (var j = 0; j < checkboxes.length; j++) {
                if (checkboxes[j] != this) checkboxes[j].checked = false;
            }
        });
    }
    

$(document).ready(function(){
    $(".info-content").click(function(event){
        event.preventDefault();
        $("#infoPopup").show();
        $("body").css('overflow', 'hidden');
        $(".popup").css('background-color', 'rgba(0, 0, 0, 0.7)');
        // 숨겨야 할 요소들 숨기기
        $(".header-right").hide();
        $(".sticky_bottom_btns").hide();
    });

    $("#closePopup").click(function(event){
        event.stopPropagation();
        $("#infoPopup").hide();
        $("body").css('overflow', 'auto');
        // 숨겨진 요소들 다시 보이게 하기
        $(".header-right").show();
        $(".sticky_bottom_btns").show();
    });
    
    

    // 신고하기 버튼 클릭 이벤트 수정
    $("#reportButton").click(function(e) {
        var atLeastOneChecked = Array.prototype.slice.call(checkboxes).some(x => x.checked);
        if (!atLeastOneChecked) {
            e.preventDefault();
            alert('신고 사유를 선택해주세요.');
        }
    });
});

      // 개인정보 수집 및 이용 동의 체크박스 확인
    var form = document.getElementById('reviewReportPro');
    var agreementCheckbox = document.getElementById('agreeCheckbox'); 

    form.addEventListener('submit', function(event) {
        if (!agreementCheckbox.checked) {
            event.preventDefault();
            alert('개인정보 수집 및 이용 동의를 체크해 주세요');
        }
    });
});
