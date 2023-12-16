<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
			<table>
				<tr>
					<th>번호</th>
					<td>1</td>
					<th>
						유형
					</th>
					<td>
					[일반회원의 경우 질문유형]<br>
					주문/결제, 리뷰, 회원정보,<br>
					이용문의, 쿠폰/포인트<br>
					</td>
				</tr>
				<tr>
					<th colspan="1">제목</th>
					<td colspan="3">
					-- 여기제목
					</td>
				</tr>
				<tr>
					<th colspan="1">질문</th>
					<td colspan="3">
						--여기 문의내용
					</td>
				</tr>
				<tr>
					<th colspan="1">답변</th>
					<td colspan="3">
						--여기 답변내용
					</td>
				</tr>
			</table>
			<%--자주묻는 질문의 수정과 삭제 권한은 오직 관리자에게만 있음 수정과 삭제는 관리자 페이지에서 진행!! --%>
	</section>
</body>
</html>