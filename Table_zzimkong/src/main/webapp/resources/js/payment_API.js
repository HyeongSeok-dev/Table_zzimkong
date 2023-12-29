$(function() {
	
	// [V1]
	//결제 API 가맹점 식별코드 추가
//	var IMP = window.IMP;
//	IMP.init('imp05703412');
	
	//여기까지 함
	
	$("#api").on("click",function() {
////		console.log("pay");
//		
//		//카카오 페이
//		IMP.request_pay({
//		    pg : 'html5_inicis.INIpayTest{INIBillTst}', //테스트 시 html5_inicis.INIpayTest 기재 
//		    pay_method : 'card',
//		    merchant_uid: "order_no_0001", //상점에서 생성한 고유 주문번호
//		    name : '주문명:결제테스트',
//		    amount : 1004,
//		    buyer_email : 'test@portone.io',
//		    buyer_name : '구매자이름',
//		    buyer_tel : '010-1234-5678',   //필수 파라미터 입니다.
//		    buyer_addr : '서울특별시 강남구 삼성동',
//		    buyer_postcode : '123-456',
//		    m_redirect_url : '{payment/info}',
//		    escrow : true, //에스크로 결제인 경우 설정
//		    bypass : {
//		        acceptmethod : "noeasypay" // 간편결제 버튼을 통합결제창에서 제외(PC)
//		        acceptmethod: 'cardpoint'  // 카드포인트 사용시 설정(PC)
//		    },
//		    period : {
//		       from : "20200101", //YYYYMMDD
//		       to : "20201231"   //YYYYMMDD
//		    }
//		}, function (rsp) { // callback 로직
//		
//		});
  
	//============================================================================================
	
	// [V2] 성공!!!!
//	
//		PortOne.requestPayment({
//	      // 고객사 storeId로 변경해주세요.
//	      storeId: 'store-871cee3d-0fc6-42e1-80d0-f97c0e84ba32',
//	      paymentId: `payment-${crypto.randomUUID()}`,
//	      orderName: '나이키 와플 트레이너 2 SD',
//	      totalAmount: 1000,
//	      currency: 'CURRENCY_KRW',
//	      channelKey: 'channel-key-7f109b2d-99c6-4ca1-bc24-582909a76086',
//	      payMethod: 'CARD'
//	    });
	
	//---------------------------------------------------------------------
	// 라디오버튼에 따른 결제팝업 변경
	var selectVal = $("#bankSelect").val();
	var account = $(".account").val();
	var IMP = window.IMP;
	IMP.init('imp05703412');
	
			if($('input[name="pay_method"]:checked').length == 0) {
				alert("결제수단을 선택해주세요!!");
			} else if($('input[type=radio][value="1"]').is(':checked')) {//카카오페이
				// V1방법 카카오페이 연동
				console.log("kakao");
				IMP.request_pay({
				  pg: "kakaopay",
				  pay_method: "card", // 생략가
				  merchant_uid: "order_no_0001", // 상점에서 생성한 고유 주문번호
				  name: "주문명:결제테스트",
				  amount: 1004,
				  buyer_email: "test@portone.io",
				  buyer_name: "구매자이름",
				  buyer_tel: "010-1234-5678",
				  buyer_addr: "서울특별시 강남구 삼성동",
				  buyer_postcode: "123-456",
				  m_redirect_url: "{모바일에서 결제 완료 후 리디렉션 될 URL}"
				}, function (rsp) { // callback 로직
				  /* ...중략... */
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
				// V2방법, 토스페이먼츠 연동
				PortOne.requestPayment({
			      storeId: 'store-871cee3d-0fc6-42e1-80d0-f97c0e84ba32',
			      paymentId: `payment-${crypto.randomUUID()}`,
			      orderName: '나이키 와플 트레이너 2 SD',
			      totalAmount: 1000,
			      currency: 'CURRENCY_KRW',
			      channelKey: 'channel-key-7f109b2d-99c6-4ca1-bc24-582909a76086',
			      payMethod: 'CARD'
	   			 });
			} else if($('input[type=radio][value="4"]').is(':checked')) { //무통장입금
				alert("무통장 입급을 선택하셨습니다.\n입금정보를 다시 확인해주세요! \n" + "은행 : " + selectVal + "\n입금 계좌 : " + account);
			} else if($("#mobilePhonePayment").is(':checked')) { // 휴대폰 결제
				console.log("폰결제");
				IMP.request_pay(
				  {
				    pg: "danal",
				    pay_method: "phone",
				    merchant_uid: "order_no_0001", // 상점에서 생성한 고유 주문번호
				    name: "주문명:결제테스트",
				    amount: 1004,
				    buyer_email: "test@portone.io",
				    buyer_name: "구매자이름",
				    buyer_tel: "010-1234-5678",
				    buyer_addr: "서울특별시 강남구 삼성동",
				    buyer_postcode: "123-456",
				  },
				  function (rsp) {
				    // callback 로직
				    //* ...중략... *//
				  }
				);
			}
	}); //버튼
	
}); //jquery문 전체