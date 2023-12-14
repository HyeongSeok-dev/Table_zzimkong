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
		<h3>리뷰 상세 정보</h3>
		<br><br>
		<table border="1">
			<tr>
				<th>신고번호</th>
				<td>1</td>
				<th>신고자</th>
				<td>user1</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>리뷰신고</td>
				<th>신고대상</th>
				<td>user2</td>
			</tr>
			<tr>
				<th>해당 신고글</th>
				<td colspan="3">리뷰 원본글</td>
			</tr>
			<tr>
				<th>신고내용</th>
				<td colspan="4">모든 국민은 인간다운 생활을 할 권리를 가진다. 모든 국민은 사생활의 비밀과 자유를 침해받지 아니한다. 이 헌법시행 당시의 법령과 조약은 이 헌법에 위배되지 아니하는 한 그 효력을 지속한다.</td>
			</tr>
			<tr>
				<th rowspan="2">답변 받을 경로</th>
				<td><b>메일주소 : </b>user1@naver.com</td>
				<th rowspan="2">처리상태</th>
				<td rowspan="2">접수</td>
			</tr>
			<tr>
				<td><b>전화번호 : </b>010-1234-5678</td>
			</tr>
		</table>
	</section>
	
	<br>
	<section>
		<button type="submit" class="button_olive" onclick="report_blind()">승인</button>
		<button type="submit" class="button_cancel" onclick="report_blind_not()">반려</button>
	</section>
</body>
</html>