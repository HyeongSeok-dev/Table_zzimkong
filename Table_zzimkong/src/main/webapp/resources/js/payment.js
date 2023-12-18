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
		$(".point_to_use").val("1000원"); //여기 내포인트 전액이 와야함
		$("#discountPoint").text("1000"); //여기 내포인트 전액이 와야함
		$("#nowPoint").text("0");
		$("#totalPayment").text("126,000");// 여기 총결제 금액에서 포인트사용된 금액표시
		
	});
	
	var isChecked;
	$("#onSitePayment").click(function() {
		if($("#preOrderTotalPrice").text() !== "0"){ //파라미터가 있으면
			if(isChecked) {
	            $("#onSitePayment").prop('checked', false);
	            isChecked = false;
	            $("#preOrderTotalPrice").text("0");
	        } else {
	            isChecked = true;
	            $("#preOrderTotalPrice").text("9,7000");//여기파라미터값
	        }
		} else if($("#preOrderTotalPrice").text() == "0"){ //파라미터가 없으면으로 바꿔야함
			if(!isChecked) {
	            $("#onSitePayment").prop('checked', false);
	            alert("선결제할 금액이 없습니다!");
	        } 
	        
		}
		
	});
	
	// 만약 선주문이 있을 떄(예약에서 넘어온 값이 있음)
	
	$("form").submit(function() {
	});
	
});