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
	//====================================================================================
	
	// 디비의포인트사용가능금액
	var useablePoint = parseInt($("#useablePoint").text().replace(/,/g, '')); 
	// 총결제금액(controller에서 예약금과 선결제금이 합산되어 전달됨)
	var totalPayment_text = parseInt($("#totalPayment_text").text().replace(/,/g, '')); 
	// 선주문금액
	if ($("#preOrderTotalPrice_text").text() != "선주문 없음") {
		var preOrderTotalPrice_text = parseInt($("#preOrderTotalPrice_text").text().replace(/,/g, ''));
	} else {
		var preOrderTotalPrice_text = 0;
	}
	console.log("preOrderTotalPrice_text : " + preOrderTotalPrice_text);
	// 예약금
	var reservationPrice = parseInt($("#reservationPrice").text().replace(/,/g, ''));
	
	// < 페이지 로드직후 > 적립금 계산----------------------------------------------------------
	// 계산부분의 현재포인트
	// 할인 전 현재 보유 포인트
	var nowPoint = parseInt($("#nowPoint").text().trim().replace(/,/g, '')); 
	// 적립될포인트(총결제금액에서 0.001곱한값)
	var earnedPoints_text = parseFloat($("#totalPayment_text").text().trim().replace(/,/g, '')) *  0.001;
	$("#earnedPoints_text").text(Math.round(earnedPoints_text).toLocaleString());
	// 총 포인트
	$("#totalPoint").text((Math.round(earnedPoints_text) + nowPoint).toLocaleString());
	
	// 혹시 DB에서 결과가 음수 일 때 0원으로 ----------------------------------------
	if(useablePoint<0) {
		useablePoint = 0;
	}
	
	// [ 변경된 값이 반영되어 결제될수 있도록 함수정의 ]-----------------------------------------
	
	function payCalculation() {
		
		if ($("#preOrderTotalPrice_text").text() !== "선주문 없음") {
			var CalpreOrderTotalPrice = parseInt($("#preOrderTotalPrice_text").text().replace(/,/g, ''));
		} else {
			var CalpreOrderTotalPrice = 0;
		}
		
		console.log("CalreservationPrice : " + reservationPrice);
		console.log("discountPoint : " + $("#discountPoint_text").text());
		//총결제금액 = 예약금액(고정) + 선결제금액(선결제없거나, 현장결제선택시 == 0) -포인트할인액
		var calTotalPayment = reservationPrice + CalpreOrderTotalPrice - parseInt($("#discountPoint_text").text().trim().replace(/,/g, ''));
		$("#totalPayment_text").text(calTotalPayment.toLocaleString());
		//적립예정 포인트 = 총결제금액 * 0.001
		var calEarnedPoints = Math.round(calTotalPayment * 0.001);
		$("#earnedPoints_text").text(calEarnedPoints.toLocaleString());
		console.log("CalearnedPoints_text : " + $("#earnedPoints_text").text());
		//현재포인트 = 디비조회한 포인트 - 포인트 할인액 
		var calNowPoint = useablePoint-parseInt($("#discountPoint_text").text().trim().replace(/,/g, ''));
		$("#nowPoint").text(calNowPoint.toLocaleString());
		console.log("CalnowPoint : " + $("#nowPoint").text());
		//총포인트 = 현재포인트 + 적립예정 포인트
		var calTotalPoint = calEarnedPoints + calNowPoint;
		$("#totalPoint").text(calTotalPoint.toLocaleString());
		console.log("CaltotalPoint : " + $("#totalPoint").text());
		// 계산결과 반영
		$("#useablePoint").text(calNowPoint.toLocaleString());
		$(".point_to_use").val($("#discountPoint_text").text());
		totalPaymentNone();
	}
	
	// [ 최종결제금액이 0원일경우 함수 ] -----------------------------------------------------
	function totalPaymentNone() {
		if($("#totalPayment_text").text().trim() === "0") {
			console.log("0으로 변함");
			$("#creditCardPayment").prop('disabled', true);
			$("#kakaoPay").prop('disabled', true);
			$("#mobilePhonePayment").prop('disabled', true);
			alert("결제금액이 0원입니다. 결제수단 선택없이 결제버튼을 눌러주세요.");
		} else {
			$("#creditCardPayment").prop('disabled', false);
			$("#kakaoPay").prop('disabled', false);
			$("#mobilePhonePayment").prop('disabled', false);
		}
	}
	
	
    // 포인트사용하기 버튼은>>>>>>>>>>>>>>
    // 텍스트박스금액을 포인트할인에 반영후
    // 디비포인트 - 포인트할인부분 결과값을 사용가능 포인트에 넣기     
    
    // 전액사용 버튼은 >>>>>>>>>>>>>>>>>>
    // 디비포인트 전액을 텍스트 박스에 넣고 
    // 사용가능 포인트 == 0원
    
    // 포인트 할인으로 총결제값이 0원일때 현장결제 버튼 생각하기
	
	
	
	// -------------- 옛코드// 결제 상세의 값이 바뀔 때 마다 총결제가격과 적립포인트 변경됨
//	function finalTotalPayment(preOrderTotalPrice_text, reservationPrice) {
//		if($("#preOrderTotalPrice_text").text() === "0") {
//			// 현장결제 선택하면 총금액에서 선주문금액 제외
//			var finalTotalPayment = reservationPrice
//			 							- parseInt($("#discountPoint_text").text().trim().replace(/,/g, ''));
//			$("#totalPayment_text").text(finalTotalPayment.toLocaleString());
//		} else {
//			console.log("여기");
//			console.log(reservationPrice);
//			console.log(".." + preOrderTotalPrice_text);
//			var finalTotalPayment = reservationPrice + preOrderTotalPrice_text
//			 							- parseInt($("#discountPoint_text").text().trim().replace(/,/g, ''));
//			console.log(finalTotalPayment);
//			$("#totalPayment_text").text(finalTotalPayment.toLocaleString());
//		}
//		// 결제금액에 따른 포인트 적립(1%적립)(적립예정포인트)
//		var earnedPoints_text = parseFloat($("#totalPayment_text").text().trim().replace(/,/g, '')) *  0.001;
//		$("#earnedPoints_text").text(parseInt(earnedPoints_text).toLocaleString());  
//		$("#totalPoint").text((parseInt(earnedPoints_text) + parseInt($("#nowPoint").text().trim().replace(/,/g, ''))).toLocaleString());                                                                          
//		totalPaymentNone();
//	}
	
	// >>>>>>>> check!!!

	// 현재보유포인트에 따른 전액사용 선택시
	$("#useAllPoint").on("click", function() {
		if($("#totalPayment_text").text() == "0") {
			alert("결제금액이 0원입니다.");
		} else {
			 //보유포인트가 총결제 금액보다 많을 때
			if(useablePoint > parseInt($("#totalPayment_text").text().trim().replace(/,/g, ''))){
				console.log("결제금액보다 포인트가 더 많음");
				var payment = parseInt($("#preOrderTotalPrice_text").text().replace(/,/g, '')) + reservationPrice
				$(".point_to_use").val(payment.toLocaleString()); //사용포인트에 결제금액 만큼들어감
				var point = useablePoint - parseInt($("#totalPayment_text").text().trim().replace(/,/g, ''));
				$("#useablePoint").text(point.toLocaleString()); //사용가능 포인트에 보유포인트 - 총결제금액
			
			} else if($("#useablePoint").text() === "0") {
				alert("사용가능한 포인트가 없습니다!");
				
			} else if(useablePoint < (parseInt($("#preOrderTotalPrice_text").text().replace(/,/g, '')) + reservationPrice)) {
				$(".point_to_use").val(useablePoint.toLocaleString()); //여기 내포인트 전액이 와야함
				$("#useablePoint").text("0"); //사용가능 포인트가 0이된다
			}
		}
	});
	
		// >>>>>>>> check!!!
	// 포인트 사용 버튼 클릭시 현재포인트가 변하고 총결제금액에서 차감됨 
	$("#usePoint").on("click", function() {
		var pointToUse = parseInt($(".point_to_use").val().trim().replace(/,/g, '')); 
		if($(".point_to_use").val() === "") {
			alert("포인트를 입력해주세요!");

		} else if(pointToUse >= 0) { // 포인트의 텍스트 박스의 값이 0보다 크거나 같을 때
			
			if((parseInt($(".point_to_use").val().trim().replace(/,/g,'')) > useablePoint)) { 
				alert("포인트를 다시 확인해 주세요!");// 여기선 작을때임

			} else { // 총포인트가 텍스트 박스의 입력값보다 크거나 같을 때 할인적용
				//새로짠 코드
				
				$("#discountPoint_text").text(pointToUse.toLocaleString());
		 		console.log($("#discountPoint_text").text());
				payCalculation(); //계산함수
				
			}
		} else {
			alert("포인트를 다시 확인해 주세요!");
		}
	});	




	// 선결제유무에 따른 선결제방법 선택 
	var isChecked;
	$("#onSitePayment").click(function(event) {
		console.log("라디오버튼 : " + parseInt($("#preOrderTotalPrice_text").text().trim().replace(/,/g, '')));
		if($("#preOrderTotalPrice_text").text() == "선주문 없음") { //파라미터가 없으면으로 바꿔야함
			 event.preventDefault();
	         alert("선주문 내역이 없습니다!");
		
		} else if(!isChecked){	
			
			if(parseInt($("#totalPayment_text").text().trim().replace(/,/g, '')) === 0) { 
				
				  // 할인포인트랑 사용포인트가 같으면
				if(parseInt($("#discountPoint_text").text().trim().replace(/,/g, '')) == parseInt($(".point_to_use").val().replace(/,/g, ''))) {
					if(confirm("포인트 차감을 취소하고 현장결제 하시겠습니까?")) {
						// 라디오버튼체크하고
						$("#onSitePayment").prop('checked', true);
						//포인트금액에서 선결제금액 빼고
						var pointResult = $("#discountPoint_text").text().trim().replace(/,/g, '') - parseInt($("#preOrderTotalPrice_text").text().trim().replace(/,/g, ''));
						$("#discountPoint_text").text(pointResult.toLocaleString());
//						$(".point_to_use").val(pointResult);
						// 선주문 내역 0원으로 만들면 함수에서 계산
						$("#preOrderTotalPrice_text").text("0");
						payCalculation();
						
			            isChecked = true;
					} else {
						$("#onSitePayment").prop('checked', false);
						isChecked = false;
					}
				} else {
					alert("현장에서 결제할 금액이 없습니다.");
				}
			
			} else if(parseInt($("#totalPayment_text").text().trim().replace(/,/g, '')) < parseInt($("#preOrderTotalPrice_text").text().trim().replace(/,/g, ''))){
				$("#onSitePayment").prop('checked', true);
				$("#discountPoint_text").text(reservationPrice.toLocaleString());
	            $("#preOrderTotalPrice_text").text("0"); // 선주문메뉴 금액을 합한값을 0으로 만들어줌
	            payCalculation();
	            isChecked = true;
			} else {
				$("#preOrderTotalPrice_text").text("0");
	            payCalculation();
	            isChecked = true;
			}
	       
        } else { // 라디오버튼에 체크가 되어있을 때
			if(parseInt($("#totalPayment_text").text().trim().replace(/,/g, '')) === 0) { 
				if(parseInt($("#discountPoint_text").text().trim().replace(/,/g, '')) == parseInt($(".point_to_use").val().replace(/,/g, ''))) {
					if(confirm("현장결제를 취소 하시겠습니까?")) {
						$("#onSitePayment").prop('checked', false);
						$("#preOrderTotalPrice_text").text(preOrderTotalPrice_text);		
						payCalculation();
						
						isChecked = false;
					} else {
						$("#onSitePayment").prop('checked', true);
						isChecked = true;
					}
				}
			} else {
				$("#onSitePayment").prop('checked', false);
				$("#preOrderTotalPrice_text").text(preOrderTotalPrice_text.toLocaleString()); //그전 값으로 다시 돌려줌
				payCalculation();
				isChecked = false;
			}
		}
	});

    
    
}); //jquery문 전체