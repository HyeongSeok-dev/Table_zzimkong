	//생일 선택시 오늘이후 날짜 선택 막아놓음
	window.onload = function() {
	    var today = new Date();
	    var dd = String(today.getDate()).padStart(2, '0');
	    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	    var yyyy = today.getFullYear();
	
	    today = yyyy + '-' + mm + '-' + dd;
	    document.getElementById("date1").max = today;
	    document.getElementById("date2").max = today;
	}
	
	
	// 예약취소 버튼 클릭시 예약취소로 상태 변경
		function cancelReservation(res_idx) {
	    $.ajax({
	        type: "POST",
	        url: "/my/resPro",
	        data: {
	            res_idx:res_idx
	        },
	        success: function() {
	            location.reload();
	        },
	        error: function(e) {
	            alert('예약 취소에 실패했습니다.');
	            console.log(e);
		        }
		    });
		}

