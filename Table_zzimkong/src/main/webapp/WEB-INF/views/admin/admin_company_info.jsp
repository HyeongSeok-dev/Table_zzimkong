<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin_article.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
</head>
<body class="info_window">
	<section>
		<h3>업체 상세 정보</h3>
		<br><br>
		<form action="" method="GET">
			<table>
				<tr>
					<th>업체번호</th>
					<td colspan="5">1</td>
				</tr>
				<tr>
					<th>업체명</th>
					<td colspan="2"><input type="text" value="아오모리" disabled></td>
					<th>업태</th>
					<td colspan="2"><input type="text" value="일식" disabled></td>
				</tr>
				<tr>
					<th>대표자명</th>
					<td colspan="2"><input type="text" value="최종권" disabled></td>
					<th>사업자등록번호</th>
					<td colspan="2">051-720-8200</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="5"><input type="text" maxlength="5" size="50" value="부산광역시 해운대구 센텀3로 20 (우동, 센텀호텔316,317호)" disabled></td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td colspan="2"><input type="text" value="11:00~21:30" disabled></td>
					<th>업체상태</th>
					<td colspan="2">
						<select id="company_state" onchange="company_shut_down()">
							<option value="1">정상</option>
							<option value="3">영업중지</option>
							<option value="4" disabled>폐점</option>
						</select>
					</td>
				</tr>	
				<tr>
					<th>시간당 최대 테이블</th>
					<td colspan="2"><input type="text" value="10명" disabled></td>
					<th>광고등급</th>
					<td colspan="2">
						<select>
							<option>0단계</option>
							<option>1단계</option>
							<option>2단계</option>
							<option>3단계</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>건당 최대인원</th>
					<td colspan="2"><input type="text" value="20명" disabled></td>
					<th>등록일자</th>
					<td colspan="2">2023/12/24</td>
				</tr>
				
			</table>
			<br>
			<button type="submit" class="button_olive">수정</button>
			<button type="reset" class="button_grey2">초기화</button>
		</form>
	</section>
</body>
</html>