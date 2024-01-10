<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<style>
#footer-bottom {
	background: #E9E9E9;
	padding: 50px 50px 50px 0px;
	margin-top: 100px;
    padding-bottom: 45px;
}
#footer-bottom p {
	text-align: left;
	padding-top: 1.3;
	color: #454545;
	font-size: 12px;
	font-weight: 600;
	line-height: 2.0;
	letter-spacing: 0.2px;
}
#footer-bottom p a {
	color: #3FAFFC;
	font-size: 12px;
}
.container_bottom {
    padding-right: 15px;
/*  padding-left: 15px; */
    margin-right: auto;
    margin-left: auto;
}
.p_col-md-12, .p_col-sm-12 {
	position: relative;
	min-height: 1px;
	padding-right: 30px;
	padding-left: 30px;
}

@media (min-width: 992px) {
	.container_bottom {
	 /* width: 970px; */
		width: 80%;
	}
}
@media only screen and (min-width: 768px) and (max-width: 991px) {
	#footer-bottom .block p {
    	text-align: center;
	}
}
</style>

<footer id="footer-bottom">
	<div class="container_bottom">
		<div class="row">
			<div class="p_col-md-12 p_col-sm-12">
				<div class="block">
					<p><a href="#">(주)테이블찜콩</a></p>
					<p>대표 : 이형석</p>
					<p>주소 : 부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층</p>
					<p>대표번호 : 051-803-0909 / 1544-7070</p>
					<p>이메일 : class@itwillbs.co.kr</p>
					<br>
					<p>서비스 이용약관 | 개인정보 처리방침 | 위치정보 이용약관 | 인재 채용 | 광고/제휴문의<c:if test="${sessionScope.sCategory eq 3}"> | <a href="${pageContext.request.contextPath}/admin/main">관리자페이지</a></c:if></p>
				</div>
			</div>
		</div>
	</div>
</footer>
