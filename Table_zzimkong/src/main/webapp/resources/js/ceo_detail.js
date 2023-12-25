//예약현황정보
function newDetails(){
	var popupW = 850;
	var popupH = 600;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open("reservation/detail", "address_window", 'width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')
}

//예약정보
function newInfo() {
  var url = "reservation/info";
  var name = "New Info";
  var specs = "width=1200,height=600";  // 팝업창의 너비와 높이를 설정합니다. 필요에 따라 조정하세요.
  
  window.open(url, name, specs);
}