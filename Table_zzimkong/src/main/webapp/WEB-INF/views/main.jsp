<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 수정!!!! --%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Restaurant One Page HTML5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS
       ================================================ -->
<!-- Owl Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
<!-- bootstrap.min css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<!-- Font-awesome.min css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<!-- Responsive Stylesheet -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">

<!-- Js -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/vendor/modernizr-2.6.2.min.js"></script>
<script>
	window.jQuery || document.write('<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-1.10.2.min.js"><\/script>')
</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.nav.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>

<body>
	
	<!-- Header start ============================== -->
	<nav id="navigation">
		<div class="container_header_width">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<nav class="navbar navbar-default">
							<div class="container-fluid">
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="container-fluid-display">
									<div class="navbar-header">
										<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
											data-target="#bs-example-navbar-collapse-1">
											<span class="sr-only">Toggle navigation</span>
											<span class="icon-bar"></span>
											<span class="icon-bar"></span>
											<span class="icon-bar"></span>
										</button>
										
										<%-- 상단 로고 --%>
										<div class="header_img">
											<a href="./">
												<img alt="logo1" src="${pageContext.request.contextPath}/resources/img/logo1_2.png">
												<img alt="logo2" src="${pageContext.request.contextPath}/resources/img/logo5_b.png">
											</a>
										</div>
									</div>
									
									<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
										<ul class="nav navbar-nav navbar-right">
											<c:choose>
												<c:when test="${empty sessionScope.sId }"> <%-- 미 로그인 시 --%>
													<%--로그인 --%>
													<li><a href="${pageContext.request.contextPath}/login">
													<img src="${pageContext.request.contextPath}/resources/img/user.png"
													style="width: 30px; height: 30px;"></a></li>
													<%--고객센터 --%>
													<li><a href="${pageContext.request.contextPath}/member/cs/faq">
													<img  src="${pageContext.request.contextPath}/resources/img/headset.png"
													style="width: 30px; height: 30px;"></a></li>
												</c:when>
												<c:otherwise>
													<%--마이페이지 --%>
													<li><a href="${pageContext.request.contextPath}/my/list">
													<img src="${pageContext.request.contextPath}/resources/img/user.png"
														style="width: 30px; height: 30px;"></a></li>
													<%--알림 --%>
													<li><a href="${pageContext.request.contextPath}/#">
													<img src="${pageContext.request.contextPath}/resources/img/bell.png"
													style="width: 30px; height: 30px;"></a></li>
													<%--고객센터 --%>
													<li><a href="${pageContext.request.contextPath}/member/cs/faq">
													<img  src="${pageContext.request.contextPath}/resources/img/headset.png"
													style="width: 30px; height: 30px;"></a></li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div><!-- /.navbar-collapse -->
								</div>
								<%-- 검색바 삽입 --%>
								<div>
									<jsp:include page="inc/search_bar.jsp"/>
								</div>
							</div><!-- /.container-fluid -->
						</nav>
					</div>
				</div><!-- .col-md-12 close -->
			</div><!-- .row close -->
		</div><!-- .container close -->
	</nav><!-- header close -->
	
	<!--header-img start (광고)============================== -->
	<section id="hero-area">
		<img class="img-responsive_main" src="${pageContext.request.contextPath}/resources/img/omakase.jpg" >
	</section>
	
	<!--Slider start============================== -->
	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
						<div class="title">
							<h3>부산전포 <span>위생순</span></h3>
						</div>
						<div id="owl-example1" class="owl-carousel">
						
						<%-- 상세페이지로 가는 이미지 --%>
							<div class="owl_example1_items_images">
								<a href="${pageContext.request.contextPath}/product/detail">
									<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/list_com.jpg" >
								</a>
							</div>
							<div class="owl_example1_items_images">
								<a href="">
									<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant2.jpg" >
								</a>
							</div>
							<div  class="owl_example1_items_images">
								<a href="">
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant3.jpg" >
								</a>
							</div>
							<div  class="owl_example1_items_images">
								<a href="">
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant4.jpg" >
								</a>
							</div>
							<div  class="owl_example1_items_images">
								<a href="">
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant5.jpg" >
								</a>
							</div>
							<div  class="owl_example1_items_images">
								<a href="">
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant6.jpg" >
								</a>
							</div>
							<div  class="owl_example1_items_images">
								<a href="">
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant7.jpg">
								</a>
							</div>
							<div  class="owl_example1_items_images">
								<a href="">
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant8.jpg">
								</a>
							</div>

						</div>
					</div>
				</div><!-- .col-md-12 close -->
			</div><!-- .row close -->
		</div><!-- .container close -->
	</section><!-- slider close -->

		
	 <button><a href="ceo/sale">ceo/sale</a></button>
	 <button><a href="ceo/black">ceo/black</a></button>
	 <button><a href="ceo/black/register">ceo/black/register</a></button>
	 <button><a href="ceo/company/list">ceo/company/list</a></button>
	 <button><a href="ceo/company/register">ceo/company/register</a></button>
	 <button><a href="ceo/company/modify">ceo/company/modify</a></button>
	 <button><a href="ceo/company/ad">ceo/company/ad</a></button>
	 <button><a href="ceo/menu/list">ceo/menu/list</a></button>
	 <button><a href="ceo/menu/modify">ceo/menu/modify</a></button>
	 <button><a href="ceo/menu/register">ceo/menu/register</a></button>
	 <button><a href="ceo/reservation">ceo/reservation</a></button>
	 <button><a href="ceo/reservation/detail">ceo/reservation/detail</a></button>
	 <button><a href="ceo/cs/faq">ceo/cs/faq</a></button>
	 <button><a href="ceo/cs/notice">ceo/cs/notice</a></button>
	 <button><a href="ceo/cs/qna/modify">ceo/cs/qna/modify</a></button>
	 <button><a href="ceo/cs/qna/register">ceo/cs/qna/register</a></button>
	 <button><a href="ceo/cs/qna">ceo/cs/qna</a></button>
	 <hr>
	 
	 <button><a href="payment/info">payment/info</a></button>
	 <button><a href="payment">payment</a></button>
	  <hr>
	 <button><a href="product/detail">product/detail</a></button>
	 <button><a href="product/list">product/list</a></button>
	  <hr>
	 <button><a href="admin/main">admin/main</a></button>
	 <button><a href="admin/user">admin/user</a></button>
	 <button><a href="admin/company">admin/company</a></button>
	 <button><a href="admin/company/info">admin/company/info</a></button>
	 <button><a href="admin/review">admin/review</a></button>
	 <button><a href="admin/review/detail">admin/review/detail</a></button>
	 <hr>
	 <button><a href="join/join">join</a></button>
	 <button><a href="join/ceo">join/ceo</a></button>
	 <button><a href="join/choice">join/choice</a></button>
	 <button><a href="login">login</a></button>
	 <hr>
	 <button><a href="login/find/id">login/find/id</a></button>
	 <button><a href="login/find/passwd">login/find/passwd</a></button>
	 <hr>
	 <button><a href="my/list">my/list</a></button>
	 <button><a href="my/review">my/review</a></button>
	 <button><a href="my/report/shop">my/report/shop</a></button>
	 <button><a href="my/report/reason">my/report/reason</a></button>
	 <button><a href="my/modify/profile">my/modify/profile</a></button>
	 <button><a href="my/unregister">my/unregister</a></button>
	 <hr>
	 <button><a href="review/detail">review/detail</a></button>
	 <button><a href="review/write">review/write</a></button>
	 <button><a href="review/complete">review/complete</a></button>
	 <button><a href="review/report">review/report</a></button>
	 <hr>
	 <button><a href="reservation">reservation</a></button>
	<hr>
	<button><a href="member/cs/faq">member/cs/faq</a></button>
	<button><a href="member/cs/notice">member/cs/notice</a></button>
	<button><a href="member/cs/qna/register">member/cs/qna/register</a></button>
	<button><a href="member/cs/qna">member/cs/qna</a></button>
	<button><a href="member/cs/register">member/cs/register</a></button>
	<br>
	
	   
	
	<!--
    footer-bottom  start
    ============================= -->
	<footer>
		<jsp:include page="inc/bottom_main.jsp"/>
	</footer>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script> -->
</body>
</html>