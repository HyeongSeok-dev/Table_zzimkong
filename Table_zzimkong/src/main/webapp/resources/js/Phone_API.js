
/*금비*/
//window.requestIdentityVerification = function() {
//  PortOne.requestIdentityVerification({
//    storeId: 'store-5dfbb033-7261-4e10-8005-e43f84cd3584',
//    identityVerificationId: `identity-verification-${crypto.randomUUID()}`,
//    channelKey: 'channel-key-c08ff4d9-1167-40e9-9357-55ab241dfb70',
//  });
//}
/*혜성*/
//function requestIdentityVerification() {
//  PortOne.requestIdentityVerification({
//    // 고객사 storeId로 변경해주세요.
//    storeId: 'store-871cee3d-0fc6-42e1-80d0-f97c0e84ba32',
//    identityVerificationId: `identity-verification-${crypto.randomUUID()}`,
//    // 콘솔에서 추가한 채널의 키 값으로 변경해주세요.
//    channelKey: 'channel-key-fe4c456b-28f8-4d85-8539-536219325478',
//  });
//}
//		console.log("본인인증v2");

//function requestIdentityVerification() {
//  // 리디렉션의 경우 결제 프로세스 완료 시(성공, 실패 모두) redirectUrl로 이동되므로
//  // 함수의 반환 값을 이용해 결과처리할 수 없습니다.
//  PortOne.requestIdentityVerification({
//    /* 객체 생략 */
//    redirectUrl: "join/join",//"https://리디렉션될-URL",
//  });
//}

$(document).ready(function() {

	$("#api").click(function() {
	//휴대폰 본인인증하기=======================================
	//식별코드 imp22106057
		
		console.log("본인인증");
		
		var IMP = window.IMP;
		IMP.init("imp22106057");
		
		//V2인증창 호출
//	requestIdentityVerification();

		// V1 인증창 호출
		IMP.certification({ //param
			pg: 'inicis_unified.MIIiasTest',
	        merchant_uid: 'merchant_' + new Date().getTime(),
	        m_redirect_url: 'join/join', //리디렉션 될 URL
	        popup : false //pc환경에서는 popup파라미터가 무시되고 항상 true 로 적용됨
	        },function (rsp) { //callback
		
					console.log('여기');	
		
	            //본인인증 성공 프로세스
	            if (rsp.success) {
					console.log('여기2');	
	            	jQuery.ajax({
						url: "join",
						method: "post",
						headers: {"Content-Type": "appliction/json"},	
						data: {imp_uid: rsp.imp_uid}	
					});
	            }
	            //본인인증 실패 프로세스
	            else{
	                alert("인증에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	            }
       		 }
		 );

		}); //버튼
		

}); //jquery문 전체