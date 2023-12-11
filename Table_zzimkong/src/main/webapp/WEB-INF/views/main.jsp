<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 수정!!!!! --%>
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
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>

<body>
	<!--
	header-img start 
	============================== -->
	<section id="hero-area">
		<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_header.jpg" alt="">
	</section>
	<!--
    Header start 
	============================== -->
	<nav id="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<nav class="navbar navbar-default">
							<div class="container-fluid">
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
										data-target="#bs-example-navbar-collapse-1">
										<span class="sr-only">Toggle navigation</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
									
									<%-- 상단 로고 --%>
									<a class="navbar-brand" href="login.jsp">
										<img src="${pageContext.request.contextPath}/resources/img/logo_top.png" alt="Logo">
									</a>
								</div>

								<%-- 검색바 삽입 --%>
								<div>
									<br><br><br>
									<jsp:include page="inc/search_bar.jsp"/>
								</div>
								
								<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
									<ul class="nav navbar-nav navbar-right">
										<li><a href="${pageContext.request.contextPath}/login.jsp">LOGIN</a></li>
										<li><a href="CEO_MVC_YM.jsp">NOTIFICATIONS</a></li>
										<li><a href="member_mypage.jsp">MYPAGE</a></li>
										<li><a href="login.jsp">CS</a></li>
									</ul>
								</div><!-- /.navbar-collapse -->
							</div><!-- /.container-fluid -->
						</nav>
					</div>
				</div><!-- .col-md-12 close -->
			</div><!-- .row close -->
		</div><!-- .container close -->
	</nav><!-- header close -->
	<!--
    Slider start
    ============================== -->
	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
						<div class="title">
							<h3>Featured1 <span>Works</span></h3>
						</div>
						<div id="owl-example1" class="owl-carousel">
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_4.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_4.jpg" alt="">
							</div>

						</div>
					</div>
				</div><!-- .col-md-12 close -->
			</div><!-- .row close -->
		</div><!-- .container close -->
	</section><!-- slider close -->


	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
						<div class="title">
							<h3>Featured2 <span>Works</span></h3>
						</div>
						<div id="owl-example2" class="owl-carousel">
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_4.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_4.jpg" alt="">
							</div>

						</div>
					</div>
				</div><!-- .col-md-12 close -->
			</div><!-- .row close -->
		</div><!-- .container close -->
	</section><!-- slider close -->


	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
						<div class="title">
							<h3>Featured3 <span>Works</span></h3>
						</div>
						<div id="owl-example3" class="owl-carousel">
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_4.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_4.jpg" alt="">
							</div>

						</div>
					</div>
				</div><!-- .col-md-12 close -->
			</div><!-- .row close -->
		</div><!-- .container close -->
	</section><!-- slider close -->


	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
						<div class="title">
							<h3>Featured4 <span>Works</span></h3>
						</div>
						<div id="owl-example4" class="owl-carousel">
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_4.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_4.jpg" alt="">
							</div>

						</div>
					</div>
				</div><!-- .col-md-12 close -->
			</div><!-- .row close -->
		</div><!-- .container close -->
	</section><!-- slider close -->


	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
						<div class="title">
							<h3>Featured5 <span>Works</span></h3>
						</div>
						<div id="owl-example5" class="owl-carousel">
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_4.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_img_4.jpg" alt="">
							</div>

						</div>
					</div>
				</div><!-- .col-md-12 close -->
			</div><!-- .row close -->
		</div><!-- .container close -->
	</section>
	
	<br>
	<br>
	<br>
	
	<!--
    footer-bottom  start
    ============================= -->
	<footer>
		<jsp:include page="../inc/bottom_main.jsp"/>
	</footer>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>