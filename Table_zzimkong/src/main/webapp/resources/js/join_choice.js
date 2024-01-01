$(document).ready(function() {

//카카오 로그인 연동하기===========================================
//2b856befaab48ecaaeab0043c8b1f392
//초기화 확인하는 함수
//kakao.init("2b856befaab48ecaaeab0043c8b1f392");
	
	$("#kakao").click(function() {
	console.log("카카오 버튼 작동");	
	
	
	
//		console.log(kakao.isInitialized());
	
	//	window.kakao.Auth.login({
	//		scope: 'profile_nickname, profile_image',
	//		susccess: function(authObj){
	//			console.log(authObj);
	//			window.kakao.API.request({
	//				url: '/v2/user/me',
	//				success: res => {
	//					const kakao_account = res.kakao_account;
	//					console.log(kakao_account);
	//				}
	//			});
	//		}
	//	});
	}); //카카오로그인 버튼끝
//========================================
//일반 회원가입버튼 누르면 join.jsp로 이동
$("#join_u").click(function() {
    window.location.href = "join";
});

//업체 회원가입 버튼 누르면 join_ceo.jsp로 이동
$("#join_c").click(function() {
	window.location.href="ceo";
});

});