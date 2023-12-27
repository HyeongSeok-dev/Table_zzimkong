/* [ register ] */
$(function() {
	
	/*시간당 최대 인원이 예약 최대 인원보다 많으면 안됨*/
	var hMax = $("#hMax").val();
	var rMax = $("#rMax").val();
	$("#hMax").change(function() {
		if(rMax != "" || hMax > rMax) {
			alert("예약 최대 인원보다 더 많습니다");
		}
	});
	$("#rMax").change(function() {
		if(hax != "" ||hMax > rMax) {
			alert("예약 최대 인원보다 더 많습니다");
		}
	});
	
}); //jquery문 전체
