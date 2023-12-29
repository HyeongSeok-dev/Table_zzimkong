<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_company.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin_article.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_top.jsp"/>
	</header>

	<section class="article">
		<div class="text">
		
			<%-- 검색창 --%>
			<div id="board-search">
				<div class="container">
					<div class="search-window">
						<form action="/zzimkong/admin/company">
							<div class="search-wrap">
								<select name="searchCompanyType" class="search_select">
									<option value="company_num" <c:if test="${param.searchCompanyType eq 'company_num'}">selected</c:if>>업체번호</option>
									<option value="company_name" <c:if test="${param.searchCompanyType eq 'company_name'}">selected</c:if>>상호명</option>
									<option value="company_ceo" <c:if test="${param.searchCompanyType eq 'company_ceo'}">selected</c:if>>대표자명</option>
								</select>
								
		                        <input id="search" type="search" name="searchCompanyKeyword" placeholder="검색어를 입력해주세요." value="${param.searchCompanyKeyword}">
								<button type="submit" class="btn btn-dark"><i class="material-icons search_icon">&#xe8b6;</i></button>
		                    </div>
		                </form>
					</div>
				</div>
			</div>
			<div class="float_after"></div>
	        
			<h3>업체 관리</h3>
			
			<form action="/zzimkong/admin/company/approve/Pro" method="POST" class="companyApprove">
				<table border="1">
					<tr>
						<th>업체번호</th>
						<th>상호명</th>
						<th>업태</th>
						<th>대표자명</th>
<!-- 						<th>전화번호</th> -->
						<th>영업시간</th>
<!-- 						<th>건당<br>최대인원</th> -->
						<th>등록일자</th>
						<%-- 카테고리 필터 : 광고 등급 --%>
						<th>
							<select id="adGradeCategory">
								<option value="ad_grade_all" selected>광고등급</option>
								<option value="ad_grade_0">0단계</option>
								<option value="ad_grade_1">1단계</option>
								<option value="ad_grade_2">2단계</option>
								<option value="ad_grade_3">3단계</option>
							</select>
						</th>
						<%-- 카테고리 필터 : 업체 상태 --%>
						<th>
							<select id="companyStatusCategory">
								<option value="company_status_all" selected>업체상태</option>
								<option value="company_status_2">대기</option>
								<option value="company_status_1">정상</option>
								<option value="company_status_3">영업중지</option>
								<option value="company_status_4">폐점</option>
							</select>
						</th>
					</tr>
					<%-- 아래로 업체 목록 출력 --%>
					<c:forEach var="company" items="#{companyList}">
						<tr onclick="company_info_open('${company.com_id}')" class="tr_hover">
							<td>${company.com_id}</td>
							<td>${company.com_name}</td>
							<td>${company.com_category}</td>
							<td>${company.com_ceo}</td>
<%-- 							<td>${company.com_tel}</td> --%>
							<td>${fn:substring(company.com_open_time, 0, 5)} ~ ${fn:substring(company.com_close_time, 0, 5)}</td>
<%-- 							<td>${company.com_max_people}명</td> --%>
							<td><fmt:formatDate value="${company.com_reg_date}" pattern="yy/MM/dd HH:mm"/></td>
							<td class="ad_grade_item" data-category="ad_grade_${company.com_ad_grade}">${company.com_ad_grade}단계</td>
							<%-- 업체 상태 --%>
							<c:choose>
								<c:when test="${company.com_status eq 1}">
									<td class="company_status_item" data-category="company_status_1">정상</td>
								</c:when>
								<c:when test="${company.com_status eq 2}">
									<td class="company_status_item" data-category="company_status_2">
										<input type="hidden" id="com_id" name="com_id">
										<button type="submit" class="button_olive" onclick="company_approve('${company.com_id}')">승인</button>
										<button type="button" class="button_cancel" onclick="company_disapprove()">거부</button>
									</td>
								</c:when>
								<c:when test="${company.com_status eq 3}">
									<td class="company_status_item" data-category="company_status_3">영업중지</td>
								</c:when>
								<c:when test="${company.com_status eq 4}">
									<td class="company_status_item" data-category="company_status_4">폐점</td>
								</c:when>
								<c:otherwise>
									<td class="company_status_item" data-category="company_status_unknown" style="color:red;">알수없음</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>		
			</form>	
		</div>
	</section>
	
	<%-- 상단으로/bottom --%>
	<footer>
		<jsp:include page="../inc/topup.jsp"/>
		<jsp:include page="../inc/bottom_main.jsp"/>
	</footer>
</body>
</html>