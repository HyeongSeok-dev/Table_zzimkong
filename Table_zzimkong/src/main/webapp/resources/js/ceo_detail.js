//예약현황정보
function newDetails(){
	var popupW = 850;
	var popupH = 600;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open("reservation/detail", "address_window", 'width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')
}

//예약정보
function newInfo(res_idx) {
  var url = "reservation/info?res_idx=" + res_idx;
  var name = "New Info";
  var specs = "width=1200,height=600";  // 팝업창의 너비와 높이를 설정합니다. 필요에 따라 조정하세요.
  
  window.open(url, name, specs);
}

$(document).ready(function() {
	var initialCompanyId = $('#storeList option:first').val();
    fetchCompanyData(initialCompanyId); 

    $('#storeList').change(function() {
        var selectedCompanyId = $(this).val();
        fetchCompanyData(selectedCompanyId); 
    });
});	

//function fetchCompanyData(companyId) {
//	var fetchData ={com_id: companyId}
//    $.ajax({
//        url: 'ceo/reservation', // API 경로를 적절히 변경하세요.
//        type: 'POST',
//		contentType: 'application/json',
//		dataType: 'json',
//		data: JSON.stringify(fetchData),
//        success: function(response) {
//			var reservationTable = $('#reservationTable');
//            reservationTable.find("tr:gt(0)").remove();
//            response.forEach(function(menu) {
//               var row = `<tr>
//                    <td>${res.res_num}</td>
//                    <td>${res.res_date}</td>
//                    <td>${res.res_time}원</td>
//                  	<td>
//						<button type="button" value="예약 상세 정보" onclick="newInfo(${res.res_idx})">예약 상세정보</button>
//					</td>
//                </tr>`;
//                reservationTable.append(row);
//            });
//        },
//        error: function(error) {
//            // 에러가 발생했을 때 실행할 코드
//            console.error("Error fetching data: ", error);
//        }
//    });
//}
/*예약정보 불러오기*/
function showResInfo(com_id){
//	$.ajax({
//		url: "reservation",
//		type: "GET",
//		data: {"com_id":com_id},
//		dataType: "json",
//		success: function(data){
//			console.log(JSON.stringify(data));
//		} 
//		
//	});
	location.href = "reservation?com_id=" + com_id;
}	
