$(function() {
	 console.log("test");
	 console.log("test" + $("#file").val());
	/* 텍스트 박스에 숫자만 입력 할 수 있음 */
	$('#hMax').on('input', function () {
    	$(this).val($(this).val().replace(/[^0-9]/g, ''));
	});
	$('#com_tel').on('input', function () {
    	 var input = $(this).val().replace(/[^0-9]/g, '');
    	if(input.length > 12) {
	        input = input.substring(0, 12);
	    }
	    $(this).val(input);
	});
	
	/* 광고 신청이 미신청 상태이면 광고 단계 0으로 바꿈*/
	$("#adRegister").on("change", function() {
		if($("#adRegister").val() === "미신청") {
			$("#adLevel").val("0단계");
			$("#adLevel").prop('disabled', true);
		} else if($("#adRegister").val() === "신청") {
			$("#adLevel").prop('disabled', false);
		}
 
	});
	
	$('#keyword').on('input', function() {
	    var lines = $(this).val().split('\n');
	    for (var i = 0; i < lines.length; i++) {
	        if (lines[i].length > 0 && lines[i][0] != '#') {
	            lines[i] = '#' + lines[i];
	        }
	    }
	    $(this).val(lines.join('\n'));
	    
	});
	
	$('#keyword').on('keydown', function(e) {
    if (e.which == 32) { 
        e.preventDefault();
        $(this).val($(this).val() + '#');
    }
    });
    
    $('#uploadFileBtn').click(function() {
        $('#file').click();
    });

    $('#file').on('change', function() {
        var fileName = $(this).val().split('\\').pop();
        $('#fileLabel').text(fileName ? fileName : '선택된 파일 없음');
    });
	
	$('#file').change(function() {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = $('<img>').attr('src', e.target.result).css('max-width', '290px').css('max-height', '200px');
            $('#img').empty().append(img);
        }
        reader.readAsDataURL(this.files[0]);
    });
    
    $("#button_cancel").on("click", function() {
		console.log("fff");
		if(confirm("정말 폐점신청을 하시겠습니까? \n 폐점신청을 취소하시려면 고객센터로 연락해 주세요.")){
			 $("#comCancelForm").submit();
			 return "true";
		} else {
			return "false";
		}
		
	});
    
	$("#modifyButton").on("click", function() {
		console.log("수정버튼");
		if($("#com_tel").val() == "") {
			alert("전화번호를 입력해 주세요");
			$('html, body').animate({
            scrollTop: $('body').offset().top
            }, 500);
            $("#com_tel").focus();
//		} else if($("#file").val() == "") {
//			alert("사진을 등록해 주세요!");
//			$('html, body').animate({
//            scrollTop: $('body').offset().top
//            }, 500);
//            $("#file").focus();
		} else if($("#openHour").val() == "") {
			alert("영업 시작시간을 선택해 주세요.");
            $("#openHour").focus();
			return false;
		} else if($("#openMin").val() == "") {
			alert("영업 시작시간을 선택해 주세요.");
            $("#openMin").focus();
		} else if($("#closeHour").val() == "") {
			alert("영업 종료시간을 선택해 주세요.");
            $("#closeHour").focus();
		} else if($("#closeMin").val() == "") {
			alert("영업 종료시간을 선택해 주세요.");
			$("#closeMin").focus();
		} else if($("#com_max_people").val() == "") {
			alert("예약 최대인원을 선택해 주세요.");
			$("#com_max_people").focus();
		} else if($('input[type="checkbox"]:checked').length == 0) {
			alert("카테고리를 선택해 주세요");
		} else {
			$("#registerForm").submit();	
		}
	});
}); //jquery문 전체
