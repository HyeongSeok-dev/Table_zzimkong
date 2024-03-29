<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!--  광고슬라이드 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

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
												<%-- 미 로그인 시 --%>
												<c:when test="${empty sessionScope.sId }"> 
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
												<c:when test="${sessionScope.sCategory eq 2}"> 
													<li class="dropdown"><a href="${pageContext.request.contextPath}/my/list">
      										    	${sessionScope.sName}&nbsp;업주님</a></li>
      										    	<%--업주페이지 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/ceo/sale">
													업주페이지</a></li>
													<%--알림 --%>
<%-- 													<li class="dropdown"><a href="${pageContext.request.contextPath}/#"> --%>
<%-- 													<img src="${pageContext.request.contextPath}/resources/img/top_bell.png" style="width: 25px; height: 25px;"> --%>
<!-- 													알림</a></li> -->
													<%--고객센터 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/member/cs/faq">
<%-- 													<img  src="${pageContext.request.contextPath}/resources/img/top_headset.png" style="width: 25px; height: 25px;"> --%>
													고객센터</a></li>
													<%--로그아웃 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/MemberLogout">
													로그아웃</a></li>
												</c:when>
												<%--관리자 로그인시 --%>
												<c:when test="${sessionScope.sCategory eq 3}"> 
													<li class="dropdown"><a href="${pageContext.request.contextPath}/admin/main">
      										    	관리자님</a></li>
													<%--알림 --%>
<%-- 													<li class="dropdown"><a href="${pageContext.request.contextPath}/#"> --%>
<%-- 													<img src="${pageContext.request.contextPath}/resources/img/top_bell.png" style="width: 25px; height: 25px;"> --%>
<!-- 													알림</a></li> -->
													<%--고객센터 --%>
<%-- 													<li class="dropdown"><a href="${pageContext.request.contextPath}/member/cs/faq"> --%>
<%-- <%-- 													<img  src="${pageContext.request.contextPath}/resources/img/top_headset.png" style="width: 25px; height: 25px;"> --%> 
<!-- 													고객센터</a></li> -->
													<%--로그아웃 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/MemberLogout">
													로그아웃</a></li>
												</c:when>
												
												
												
												<%-- --%>
												<c:otherwise>
												<%--로그인후 마이페이지/로그아웃 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/my/list">
		      										 ${sessionScope.sNick}&nbsp;님</a></li>
													<%--알림 --%>
<%-- 													<li class="dropdown"><a href="${pageContext.request.contextPath}/#"> --%>
<!-- 													알림</a></li> -->
													<%--고객센터 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/member/cs/faq">
													고객센터</a></li>
													<%--로그아웃 --%>
													<li class="dropdown"><a href="${pageContext.request.contextPath}/MemberLogout">
													로그아웃</a></li>
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
						
<!-- 	<section id="hero-area"> -->
<%-- 		<img class="img-responsive_main" src="${pageContext.request.contextPath}/resources/img/omakase.jpg" > --%>
 <%-- 		<img class="img-responsive_main" src="${pageContext.request.contextPath}/resources/img/omakase.jpg" > --%> 
<!-- 	</section> -->
	
	
	<div id="hero-area">
  <button id="prev"><i class="fas fa-angle-left"></i></button> <!-- 이전광고 -->
  <div id="slide1" class="slide"><img class="img-responsive_main" src="${pageContext.request.contextPath}/resources/img/omakase.jpg"></div>
  <div id="slide2" class="slide"><img class="img-responsive_main" src="${pageContext.request.contextPath}/resources/img/dog.jpg"></div>
  <div id="slide3" class="slide"><img class="img-responsive_main" src="${pageContext.request.contextPath}/resources/img/clean.jpg"></div>
  <div id="slide4" class="slide"><img class="img-responsive_main" src="${pageContext.request.contextPath}/resources/img/dining.jpg"></div>
  <button id="next"><i class="fas fa-angle-right"></i></button> <!-- 다음광고 -->
  <!-- 추가될 이미지들 -->
</div>


<!-- <span id="currentSlide"></span> 페이지 표시 -->
							
	
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
	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
<%-- 						위생순 --%>

                               <div class="title">
		                            <h3><span class="seleted_location">${search.location}</span> <span>위생순</span></h3>
		                        </div>
		                        <div id="owl-example1" class="owl-carousel">
	                              <c:forEach var="clean" items="${cleanList}">
	                                <div class="owl_example1_items_images">
	                                  <a href="product/detail?com_id=${clean.com_id}">
	                                    <img alt="" src="${pageContext.request.contextPath }/resources/upload/${clean.com_img}"> <br>
	                                    ${clean.com_name}
	                                  </a>
	                                </div>
	                              </c:forEach>
                              </div>
                        
						
						<%--추천순(광고등급순)--%>
						<br><br><br>
						<div class="title">
							<h3><span class="seleted_location">${search.location}</span> <span>추천순</span></h3>
						</div>
						<%-- 상세페이지로 가는 이미지 --%>
						<div id="owl-example2" class="owl-carousel">
						  <c:forEach var="recommand" items="${recommendList}">
						    <div class="owl_example1_items_images">
					    		<a href="product/detail?com_id=${recommand.com_id}">
						      		<img alt="" src="${pageContext.request.contextPath }/resources/upload/${recommand.com_img}"> <br>
						      		${recommand.com_name}
						    	</a>
						    </div>                      
						  </c:forEach>
						</div>
						
						<%--별점순 --%>		
						<br><br><br>				
						<div class="title">
							<h3><span class="seleted_location">${search.location}</span> <span>별점순</span></h3>
						</div>
						<%-- 상세페이지로 가는 이미지 --%>
						<div id="owl-example3" class="owl-carousel">
						  <c:forEach var="review" items="${reviewList}">
						    <div class="owl_example1_items_images">
						    	<a href="product/detail?com_id=${review.com_id}">
						      		<img alt="" src="${pageContext.request.contextPath }/resources/upload/${review.com_img}"> <br>
						     		 ${review.com_name}
						    	</a>
						    </div>                          
						  </c:forEach>
						</div>

					</div>
				</div><!-- .col-md-12 close -->
			</div><!-- .row close -->
		</div><!-- .container close -->
	</section><!-- slider close -->


	
	<!--footer-bottom  start ============================= -->
	<footer>
		<jsp:include page="inc/bottom_main.jsp"/>
	</footer>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script> -->
</body>
</html>