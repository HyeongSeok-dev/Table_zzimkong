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
<script type="text/javascript">
	function companyRegistration() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/ceo/company/register','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
	
	function companyInfoOpen() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/ceo/company/modify','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
	
	function comAdRegistration() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/ceo/company/ad','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
	
</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/ceo_top.jsp"/>
	</header>
	<section class="article">
		<div class="text">
			<div class="header">
			<span><h3>업체 관리 리스트</h3></span>
			<span><button type="button" class="button_olive" onclick="companyRegistration()">업체등록</button></span>
			</div>
			<table border="1">
				<tr>
					<th>업체번호</th>
					<th>상호명</th>
					<th>영업시간</th>
					<th>등록일자</th>
					<th>업체상태</th>
					<th colspan="2">광고등급</th>
					<th>수정/삭제</th>
				</tr>
				<tr>
					<td>1</td>
					<td>칸다소바</td>
					<td>09:00~23:30</td>
					<td>2023/12/25</td>
					<td>영업중지</td>
					<td>
						0단계
					</td>
					<td>
						<button type="button" class="button_olive" onclick="comAdRegistration()">광고등록</button>
					</td>
					<td>
						<button type="button" class="button_olive" onclick="companyInfoOpen()">수정</button>
					<!-- 	<input type="button" value="폐점신청" class="button_red" onclick="company_disapprove()"> -->
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>아오모리</td>
					<td>11:00~21:30</td>
					<td>2023/12/24</td>
					<td>영업중지</td>
					<td>
						0단계
					</td>
					<td>
						<button type="button" class="button_olive" onclick="comAdRegistration()">광고등록</button>
					</td>
					<td>
						<button type="button" class="button_olive" onclick="companyInfoOpen()">수정</button>
					</td>
				</tr>
			</table>
		</div>
	</section>
</body>
</html>