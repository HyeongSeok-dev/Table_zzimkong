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
			var cancel = confirm("예약을 취소하시겠습니까?");
			 if(cancel) { // 확인을 눌렀을 경우
		      var form = document.createElement("form");
		      form.method = "POST";
		      form.action = "/zzimkong/my/resPro";
		
		      var element = document.createElement("input");
		      element.value = res_idx
		      element.name = "res_idx";
		      form.appendChild(element);
		      document.body.appendChild(form);
		
		      alert("예약이 취소되었습니다."); // 알림창을 띄움
		      form.submit();
		  } else {
		    event.preventDefault();
		  }
		};

