$(function() {
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
	
	$("#useAllPoint").on("click", function() {
		$("#useablePoint").text("0");
		$(".point_to_use").val("1000"); //여기 내포인트 전액이 와야함
		$("#discountPoint").text("1000원"); //여기 내포인트 전액이 와야함
		$("#nowPoint").text("0원");
		$("#totalPayment").text("126,000원");// 여기 총결제 금액에서 포인트사용된 금액표시
		
	});
	
});