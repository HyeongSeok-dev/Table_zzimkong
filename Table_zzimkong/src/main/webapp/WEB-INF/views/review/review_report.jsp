<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1" />
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review_report.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css"> --%>
<!-- Js -->
<script src="${pageContext.request.contextPath}/resources/js/review_report.js"></script>

</head>
<body>
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
								<br> <label class="label_checkbox"> <input
									type="checkbox" class="form_checkbox" name="why" checked> <span
									class="label strong">신뢰하기 어려운 홍보 게시물</span></label> <label
									class="label_checkbox"><input type="checkbox"
									class="form_checkbox" name="why"><span
									class="label strong">음란성 또는 부적절한 내용</span></label><label
									class="label_checkbox"><input type="checkbox"
									class="form_checkbox" name="why"><span
									class="label strong">명예훼손 및 저작권 침해</span></label>
							</div>
						</div>
					</div>
					<br>
					<div class="form_block">
						<h3 class="form_block_title">신고자 정보</h3>
						<div class="form_block_body">
							<br>
							<div class="checkbox-group">
								<label class="label_checkbox"><input type="radio"
									class="form_checkbox" name="reporter" checked=""><span
									class="label strong">일반 사용자</span></label><label class="label_checkbox"><input
									type="radio" class="form_checkbox" name="reporter"><span
									class="label strong">레스토랑 관계자</span></label>
							</div>
						</div>
					</div>
					<div class="form_block">
						<div class="form_block_header">
							<h3 class="form_block_title">상세 내용</h3>
						</div>
						<div class="form_block_body">
							<textarea rows="8" class="form-input"
								placeholder="타당한 사유가 없는 허위 신고 시 이용에 제한이 가해질 수 있으므로, 신중하게 제보해 주세요.
신고된 내용은 7일 이내의 검수과정을 거친 후 적용됩니다."></textarea>
						</div>
					</div>
					<br> <br>
					<div class="form_block">
						<h3 class="form_block_title">답변 받으실 휴대폰 번호</h3>
						<br>
						<div class="form_block_body">
							<input type="tel" class="form-input"
								placeholder="사용자 휴대폰 번호">
						</div>
					</div>
					<br>
					<div class="form_block">
						<h3 class="form_block_title">답변 받으실 이메일 주소</h3>
						<br>
						<div class="form_block_body">
							<input type="tel" class="form-input"
								placeholder="사용자 이메일 주소">
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
						<label class="label_checkbox"><input type="checkbox"
							class="form_checkbox"> <span class="label strong">[필수]
								개인정보 수집 및 이용 동의</span></label><a href="#" class="info-content">보기</a>
					</div>
				</div>
			</section>
			<hr class="space">
		</main>
		<div class="sticky_bottom_btns">
			<button class="btn btn-lg btn_outline" id="cancelButton">취소</button>
			<button class="btn btn-lg btn-red" id="reportButton">신고하기</button>
		</div>
	</div>
</body>
</html>
