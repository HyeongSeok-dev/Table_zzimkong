$(function() {
	
	/* [ register ] */
	/* 텍스트 박스에 숫자만 입력 할 수 있음 */
	$('#hMax').on('input', function () {
    	$(this).val($(this).val().replace(/[^0-9]/g, ''));
	});
	$('#com_tel').on('input', function () {
    	$(this).val($(this).val().replace(/[^0-9]/g, ''));
	});
	$('#com_num_register').on('input', function () {
    var input = $(this).val().replace(/[^0-9]/g, '');
	    if(input.length > 10) {
	        input = input.substring(0, 10);
	    }
	    $(this).val(input);
	});
	$('#keyword').on('input', function(e) {
	    var lines = $(this).val().split('\n');
	    for (var i = 0; i < lines.length; i++) {
	        if (lines[i].length > 0 && lines[i][0] != '#') {
	            lines[i] = '#' + lines[i];
	        }
	    }
	    $(this).val(lines.join('\n'));
	    
	});
	
	$('#keyword').on('keydown', function(e) {
    if (e.which == 32) { // 32는 스페이스바의 키 코드입니다.
        e.preventDefault(); // 스페이스바의 기본 동작을 취소합니다.
        $(this).val($(this).val() + '#'); // 현재 입력 필드의 내용 뒤에 '#' 문자를 추가합니다.
    }
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
	
	//사진 미리보기
    $('#file').change(function() {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = $('<img>').attr('src', e.target.result).css('max-width', '290px').css('max-height', '200px');
            $('#img').empty().append(img);
        }
        reader.readAsDataURL(this.files[0]);
    });
	
	$("#comNumBtn").on("click", function(){
		if($("#com_num_register").val() == "") {
			alert("사업자 등록 번호를 입력해 주세요.");
		} else {
			var data = {
		    "b_no": [$("#com_num_register").val()] // 사업자번호 "xxxxxxx" 로 조회 시,
		   }; 
		
			$.ajax({
				type: "POST",
				url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=mtlt43WH%2BFWYUXqzevm8DYClYRQKrSpN2Ci%2BIL2Gd1mEnNh3mtqJU0lUAOl68D6iIUKyt4JPb4gz65d4NzarzA%3D%3D",
				data:  JSON.stringify(data),
				contentType: "application/json",
	  			accept: "application/json",
				dataType: "json",
				accept: "application/json",
				success: function(result) {
					console.log(result);
					let businessesResult = result.busunesses;
					let com_num = businessesResult.b_no; // 사업자 등록번호
					let user_name = businessesResult.p_nm; // 대표명
					let com_name = businessesResult.b_nm; // 상호
					let com_category = businessesResult.b_sector; //업태
					let com_address = businessesResult.b_adr; //주소
					
					$("#com_num").val(com_num);
					$("#user_name").val(user_name);
					$("#com_name").val(com_name);
					$("#com_category").val(com_category);
					$("#com_category").val(com_address);
				},
				error: function(result) {
					 console.log(result.responseText)
				}
			});
		}
		
	});// 조회버튼
	
//	$("form").submit(function(){
//		if($("#com_num_register").val() == "") {
//			alert("사업자 등록번호를 조회해 주세요");
//			$('html, body').animate({
//            scrollTop: $('body').offset().top
//            }, 500);
//            $("#com_num_register").focus();
//			return false;
//		} else if($("#com_tel").val() == "") {
//			alert("전화번호를 입력해 주세요");
//			$('html, body').animate({
//            scrollTop: $('body').offset().top
//            }, 500);
//            $("#com_tel").focus();
//			return false;
//		} else if($("#file").val() == "") {
//			alert("사업장의 사진을 등록해 주세요");
//			$('html, body').animate({
//            scrollTop: $('body').offset().top
//            }, 500);
//            $("#file").focus();
//			return false;
//		} else if($("#openHour").val() == "") {
//			alert("영업 시작시간을 선택해 주세요.");
//            $("#openHour").focus();
//			return false;
//		} else if($("#openMin").val() == "") {
//			alert("영업 시작시간을 선택해 주세요.");
//            $("#openMin").focus();
//			return false;
//		} else if($("#closeHour").val() == "") {
//			alert("영업 종료시간을 선택해 주세요.");
//            $("#closeHour").focus();
//			return false;
//		} else if($("#closeMin").val() == "") {
//			alert("영업 종료시간을 선택해 주세요.");
//			$("#closeMin").focus();
//			return false;
//		} else if($("#com_max_people").val() == "") {
//			alert("예약 최대인원을 선택해 주세요.");
//			$("#com_max_people").focus();
//			return false;
//		} else if($("#adRegister").val() == "") {
//			alert("광고신청사항을 선택해 주세요.");
//			$("#adRegister").focus();
//			return false;
//		} else if($("#adRegister").val() == "신청" && $("#adLevel").val() == "0단계") {
//			alert("광고를 신청하셨습니다.\n 광고단계를 선택해 주세요.");
//			 $('#adLevel').focus();
//			return false;
//		} else if($('input[type="checkbox"]:checked').length == 0) {
//			alert("카테고리를 선택해 주세요");
//			return false;
//		} 
//		return true;
//	});
	
}); //jquery문 전체
