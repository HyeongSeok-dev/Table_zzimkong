<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업장 상세 정보</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/ceo_company_view.js"></script>
</head>
<body>
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>사업장 정보</h3></span>
				<span id="status_4"></span>
			</div>
		</div>
		<div class="text_inner_viewTable">
				<table>
					<tr>
						<th rowspan="4">사진</th>
						<td rowspan="4"><img src="${pageContext.request.contextPath}/resources/upload/${com.com_img }" style="width: 200px;"></td>
						<th colspan="2">등록일자</th>
						<td>${com.com_reg_date }</td>
					</tr>
					<tr>	
						<th colspan="2">사업자등록번호</th>
						<td id="com_num">${com.com_num }</td>
					</tr>
					<tr>
						<th colspan="2">상호명</th>
						<td>${com.com_name }</td>
					</tr>
					<tr>
						<th colspan="2">대표자명</th>
						<td>${com.com_ceo }</td>
					</tr>
					<tr>
						<th>업태</th>
						<td>${com.com_category }</td>
						<th rowspan="2">업체상태</th>
						<th>현재상태</th>
						<td id="com_status">
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
					<tr>
						<th>전화번호</th>
						<td>${com.com_tel }</td>
						<th>상태변경</th>
						<td>
							<select id="company_state2">
								<option value="">상태변경</option>
								<option value="영업중지">영업중지</option>
								<option value="정상영업">정상영업</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="4">${com.com_address }</td>
					</tr>
					<tr>
						<th>시간당 최대 인원</th>
						<td>${com.com_max_people } 명</td>
						<th colspan="2">광고등급</th>
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
					</tr>
					<tr>
						<th>영업시간</th>
						<td>${com.operatingTime }</td>
						<th colspan="2">브레이크타임</th>
						<td>${com.breakTime }</td>
					</tr>	
					<tr>
						<th>카테고리</th>
						<td colspan="4">${com.com_category }</td>
					</tr> 
					<tr>
						<th>검색키워드</th>
						<td colspan="4">${com.com_search_tag}</td>
					</tr>
				</table>
				<br><br>
				<span id="span_button">
					<form action="ad">
						<input type="hidden" name="com_num" value="${com.com_num }">				
						<button type="submit" id="adRegister" class="button_olive">광고등록</button>
					</form>
					<form action="modify">
						<input type="hidden" name="com_num" value="${com.com_num }">				
						<button type="submit" class="button_olive">수정/폐점신청</button>
					</form>
				</span>
		</div>
	</section>
</body>
</html>