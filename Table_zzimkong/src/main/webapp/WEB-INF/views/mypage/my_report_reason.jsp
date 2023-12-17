<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script type="text/javascript">
	function reportRegister(){
		confirm("해당 가게를 신고하였습니다.");
	}
</script>
</head>
<body>
	<form action="" method="post">
		<h3>신고 사유를 선택해주세요</h3>
		<br><br>
		<section class="report_reason">
		<input type="radio" name="reason"> 청결하지 못함<br>
		<input type="radio" name="reason"> 직원이 불친절함<br>
		<input type="radio" name="reason"> 기타
		</section>
		<br><br>
		
		<h3>상세 사유</h3>
		<br><br>
		<textarea rows="10" cols="40" name="motivation" placeholder="내용을 입력해주세요."></textarea><br>
		<br>
		<div class = "click_button">
			<button type="submit" onclick="reportRegister()">신고</button>
			<button type="reset" id="button_grey2">초기화</button>
			<button type="button" id="my_delete" onclick="javascript:window.close()">취소</button>
		</div>
	</form>
</body>
</html>