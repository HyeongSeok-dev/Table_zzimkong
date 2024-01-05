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
	var totalPayment = parseInt($("#totalPayment_text").text().replace(/,/g, '')); //총결제금액(controller에서 예약금과 선결제금이 합산되어 전달됨)
	var preOrderTotalPrice = parseInt($("#preOrderTotalPrice_text").text().replace(/,/g, '')); // 선주문이 있을때 메뉴를 합산한총금액
	// 페이지 로드후 적립금 계산
	var nowPoint = parseInt($("#nowPoint").text().trim().replace(/,/g, '')); //할인 후 결제전 현재 보유 포인트
	var earnedPoints = parseFloat($("#totalPayment_text").text().trim().replace(/,/g, '')) *  0.01;
	$("#earnedPoints_text").text(parseInt(earnedPoints).toLocaleString());
	$("#totalPoint").text((parseInt(earnedPoints) + nowPoint).toLocaleString());
	
	if(useablePoint<0) {
		useablePoint = 0;
	}
	
	// 결제 상세의 값이 바뀔 때 마다 총결제가격과 적립포인트 변경됨
	function finalTotalPayment(totalPayment, preOrderTotalPrice) {
		if($("#preOrderTotalPrice_text").text() === "0") {
			// 현장결제 선택하면 총금액에서 선주문금액 제외
			var finalTotalPayment = parseInt($("#reservationPrice").text().trim().replace(/,/g, ''))
			 							- parseInt($("#discountCoupon").text().trim().replace(/,/g, ''))
			 							- parseInt($("#discountPoint_text").text().trim().replace(/,/g, ''));
			$("#totalPayment_text").text(finalTotalPayment.toLocaleString());
		} else {
			var finalTotalPayment = (parseInt($("#reservationPrice").text().trim().replace(/,/g, ''))) + preOrderTotalPrice
			 							- parseInt($("#discountCoupon").text().trim().replace(/,/g, ''))
			 							- parseInt($("#discountPoint_text").text().trim().replace(/,/g, ''));
			$("#totalPayment_text").text(finalTotalPayment.toLocaleString());
		}
		// 결제금액에 따른 포인트 적립(1%적립)(적립예정포인트)
		var earnedPoints = parseFloat($("#totalPayment_text").text().trim().replace(/,/g, '')) *  0.01;
		$("#earnedPoints_text").text(parseInt(earnedPoints).toLocaleString());  
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
			if(useablePoint>parseInt($("#totalPayment_text").text().trim().replace(/,/g, ''))){ //보유포인트가 총결제 금액보다 많을 때
				$(".point_to_use").val($("#totalPayment_text").text()); //사용포인트에 결제금액 만큼들어감
				var point = parseInt($("#useablePoint").text().trim().replace(/,/g, '')) - parseInt($("#totalPayment_text").text().trim().replace(/,/g, ''))
				$("#useablePoint").text(point.toLocaleString()); //사용가능 포인트에 보유포인트 - 총결제금액
			} else if($("#useablePoint").text() === "0") {
				alert("사용가능한 포인트가 없습니다!");
			} else {
				if(useablePoint<parseInt($("#totalPayment_text").text().trim().replace(/,/g, '')))
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
				var discountPoint = parseInt($("#discountPoint_text").text().replace(/,/g, '')); // 포인트 할인부분
				discountPoint =  pointToUse;
				$("#discountPoint_text").text(discountPoint.toLocaleString());
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
		
		if($("#preOrderTotalPrice_text").text() == "선주문 없음") { //파라미터가 없으면으로 바꿔야함
			 event.preventDefault();
	         alert("선주문 내역이 없습니다!");
		
		} else { 
			
			if(!isChecked) {
				$("#onSitePayment").prop('checked', true);
	            $("#preOrderTotalPrice_text").text("0"); // 선주문메뉴 금액을 합한값을 0으로 만들어줌
	            
	            //결제해야할 최종합계에서 빼줌
	            if($("#preOrderTotalPrice_text").text() === "0") {
				// 현장결제 선택하면 총금액에서 선주문금액 제외
				var finalTotalPayment = parseInt($("#reservationPrice").text().trim().replace(/,/g, ''))
				 							- parseInt($("#discountCoupon").text().trim().replace(/,/g, ''))
				 							- parseInt($("#discountPoint_text").text().trim().replace(/,/g, ''));
				$("#totalPayment_text").text(finalTotalPayment.toLocaleString());
				
				} else {
					var finalTotalPayment = (parseInt($("#reservationPrice").text().trim().replace(/,/g, ''))) + preOrderTotalPrice
					 							- parseInt($("#discountCoupon").text().trim().replace(/,/g, ''))
					 							- parseInt($("#discountPoint_text").text().trim().replace(/,/g, ''));
					$("#totalPayment_text").text(finalTotalPayment.toLocaleString());
				}
				// 결제금액에 따른 포인트 적립(1%적립)(적립예정포인트)
				var earnedPoints = parseFloat($("#totalPayment").text().trim().replace(/,/g, '')) *  0.01;
				$("#earnedPoints_text").text(parseInt(earnedPoints).toLocaleString());  
				$("#totalPoint").text((parseInt(earnedPoints) + parseInt($("#nowPoint").text().trim().replace(/,/g, ''))).toLocaleString());
	            
	            isChecked = true;
	       
	        } else {
				$("#onSitePayment").prop('checked', false);
				$("#preOrderTotalPrice_text").text(preOrderTotalPrice.toLocaleString()); //그전 값으로 다시 돌려줌
				
				var finalTotalPayment = (parseInt($("#reservationPrice").text().trim().replace(/,/g, ''))) + preOrderTotalPrice
		 							- parseInt($("#discountCoupon").text().trim().replace(/,/g, ''))
		 							- parseInt($("#discountPoint_text").text().trim().replace(/,/g, ''));
				$("#totalPayment_text").text(finalTotalPayment.toLocaleString()); //그 전 값으로 다시 돌려줌
				//포인트 계산
				var earnedPoints = parseFloat($("#totalPayment_text").text().trim().replace(/,/g, '')) *  0.01;
				$("#earnedPoints_text").text(parseInt(earnedPoints).toLocaleString());  
				$("#totalPoint").text((parseInt(earnedPoints) + parseInt($("#nowPoint").text().trim().replace(/,/g, ''))).toLocaleString());  
				
				isChecked = false;
			}
		}
	});
	
	// 결제 버튼을 클릭했을 때 : 필수선택이 비어있을 때 안내문 / 결제 포트원 연동
	$("#payBtn").on("click",function() {
		
		if($('input[name="pay_method"]:checked').length == 0) { 
			
			if($("#preOrderTotalPrice_text").text() == "선결제 없음") { 
				alert("예약금의 결제수단을 선택해 주세요.");
				$('html, body').animate({
                scrollTop: $('#leftSec02').offset().top
            	}, 500);
				return false;
			
			} else if($("#preOrderTotalPrice_text").text() != "선결제 없음") { 
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
		
		//div나 span태그의 값을 넘김(form-submit 사용할떄)
		 var discountPoint = $("#discountPoint_text").text();
	     var earnedPoints = $("#earnedPoints_text").text();
	     var totalPayment = $("#totalPayment_text").text();
	     var preOrderTotalPrice = $("#preOrderTotalPrice_text").text();
	     $("#").val();
	     $("#").val();
	     $("#").val();
	     $("#").val();
	     
         var IMP = window.IMP;
		IMP.init('imp05703412');
		
		// 라디오버튼에 따른 결제팝업 변경
		if($('input[name="pay_method"]:checked').length == 0) {
				alert("결제수단을 선택해주세요!!");
		} else if($('input[type=radio][value="1"]').is(':checked')) {//카카오페이
				// V1방법 카카오페이 연동
				console.log("kakao");
				IMP.request_pay({
				  pg: "kakaopay",
				  pay_method: "card", // 생략가
				  merchant_uid: $("#res_num").val(), // 상점에서 생성한 고유 주문번호
				  name: "찜콩테이블 예약 - " + $("#com_name").val() +" "+ $("#res_person").val() + "명",
				  amount: parseInt($("#totalPayment_text").text().trim().replace(/,/g, '')),
				  buyer_email: $("#user_email").val(),
				  buyer_name: $("#user_name").val(),
				}, function (rsp) { 
					console.log("function");
					console.log("rsp : " + rsp);
					console.log("status : " + rsp.status);
				    if (rsp.success) {
				      // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				      // jQuery로 HTTP 요청
				      jQuery.ajax({
				        url: "paymentPro", 
				        method: "post",
				        headers: { "Content-Type": "application/json" },
				        data: JSON.stringify({
				          imp_uid: rsp.imp_uid,            // 결제 고유번호
				          pay_num: $("#pay_num").val(),  // 주문번호
				          res_num: rsp.merchant_uid,	//예약번호
				          res_idx: $("#res_idx").val(),	//예약인덱스
				          preOrderTotalPrice: preOrderTotalPrice,
				          discountPoint: discountPoint,
				          earnedPoints: earnedPoints,
				          totalPayment: totalPayment  // 주문번호   
				        })
				      }).done(function (data) {
				        // 가맹점 서버 결제 API 성공시 로직
				        console.log("성공 : " + data);
				        
				      })
				    } else {
				      alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
				    }
				});
//		} else if($('input[type=radio][value="2"]').is(':checked')) { // 네이버페이
		
		} else if($('input[type=radio][value="3"]').is(':checked')) { //카드결제
			console.log("dd");
			//이니시스
			IMP.request_pay({
			    pg : 'html5_inicis.INIBillTst', //테스트 시 html5_inicis.INIpayTest 기재 
			    pay_method : 'card',
			    merchant_uid: $("#pay_num").val(), //상점에서 생성한 고유 주문번호
			    name : "찜콩테이블 예약 - " + $("#com_name").val() +" "+ $("#res_person").val() + "명",
			    amount : parseInt($("#totalPayment_text").text().trim().replace(/,/g, '')),
			    buyer_email : $("#user_email").val(),
			    buyer_name : $("#user_name").val(),
			    buyer_tel : $("#user_phone").val(),   //필수 파라미터 입니다.
//			    escrow : true, //에스크로 결제인 경우 설정
			}, function(rsp) { // callback 로직
				if (rsp.success) {   
				        $.ajax({
					        url: "paymentPro", 
					        method: "POST",
					        headers: { "Content-Type": "application/json" },
					        data: {
					          imp_uid: rsp.imp_uid,            // 결제 고유번호
					          pay_num: rsp.merchant_uid,        // 주문번호
					          res_num: $("#res_num").val(),	//예약번호
					          res_idx: $("#res_idx").val(),	//예약인덱스
					          preOrderTotalPrice: preOrderTotalPrice,
					          discountPoint: discountPoint,
					          earnedPoints: earnedPoints,
					          totalPayment: totalPayment
					        }
					      }).done(function (data) {
					       console.log("2번까지");
					      })
					    } else {
					      alert("결제에 실패하였습니다.\n" + rsp.error_msg);
					    }
			});
		} else if($('input[type=radio][value="4"]').is(':checked')) { //무통장입금
				alert("무통장 입급을 선택하셨습니다.\n입금정보를 다시 확인해주세요! \n" + "은행 : " + selectVal + "\n입금 계좌 : " + account);
		} else if($("#mobilePhonePayment").is(':checked')) { // 휴대폰 결제
				console.log("폰결제");
				IMP.request_pay(
				  {
				    pg: "danal",
				    pay_method: "phone",
				    merchant_uid: $("#pay_num").val(), // 상점에서 생성한 고유 주문번호
				    name: "찜콩테이블 예약 - " + $("#com_name").val() +" "+ $("#res_person").val() + "명",
				    amount: parseInt($("#totalPayment_text").text().trim().replace(/,/g, '')),
				    buyer_email: $("#user_email").val(),
				  	buyer_name: $("#user_name").val(),
				  },
				  function (rsp) {
				    if (rsp.success) {   
						console.log("ajax전까지 함")
				      $.ajax({
					        url: "paymentPro", 
					        method: "POST",
					        headers: { "Content-Type": "application/json" },
					        data: {
					          imp_uid: rsp.imp_uid,            // 결제 고유번호
					          pay_num: rsp.merchant_uid,        // 주문번호
					          res_num: $("#res_num").val(),	//예약번호
					          res_idx: $("#res_idx").val(),	//예약인덱스
					          preOrderTotalPrice: preOrderTotalPrice,
					          discountPoint: discountPoint,
					          earnedPoints: earnedPoints,
					          totalPayment: totalPayment   // 주문번호
					        }
					      }).done(function (data) {
					       console.log("2번까지");
					      })
				    } else {
				      alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
				    }
				  }
				);
		} //결제수단선택
         
		return true;
	}); //submit버튼
	
}); //jquery문 전체