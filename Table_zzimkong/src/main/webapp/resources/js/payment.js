$(function() {
	
	var preOrderTotalPrice = $("#preOrderTotalPrice").text();
	var reservationPrice = $("#reservationPrice").text();
	var totalPayment = $("#totalPayment").text();
	if($("#preOrderTotalPrice").text() == "선결제 없음"){
		$("#totalPayment").text( $("#reservationPrice").text());
	}
	 else {
		$("#totalPayment").text(parseInt(preOrderTotalPrice) + parseInt(reservationPrice));
	}
	
	$("#checkAllAgree").on("change", function() { 
		
			if($("#checkAllAgree").prop("checked")){
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
	});
	
	$("#bankSelect").on("change", function() {
			switch($("#bankSelect").val()) {
			case "신한": $(".account").val("111-1234-12345"); 
						break
			case "국민": $(".account").val("222-1234-12345");
						break
			case "우리": $(".account").val("333-1234-12345");
						break
			case "하나": $(".account").val("444-1234-12345");
						break
			case "농협": $(".account").val("555-1234-12345");
						break
			case "기업": $(".account").val("666-1234-12345");
						break
			case "시티": $(".account").val("777-1234-12345");
						break
			case "SC": $(".account").val("888-1234-12345");
						break
			case "우체국": $(".account").val("999-1234-12345");
						break
			case "부산": $(".account").val("1010-1234-12345");
						break
			case "대구": $(".account").val("1111-1234-12345");
						break
			case "외환": $(".account").val("1212-1234-12345");
						break
			case "카카오뱅크": $(".account").val("1313-1234-12345");
						break
			case "케이뱅크": $(".account").val("1414-1234-12345");
						break
			}
	});
	
	var isChecked;
	$("#onSitePayment").click(function(event) {
		if($("#preOrderTotalPrice").text() == "선결제 없음") { //파라미터가 없으면으로 바꿔야함
			 event.preventDefault();
	         alert("선결제할 금액이 없습니다!");
		
		} else if($("#preOrderTotalPrice").text() != "선결제 없음") { 
			if(isChecked) {
	            $("#onSitePayment").prop('checked', false);
	            $("#preOrderTotalPrice").text("97,000");//여기파라미터값
	            $("#totalPayment").text("127,000원");
	            isChecked = false;
	        } else {
	            $("#preOrderTotalPrice").text("0");
	            $("#totalPayment").text("37,000원");
	            isChecked = true;
	        }
		}
	});
	
	// 만약 포인트가 0이거나, 내포인트가 input text 보다작으면 사용불가메세지
	$("#useAllPoint").on("click", function() {
			if($("#useablePoint").text() == "0") {
				alert("사용가능한 포인트가 없습니다!");
			} else {
				$(".point_to_use").val($("#useablePoint").text().trim()); //여기 내포인트 전액이 와야함
				 //여기 내포인트 전액이 와야함
				$("#useablePoint").text("0");
			}
	});
	
	$("#usePoint").on("click", function() {
		
		if($(".point_to_use").val() == "") {
			alert("포인트를 입력해주세요!");
		} else {
			$("#discountPoint").text($(".point_to_use").val());
			$("#nowPoint").text("0");
			var getTotalPayment = $("#totalPayment").text();
			var discountPoint = $("#discountPoint").text();
			totalPayment = getTotalPayment - discountPoint;
			$("#totalPayment").text(totalPayment);
			//총결제금액에서 -된금액이 와야함
		}
	});	

	$("form").submit(function() {
		
		if($('input[name="pay_method"]:checked').length == 0) { 
			
			if($("#preOrderTotalPrice").text() == "선결제 없음") { 
				alert("예약금의 결제수단을 선택해 주세요.");
				$('html, body').animate({
                scrollTop: $('#leftSec02').offset().top
            	}, 500);
				return false;
			} else if($("#preOrderTotalPrice").text() != "선결제 없음") { 
				alert("결제수단을 선택해 주세요.");
				$('html, body').animate({
                scrollTop: $('#leftSec02').offset().top
            	}, 500);
				return false;
			}
		
		} else if($("#creditCardPayment").is(':checked') && $("#cardSelect").val() == "") {
				alert("카드사를 선택해 주세요.");
				$('html, body').animate({
                scrollTop: $('#leftSec02').offset().top
            	}, 500);
				return false;
		} else if($("#accountPayment").is(':checked') && $("#bankSelect").val() == "") {
				alert("은행을 선택해 주세요.");
				$('html, body').animate({
                scrollTop: $('#leftSec02').offset().top
            	}, 500);
				return false;
		} else if(!$('#payAgree').is(':checked') && !$('#revocationAgree').is(':checked')) {
				alert("필수동의에 체크해주세요.");
				$('html, body').animate({
                scrollTop: $('#leftSec03').offset().top
           		 }, 500);
				return false;
		}				
		
		
		return true;
	}); //submit버튼
	
}); //jquery문 전체