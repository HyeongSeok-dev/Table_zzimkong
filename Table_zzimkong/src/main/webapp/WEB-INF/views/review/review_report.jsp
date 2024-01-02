<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- JSTL 에서 split() 등의 함수 사용을 위해 functions 라이브러리 추가(${fn:xxx()} 형식으로 활용) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1" />
<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review_report.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css"> --%>
<!-- Js -->
<script src="${pageContext.request.contextPath}/resources/js/review_report.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<form action="reviewReportPro" name="reviewReportPro" method="POST" id="reviewReportPro">
    <input type="hidden" name="com_id" value="${comId}">
    <input type="hidden" name="review_num" value="${reviewNum}">
    <input type="hidden" name="user_id" value="${userId}">
	<div class="wrapper">
		<header id="header" class="opaque">
			<div class="container">
				<div class="header-left">
					<a href="./review_detail.jsp" class="btn-back">뒤로</a>
					<h1 class="page-title">리뷰 신고</h1>
				</div>
				<div class="header-right">
					<button class="btn-icon">정보</button>
				</div>
			</div>
		</header>
		<main id="main" class="">
			<br>
			<section class="section">
				<div class="container reason">
					<div class="form_block">
						<h3 class="form_block_title">신고 사유</h3>
						<div class="form_block_body">
							<div class="checkbox-group">
								<br> 
								<label class="label_checkbox"> 
								<input type="checkbox" class="form_checkbox" name="report_reason" value="4" checked>
								<span class="label strong">신뢰하기 어려운 홍보 게시물</span></label> 
								<label class="label_checkbox">
								<input type="checkbox" class="form_checkbox" name="report_reason" value="5">
								<span class="label strong">음란성 또는 부적절한 내용</span></label>
								<label class="label_checkbox">
								<input type="checkbox" class="form_checkbox" name="report_reason" value="6">
								<span class="label strong">명예훼손 및 저작권 침해</span></label>
							</div>
						</div>
					</div>
					<br>
					<div class="form_block">
						<h3 class="form_block_title">신고자 정보</h3>
						<div class="form_block_body">
							<br>
							<div class="checkbox-group">
								<label class="label_checkbox">
								<input type="radio" class="form_checkbox" name="report_person" value="1" checked>
								<span class="label strong">일반 사용자</span></label>
								<label class="label_checkbox">
								<input type="radio" class="form_checkbox" name="report_person" value="2">
								<span class="label strong">레스토랑 관계자</span></label>
							</div>
						</div>
					</div>
					<div class="form_block">
						<div class="form_block_header">
							<h3 class="form_block_title">상세 내용</h3>
						</div>
						<div class="form_block_body">
							<textarea name="report_content" rows="8" class="form-input" maxlength="500"
								placeholder="타당한 사유가 없는 허위 신고 시 이용에 제한이 가해질 수 있으므로,  &#13;&#10;신중하게 제보해 주세요.&#13;&#10;신고된 내용은 7일 이내의 검수과정을 거친 후 적용됩니다.(500자 제한)"></textarea>
						</div>
					</div>
					<br> <br>
					<div class="form_block">
						<h3 class="form_block_title">답변 받으실 휴대폰 번호</h3>
						<br>
						<div class="form_block_body">
<!-- 							<input type="tel" class="form-input" placeholder="사용자 휴대폰 번호"> -->
							<input type="text" class="form-input" name="user_email" value="${member.user_phone}">
						</div>
					</div>
					<br>
					<div class="form_block">
						<h3 class="form_block_title">답변 받으실 이메일 주소</h3>
						<br>
						<div class="form_block_body">
<!-- 							<input type="tel" class="form-input" placeholder="사용자 이메일 주소"> -->
							<input type="text" class="form-input" name="user_phone" value="${member.user_email}">
						</div>
					</div>
					<hr class="line">
					<br>
					<p class="law_info">
						수집하는 개인정보는 신고 내용 처리를 위해 꼭 필요한 정보로 동의 후 이용 가능하며, 수집된 정보는 관련 법령에 따라
						3년간 보관 후 삭제됩니다. <br>※ 수집 개인정보 : 이메일,휴대폰 번호
					</p>
					<br>
					<div class="agree_checkbox_block">
					  <label class="label_checkbox">
					    <input type="checkbox" class="form_checkbox" id="agreeCheckbox" checked> 
					    <span class="label strong">[필수] 개인정보 수집 및 이용 동의</span>
					  </label>
					  <a href="#" class="info-content">보기</a>
					  <!-- Popup window -->
					  <div id="infoPopup" class="popup">
					    <div class="popup-content">
					      <div class="law_content">개인정보 처리 방침</div><br>
					      <p>주식회사 찜콩(이하 "회사"라 한다)는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법 등 관련 법령에 따라 이용자의 개인정보를 보호하고, 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보처리방침을 수립합니다.</p><br>
					      <p>개인정보처리방침은 이용자가 언제나 쉽게 열람할 수 있도록 서비스 초기화면을 통해 공개하고 있으며 관련법령, 지침, 고시 또는 캐치테이블 서비스 정책의 변경에 따라 달라질 수 있습니다. 1. 개인정보의 수집·이용 회사는 다음과 같이 이용자의 개인정보를 수집합니다. 처리하고 있는 개인정보는 다음의 수집·이용 목적 이외의 용도로는 활용되지 않으며, 수집·이용 목적이 변경되는 경우에는 개인정보보호법에 따라 별도의 동의를 받는 등 필요한 조치를 이행합니다.</p>
					      <!-- Close button -->
					      <button id="closePopup" class="close-btn">닫기</button>
					    </div>
					  </div>
					</div>
			</section>
			<hr class="space">
		</main>
		<div class="sticky_bottom_btns">
			<button class="btn btn-lg btn_outline" id="cancelButton">취소</button>
			<button class="btn btn-lg btn-red" id="reportButton" type="submit">신고하기</button>
			
		</div>
	</div>
</form>	
</body>
</html>
