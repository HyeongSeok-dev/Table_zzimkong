<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/ceo_article.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<%-- <link href="${pageContext.request.contextPath}/resources/js/ceo_sale.js" rel="stylesheet"> --%>
<style type="text/css">
	select {
 	    border: none !important;
		background-color: #eff7fe;
	    padding: 11px !important;
	}
	.styled-date-input {
	    border: none;
		background-color: #eff7fe;
	    padding: 20px;
	    border-radius: 10px;
	}
</style>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', (event) => {
    var selectedValue = document.getElementById('storeList').value;
    var isDisabled = selectedValue === "";
    document.getElementById('date').disabled = isDisabled;
    document.getElementById('warningMessage').style.display = isDisabled ? "inline" : "none";
    
    // 날짜 선택 가능 범위 제한
    var date = new Date();
    var dateString = date.toISOString().split('T')[0];   
    document.getElementById('date').max = dateString;
});

function select_company(com_id) {
	location.href = "sale?com_id=" + com_id;
}

function select_company_date(com_id, company_date) {
    document.getElementById("companySaleForm").submit();
}
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
					<span><h1>사업장별 판매관리</h1></span>
					<span class="header_span">
						<form action="${pageContext.request.contextPath}/ceo/sale" method="GET" id="companySaleForm">
							<select id="storeList" onchange="select_company(this.value)">
								<c:if test="${not empty storeList}">
								    <option value="" selected disabled>선택해주세요</option>
									<c:forEach var="company" items="${storeList}">
										<option value="${company.com_id}"
											<c:if test="${not empty param.com_id and param.com_id eq company.com_id}">selected</c:if>
											<c:if test="${company.com_status eq 4}">disabled</c:if>>
											${company.com_name}
										</option>
									</c:forEach>
								</c:if>
							</select>
							
							<input type="hidden" id="com_id" name="com_id" value="${param.com_id}"/>
							<input type="date" id="date" class="styled-date-input" name="company_date" value="${param.company_date}" onchange="select_company_date('${param.com_id}', this.value)"><br>
 							<p id="warningMessage" style="color:red; display:none; margin-left: 50%;">※ 사업장을 먼저 선택해주세요</p>
 						</form>
					</span>	
				</div>
			</div>
			<div class="text_inner">
				<div class="header">
					<span><h3>일별 판매&예약 현황</h3></span>
					<span class="header_span">
					</span>	
				</div>
				
				<table border="1">
					<tr>
						<th>총 판매금액</th>
						<th>총 판매금액(선주문)</th>
						<th>총 예약 건수</th>
						<th>총 예약 인원</th>
					</tr>
					<tr>
						<td>
							<%-- 숫자값 : 쉼표로 구분된 형식으로 --%>
							<fmt:formatNumber value="${total_sales}" groupingUsed="true"/><c:if test="${empty total_sales}">0</c:if>원								
						</td>
						<td>
							<%-- 숫자값 : 쉼표로 구분된 형식으로 --%>
							<fmt:formatNumber value="${pre_order_sales}" groupingUsed="true"/><c:if test="${empty pre_order_sales}">0</c:if>원
						</td>
						<td>${total_res_count}<c:if test="${empty total_res_count}">0</c:if>건</td>
						<td>${total_res_people}<c:if test="${empty total_res_people}">0</c:if>명</td>
					</tr>
				</table>
			</div>
			
			<div class="text_inner">
				<div class="header">
					<span><h3>일별 메뉴별 선주문 판매 현황</h3></span>
				</div>
				<table border="1">
					<tr>
						<th>메뉴 이름</th>
						<th>메뉴 가격</th>
						<th>판매량</th>
						<th>총 판매 금액</th>
					</tr>
					<%-- 선택한 업체에 메뉴가 존재하지 않을 경우 --%>
					<c:if test="${empty storeMenuList}">
					    <tr>
					        <td colspan="4">메뉴가 존재하지 않습니다.</td>
					    </tr>
					</c:if>
					<%-- 아래부터 메뉴 출력 --%>
					<c:forEach var="menu" items="${storeMenuList}">
					<tr>
						<td>${menu.menu_name}</td>
						<td>
							<%-- 숫자값 : 쉼표로 구분된 형식으로 --%>
							<fmt:formatNumber value="${menu.menu_price}" groupingUsed="true"/>원								
						</td>
						<td>${menu.pre_sales}건</td>
						<td>
							<%-- 숫자값 : 쉼표로 구분된 형식으로 --%>
							<fmt:formatNumber value="${menu.total_menu_sales}" groupingUsed="true"/>원								
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
	<br><br><br>

	<footer>
		<%-- 상단으로 --%>
		<jsp:include page="../inc/topup.jsp"/>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>