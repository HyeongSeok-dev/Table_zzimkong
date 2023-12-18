<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script type="text/javascript">
	function cancelReservation(){
		confirm("예약을 취소하시겠습니까?");
		if(true) {
			alert("예약이 취소되었습니다.");
		}
	}
	function editReservation() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('edit/reservation','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
</script>
</head>
<body>
	<jsp:include page="../inc/my_sidebar.jsp" />
	<div class="wrapper">
		<div>
			<div class ="title">
			<span class= "mypg">
				<h1>나의 예약 내역</h1>
			</span>
			<span>
				<button type="button">6개월</button>
				<button type="button">3개월</button>
				<button type="button">1개월</button>
				<input type="date">
				-
				<input type="date">
				<button type="button" onclick="showDate()">조회</button>
				<p id="selectedDate"></p>
			</span>
			</div>
			<br>
			<table style="width: 1000px; height: 400px; table-layout: fixed;">
				<tr class ="subject">
					<th style="width:150px;">예약일자</th>
					<th>가게명</th>
					<th>주소</th>					
					<th style="width:50px;">인원</th>
					<th style="width:200px"">선주문유무</th>
					<th>예약상태</th>
					<th style="width:140px;"></th>
				</tr>
				<tr>
					<td>23/12/05 12:30</td>
					<td>파전닭갈비</td>
					<td>양정</td>
					<td>4</td>
					<td>예약금 결제/ 메뉴 결제</td>
					<td>예약 완료</td>
					<td>
						<div class="div_button">
							<button type="button" id="my_delete" onclick="cancelReservation()">예약취소</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>23/09/24 19:30</td>
					<td>맛나주꾸미</td>
					<td>남포동</td>
					<td>4</td>
					<td>예약금 미결제</td>
					<td>예약 취소</td>
					<td>
						<div class="div_button">
							<button type="button" id="my_delete" onclick="cancelReservation()">예약취소</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>23/09/15 14:00</td>
					<td>현풍닭칼국수</td>
					<td>서면</td>
					<td>3</td>
					<td>예약금 결제</td>
					<td>방문 완료</td>
					<td>
						<div class="div_button">
							<button type="button" onclick="location.href='${pageContext.request.contextPath }/review/write'">리뷰작성</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>23/09/02 12:30</td>
					<td>웅치킨</td>
					<td>서면</td>
					<td>4</td>
					<td>예약금 결제/ 메뉴 결제</td>
					<td>방문 완료</td>
					<td>
						<div class="div_button">
							<button type="button" onclick="location.href='${pageContext.request.contextPath }/review/write'">리뷰작성</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>23/08/27 12:30</td>
					<td>부산갈비</td>
					<td>남포</td>
					<td>4</td>
					<td>예약금 결제/ 메뉴 결제</td>
					<td>방문 완료</td>
					<td>
						<div class="div_button">
							<button type="button" onclick="location.href='${pageContext.request.contextPath }/review/write'">리뷰작성</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>23/08/23 12:30</td>
					<td>이재모피자</td>
					<td>남포</td>
					<td>4</td>
					<td>예약금 결제/ 메뉴 결제</td>
					<td>방문 완료</td>
					<td>
						<div class="div_button">
							<button type="button" onclick="location.href='${pageContext.request.contextPath }/review/write'">리뷰작성</button>
						</div>
					</td>
				</tr>
				</table>

</body>
</html>