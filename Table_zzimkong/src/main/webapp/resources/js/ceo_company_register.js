$(function() {
	
	/* [ register ] */
	/* 텍스트 박스에 숫자만 입력 할 수 있음 */
	$('#hMax').on('input', function () {
    	$(this).val($(this).val().replace(/[^0-9]/g, ''));
	});
	$('#openDate').on('input', function () {
    	 var input = $(this).val().replace(/[^0-9]/g, '');
    	if(input.length > 8) {
	        input = input.substring(0, 8);
	    }
	    $(this).val(input);
	});
	$('#com_tel').on('input', function () {
    	 var input = $(this).val().replace(/[^0-9]/g, '');
    	if(input.length > 12) {
	        input = input.substring(0, 12);
	    }
	    $(this).val(input);
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
    if (e.which == 32) {
        e.preventDefault();
        $(this).val($(this).val() + '#'); 
    }
});
	
	
	/* 광고 신청이 미신청 상태이면 광고 단계 0으로 바꿈*/
	$("#adRegister").on("change", function() {
		if($("#adRegister").val() === "미신청") {
			$("#adLevel").val("0");
			$("#adLevel").prop('disabled', true);
		} else if($("#adRegister").val() === "신청") {
			$("#adLevel").prop('disabled', false);
		}
 
	});
	
	$('#uploadFileBtn').click(function() {
        $('#file').click();
    });

    $('#file').on('change', function() {
        var fileName = $(this).val().split('\\').pop();
        $('#fileLabel').text(fileName ? fileName : '선택된 파일 없음');
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
	
	// 사업자 등록번호 조회하기 
	$("#comNumBtn").on("click", function(){
		if($("#com_num_register").val() == "") {
			alert("사업자 등록 번호를 입력해 주세요.");
		} else if($("#openDate").val() == "") { 
			alert("개업일자를 입력해 주세요.");
			
		} else {
			var data = {
			    
		   "businesses": [
						    {
						      "b_no": $("#com_num_register").val(), // 사업자번호 필수
							  "start_dt" : $("#openDate").val(), // 개업일 필수
							  "p_nm" : $("#user_name").val(), // 대표자명 필수
						      "p_nm2": "",
						      "b_nm": "",
						      "corp_no": "",
						      "b_sector": "",
						      "b_type": "",
						      "b_adr": ""
						    }
						  ]
		   }; 
		
			$.ajax({
				type: "POST",
				url: "https://api.odcloud.kr/api/nts-businessman/v1/validate?"
				 + "serviceKey=mtlt43WH%2BFWYUXqzevm8DYClYRQKrSpN2Ci%2BIL2Gd1mEnNh3mtqJU0lUAOl68D6iIUKyt4JPb4gz65d4NzarzA%3D%3D"
//				+ "serviceKey=mtlt43WH+FWYUXqzevm8DYClYRQKrSpN2Ci+IL2Gd1mEnNh3mtqJU0lUAOl68D6iIUKyt4JPb4gz65d4NzarzA=="
				 ,
				data:  JSON.stringify(data),
				contentType: "application/json",
				dataType: "json",
				accept: "application/json",
				success: function(businesses) {
					console.log(businesses);
					let com_num = businesses.b_no; // 사업자 등록번호 
					let ceo_name = businesses.p_nm; // 대표명 
					let com_name = businesses.b_nm; // 상호
					let com_category = businesses.b_sector; //업태
					let com_address = businesses.b_adr; //주소
					console.log(ceo_name);
					console.log(businesses.p_nm);
					if(ceo_name === $("#user_name").val()){
						$("#com_num").val(com_num);
						$("#com_num").attr('readonly', true);
						$("#com_name").val(com_name);
						$("#com_category").val(com_category);
						$("#com_category").attr('readonly', true);
						$("#com_address").val(com_address);
						$("#com_address").attr('readonly', true);
						$("#guide").text("조회확인");
						$("#guide").css("color","green");
						
					} else {
						alert("조회하신 사업자등록번호의 대표자명이 회원님의 성함과 일치하지 않습니다."
						+ "\n사업자등록번호를 다시한번 확인해 주세요!");
						$("#guide").text("사업자등록번호를 다시 확인해주세요!");
						$("#guide").css("color","#bb5b67");
					}
					
				},
				error: function(result) {
					 console.log(result.responseText)
					$("#guide").text("사업자등록번호를 다시 확인해주세요!");
					$("#guide").css("color","#bb5b67");
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
