$(document).ready(function() {

		var IMP = window.IMP;
		IMP.init("{imp22106057}");
		
	$("#api").click(function() {
	//휴대폰 본인인증하기=======================================
	//식별코드 imp22106057
		
//		console.log("본인인증 함수작동");
		
		//인증창 호출
		IMP.certification({
//			//pg:'PG사코드.{CPID}', //본인인증설정2개이상일경우 필수
			merchant_uid: "ORD20180131-0000011",
			m_redirect_url: "join/choice",
			popup : false //pc는 popup파라미터 무시, 항상 true로 적용
			},function(rsp){ //callback
			if(rsp.success){
				alert("인증에 성공하였습니다.");
				return flase;
			}else{
				alert("인증에 실패하였습니다.");
				return true;
			}
		});
//		
//		//callbackDate전달
		IMP.certification({
//			/*중략 */
			}, function (rsp) {
				if(rsp.success){ //인증성공시
				//제이쿼리로 http요청			
				JQuery.ajax({
					url: "{join/choice}", //서버의 인증 정보를 받는 endpoint
					method: "POST",
					headers: {"Content-Type": "appliction/json"},	
					data: {imp_uid: rsp.imp_uid}				
				}); //ajax
				}else{
					alert("인증에 실패하였습니다. " + rsp.error_msg);
				}
		});

		}); //버튼
		
		//돌아가기버튼 메인으로 리다이렉트
		$("#delete").click(function() {
//	    	window.location.href = "/";
		});
}); //jquery문 전체