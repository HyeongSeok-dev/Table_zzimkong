<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업장 광고 등록</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<sectionc class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>광고 등록</h3></span>
			</div>
		</div>
		<div class="text_inner">
			<form action="payAdPro" method="post" name="comAdJoin">
				<table>
					<tr>
						<th>사업자번호</th>
						<td colspan="1">
							${com.com_num}
							<input type="hidden" name="com_num" value="${com.com_num}">
						</td>
						<th>상호명</th>
						<td colspan="3"><input type="text" value="${com.com_name }" id="ceo_name" name="comName" readonly style="text-align: center;"></td>
					</tr>
					<tr>
						<th>현재 광고상태</th>
						<td colspan="1">
							<c:choose>
								<c:when test="${com.com_ad_grade eq '0'}">
										<input type="text" value="신규등록" name="adStatus" id="adStatus" readonly="readonly">
								</c:when>
								<c:when test="${com.com_ad_grade eq '1'}">
										<input type="text" value="1단계" name="adStatus" id="adStatus" readonly="readonly">
								</c:when>
								<c:when test="${com.com_ad_grade eq '2'}">
										<input type="text" value="2단계" name="adStatus" id="adStatus" readonly="readonly">
								</c:when>
								<c:otherwise>
										<input type="text" value="3단계" name="adStatus" id="adStatus" readonly="readonly">
								</c:otherwise>
						    </c:choose>
						</td>
						<th>광고등급</th>
						<td colspan="3">
							<select id="company_state" id="com_ad_grade" name="com_ad_grade">
								<option value="0">광고없음</option>
								<option value="1">1단계</option>
								<option value="2">2단계</option>
								<option value="3">3단계</option>
							</select>
						</td>
					</tr>	
					<tr>
						<th colspan="6">광고 등급당 가격 안내</th>
					</tr>
					<tr>
						<th colspan="2">등급</th>
						<th colspan="2">가격</th>
					</tr>
					<tr>
						<td colspan="2">1</td>
						<td colspan="2">30만원</td>
					</tr>
					<tr>
						<td colspan="2">2</td>
						<td colspan="2">50만원</td>
					</tr>
					<tr>
						<td colspan="2">3</td>
						<td colspan="2">100만원</td>
					</tr>
					
				</table>
				<br><br>
				<button type="submit" class="button_olive">결제</button>
				<button type="reset" class="button_grey2">초기화</button>
				<button type="button" class="button_grey2" style="color: #3FAFFC; background-color: #fff; border: 1px solid #3FAFFC;" onclick="javascript:history.back()">나가기</button>
			</form>
		</div>
	</section>
</body>
</html>