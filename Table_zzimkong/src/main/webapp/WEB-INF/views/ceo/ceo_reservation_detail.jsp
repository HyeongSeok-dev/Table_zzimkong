<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 글로벌 css --%>
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<%-- 사이드바 css --%>
<!-- <link href="side_bar.css" rel="stylesheet"> -->
</head>
<body>
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>예약 상세 정보</h3></span>
			</div>
		</div>
		<div class="text_inner">
<!-- 			<h3>예약자</h3> -->
			<table border="1">
				<tr>
					<th>예약시간대</th>
					<th>예약된 인원</th>
					<th>예약가능 인원</th>
				
				</tr>
				<tr>
					<td>12:00</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>13:00</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>14:00</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>15:00</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>16:00</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>17:00</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>18:00</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>19:00</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>20:00</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>21:00</td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<br>
			<button type="button" class="button_olive" onclick="javascript:window.close()">닫기</button>
		</div>
	</section>	

</body>
</html>