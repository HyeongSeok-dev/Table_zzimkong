<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<style>
#footer-bottom {
/* 	background: #E9E9E9; */
	background : #fff;
/* 	margin-top: 100px; */
    padding-bottom: 45px;
}
#footer-bottom p {
	text-align: center;
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
    margin-right: auto;
    margin-left: auto;
}
.p_col-md-12, .p_col-sm-12 {
	position: relative;
	min-height: 1px;
}

@media (min-width: 992px) {
	.container_bottom {
	 /* width: 970px; */
		width: 100%;
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
				<div class="block_bottom">
					<hr>
					<br>
					<p>서비스 이용약관 | 개인정보 처리방침 | 위치정보 이용약관 | 인재 채용 | 광고/제휴문의 </p>
					<p><a href="#">(주)테이블찜콩</a></p>
				</div>
			</div>
		</div>
	</div>
</footer>
