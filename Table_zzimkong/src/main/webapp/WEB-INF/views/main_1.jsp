<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 수정!!!! --%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>테이블 찜콩</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS
        ================================================ -->
<!-- Owl Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.css">
<!-- bootstrap.min css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<!-- Font-awesome.min css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<!-- Responsive Stylesheet -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">

<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<!-- Js -->
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
<script>
	window.jQuery
			|| document
					.write('<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-1.10.2.min.js"><\/script>')
					
</script>
<script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.nav.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.sticky.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/plugins.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
</head>

<body>
	
	
	<!--header-img start (광고)============================== -->
						
	<section id="hero-area">
		<img class="img-responsive_main" src="${pageContext.request.contextPath}/resources/img/omakase.jpg" >
		<img class="img-responsive_main" src="${pageContext.request.contextPath}/resources/img/omakase.jpg" >
	</section>


							
	
	
	<!--Slider start============================== -->
	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
						<div class="title">
							<h3><span class="seleted_location">${search.location}</span> <span>위생순</span></h3>
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

	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script> -->
</body>
</html>
