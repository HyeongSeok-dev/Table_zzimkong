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




//로그인한 아이디의 업체목록
$(document).ready(function() {
    var initialCompanyId = $('#storeList option:first').val();
    fetchReservationData(initialCompanyId);

    $('#storeList').change(function() {
        var selectedCompanyId = $(this).val();
        fetchReservationData(selectedCompanyId);
    });
});

function fetchReservationData(companyId) {
	$.ajax({
	    url: 'reservation/resPro', // API 경로를 적절히 변경하세요.
	    type: 'POST',
	    dataType: 'json',
	    data: {com_id: companyId},
	    success: function(map) {
	        var reservationTable = $('#reservationTable');
	        reservationTable.find("tr:gt(0)").remove();
	        for(let res of map.resInfoList){
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
		                <td>${map.res.count}</td>
		                <td>${map.totalPersons}</td>
		                <td>${res.resTotal}</td>
		            </tr>`;
		            reservationStatus.append(row);
		        };
	    },
	    error: function(error) {
	        // 에러가 발생했을 때 실행할 코드
	        console.error("Error fetching data: ", error);
	    }
	});
}
		
//function res_list(){
//	let searchType = $("#searchType").val();
//	let searchType = $("#searchType").val();
//	let searchType = $("#searchType").val();
//	let searchType = $("#searchType").val();
//	
//	$.ajax({
//		url: "reservation/resPro",
//		type: "POST",
//		data: {
//			resInfoList: resInfoList,
//		    count: count,
//		    resTotal: resTotal,
//		    totalPersons: totalPersons
//		},
//		dataType: "json",
//		success: function(data){
//			for (ReservationVO resInfo : data.resInfoList) {
//			    int res_idx = resInfo.getRes_idx();
//			    int res_num = resInfo.getRes_num();
//			    int res_date = resInfo.getRes_date();
//			    int res_time = resInfo.getRes_time();
//			    int res_status = resInfo.getRes_num();
//			    
//			    var resStatus = "";
//		            if (res.res_status === 1) {
//		                resStatus = "예약완료";
//		            } else if (res.res_status === 2) {
//		                resStatus = "예약취소";
//		            }
//			    let result = "<tr>"
//									+ "<td>" + resInfo.res_num + "</td>"
//									+ "<td>"+ resInfo.res_date + "</td>"
//									+ "<td>"+ resInfo.res_time + "</td>"
//									+ "<td>"+ resInfo.res_date + "</td>"
//									+"<td><button type='button' value='예약 상세 정보' onclick='newInfo(" + resInfo.res_idx + ")'>예약 상세정보</button></td>"
//									+ "<td>"+ resInfo.res_status + "</td>"
//								+ "</tr>";
//					$("#listForm > table").append(result);
//			}
//		},
//		error: function(){
//			alert("요청 실패!");
//		}
//	});
//}


/*예약정보 불러오기*/
//function showResInfo(com_id){
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
//	location.href = "reservation?com_id=" + com_id;
//}	

