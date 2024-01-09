//예약현황정보
//function newDetails(com_id){
//	var popupW = 850;
//	var popupH = 600;
//	var left = Math.ceil((window.screen.width - popupW)/2);
//	var top = Math.ceil((window.screen.height - popupH)/2);
//	window.open("reservation/detail?com_id=" + com_id, "address_window", 'width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')
//}

function newDetail(com_id){
  var url = "reservation/detail?com_id=" + com_id;
  var name = "New detail";
  var specs = "width=1200,height=600";  // 팝업창의 너비와 높이를 설정합니다. 필요에 따라 조정하세요.
  
  window.open(url, name, specs);
	
}

//예약정보
function newInfo(res_idx) {
  var url = "reservation/info?res_idx=" + res_idx;
  var name = "New Info";
  var specs = "width=1200,height=600";  // 팝업창의 너비와 높이를 설정합니다. 필요에 따라 조정하세요.
  
  window.open(url, name, specs);
}




//로그인한 아이디의 업체목록
$(document).ready(function() {
    var initialCompanyId = $('#storeList option:first').val();
    fetchReservationData(initialCompanyId);

    $('#storeList').change(function() {
        var selectedCompanyId = $(this).val();
        fetchReservationData(selectedCompanyId);
    });
});


//테스트1
//function addResInfoToTable(resInfoList) {
//    var reservationTable = $('#reservationTable');
//    reservationTable.find("tr:gt(0)").remove();
//    for(let res of resInfoList){
//        var resStatus = "";
//        if (res.res_status === 1) {
//            resStatus = "예약완료";
//        } else if (res.res_status === 2) {
//            resStatus = "예약취소";
//        }
//        var row = `<tr>
//        <td>${res.res_num}</td>
//        <td>${res.res_date}</td>
//        <td>${res.res_time}원</td>
//        <td>
//            <button type="button" value="예약 상세 정보" onclick="newInfo(${res.res_idx})">예약 상세정보</button>
//        </td>
//        <td>${resStatus}</td>
//        </tr>`;
//        reservationTable.append(row);
//    };
//}
//function fetchReservationData(companyId) {
//$.ajax({
//    url: 'reservation/resPro', // API 경로를 적절히 변경하세요.
//    type: 'POST',
//    dataType: 'json',
//    data: {com_id: companyId},
//    success: function(map) {
//        if (map.resInfoList) { // resInfoList가 존재하는 경우
//            if (map.resInfoList.length > 0) { // 그 길이가 0보다 큰 경우에만 함수를 호출
//                addResInfoToTable(map.resInfoList);
//            }
//
//            var reservationStatus = $('#reservationStatus');
//            reservationStatus.find("tr:gt(0)").remove();
//            var row = `<tr>
//                <td>${map.resTotal}</td>
//                <td>${map.totalPersons}</td>
//                <td>${map.cancelCount}</td>
//            </tr>`;
//            reservationStatus.append(row);
//        }
//    },
//    error: function(error) {
//    // 에러가 발생했을 때 실행할 코드
//    console.error("Error fetching data: ", error);
//    }
//});
//}

//원본
//function fetchReservationData(companyId) {
//	$.ajax({
//	    url: 'reservation/resPro', // API 경로를 적절히 변경하세요.
//	    type: 'POST',
//	    dataType: 'json',
//	    data: {com_id: companyId},
//	    success: function(map) {
//			if (map.comResList && map.comResList.length > 0) {
//		        var reservationTable = $('#reservationTable');
//		        reservationTable.find("tr:gt(0)").remove();
//		        for(let res of map.comResList){
//					var resStatus = "";
//		            if (res.res_status === 1) {
//		                resStatus = "예약완료";
//		            } else if (res.res_status === 2) {
//		                resStatus = "예약취소";
//		            }
//		            var row = `<tr>
//	                <td>${res.res_num}</td>
//	                <td>${res.res_date}</td>
//	                <td>${res.res_time}원</td>
//	                <td>
//	                    <button type="button" value="예약 상세 정보" onclick="newInfo(${res.res_idx})">예약 상세정보</button>
//	                </td>
//	                <td>${resStatus}</td>
//		            </tr>`;
//		            reservationTable.append(row);
//		            
//		        };
//	            var reservationStatus = $('#reservationStatus');
//		        reservationStatus.find("tr:gt(0)").remove();
//		
//		            var row = `<tr>
//		                <td>${map.resTotal}</td>
//		                <td>${map.totalPersons}</td>
//		                <td>${map.cancelCount}</td>
//		            </tr>`;
//		            reservationStatus.append(row);
//            }
//	    },
//	    error: function(error) {
//	        // 에러가 발생했을 때 실행할 코드
//	        console.error("Error fetching data: ", error);
//	    }
//	});
//}












//테스트3
function fetchReservationData(companyId) {
	$.ajax({
	    url: 'reservation/resPro',
	    type: 'POST',
	    dataType: 'json',
	    data: {com_id: companyId},
	    success: function(map) {
			//comResList가 존재하고 그 길이가 0보다 큰 경우(예약 정보가 있는 경우)에 실행
			if (map.comResList && map.comResList.length > 0) {
			    var reservationTable = $('#reservationTable');
			    reservationTable.find("tr:gt(0)").remove();
				//comResList값 			    
			    for(let res of map.comResList){
			        var resStatus = "";
			        if (res.res_status === 1) {
			            resStatus = "예약완료";
			        } else if (res.res_status === 2) {
			            resStatus = "예약취소";
			        }
			        var row = `<tr>
			        <td>${res.res_num}</td>
			        <td>${res.res_date}</td>
			        <td>${res.res_time}원</td>
			        <td>
			            <button type="button" value="예약 상세 정보" onclick="newInfo(${res.res_idx})">예약 상세정보</button>
			        </td>
			        <td>${resStatus}</td>
			        </tr>`;
			        reservationTable.append(row);
			        
			    var reservationStatus = $('#reservationStatus');
			    reservationStatus.find("tr:gt(0)").remove();
			        var row = `<tr>
			            <td>${map.resTotal}</td>
			            <td>${map.totalPersons}</td>
			            <td>${map.cancelCount}</td>
			            <td>
			            	<button type="button" value="상세정보" class="popup" onclick="newDetail(${res.com_id})">상세정보</button>
			            </td>
			        </tr>`;
			        reservationStatus.append(row);
			    };
			}else{
				// comResList가 비어있거나 null인 경우
		        var reservationTable = $('#reservationTable');
		        var reservationStatus = $('#reservationStatus');
		        // 테이블의 내용을 제거합니다.
		        reservationTable.find("tr:gt(0)").remove();
		        reservationStatus.find("tr:gt(0)").remove();
	
			}
	    },
	    error: function(error) {
	        // 에러가 발생했을 때 실행할 코드
	        console.error("Error fetching data: ", error);
	    }
	});
}



