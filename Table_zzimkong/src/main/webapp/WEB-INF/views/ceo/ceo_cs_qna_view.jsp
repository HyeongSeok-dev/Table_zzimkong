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
<body class="info_window">
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>1 :1 문의</h3></span>
			</div>
		</div>
		<div class="text_inner">
			<div class="text_inner_view">
				<table>
					<tr>
						<th width="80">회원정보</th>
						<td width="100">이형석</td>
						<th width="80">유형</th>
						<td>
							--유형
						</td>
					</tr>
					<tr>
						<th colspan="1">제목</th>
						<td colspan="3">
						--제목
						</td>
					</tr>
					<tr>
						<th colspan="1">문의내용</th>
						<td colspan="3">
						--내용
						</td>
					</tr>
					<tr>
						<th colspan="1">사진</th>
						<td colspan="3" class="td_file">
						--사진
						</td>
					</tr>
				</table>
				<br>
				<br><br>
				<button type="button" class="button_olive" onclick="location.href='${pageContext.request.contextPath }/ceo/cs/qna/modify'">수정하기</button>
				<button type="button" id="cs_button_delete">삭제</button>
			</div>
		</div>
	</section>
</body>
</html>