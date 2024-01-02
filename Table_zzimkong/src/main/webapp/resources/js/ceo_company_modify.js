$(function() {
	
	/* [ register ] */
	/* 텍스트 박스에 숫자만 입력 할 수 있음 */
	$('#hMax').on('input', function () {
    	$(this).val($(this).val().replace(/[^0-9]/g, ''));
	});
	$('#com_tel').on('input', function () {
    	$(this).val($(this).val().replace(/[^0-9]/g, ''));
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
	
	$('#file').change(function() {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = $('<img>').attr('src', e.target.result).css('max-width', '290px').css('max-height', '200px');
            $('#img').empty().append(img);
        }
        reader.readAsDataURL(this.files[0]);
    });
		
	$(".button_olive").on("click", function() {
		$("#registerForm").submit(function(){
			if($("#com_tel").val() == "") {
				alert("전화번호를 입력해 주세요");
				$('html, body').animate({
	            scrollTop: $('body').offset().top
	            }, 500);
	            $("#com_tel").focus();
				return false;
			} else if($("#file").val() == "") {
				alert("사업장의 사진을 등록해 주세요");
				$('html, body').animate({
	            scrollTop: $('body').offset().top
	            }, 500);
	            $("#file").focus();
				return false;
			} else if($("#openHour").val() == "") {
				alert("영업 시작시간을 선택해 주세요.");
	            $("#openHour").focus();
				return false;
			} else if($("#openMin").val() == "") {
				alert("영업 시작시간을 선택해 주세요.");
	            $("#openMin").focus();
				return false;
			} else if($("#closeHour").val() == "") {
				alert("영업 종료시간을 선택해 주세요.");
	            $("#closeHour").focus();
				return false;
			} else if($("#closeMin").val() == "") {
				alert("영업 종료시간을 선택해 주세요.");
				$("#closeMin").focus();
				return false;
			} else if($("#com_max_people").val() == "") {
				alert("예약 최대인원을 선택해 주세요.");
				$("#com_max_people").focus();
				return false;
			} else if($('input[type="checkbox"]:checked').length == 0) {
				alert("카테고리를 선택해 주세요");
				return false;
			} 
			return true;
		});
	});
}); //jquery문 전체
