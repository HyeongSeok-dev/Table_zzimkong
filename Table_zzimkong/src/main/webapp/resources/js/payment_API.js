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
				IMP.request_pay(
				  {
				    pg: "tosspayments", // 반드시 "tosspayments"임을 명시해주세요.
				    merchant_uid:  parseInt($("#totalPayment").text()),
				    name: "찜콩테이블 예약 - " + $("#com_name").val() +" "+ $("#res_person").val() + "명",
				    pay_method: "card",
				    escrow: false,
				    amount: parseInt($("#totalPayment").text().trim().replace(/,/g, '')),
				    tax_free: 3000,
				    buyer_name: $("#user_name").val(),
				    buyer_email: $("#user_email").val(),
				    m_redirect_url: "https://helloworld.com/payments/result", // 모바일 환경에서 필수 입력
				    notice_url: "https://helloworld.com/api/v1/payments/notice",
				    confirm_url: "https://helloworld.com/api/v1/payments/confirm",
				    currency: "KRW",
				    locale: "ko",
				    custom_data: { userId: 30930 },
				    display: { card_quota: [0, 6] },
				    appCard: false,
				    useCardPoint: true,
				    bypass: {
				      tosspayments: {
				        useInternationalCardOnly: true, // 영어 결제창 활성화
				      },
				    },
				  },
				  (response) => {
				    
				      // axios로 HTTP 요청
				      console.log("1번까지");
				      axios({
				        url: "paymentPro",
				        method: "post",
				        headers: { "Content-Type": "application/json" },
				        data: {
				          imp_uid: rsp.imp_uid,
				          merchant_uid: rsp.merchant_uid
				        }
				      }).then((data) => {
				       console.log("2번까지");
				      })
				    }
				);
				
				//-------------------------------------------------------------------------
				// V2방법, 토스페이먼츠 연동
				PortOne.requestPayment({
			      storeId: 'store-871cee3d-0fc6-42e1-80d0-f97c0e84ba32',
			      paymentId: $("#pay_num").val(),
			      orderName: "찜콩테이블 예약 - " + $("#com_name").val() +" "+ $("#res_person").val() + "명",
			      totalAmount: parseInt($("#totalPayment").text()),
			      currency: 'CURRENCY_KRW',
			      channelKey: 'channel-key-7f109b2d-99c6-4ca1-bc24-582909a76086',
			      payMethod: 'CARD'
	   			 });
////	   			  bodyParser 등을 통해 body의 JSON 데이터를 파싱할 수 있는지 확인해주세요.
//				app.use(bodyParser.json());
//				// POST 요청을 받는 /payments/complete
//				app.post("paymentPro", async (req, res) => {
//				  try {
//				    // 요청의 body로 SDK의 응답 중 paymentId가 오기를 기대합니다.
//				    const { paymentId } = req.body;
//				 
//				    // 1. 포트원 API를 사용하기 위해 액세스 토큰을 발급받습니다.
//				    const signinResponse = await axios({
//				      url: "https://api.portone.io/login/api-secret",
//				      method: "post",
//				      headers: { "Content-Type": "application/json" },
//				      data: {
//				        apiSecret: PORTONE_API_SECRET, // 포트원 API Secret
//				      },
//				    });
//				    const { accessToken } = signinResponse.data;
//				 
//				    // 2. 포트원 결제내역 단건조회 API 호출
//				    const paymentResponse = await axios({
//				      url: `https://api.portone.io/payments/${encodeURIComponent(paymentId)}`,
//				      method: "get",
//				      // 1번에서 발급받은 액세스 토큰을 Bearer 형식에 맞게 넣어주세요.
//				      headers: { "Authorization": "Bearer " + accessToken },
//				    });
//				    const { id, status, amount, method } = paymentResponse.data;
//				 
//				    // 3. 고객사 내부 주문 데이터의 가격과 실제 지불된 금액을 비교합니다.
//				    const order = await OrderService.findById(id);
//				    if (order.amount === amount.total) {
//				      switch (status) {
//				        case "VIRTUAL_ACCOUNT_ISSUED": {
//				          // 가상 계좌가 발급된 상태입니다.
//				          // method에 들어 있는 계좌 정보를 이용해 원하는 로직을 구성하세요.
//				          break;
//				        }
//				        case "PAID": {
//				          // 모든 금액을 지불했습니다! 완료 시 원하는 로직을 구성하세요.
//				          break;
//				        }
//				      }
//				    } else {
//				      // 결제 금액이 불일치하여 위/변조 시도가 의심됩니다.
//				    }
//				  } catch (e) {
//				    // 결제 검증에 실패했습니다.
//				    res.status(400).send(e);
//				  }
//				});
		
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