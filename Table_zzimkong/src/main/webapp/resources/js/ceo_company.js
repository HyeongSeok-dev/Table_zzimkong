$(function() {
	
	/* [ register ] */
	/* 텍스트 박스에 숫자만 입력 할 수 있음 */
	$('#hMax').on('input', function () {
    	$(this).val($(this).val().replace(/[^0-9]/g, ''));
	});
	$('#rMax').on('input', function () {
    	$(this).val($(this).val().replace(/[^0-9]/g, ''));
	});
	/* 시간당 최대 인원이 예약 최대 인원보다 많으면 안됨 */
	$("#rMax").blur(function() {
		if(parseInt($("#hMax").val().trim()) > parseInt($("#rMax").val().trim())) {
			alert("시간당 최대 인원이 예약 최대 인원수를 초과합니다!");
		}
	});
	
	/* 광고 신청이 미신청 상태이면 광고 단계 0으로 바꿈*/
	$("#adRegister").on("change", function() {
		if($("#adRegister").val() === "미신청") {
			$("#adLevel").val("0단계");
			$("#adLevel").prop('disabled', true);
		} else if($("#adRegister").val() === "신청") {
			$("#adLevel").prop('disabled', false);
		}
 
	});
	
	$("#comNumBtn").on("click", function(){
		
	});
	
}); //jquery문 전체
