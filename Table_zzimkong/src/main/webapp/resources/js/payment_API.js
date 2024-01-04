$(function() {
	
	
	$("#api").on("click",function() {
		var selectVal = $("#bankSelect").val();
		var account = $(".account").val();
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
				  merchant_uid: $("#pay_num").val(), // 상점에서 생성한 고유 주문번호
				  name: "찜콩테이블 예약 - " + $("#com_name").val() +" "+ $("#res_person").val() + "명",
				  amount: parseInt($("#totalPayment").text().trim().replace(/,/g, '')),
				  buyer_email: $("#user_email").val(),
				  buyer_name: $("#user_name").val(),
				}, function (rsp) { 
					if (rsp.success) {   
				        jQuery.ajax({
					        url: "paymentPro", 
					        method: "POST",
					        headers: { "Content-Type": "application/json" },
					        data: {
					          imp_uid: rsp.imp_uid,            // 결제 고유번호
					          merchant_uid: rsp.merchant_uid   // 주문번호
					        }
					      }).done(function (data) {
					       console.log("2번까지");
					      })
					    } else {
					      alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
					    }
				});
		} else if($('input[type=radio][value="2"]').is(':checked')) { // 네이버페이
				// V2방법, 네이버페이 연동
//				PortOne.requestPayment({
//			      storeId: 'store-871cee3d-0fc6-42e1-80d0-f97c0e84ba32',
//			      paymentId: `payment-${crypto.randomUUID()}`,
//			      orderName: '나이키 와플 트레이너 2 SD',
//			      totalAmount: 1000,
//			      currency: 'CURRENCY_KRW',
//			      channelKey: 'channel-key-7f109b2d-99c6-4ca1-bc24-582909a76086',
//			      payMethod: 'CARD'
//	   			 });
		} else if($('input[type=radio][value="3"]').is(':checked')) { //카드결제
			console.log("dd");
			//이니시스
			IMP.request_pay({
			    pg : 'html5_inicis.INIBillTst', //테스트 시 html5_inicis.INIpayTest 기재 
			    pay_method : 'card',
			    merchant_uid: $("#pay_num").val(), //상점에서 생성한 고유 주문번호
			    name : "찜콩테이블 예약 - " + $("#com_name").val() +" "+ $("#res_person").val() + "명",
			    amount : parseInt($("#totalPayment").text().trim().replace(/,/g, '')),
			    buyer_email : $("#user_email").val(),
			    buyer_name : $("#user_name").val(),
			    buyer_tel : $("#user_phone").val(),   //필수 파라미터 입니다.
//			    escrow : true, //에스크로 결제인 경우 설정
			}, function(rsp) { // callback 로직
				if (rsp.success) {   
				        jQuery.ajax({
					        url: "paymentPro", 
					        method: "POST",
					        headers: { "Content-Type": "application/json" },
					        data: {
					          imp_uid: rsp.imp_uid,            // 결제 고유번호
					          pay_num: rsp.merchant_uid,        // 주문번호
					          res_num: $("#res_num").val(),	//예약번호
					          res_idx: $("#res_idx").val(),	//예약인덱스
					          
					          
					        }
					      }).done(function (data) {
					       console.log("2번까지");
					      })
					    } else {
					      alert("결제에 실패하였습니다.\n" + rsp.error_msg);
					    }
			
			});
			
			
			
			//토스 v1
				
				//-------------------------------------------------------------------------
				// V2방법, 토스페이먼츠 연동
//				PortOne.requestPayment({
//			      storeId: 'store-871cee3d-0fc6-42e1-80d0-f97c0e84ba32',
//			      paymentId: $("#pay_num").val(),
//			      orderName: "찜콩테이블 예약 - " + $("#com_name").val() +" "+ $("#res_person").val() + "명",
//			      totalAmount: parseInt($("#totalPayment").text()),
//			      currency: 'CURRENCY_KRW',
//			      channelKey: 'channel-key-7f109b2d-99c6-4ca1-bc24-582909a76086',
//			      payMethod: 'CARD'
//	   			 });
		
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
				    amount: parseInt($("#totalPayment").text().trim().replace(/,/g, '')),
				    buyer_email: $("#user_email").val(),
				  	buyer_name: $("#user_name").val(),
				  },
				  function (rsp) {
				    if (rsp.success) {   
						console.log("ajax전까지 함")
				      jQuery.ajax({
					        url: "paymentPro", 
					        method: "POST",
					        headers: { "Content-Type": "application/json" },
					        data: {
					          imp_uid: rsp.imp_uid,            // 결제 고유번호
					          merchant_uid: rsp.merchant_uid   // 주문번호
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
	}); //버튼
	
}); //jquery문 전체