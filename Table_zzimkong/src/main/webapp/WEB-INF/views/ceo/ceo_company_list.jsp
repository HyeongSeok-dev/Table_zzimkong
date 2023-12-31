<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업장 관리</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/ceo_company_list.js"></script>
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
	
// 	function comView() {
// 		/* 팝업창 중앙 정렬 */
// 		var popupW = 950;
// 		var popupH = 700;
// 		var left = Math.ceil((window.screen.width - popupW)/2);
// 		var top = Math.ceil((window.screen.height - popupH)/2);
// 		window.open('${pageContext.request.contextPath }/ceo/company/view','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
// 	}
	
</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/ceo_top.jsp"/>
	</header>
	<section class="ceo_sec">
		<div class="text">
			<div class="text_inner">
				<div class="header_div01">
				<span><h1>사업장 관리</h1></span>
				</div>
			</div>
			<div class="text_inner">
				<div class="header">
				<span><h3>사업장 목록</h3></span>
				<span><button type="button" class="button_olive" onclick="companyRegistration()">신규등록</button></span>
				</div>
				<table border="1">
					<tr>
						<th>상호명</th>
						<th>영업시간</th>
						<th>브레이크타임</th>
						<th>등록일자</th>
						<th>광고등급</th>
						<th>영업상태</th>
					</tr>
					<c:forEach var="com" items="${myCompanyList }" varStatus="status">
						<tr class="tr_hover">
							<div class="com_num" style="display:none">${com.com_num }</div>
							<td>${com.com_name }</td>
							<td>${com.operatingTime }</td>
							<td>${com.breakTime }</td>
							<td>${com.com_reg_date }</td>
							<td>
							<c:choose>
								<c:when test="${com.com_ad_grade eq '1'}">
										광고없음(0단계)
								</c:when>
								<c:when test="${com.com_ad_grade eq '2'}">
										1단계
								</c:when>
								<c:when test="${com.com_ad_grade eq '3'}">
										2단계
								</c:when>
								<c:otherwise>
										3단계
								</c:otherwise>
							</c:choose>
							</td>
							<td>
							<c:choose>
								<c:when test="${com.com_status eq '1'}">
										정상영업
								</c:when>
								<c:when test="${com.com_status eq '2'}">
										승인대기
								</c:when>
								<c:when test="${com.com_status eq '3'}">
										영업중지
								</c:when>
								<c:when test="${com.com_status eq '4'}">
										폐점
								</c:when>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
					
<!-- 					<tr class="tr_hover" onclick="comView()"> -->
<%-- 						<td>번호</td> --%>
<%-- 						<td>상호명</td> --%>
<%-- 						<td>영업시간</td> --%>
<%-- 						<td>등록일자</td> --%>
<%-- 						<td>업체상태</td> --%>
<%-- 						<td>업체상태</td> --%>
<!-- 						<td> -->
<%-- 							광고단계 --%>
<!-- 						</td> -->
<!-- 					</tr> -->
				</table>
			</div>	
		</div>
	</section>
	<div class="ceo_bottom">
		<footer>
	 		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	 	</footer>
 	</div>
</body>
</html>