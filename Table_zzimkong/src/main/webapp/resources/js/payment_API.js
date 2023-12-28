$(function() {
	//결제 API 가맹점 식별코드 추가
	var IMP = window.IMP;
	IMP.init('imp05703412');
	
	//여기까지 함
	
	function requestPay() {
    IMP.request_pay({
      pg: "kcp.{상점ID}",
      pay_method: "card",
      merchant_uid: "ORD20180131-0000011",   // 주문번호
      name: "노르웨이 회전 의자",
      amount: 64900,                         // 숫자 타입
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
    }, function (rsp) { // callback
      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
    });
  }
	
}); //jquery문 전체