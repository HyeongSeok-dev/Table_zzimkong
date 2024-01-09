<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/my_sidebar.css" rel="stylesheet">
</head>
<body>
<main class="content">
<div id="commonMypage">
  <section class="common-mypage__sc-5trtbg-0 hNGEpQ">
    <h1 class="common-mypage__sc-5trtbg-1 cOPbLJ">
      <a href="${pageContext.request.contextPath }/my/list" class="mypage">My Page</a>
    </h1>
    <div class="common-mypage__sc-5trtbg-3 JsGLX">
      <div class="common-mypage__sc-wme82i-0 bHZFGQ"></div>
      <div class="common-mypage__sc-1loaj4c-0 dZrJws">
        <div class="common-mypage__sc-1loaj4c-1 hvkAAt">
        <c:choose>
        	<c:when test="${not empty sessionScope.imgName}">
	        	<img id="profile" src="/upload${sessionScope.imgName}">
        	</c:when>
        	<c:otherwise>
	        	<img id="profile" src="${pageContext.request.contextPath}/resources/img/profile.png">
        	</c:otherwise>
        </c:choose>
            <strong>${sessionScope.user_nick}</strong>
            <a href="${pageContext.request.contextPath }/my/modify/profile">회원정보변경</a>
        </div>
     </div>
     <div class="common-mypage__sc-1m1vyak-0 fJZyji">
      <a href="${pageContext.request.contextPath }/my/point" >
         <em>포인트 &gt;</em>
         <strong> ${sessionScope.totalPoint} <span style="font-size: 19px;">찜콩</span></strong>
        </a>
      <a href="${pageContext.request.contextPath }/my/coupon" >
         <em>나의 쿠폰 &gt;</em>
         <strong>5개</strong>
      </a>
    </div>
  </div>
</section>
<nav class="common-mypage__sc-1xdf2j1-0 efRKwE">
<!--   <h2 class="common-mypage__sc-1xdf2j1-1 ldXGXJ">Mypage Navigation Menus</h2> -->
  <div class="common-mypage__sc-1xdf2j1-3 ckQMyv">
      <h3>나의 쇼핑 활동</h3>
      <a href="${pageContext.request.contextPath }/my/list" class="common-mypage__sc-13c5psb-0 dhFOel">나의 내역</a>
      <a href="${pageContext.request.contextPath }/my/review" class="common-mypage__sc-13c5psb-0 dhFOel">나의 리뷰</a>
      <a href="${pageContext.request.contextPath }/my/report/shop" class="common-mypage__sc-13c5psb-0 dhFOel">가게 신고하기</a>
      <a href="${pageContext.request.contextPath }/member/cs/qna" class="common-mypage__sc-13c5psb-0 dhFOel">1:1 문의</a>
  </div>
  </nav>
</div>
</main>
</body>
</html>