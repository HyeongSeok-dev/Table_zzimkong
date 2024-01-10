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
							
							<input type="hidden" value="${param.memberCategory}">
							<input type="hidden" value="${param.memberStatusCategory}">
	                        <input id="search" type="search" name="searchCompanyKeyword" placeholder="검색어를 입력해주세요." value="${param.searchCompanyKeyword}">
							<button type="submit" class="btn btn-dark"><i class="material-icons search_icon">&#xe8b6;</i></button>
	                    </div>
					</div>
				</div>
			</div>
			<div class="float_after"></div>
	        
			<h3>업체 관리</h3>
			
			<table border="1">
				<tr>
					<th>업체번호</th>
					<th>상호명</th>
					<th>업태</th>
					<th>대표자명</th>
					<th>영업시간</th>
					<th>등록일자</th>
					<%-- 카테고리 필터 : 광고 등급 --%>
					<th>
						<select id="adGradeCategory" name="adGradeCategory" onchange="this.form.submit()">
							<option value="ad_grade_all" <c:if test="${param.adGradeCategory eq 'ad_grade_all'}">selected</c:if>>광고등급</option>
							<option value="ad_grade_0" <c:if test="${param.adGradeCategory eq 'ad_grade_0'}">selected</c:if>>0단계</option>
							<option value="ad_grade_1" <c:if test="${param.adGradeCategory eq 'ad_grade_1'}">selected</c:if>>1단계</option>
							<option value="ad_grade_2" <c:if test="${param.adGradeCategory eq 'ad_grade_2'}">selected</c:if>>2단계</option>
							<option value="ad_grade_3" <c:if test="${param.adGradeCategory eq 'ad_grade_3'}">selected</c:if>>3단계</option>
						</select>
					</th>
					<%-- 카테고리 필터 : 업체 상태 --%>
					<th>
						<select id="companyStatusCategory" name="companyStatusCategory" onchange="this.form.submit()">
							<option value="company_status_all" <c:if test="${param.companyStatusCategory eq 'company_status_all'}">selected</c:if>>업체상태</option>
							<option value="company_status_1" <c:if test="${param.companyStatusCategory eq 'company_status_1'}">selected</c:if>>정상</option>
							<option value="company_status_2" <c:if test="${param.companyStatusCategory eq 'company_status_2'}">selected</c:if>>대기</option>
							<option value="company_status_3" <c:if test="${param.companyStatusCategory eq 'company_status_3'}">selected</c:if>>영업중지</option>
							<option value="company_status_4" <c:if test="${param.companyStatusCategory eq 'company_status_4'}">selected</c:if>>폐점</option>
							<option value="company_status_5" <c:if test="${param.companyStatusCategory eq 'company_status_5'}">selected</c:if>>입점거부</option>
						</select>
					</th>
					</form>
				</tr>
				<%-- 아래로 업체 목록 출력 --%>
				<c:forEach var="company" items="#{companyList}">
					<tr onclick="company_info_open('${company.com_id}')" class="tr_hover">
						<td>${company.com_id}</td>
						<td>${company.com_name}</td>
						<td>${company.com_category}</td>
						<td>${company.com_ceo}</td>
						<td>${fn:substring(company.com_open_time, 0, 5)} ~ ${fn:substring(company.com_close_time, 0, 5)}</td>
						<td>${company.com_reg_date}</td>
						<td class="ad_grade_item" data-category="ad_grade_${company.com_ad_grade}">${company.com_ad_grade}단계</td>
						<%-- 업체 상태 --%>
						<c:choose>
							<c:when test="${company.com_status eq 1}">
								<td class="company_status_item" data-category="company_status_1">정상</td>
							</c:when>
							<c:when test="${company.com_status eq 2}">
								<td class="company_status_item" data-category="company_status_2">
								    <form id="companyOpenForm${company.com_id}" action="/zzimkong/admin/company/register/pro" method="POST" >
								    	<%-- 각자 고유한 값을 부여 --%>
								        <input type="hidden" id="com_id${company.com_id}" name="com_id">
								        <input type="hidden" id="company_open_register${company.com_id}" name="company_open_register">
								
								        <button type="submit" class="button_olive" name="company_oepn_ok"
								            onclick="event.stopPropagation(); company_approve(event, '${company.com_id}', this.name)">승인</button>
								        <button type="submit" class="button_cancel" name="company_oepn_no"
								            onclick="event.stopPropagation(); company_disapprove(event, '${company.com_id}', this.name)">거부</button>
								    </form>
								</td>
							</c:when>
							<c:when test="${company.com_status eq 3}">
								<td class="company_status_item" data-category="company_status_3">영업중지</td>
							</c:when>
							<c:when test="${company.com_status eq 4}">
								<td class="company_status_item" data-category="company_status_4">폐점</td>
							</c:when>
							<c:when test="${company.com_status eq 5}">
								<td class="company_status_item" data-category="company_status_5">입점거부</td>
							</c:when>
							<c:otherwise>
								<td class="company_status_item" data-category="company_status_unknown" style="color:red;">알수없음</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>		
		</div>
	</section>
	
	<%-- 페이지네이션 --%>
	<c:set var="pageNum" value="1"/>
	<c:if test="${not empty param.pageNum}">
		<c:set var="pageNum" value="${param.pageNum}"/>
	</c:if>
	
	<section id="pageList">
		<input type="button" value="이전" onclick="location.href='?pageNum=${pageNum - 1}&searchCompanyType=${searchCompanyType}&searchCompanyKeyword=${searchCompanyKeyword}&adGradeCategory=${adGradeCategory}&companyStatusCategory=${companyStatusCategory}'"
		 <c:if test="${pageNum <= 1}">disabled</c:if>>
		 
		<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
			<c:choose>
				<c:when test="${pageNum eq i}">
					<b>${i}</b>
				</c:when>
				<c:otherwise>
					<a href="?pageNum=${i}&searchCompanyType=${searchCompanyType}&searchCompanyKeyword=${searchCompanyKeyword}&adGradeCategory=${adGradeCategory}&companyStatusCategory=${companyStatusCategory}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<input type="button" value="다음" onclick="location.href='?pageNum=${pageNum + 1}&searchCompanyType=${searchCompanyType}&searchCompanyKeyword=${searchCompanyKeyword}&adGradeCategory=${adGradeCategory}&companyStatusCategory=${companyStatusCategory}'"
		 <c:if test="${pageNum >= pageInfo.maxPage}">disabled</c:if>>	
	</section>
	
	<%-- 상단으로/bottom --%>
	<footer>
		<jsp:include page="../inc/topup.jsp"/>
		<jsp:include page="../inc/bottom_main.jsp"/>
	</footer>
</body>
</html>