<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<style>
/* 로고랑 링크 평행 맞추기 */
.container {
  display: flex;
  justify-content: center; 
  align-items: center;
}

/* 로고사진 크기 조정 */
#logo > img {
  height: 120px;
  width: 120px;
}

/*로고랑 링크사이 여백주기 */
#link {
  margin-left: 20px; 
}
</style>

<body>
<hr>

<div class="container">
  <!-- 로고-->
  <div id="logo">
    <img src="${pageContext.request.contextPath }/resources/img/logo_top.png">
  </div>  
  
  <!-- 링크 -->
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
  
     
  </div>
</div>
</body>

</html>