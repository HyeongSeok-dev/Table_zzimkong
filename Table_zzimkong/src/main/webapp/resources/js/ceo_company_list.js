$(function() {
	
	/* [ list ] */
	/* 사업장 목록눌렀을 때 상세페이지로 사업장 등록 번호 넘기기 */
//	function comView() {
//		/* 팝업창 중앙 정렬 */
//		var left = Math.ceil((window.screen.width - 950)/2);
//		var top = Math.ceil((window.screen.height - 700)/2);
//		window.open('view','','width='+950+',height='+700+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no');	
//	}
	
	$("tr").on("click", function(){
		var left = Math.ceil((window.screen.width - 950)/2);
		var top = Math.ceil((window.screen.height - 700)/2);
		var pop = window.open('','','width='+950+',height='+700+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no');
		$.ajax({
			data: {
				com_num : $("#com_num").text()
			},
			success: function(data) {
				console.log("파라미터 전송 성공");
				pop.location.href = "view?com_num=" + $("#com_num").text();
			},
			error: function(e) {
				console.log("파라미터 전송 실패");
			}
		});
	});
	
}); //jquery문 전체
