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
<script src="${pageContext.request.contextPath }/resources/js/main_1.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>


<body>
	<!-- Header start (메인탑)============================== -->
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
													<li class="dropdown"><a href="${pageContext.request.contextPath}/login">
<%-- 													<img src="${pageContext.request.contextPath}/resources/img/top_user.png" style="width: 25px; height: 25px;"> --%>
													로그인</a></li>
													<%--고객센터 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/member/cs/faq">
<%-- 													<img  src="${pageContext.request.contextPath}/resources/img/top_headset.png" style="width: 25px; height: 25px;"> --%>
													고객센터</a></li>
												</c:when>
												
												
												<%--업주회원 로그인시 --%>
												<c:when test="${sessionScope.sStatus eq 2}"> 
													<li class="dropdown">
													    <a href="main" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
<%-- 		      										    <input type="text" class="input_text" value="${sessionScope.sNick}&nbsp;님" style="width: 100px;"> --%>
		      										    <span>${sessionScope.sName}&nbsp;님</span>
<%-- 													    <img src="${pageContext.request.contextPath}/resources/img/top_user.png" style="width: 25px; height: 25px;"> --%>
													    </a>
													    <ul class="dropdown-menu">
													        <li><a href="${pageContext.request.contextPath}/ceo/sale">업주페이지</a></li>
													        <li><a href="${pageContext.request.contextPath}/my/list">마이페이지</a></li>
													        <li><a href="${pageContext.request.contextPath}/MemberLogout">로그아웃</a></li>
													    </ul>
													</li>
													<%--알림 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/#">
<%-- 													<img src="${pageContext.request.contextPath}/resources/img/top_bell.png" style="width: 25px; height: 25px;"> --%>
													알림</a></li>
													<%--고객센터 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/member/cs/faq">
<%-- 													<img  src="${pageContext.request.contextPath}/resources/img/top_headset.png" style="width: 25px; height: 25px;"> --%>
													고객센터</a></li>
												</c:when>
												
												
												<c:otherwise>
												<%--로그인후 마이페이지/로그아웃 --%>
													<li class="dropdown">
													    <a href="main" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
<%-- 		      										    <input type="text" class="input_text" value="${sessionScope.sNick}&nbsp;님" style="width: 100px;"> --%>
		      										    <span>${sessionScope.sNick}&nbsp;님</span>
<%-- 													    <img src="${pageContext.request.contextPath}/resources/img/top_user.png" style="width: 25px; height: 25px;"> --%>
													    </a>
													    <ul class="dropdown-menu">
													        <li><a href="${pageContext.request.contextPath}/my/list">마이페이지</a></li>
													        <li><a href="${pageContext.request.contextPath}/MemberLogout">로그아웃</a></li>
													    </ul>
													</li>
													<%--알림 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/#">
<%-- 													<img src="${pageContext.request.contextPath}/resources/img/top_bell.png" style="width: 25px; height: 25px;"> --%>
													알림</a></li>
													<%--고객센터 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/member/cs/faq">
<%-- 													<img  src="${pageContext.request.contextPath}/resources/img/top_headset.png" style="width: 25px; height: 25px;"> --%>
													고객센터</a></li>
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
<%-- 		<img class="img-responsive_main" src="${pageContext.request.contextPath}/resources/img/omakase.jpg" > --%>
	</section>
							
	
	<!-- 카테고리 버튼 -->
	<form action="Category">
		<div id="foodBtn">
						
					<button type="button" value="한식" name="category" >
						<span>한식</span>
					</button>		
					
					<button type="button" value="패밀리레스토랑" name="category" >
						<span>양식</span>
					</button>		
					
					<button type="button" value="중식" name="category" >
						<span>중식</span>
					</button>		
					
					<button type="button" value="일식" name="category">
						<span>일식</span>
					</button>		
									
					<button type="button" value="채식" class="foodThemeCategory">
						<span>채식</span>
					</button>		
		
		</div>
	
	<div id="foodBtn2">
			<button type="button" value="신년예약"  class="foodThemeCategory">
				<span>신년<br>예약</span>
				<%--신년지나면 '찜콩추천' 카테고리 --%>
			</button>		
			
			<button type="button" value="육마카세"  class="foodThemeCategory">
				<span>육마<br>카세</span>
			</button>		
			
			<button type="button" value="호텔다이닝"  class="foodThemeCategory">
				<span>호텔 <br>다이닝</span>
			</button>		
			
			<button type="button" value="애견동반"  class="foodThemeCategory">
				<span>애견<br>동반</span>
			</button>		
			
			<button type="button" value="혼밥"  class="foodThemeCategory">
				<span>혼밥</span>
			</button>		
	</div>				
						
	</form>
	
	<!--Slider start============================== -->
						<%-- 상세페이지로 가는 이미지 --%>
								<div id="carouselExample" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active"> <!-- 첫 번째 슬라이드 -->
            <div class="row">
                <div class="col">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/list_com.jpg">
                </div>
                <div class="col">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant2.jpg">
                </div>
                <div class="col">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant3.jpg">
                </div>
                <div class="col">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant4.jpg">
                </div>
            </div>
        </div>
        <div class="carousel-item"> <!-- 두 번째 슬라이드 -->
            <div class="row">
                <div class="col">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant5.jpg">
                </div>
                <div class="col">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant6.jpg">
                </div>
                <div class="col">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant7.jpg">
                </div>
                <div class="col">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/main_restaurant8.jpg">
                </div>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">이전</span>
    </a>
    <a class="carousel-control-next" href="#carouselExample" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">다음</span>
    </a>
</div>

 
	<!--footer-bottom  start ============================= -->
	<footer>
		<jsp:include page="inc/bottom_main.jsp"/>
	</footer>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script> -->
</body>
</html>