<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<style>
body {
/*   background-color: #f4f4f4; /* 배경색 설정 */ */
  color: #333; /* 글자색 설정 */
}

#link {
  text-align: center; /* 중앙 정렬 */
  padding: 20px; /* 패딩 설정 */
}

#link p {
  line-height: 1.6; /* 줄 간격 설정 */
}

#link a {
  color: #333; /* 링크 색상 설정 */
  text-decoration: none; /* 밑줄 제거 */
}
</style>

<body>
<hr>


  <div id="link">
  
    <p>서비스 이용약관 | 개인정보 처리방침 | 위치정보 이용약관 | 광고/제휴문의 |  
    <a href="${pageContext.request.contextPath }/member/cs/faq">고객센터</a></p>
         
  </div>

</body>

</html>