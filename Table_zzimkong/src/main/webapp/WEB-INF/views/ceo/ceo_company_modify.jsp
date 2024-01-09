<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업장 정보 수정</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/ceo_company_modify.js"></script>
<script type="text/javascript">
	function companyCheckShutDown() {
		if(company_state2.selectedIndex = 0) {
			   alert("영업상태가 정상영업중 입니다. 영업상태를 확인 해주세요");
		   } else {
			  var value = confirm("폐점 하시겠습니까? 신청완료 후 폐점 신청을 철회하고 싶으시다면 고객센터로 문의 주세요");
				if(value === true) {
					companyShutDown();
				} 
		   }
		
	}
</script>
</head>
<body>
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>사업장 정보 수정</h3></span>
			</div>
		</div>
		<div class="text_inner">
				<form action="modifyPro" method="post" enctype="multipart/form-data" id="registerForm">
					<table>
						<tr>
							<th rowspan="4">사진등록</th>
							<td colspan="2" rowspan="4"> 
								<div id="img"><img src="/upload${com.com_img }" style="width: 200px;"></div>
								<hr>
								<div class="file_div">
									<input type="file" id="file" name="file" value="${com.com_img }" style="display: none;">
									<button type="button" id="uploadFileBtn">파일 선택</button>
									<span id="fileLabel">${fn:substringAfter(com.com_img, '_')}</span>
									<div class="guide">※ 사진은 최대 한장만 등록 가능합니다.</div>
								</div>
							</td>
							<th>상호명</th>
							<td colspan="2"><input type="text" name="com_name" value="${com.com_name }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>대표자명</th>
							<td colspan="2"><input type="text" name="user_name" value="${com.com_ceo }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td colspan="2"><input type="text" id="com_tel" name="com_tel" value="${com.com_tel }"></td>
						</tr>
						<tr>
							<th>시간당 최대 인원</th>
							<td colspan="2" style="font-size: 18px;"><input name="com_max_people" id="hMax" type="text" value="${com.com_max_people }"> 명</td>
						</tr>
						<tr>
							<th>영업 시작시간</th>
							<td colspan="2">
								<select class="hour" name="openHour" id="openHour">
								    <!-- 0시부터 23시까지 -->
									<c:choose>
										<c:when test="${empty com.openHour}">
									    	<option value="">시</option>
									    	<c:forEach var="i" begin="0" end="23">
										    	<option value="${i}">${i}</option>
										    </c:forEach>
									    </c:when>
									    <c:otherwise>
										    <c:forEach var="i" begin="0" end="23">
										    	<option value="${i}" ${i == com.openHour ? 'selected' : ''}>${i}</option>
										    </c:forEach>
									    </c:otherwise>
									</c:choose>    
								</select>
								:
								<select class="minute" name="openMin" id="openMin">
								    <option value="">분</option>
									<option value="00" <c:if test="${com.openMin eq '00'}">selected</c:if>>00</option>
								    <option value="10" <c:if test="${com.openMin eq '10'}">selected</c:if>>10</option>
								    <option value="20" <c:if test="${com.openMin eq '20'}">selected</c:if>>20</option>
								    <option value="30" <c:if test="${com.openMin eq '30'}">selected</c:if>>30</option>
								    <option value="40" <c:if test="${com.openMin eq '40'}">selected</c:if>>40</option>
								    <option value="50" <c:if test="${com.openMin eq '50'}">selected</c:if>>50</option>
								</select>
							</td>
							<th>영업 종료시간</th>
							<td colspan="2">
								<select class="hour" name="closeHour">
								    <!-- 0시부터 23시까지 -->
								    <c:choose>
										<c:when test="${empty com.closeHour}">
									    	<option value="">시</option>
									    	<c:forEach var="i" begin="0" end="23">
										    	<option value="${i}">${i}</option>
										    </c:forEach>
									    </c:when>
									    <c:otherwise>
										    <c:forEach var="i" begin="0" end="23">
										    	<option value="${i}" ${i == com.closeHour ? 'selected' : ''}>${i}</option>
										    </c:forEach>
									    </c:otherwise>
									</c:choose>
								</select>
								:
								<select class="minute" name="closeMin">
								    <option value="">분</option>
									<option value="00" <c:if test="${com.closeMin eq '00'}">selected</c:if>>00</option>
								    <option value="10" <c:if test="${com.closeMin eq '10'}">selected</c:if>>10</option>
								    <option value="20" <c:if test="${com.closeMin eq '20'}">selected</c:if>>20</option>
								    <option value="30" <c:if test="${com.closeMin eq '30'}">selected</c:if>>30</option>
								    <option value="40" <c:if test="${com.closeMin eq '40'}">selected</c:if>>40</option>
								    <option value="50" <c:if test="${com.closeMin eq '50'}">selected</c:if>>50</option>
								</select>
							</td>
						</tr>	
						<tr>
							<th>브레이크타임 시작시간</th>
							<td colspan="2">
								<select class="hour" name="startHour" id="openHour">
								    <!-- 0시부터 23시까지 -->
									<c:choose>
										<c:when test="${empty com.startHour}">
									    	<option value="">시</option>
									    	<c:forEach var="i" begin="0" end="23">
										    	<option value="${i}">${i}</option>
										    </c:forEach>
									    </c:when>
									    <c:otherwise>
										    <c:forEach var="i" begin="0" end="23">
										    	<option value="${i}" ${i == com.startHour ? 'selected' : ''}>${i}</option>
										    </c:forEach>
									    </c:otherwise>
									</c:choose>
								</select>
								:
								<select class="minute" name="startMin" id="openMin">
								    <option value="">분</option>
									<option value="00" <c:if test="${com.startMin eq '00'}">selected</c:if>>00</option>
								    <option value="10" <c:if test="${com.startMin eq '10'}">selected</c:if>>10</option>
								    <option value="20" <c:if test="${com.startMin eq '20'}">selected</c:if>>20</option>
								    <option value="30" <c:if test="${com.startMin eq '30'}">selected</c:if>>30</option>
								    <option value="40" <c:if test="${com.startMin eq '40'}">selected</c:if>>40</option>
								    <option value="50" <c:if test="${com.startMin eq '50'}">selected</c:if>>50</option>
								</select>
							</td>
							<th>브레이크타임 종료시간</th>
							<td colspan="2">
								<select class="hour" name="endHour">
								    <!-- 0시부터 23시까지 -->
								    <c:choose>
										<c:when test="${empty com.endHour}">
									    	<option value="">시</option>
									    	<c:forEach var="i" begin="0" end="23">
										    	<option value="${i}">${i}</option>
										    </c:forEach>
									    </c:when>
									    <c:otherwise>
										    <c:forEach var="i" begin="0" end="23">
										    	<option value="${i}" ${i == com.endHour ? 'selected' : ''}>${i}</option>
										    </c:forEach>
									    </c:otherwise>
									</c:choose>
								</select>
								:
								<select class="minute" name="endMin" >
									<option value="">분</option>
									<option value="00" <c:if test="${com.endMin eq '00'}">selected</c:if>>00</option>
								    <option value="10" <c:if test="${com.endMin eq '10'}">selected</c:if>>10</option>
								    <option value="20" <c:if test="${com.endMin eq '20'}">selected</c:if>>20</option>
								    <option value="30" <c:if test="${com.endMin eq '30'}">selected</c:if>>30</option>
								    <option value="40" <c:if test="${com.endMin eq '40'}">selected</c:if>>40</option>
								    <option value="50" <c:if test="${com.endMin eq '50'}">selected</c:if>>50</option>
								</select>
							</td>
						</tr>	
						<tr>
							<th>카테고리</th>
							<td colspan="4" style="font-size: 18px;">
								<div>
									<input type="checkbox" value="데이트" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_date, true)}">checked</c:if>>&nbsp;데이트&nbsp; 
									<input type="checkbox" value="가족모임" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_family, true)}">checked</c:if>>&nbsp;가족모임 &nbsp;
									<input type="checkbox" value="단체회식" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_party, true)}">checked</c:if>>&nbsp;단체회식 &nbsp;
									<input type="checkbox" value="조용한" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_quiet, true)}">checked</c:if>>&nbsp;조용한 &nbsp;
									<input type="checkbox" value="주차가능" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_park, true)}">checked</c:if>>&nbsp;주차가능 &nbsp;
									<input type="checkbox" value="노키즈존" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_kids, true)}">checked</c:if>>&nbsp;노키즈존 &nbsp;
								</div>	
								<div>	
									<input type="checkbox" value="장애인편의시설" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_disabled, true)}">checked</c:if>>&nbsp;장애인편의시설 &nbsp;
									<input type="checkbox" value="반려동물" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_pet, true)}">checked</c:if>>&nbsp;반려동물 동반 &nbsp;
									<input type="checkbox" value="홀" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_hall, true)}">checked</c:if>>&nbsp;홀 &nbsp;
									<input type="checkbox" value="룸" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_room, true)}">checked</c:if>>&nbsp;룸 &nbsp;
									<input type="checkbox" value="테라스" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_terrace, true)}">checked</c:if>>&nbsp;테라스 &nbsp;
									<input type="checkbox" value="창가자리" name="com_tag" class="category" <c:if test="${fn:contains(com.com_tag_window, true)}">checked</c:if>>&nbsp;창가자리 &nbsp;
								</div>
							</td>
						</tr>
						<tr>
							<th >검색키워드</th>
							<td colspan="4">
								<input type="text" name="com_search_tag" id="keyword" value="${com.com_search_tag}" placeholder="사업장이 검색될 키워드를 입력해주세요">
								<br>
								<div> </div>
							</td>
						</tr>
					</table>
					<br><br>
					<input type="hidden" name="com_num" value="${com.com_num}">
				</form>
				<div class="text_inner_form1">
					<button type="button" id="modifyButton" class="button_olive">수정</button>
					<form action="closeRegist" method="post">
						<input type="hidden" value="${com.com_num }" name="com_num">
						<button type="submit" id="button_cancel">폐점 신청</button>
					</form>
						<button type="button" class="button_grey2" style="color: #3FAFFC; background-color: #fff; border: 1px solid #3FAFFC;" onclick="javascript:history.back()">나가기</button>
				</div>
			</div>
	</section>
</body>
</html>