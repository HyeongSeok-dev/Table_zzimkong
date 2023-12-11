<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- 평행 맞추기 -->
<style>
#logo {
  display: inline-block;
  vertical-align: middle;
  float: left;
}

#link {
  display: inline-block;
  vertical-align: middle;
  float: right;
}
</style>


<head>
<meta charset="UTF-8">

</head>
<body>
<hr>
<br>
<!-- 로고 는 왼쪽 -->
<div id="logo">
	<img src="${pageContext.request.contextPath}/resources/img/logo_top.png">
</div>	
<!-- 링크는 오른쪽 -->
<div id="link">
	<a href="">서비스 이용약관</a>
	 |
	 <a href="">개인정보 처리방침</a>
	 | 
	 <a href="">위치정보 이용약관</a>
	 | 
	 <a href="">광고/제휴문의</a>
	 | 
	 <a href="">고객센터</a>
	 &nbsp;&nbsp;&nbsp;
	 <br><br><br>
 </div>

</body>

</html>