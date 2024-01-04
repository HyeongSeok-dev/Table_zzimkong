$(document).ready(function() {

		
	$("#api").click(function() {
	//휴대폰 본인인증하기=======================================
	//식별코드 imp22106057
		
		console.log("본인인증 함수작동");
		
		var IMP = window.IMP;
		IMP.init("imp22106057");

		//인증창 호출
		IMP.certification({
	        merchant_uid: 'merchant_' + new Date().getTime()
	        },function (rsp) {
					console.log('여기이');	
		
	            //본인인증 성공 프로세스
	            if (rsp.success) {
					console.log('여기');	
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