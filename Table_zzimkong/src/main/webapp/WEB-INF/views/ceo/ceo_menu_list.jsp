<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_company.jsp</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<%-- 탑 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_top.css" rel="stylesheet">
<script type="text/javascript">
	function menuRegistration() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('com_menu_regist.jsp','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
	
	function menuModify() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('com_menu_modify.jsp','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
	
</script>
</head>
<body>
	<%-- 사이드바 삽입 --%>
	<%-- <jsp:include page="../company/com_sidebar.jsp"/> --%>
	<%-- top 삽입 --%>
	<header>
		<jsp:include page=../inc/ceo_top.jsp"/>
	</header>
	<section class="article">
		<div class="text">
			<div class="header">
			<span><h3>메뉴 관리 리스트</h3></span>
			<span><button type="button" class="button_olive" onclick="menuRegistration()">메뉴등록</button></span>
			</div>
			<table border="1">
				<tr>
					<th>메뉴번호</th>
					<th>메뉴명</th>
					<th>가격</th>
					<th>메뉴설명</th>
					<th>이미지</th>
					<th>수정/삭제</th>
				</tr>
				<tr>
					<td>1</td>
					<td>불고기 파니니</td>
					<td>7000원</td>
					<td>단짠단짠 불고기 파니니</td>
					<td>여기는 이미지파일이 들어갑니다.</td>
					<td>
						<button type="button" class="button_olive" onclick="menuModify()">수정</button>
						<button type="button" id="button_cancel" onclick="">삭제</button>
					<!-- 	<input type="button" value="폐점신청" class="button_red" onclick="company_disapprove()"> -->
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>불닭 파니니</td>
					<td>7000원</td>
					<td>맵부심 불닭 파니니</td>
					<td>여기는 이미지파일이 들어갑니다.</td>
					<td>
						<button type="button" class="button_olive" onclick="menuModify()">수정</button>
						<button type="button" id="button_cancel" onclick="">삭제</button>
					<!-- 	<input type="button" value="폐점신청" class="button_red" onclick="company_disapprove()"> -->
					</td>
				</tr>
			</table>
		</div>
	</section>
</body>
</html>