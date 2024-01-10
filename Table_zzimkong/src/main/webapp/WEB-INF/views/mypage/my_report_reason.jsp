<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게 신고하기</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<!-- <script type="text/javascript">
 	function reportRegister(){
 		confirm("해당 가게를 신고하였습니다.");
 	}
 </script> -->
</head>
<body>
	<form action="reason2" method="post">
		<div align="center" class="div_img">
			<img class="logo_img_1" src="${pageContext.request.contextPath }/resources/img/logo1_2.png" alt="메인로고1" >
			<img class="logo_img_2" src="${pageContext.request.contextPath }/resources/img/logo3_2.png" alt="메인로고2" >
		</div>
  		<!-- 테두리를 위한 div테그 -->
        <div id="box">
		<h3>신고 사유를 선택해주세요</h3>
		<br><br>
		<section class="report_reason">
		<input type="hidden" name="com_id" value="${com_id}">
		<input type="radio" name="report_reason" value="1"> 청결하지 못함<br>
		<input type="radio" name="report_reason" value="2"> 직원이 불친절함<br>
		<input type="radio" name="report_reason" value="3"> 기타
		</section>
		<br><br>
		<h3>상세 사유</h3>
		<br><br>
			<textarea rows="10" cols="40" name="report_content" placeholder="방문한 날짜와 함께 자세한 내용을 입력해주세요."></textarea><br>
		<br>
			
		<div class = "click_button">
			<button type="submit" >신고</button>
			<button type="reset" id="button_grey2">초기화</button>
			<button type="button" id="my_delete" onclick="javascript:window.close()">취소</button>
		</div>
		</div>
	</form>

</body>
</html>