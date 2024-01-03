$(function() {
	// 포인트 text 박스에 숫자가 입력될 때 마다 숫자에 천단위 쉼표를 찍어주는 쿼리
	$('.point_to_use').on('input', function() {
    // 숫자만 입력되도록 처리
    var input = this.value.replace(/[^0-9]/g, '');
    
    // 콤마 추가
    var numberWithCommas = input.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    
    // 결과를 입력창에 표시
    this.value = numberWithCommas;
	});

	// 연산을 위해 ','를 제거하고 int로 타입변환
	var useablePoint = parseInt($("#useablePoint").text().replace(/,/g, '')); //사용가능금액
	var totalPayment = parseInt($("#totalPayment").text().replace(/,/g, '')); //총결제금액(controller에서 예약금과 선결제금이 합산되어 전달됨)
	var preOrderTotalPrice = parseInt($("#preOrderTotalPrice").text().replace(/,/g, '')); // 선주문이 있을때 메뉴를 합산한총금액
	// 페이지 로드후 적립금 계산
	var nowPoint = parseInt($("#nowPoint").text().trim().replace(/,/g, '')); //할인 후 결제전 현재 보유 포인트
	var earnedPoints = parseFloat($("#totalPayment").text().trim().replace(/,/g, '')) *  0.01;
	$("#earnedPoints").text(parseInt(earnedPoints).toLocaleString());
	$("#totalPoint").text((parseInt(earnedPoints) + nowPoint).toLocaleString());
	
	if(useablePoint<0) {
		useablePoint = 0;
	}
	
	// 결제 상세의 값이 바뀔 때 마다 총결제가격과 적립포인트 변경됨
	function finalTotalPayment(totalPayment, preOrderTotalPrice) {
		if($("#preOrderTotalPrice").text() === "0") {
			// 현장결제 선택하면 총금액에서 선주문금액 제외
			var finalTotalPayment = parseInt($("#reservationPrice").text().trim().replace(/,/g, ''))
			 							- parseInt($("#discountCoupon").text().trim().replace(/,/g, ''))
			 							- parseInt($("#discountPoint").text().trim().replace(/,/g, ''));
			$("#totalPayment").text(finalTotalPayment.toLocaleString());
		} else {
			var finalTotalPayment = (parseInt($("#reservationPrice").text().trim().replace(/,/g, ''))) + preOrderTotalPrice
			 							- parseInt($("#discountCoupon").text().trim().replace(/,/g, ''))
			 							- parseInt($("#discountPoint").text().trim().replace(/,/g, ''));
			$("#totalPayment").text(finalTotalPayment.toLocaleString());
		}
		// 결제금액에 따른 포인트 적립(1%적립)(적립예정포인트)
		var earnedPoints = parseFloat($("#totalPayment").text().trim().replace(/,/g, '')) *  0.01;
		$("#earnedPoints").text(parseInt(earnedPoints).toLocaleString());  
		$("#totalPoint").text((parseInt(earnedPoints) + parseInt($("#nowPoint").text().trim().replace(/,/g, ''))).toLocaleString());                                                                          
	}
	
	//라디오 버튼 해제시 select 초기화
	$('input[name="pay_method"]').click(function() {
	  if($('input[name="pay_method"]:checked').val() != 3) {
	    console.log('Checkbox has been unchecked!');
	    $("#cardSelect").val("");
	  }
	  if($('input[name="pay_method"]:checked').val() != 4) {
	    console.log('Checkbox has been unchecked!');
	    $("#bankSelect").val("");
	    $(".account").val("");
	  }
	});		
	// 전체선택 체크박스
	$("#checkAllAgree").on("change", function() { 
		
			if($("#checkAllAgree").prop("checked")){
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
	});
	
	// 은행선택시 계좌번호 나오게 하기
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
			case "씨티": $(".account").val("777-1234-12345");
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
	
	// 현재보유포인트에 따른 전액사용 선택시
	$("#useAllPoint").on("click", function() {
			if(useablePoint>parseInt($("#totalPayment").text().trim().replace(/,/g, ''))){ //보유포인트가 총결제 금액보다 많을 때
				$(".point_to_use").val($("#totalPayment").text()); //사용포인트에 결제금액 만큼들어감
				var point = parseInt($("#useablePoint").text().trim().replace(/,/g, '')) - parseInt($("#totalPayment").text().trim().replace(/,/g, ''))
				$("#useablePoint").text(point.toLocaleString()); //사용가능 포인트에 보유포인트 - 총결제금액
			} else if($("#useablePoint").text() === "0") {
				alert("사용가능한 포인트가 없습니다!");
			} else {
				if(useablePoint<parseInt($("#totalPayment").text().trim().replace(/,/g, '')))
				$(".point_to_use").val(useablePoint.toLocaleString()); //여기 내포인트 전액이 와야함
				$("#useablePoint").text("0"); //사용가능 포인트가 0이된다
			}
	});
	
	//---------------------------------------------------------------------
	// 쿠폰 선택시 할인됨
	$("#useCoupone").on("click", function() {
		
		if($(".select_coupon").val() == "") {
			alert("쿠폰을 선택해 주세요!");
		
		} else if($(".select_coupon").val() === "5000"){
			var discountCoupon =  parseInt($(".select_coupon").val().replace(/,/g, ''));
			$("#discountCoupon").text(discountCoupon.toLocaleString());
		 	// 총결제금액에서 쿠폰할인값과 포인트할인값을 제외한 최종결제금액
			finalTotalPayment(totalPayment ,preOrderTotalPrice);
		
		} else if($(".select_coupon").val() === "0.1"){
			var discountCoupon =  parseFloat($(".select_coupon").val());
			$("#discountCoupon").text((parseInt(parseFloat(totalPayment) * discountCoupon)).toLocaleString());
			finalTotalPayment(totalPayment ,preOrderTotalPrice);
		}
	});	
	
	// 포인트 사용 버튼 클릭시 현재포인트가 변하고 총결제금액에서 차감됨 
	$("#usePoint").on("click", function() {
		
		var pointToUse = parseInt($(".point_to_use").val().replace(/,/g, '')); 
		
		if($(".point_to_use").val() === "") {
			alert("포인트를 입력해주세요!");

		} else if(pointToUse >= 0) { // 포인트의 텍스트 박스의 값이 0보다 클때
			
			if((parseInt($(".point_to_use").val().replace(/,/g, '')) > useablePoint) || $(".point_to_use").val() === "0") { // 총포인트가 텍스트 박스의 입력값보다 클때 할인적용
				alert("사용가능한 포인트를 다시 확인해 주세요!");

			} else {
				var discountPoint = parseInt($("#discountPoint").text().replace(/,/g, '')); // 포인트 할인부분
				discountPoint =  pointToUse;
				$("#discountPoint").text(discountPoint.toLocaleString());
		 		if(useablePoint - pointToUse !== 0) {
					$("#useablePoint").text((useablePoint - pointToUse).toLocaleString());
				} 
				$("#nowPoint").text((useablePoint - pointToUse).toLocaleString());
		 		finalTotalPayment(totalPayment, preOrderTotalPrice);
			}
		}
	});	


	// 선결제유무에 따른 선결제방법 선택 
	var isChecked;
	$("#onSitePayment").click(function(event) {
		
		if($("#preOrderTotalPrice").text() == "선주문 없음") { //파라미터가 없으면으로 바꿔야함
			 event.preventDefault();
	         alert("선주문 내역이 없습니다!");
		
		} else { 
			
			if(!isChecked) {
				$("#onSitePayment").prop('checked', true);
	            $("#preOrderTotalPrice").text("0"); // 선주문메뉴 금액을 합한값을 0으로 만들어줌
	            
	            //결제해야할 최종합계에서 빼줌
	            if($("#preOrderTotalPrice").text() === "0") {
				// 현장결제 선택하면 총금액에서 선주문금액 제외
				var finalTotalPayment = parseInt($("#reservationPrice").text().trim().replace(/,/g, ''))
				 							- parseInt($("#discountCoupon").text().trim().replace(/,/g, ''))
				 							- parseInt($("#discountPoint").text().trim().replace(/,/g, ''));
				$("#totalPayment").text(finalTotalPayment.toLocaleString());
				
				} else {
					var finalTotalPayment = (parseInt($("#reservationPrice").text().trim().replace(/,/g, ''))) + preOrderTotalPrice
					 							- parseInt($("#discountCoupon").text().trim().replace(/,/g, ''))
					 							- parseInt($("#discountPoint").text().trim().replace(/,/g, ''));
					$("#totalPayment").text(finalTotalPayment.toLocaleString());
				}
				// 결제금액에 따른 포인트 적립(1%적립)(적립예정포인트)
				var earnedPoints = parseFloat($("#totalPayment").text().trim().replace(/,/g, '')) *  0.01;
				$("#earnedPoints").text(parseInt(earnedPoints).toLocaleString());  
				$("#totalPoint").text((parseInt(earnedPoints) + parseInt($("#nowPoint").text().trim().replace(/,/g, ''))).toLocaleString());
	            
	            isChecked = true;
	       
	        } else {
				$("#onSitePayment").prop('checked', false);
				$("#preOrderTotalPrice").text(preOrderTotalPrice.toLocaleString()); //그전 값으로 다시 돌려줌
				
				var finalTotalPayment = (parseInt($("#reservationPrice").text().trim().replace(/,/g, ''))) + preOrderTotalPrice
		 							- parseInt($("#discountCoupon").text().trim().replace(/,/g, ''))
		 							- parseInt($("#discountPoint").text().trim().replace(/,/g, ''));
				$("#totalPayment").text(finalTotalPayment.toLocaleString()); //그 전 값으로 다시 돌려줌
				//포인트 계산
				var earnedPoints = parseFloat($("#totalPayment").text().trim().replace(/,/g, '')) *  0.01;
				$("#earnedPoints").text(parseInt(earnedPoints).toLocaleString());  
				$("#totalPoint").text((parseInt(earnedPoints) + parseInt($("#nowPoint").text().trim().replace(/,/g, ''))).toLocaleString());  
				
				isChecked = false;
			}
		}
	});
	
	// 필수선택이 비어있을 때 안내문
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
		
		//div나 span태그의 값을 넘김
		 var discountPoint = $("#discountPoint").text();
	     var earnedPoints = $("#earnedPoints").text();
	     var totalPayment = $("#totalPayment").text();
	     var preOrderTotalPrice = $("#preOrderTotalPrice").text();
         $(this).append("<input type='hidden' name='discountPoint' value='" + discountPoint + "' />");
         $(this).append("<input type='hidden' name='earnedPoints' value='" + earnedPoints + "' />");
         $(this).append("<input type='hidden' name='totalPayment' value='" + totalPayment + "' />");
         $(this).append("<input type='hidden' name='preOrderTotalPrice' value='" + preOrderTotalPrice + "' />");
		return true;
	}); //submit버튼
	
}); //jquery문 전체