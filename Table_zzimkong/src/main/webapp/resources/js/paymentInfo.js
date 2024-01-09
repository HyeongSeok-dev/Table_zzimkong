$(function() {
	$("#useAllPoint").on("click", function() {
			if(useablePoint>parseInt($("#totalPayment_text").text().trim().replace(/,/g, ''))){ //보유포인트가 총결제 금액보다 많을 때
				$(".point_to_use").val($("#totalPayment_text").text()); //사용포인트에 결제금액 만큼들어감
				var point = parseInt($("#useablePoint").text().trim().replace(/,/g, '')) - parseInt($("#totalPayment_text").text().trim().replace(/,/g, ''))
				$("#useablePoint").text(point.toLocaleString()); //사용가능 포인트에 보유포인트 - 총결제금액
			} else if($("#useablePoint").text() === "0") {
				alert("사용가능한 포인트가 없습니다!");
			} else {
				if(useablePoint<parseInt($("#totalPayment_text").text().trim().replace(/,/g, '')))
				$(".point_to_use").val(useablePoint.toLocaleString()); //여기 내포인트 전액이 와야함
				$("#useablePoint").text("0"); //사용가능 포인트가 0이된다
			}
	});
	
}); //jquery문 전체