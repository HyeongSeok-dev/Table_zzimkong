$(function() {
	if($("#com_status").text().trim() == "폐점승인대기") {
		console.log("gfff");
		$("#status_4").html("<h1>폐점승인 대기중 입니다.</h1>");
		$("#status_4").css("color", "red");
		$("#adRegister").click(function(event) {
			event.preventDefault();
		});
		$(".button_olive").click(function(event) {
			event.preventDefault();
		});
		$("#company_state2").prop("disabled", true);
	}
	
	$("#company_state2").on("change", function(){
		
		if($("#company_state2").val() == "영업중지") {
			$.ajax({
				url: "companyStatusChange",
				data: {
					com_status : $("#company_state2").val(),
					com_num : $("#com_num").text()
				},
				success: function(isChange) {
					console.log("파라미터 전송 성공");
					if(isChange) {
						alert("영업 상태가 영업중지로 변경되었습니다");
						$("#com_status").text("영업중지");
					} else {
						alert("영업 상태가 변경되지 않았습니다. 고객센터로 연락해주세요");
					}
				},
				error: function(e) {
					console.log("파라미터 전송 실패");
				}
			});
			
		} else if($("#company_state2").val() == "정상영업") {
			$.ajax({
				url: "companyStatusChange",
				data: {
					com_status : $("#company_state2").val(),
					com_num : $("#com_num").text()
				},
				success: function(isChange) {
					console.log("파라미터 전송 성공");
					if(isChange) {
						alert("영업 상태가 정상영업으로 변경되었습니다");
						$("#com_status").text("정상영업");
					} else {
						alert("영업 상태가 변경되지 않았습니다. 고객센터로 연락해주세요");
					}
				},
				error: function(e) {
					console.log("파라미터 전송 실패");
				}
			});
		}
	});
	
}); //jquery문 전체
