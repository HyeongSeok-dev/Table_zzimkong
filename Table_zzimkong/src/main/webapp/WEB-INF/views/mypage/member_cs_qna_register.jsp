<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script type="text/javascript">
	
</script>
</head>
<body>
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>1 : 1 문의하기</h3></span>
			</div>
		</div>		
		<div class="text_inner_form">
			<form action="" method="post" name="memberQnaForm">
				<table>
					<tr>
						<th width="80">회원정보</th>
						<td width="100">찜콩이</td>
						<th width="80">유형</th>
						<td>
							<select class="category_select" name="memberCategory">
			            		<option value="">유형선택</option>
			            		<option value="예약">예약</option>
								<option value="주문/결제">주문/결제</option>
								<option value="리뷰">리뷰</option>
								<option value="회원정보">회원정보</option>
								<option value="이용문의">이용문의</option>
								<option value="쿠폰/포인트">쿠폰/포인트</option>
			            	</select>
						</td>
					</tr>
					<tr>
						<th colspan="1">제목</th>
						<td colspan="3">
							<input type="text" placeholder="제목" name="title">
						</td>
					</tr>
					<tr>
						<th colspan="1">문의내용</th>
						<td colspan="3">
							<textarea rows="20" cols="80" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<th colspan="1">파일첨부</th>
						<td colspan="3" class="td_file">
							<input type="file" multiple="multiple" name="uploadFile">
							<div class="file_5">* 파일 5개까지 첨부 가능</div>
						</td>
					</tr>
				</table>
				<br>
				<div class="cs_agree">
					<input type="checkbox" id="cs_agree_checkbox" name="mustAgree">
					<span class="cs_checkbox_must">
						<span class="must">[필수]</span> 개인정보 수집 및 이용에 동의합니다.
					</span>
				</div>
				<br><br>
				<button type="submit" class="button_olive">문의등록</button>
				<button type="reset" class="button_grey2">초기화</button>
			</form>
		</div>
	</section>
</body>
</html>