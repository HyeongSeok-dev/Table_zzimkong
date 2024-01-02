document.addEventListener('DOMContentLoaded', function() {
    var checkboxes = document.getElementsByName('report_reason');
    var reportButton = document.getElementById('reportButton');
    var checkbox = document.getElementById('agreeCheckbox');

    // 체크박스를 하나만 선택할 수 있도록 하는 기능
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener('change', function() {
            for (var j = 0; j < checkboxes.length; j++) {
                if (checkboxes[j] != this) checkboxes[j].checked = false;
            }
        });
    }

    // 체크박스를 하나라도 선택하지 않았을 경우 폼 제출을 막는 기능
    reportButton.addEventListener('click', function(e) {
        var atLeastOneChecked = Array.prototype.slice.call(checkboxes).some(x => x.checked);
        if (!atLeastOneChecked) {
            e.preventDefault();
            alert('신고 사유를 선택해주세요.');
        }
    });

    /* 보기 버튼 눌렀을때 제일 우선으로 만드는 js */
//    var infoLink = document.querySelector('.info-content'); 
//    var infoPopup = document.getElementById('infoPopup'); 
//    var closeButton = document.getElementById('closePopup'); 
//    var header = document.querySelector('.header-left'); 
//    var bottomButtons = document.querySelector('.sticky_bottom_btns');
//
//    // Show the popup when the link is clicked
//    infoLink.addEventListener('click', function(event) {
//        event.preventDefault();
//        infoPopup.style.display = 'block';
//        header.classList.add('hide-element');
//        bottomButtons.classList.add('hide-element');
//    });
//
//    // Close the popup when the close button is clicked
//    closeButton.addEventListener('click', function() {
//        infoPopup.style.display = 'none';
//        header.classList.remove('hide-element');
//        bottomButtons.classList.remove('hide-element');
//    });


//  $(document).ready(function(){
//    $(".info-content").click(function(event){
//      event.preventDefault();
//      $("#infoPopup").show();
//      $("body").css('overflow', 'hidden');
//      $(".popup").css('background-color', 'rgba(0, 0, 0, 0.7)');
//    });
//
//    $("#closePopup").click(function(event){
//	  event.stopPropagation();
//	  $("#infoPopup").hide();
//	  $("body").css('overflow', 'auto');
//	});
//  });

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
