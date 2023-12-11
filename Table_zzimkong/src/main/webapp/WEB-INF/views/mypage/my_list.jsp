<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../inc/sidebar.jsp" />
	<div class="wrapper">
		<div>
			<div class ="title">
			<span class= "mypg">
				<h1>나의 예약 내역</h1>
			</span>
			<span>
				<button type= "button">더보기</button>
			</span>
			</div>
			<br>
			<table style="width: 1000px; height: 400px; table-layout: fixed;">
				<tr>
					<th style="width:150px;">예약일자</th>
					<th>가게명</th>
					<th>주소</th>					
					<th style="width:50px;">인원</th>
					<th style="width:200px"">선주문유무</th>
					<th>예약상태</th>
					<th style="width:140px;">예약변경/취소</th>
				</tr>
				<tr>
					<td>23/09/15 14:00</td>
					<td>현풍닭칼국수</td>
					<td>서면</td>
					<td>3</td>
					<td>예약금 결제</td>
					<td>예약 완료</td>
					<td>
						<div class="div_button">
							<button type="button" class="mypg_button"">변경</button>
							<button type="reset" class="mypg_button">취소</button>
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
							<button type="button" class="mypg_button"">변경</button>
							<button type="reset" class="mypg_button">취소</button>
						</div>
					</td>
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
							<button type="button" class="mypg_button"">변경</button>
							<button type="reset" class="mypg_button">취소</button>
						</div>
					</td>
				</tr>
				
			</table>
			<br>
			<div class ="title">
			<span>
				<h1>나의 북마크</h1>
			</span>			
			<span>
				<button type= "button">더보기</button>
			</span>
			</div>			
			<br>
			<table style="width: 1000px; table-layout: fixed;">
				<tr>
					<td style="height: 200px;">사진</td>
					<td>사진</td>
					<td>사진</td>
				</tr>
				<tr >
					<td style="height: 30px;">또갈래 떡볶이</td>
					<td>맛있다 파스타</td>
					<td>나도갈래 치킨</td>
				</tr>
			</table>
			<br>
			<div class ="title">
			<span>
				<h1>최근 본 매장</h1>
			</span>
			<br>
			<span>
				<button type= "button">더보기</button>
			</span>
			</div>			
			<br>
			<table style="width: 1000px; table-layout: fixed;">
				<tr>
					<td style="height: 200px;">사진</td>
					<td>사진</td>
					<td>사진</td>
				</tr>
				<tr>
					<td style="height: 30px;">또갈래 떡볶이</td>
					<td>맛있다 파스타</td>
					<td>나도갈래 치킨</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>