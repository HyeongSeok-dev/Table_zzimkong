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
	
