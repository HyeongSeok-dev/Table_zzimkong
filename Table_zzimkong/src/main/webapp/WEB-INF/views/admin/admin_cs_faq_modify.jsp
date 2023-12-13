<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/admin_popup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/cs_register.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script type="text/javascript">
	
</script>
</head>
<body class="info_window">
	<section>
		<h3>자주묻는질문</h3>
		<br><br>
		<form action="" method="post" name="memberQnaForm">
			<table>
				<tr>
					<th>번호</th>
					<td>1</td>
					<th>유형</th>
					<td>
						<select class="user_select">
		            		<option>회원</option>
							<option>일반회원</option>
							<option>업주회원</option>
		            	</select>
					</td>
					<th>
						질문유형
					</th>
					<td>
					<select class="member_category_select">
	            		<option>질문유형</option>
						<option>주문/결제</option>
						<option>리뷰</option>
						<option>회원정보</option>
						<option>이용문의</option>
						<option>쿠폰/포인트</option>
	            	</select>
	            	<select class="ceo_category_select" hidden="">
	            		<option>질문유형</option>
	            		<option>예약관리</option>
	            		<option>메뉴관리</option>
	            		<option>광고</option>
	            		<option>블랙회원관리</option>
	            		<option>업체관리</option>
	            	</select>
					</td>
				</tr>
				<tr>
					<th colspan="2">제목</th>
					<td colspan="4">
						<input type="text" placeholder="제목" id="">
					</td>
				</tr>
				<tr>
					<th colspan="2">문의내용</th>
					<td colspan="4">
						<textarea rows="20" cols="80"></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">파일첨부</th>
					<td colspan="4" class="td_file">
						<input type="file" multiple="multiple">
						<div class="file_5">* 파일 5개까지 첨부 가능</div>
					</td>
				</tr>
			</table>
			<br><br>
			<button type="submit" class="button_olive">수정</button>
			<button type="button" id="cs_button_delete">삭제</button>
		</form>
	</section>
</body>
</html>