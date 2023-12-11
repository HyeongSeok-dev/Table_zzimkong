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
	function reportReason() {
		var popupW = 600;
		var popupH = 500;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('report_reason.jsp','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')				
	}
</script>
</head>
<body>
	<jsp:include page="../inc/sidebar.jsp"  />
	<div class="wrapper">
		<div>
			<div class="title">
			<span class= "mypg">
				<h1>가게 신고하기</h1>
			</span>
			</div>
			<br>
				<table style="width: 1000px; table-layout: fixed;">
					<tr>
						<th style="width:50px">선택</th>
						<th>예약일자</th>
						<th>가게명</th>
						<th>주소</th>
					</tr>
					<tr>
						<td><input type="radio" name="check"></td>
						<td>2023/05/17</td>
						<td>기장손칼국수</td>
						<td>서면</td>
					</tr>
					<tr>
						<td><input type="radio" name="check"></td>
						<td>2023/07/16</td>
						<td>화남정돼지국밥</td>
						<td>초읍</td>
					</tr>
					<tr>
						<td><input type="radio" name="check"></td>
						<td>2023/10/22</td>
						<td>송원감자탕</td>
						<td>초량</td>
					</tr>
					<tr>
						<td><input type="radio" name="check"></td>
						<td>2023/12/04</td>
						<td>송화강</td>
						<td>양정</td>
					</tr>
				</table>
				<div class = "click_button">
					<button type="button" onclick="reportReason()">신고하기</button>
				</div>
			</div>
	</div>


</body>
</html>