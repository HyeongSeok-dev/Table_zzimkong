<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 날짜 출력 형식 변경을 위해 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1" />
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review_detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Js -->
<script src="${pageContext.request.contextPath}/resources/js/review_detail.js"></script>
<!-- Chart.js CDN 추가 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- datalabels 플러그인 -->
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var reviewCountsJson = '${reviewCountsJson}'.replace(/&quot;/g, '"');
    var reviewCounts = JSON.parse(reviewCountsJson)[0]; // 첫 번째 객체만 사용

    var labels = [
        "인테리어가 멋져요", "혼밥하기 좋아요", "매장이 넓어요", "단체 모임 하기 좋아요", "뷰가 좋아요", 
        "양이 많아요", "음식이 맛있어요", "가성비가 좋아요", "재료가 신선해요", 
        "건강한 맛이에요", "친절해요", "주차하기 편해요", "화장실이 깨끗해요", 
        "음식이 빨리 나와요", "아이와 가기 좋아요", "선택할 키워드가 없어요"
    ];
    
    var data = [
        reviewCounts.review_mood_interior, reviewCounts.review_mood_alone, reviewCounts.review_mood_large, 
        reviewCounts.review_mood_meeting, reviewCounts.review_mood_view, reviewCounts.review_food_big, 
        reviewCounts.review_food_deli, reviewCounts.review_food_cheap, reviewCounts.review_food_fresh, 
        reviewCounts.review_food_healthy, reviewCounts.review_etc_kind, reviewCounts.review_etc_parking, 
        reviewCounts.review_etc_toilet, reviewCounts.review_etc_fast, reviewCounts.review_etc_child, 
        reviewCounts.review_no_keyword
    ];

    // 데이터 내림차순 정렬 + 라벨 정렬
    var sortedIndices = data.map((value, index) => ({ value, index }))
                            .sort((a, b) => b.value - a.value)
                            .map(data => data.index);
    
    var sortedLabels = sortedIndices.map(index => labels[index]);
    var sortedData = sortedIndices.map(index => data[index]);

    // 순위별로 색상을 지정합니다.
    var backgroundColors = sortedData.map((value, index) => {
        if (index === 0) return '#add8e6'; // 1위 
        if (index < 5) return '#C8E4F7'; // 2 ~ 5위
        return '#C8E4F7'; // 나머지
    });

    var ctx = document.getElementById('reviewChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: sortedLabels,
            datasets: [{
                label: '좋아요 수',
                data: sortedData,
                backgroundColor: backgroundColors, // 위에서 정의한 색상 배열을 사용
                borderColor: 'rgba(0, 123, 255, 1)',
                borderWidth: 0,
                
            }]
        },
        options: {
            indexAxis: 'y',
            plugins: {
                datalabels: {
                    color: '#000',
                    anchor: 'end', // 데이터 레이블을 막대의 끝에 위치.
                    align: 'end', // 데이터 레이블을 막대의 오른쪽 끝에 정렬.
                    // 여기에 formatter를 추가하여 각 라벨에 해당하는 값을 표시.
                    offset: -30, // 라벨을 막대 바깥으로 10px 이동.
                   	font: {
                   		size: 18,
                   		family: 'Pretendard-Regular',
                   	},
                    formatter: function(value, context) {
                        // 막대 위에 라벨의 이름을 표시.
                        return value;
                    }
                }
            },
            scales: {
                x: {
                    beginAtZero: true,
                    grid:{ // 뒤에 선 지우기
                    	display: false,
            			drawBorder: false,
                    }
                    // 여기에 적절한 최대값 설정을 추가합니다.
                },
                y: {
//                     beginAtZero: true
                    barThickness: 24,
                   ticks: {
                	   font: {
                		   size: 18,
                		   family: 'Pretendard-Regular',
                	   }
                   },
                   grid: {
//                 	   display: false,
//                    	   drawBorder: false,
                   }
                    // 막대 두께 설정
                }
            },
            maintainAspectRatio: false,
            layout: {
                backgroundColor: 'transparent' // 차트 배경을 투명하게 설정
            }
        },
        // Chart.js 3.x 이상 =>  plugins 배열 대신 options.plugins를 사용.
        plugins: [ChartDataLabels]
    });
//     // 차트 데이터를 업데이트하는 함수
//     function updateChartData(chart, showAll) {
//         if (showAll) {
//             chart.data.labels = labels; // 전체 라벨 사용
//             chart.data.datasets[0].data = data; // 전체 데이터 사용
//         } else {
//             chart.data.labels = labels.slice(0, 5); // 상위 5개 라벨만 사용
//             chart.data.datasets[0].data = data.slice(0, 5); // 상위 5개 데이터만 사용
//         }
//         chart.update();
//     }

//     // 처음에는 상위 5개 항목만 표시
//     updateChartData(myChart, false);

//     // "더보기" 버튼 클릭 이벤트 핸들러
//     document.getElementById('showMoreButton').addEventListener('click', function() {
//         var isExpanded = this.textContent === '더보기';
//         updateChartData(myChart, isExpanded);
//         this.textContent = isExpanded ? "간략히" : "더보기";
//     });
});
</script>
	<!-- ================================================================================================= -->
</head>
<body>
	<div class="restaurant_name">
		<h2>&nbsp; ${comName}</h2>
		<div class="separator"></div>
	</div>
	<br>
	<br>
	<br>
	<div class="average">
		<h5>
			<span>${reviewCount}개 리뷰 별점 평균</span>
		</h5>
		<br>
		<div class="score">
			<strong>${reviewAverage}</strong>
		</div>
	</div>
	<!-- ================================================================================================= -->
	<br>
	<br>
	<br>
	<div class="review_container">
		<h2 class="place_reason">
			이런 점이 좋았어요&nbsp;
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15 15" class="question_mark" aria-hidden="true">    
				<path d="M7.5 14.97a7.62 7.62 0 01-2.88-.55 7.25 7.25 0 01-2.44-1.62 7.25 7.25 0 01-1.61-2.43A7.81 7.81 0 010 7.5a7.25 7.25 0 01.55-2.88 7.44 7.44 0 011.63-2.43A7.45 7.45 0 014.62.55 7.27 7.27 0 017.5 0c1.01.01 1.97.2 2.88.57a7.25 7.25 0 012.43 1.61 7.25 7.25 0 011.62 2.43A7.81 7.81 0 0115 7.5a7.25 7.25 0 01-.55 2.88 7.44 7.44 0 01-1.63 2.43A7.45 7.45 0 017.5 15v-.03zM7.5 1a6.3 6.3 0 00-3.25.88 6.59 6.59 0 00-2.37 2.37A6.3 6.3 0 001 7.5c0 1.17.3 2.25.88 3.25a6.59 6.59 0 002.37 2.37A6.3 6.3 0 007.5 14c.87 0 1.7-.16 2.5-.49a6.4 6.4 0 002.1-1.4A6.4 6.4 0 0013.51 10a6.5 6.5 0 000-5 6.4 6.4 0 00-1.4-2.1A6.4 6.4 0 0010 1.49 6.5 6.5 0 007.5 1zM5 5.31C5.06 4.02 5.9 3 7.54 3 9 3 10 3.93 10 5.16c0 .93-.47 1.59-1.22 2.05-.73.45-.94.78-.94 1.4V9H6.82v-.55c0-.78.37-1.32 1.16-1.8.68-.43.94-.8.94-1.44 0-.74-.56-1.28-1.43-1.28-.87 0-1.43.53-1.5 1.38H5zm2.5 6.19a.74.74 0 01-.75-.75c0-.43.33-.75.75-.75.43 0 .75.32.75.75 0 .42-.32.75-.75.75z"></path>
			</svg>
		</h2>
		<div class="review_write_button">
		    <a href="write?com_id="${review.review_num}><i class="fas fa-pencil-alt"></i> &nbsp;리뷰쓰기</a>
		</div>
	</div>
	<!-- ======================================================================================== -->
<div class="chart-container">
    <canvas id="reviewChart"></canvas>
</div>
	<!-- ======================================================================================== -->
	<br>
	<br>
	<br>
	<br>
	<br>
		<!-- 사진/영상리뷰 제목 -->
		<h2 class="review_photo_subject">사진/영상리뷰</h2>
		<!-- 이미지 슬라이더 컨테이너 -->
		<div class="carousel">
		    <div class="carousel-inner">
		        <!-- 리뷰 객체 리스트를 반복 처리 -->
		        <c:forEach items="${reviews}" var="review" varStatus="status">
		            <!-- review_img_1 필드에 이미지가 존재하면 표시 -->
		            <c:if test="${not empty review.review_img_1}">
		                <img src="${pageContext.request.contextPath}/resources/upload/${review.review_img_1}" alt="Review Image ${status.index + 1}" />
		            </c:if>
		        </c:forEach>
		    </div>
		    <!-- 이전 이미지로 이동하는 버튼 -->
		    <div class="carousel-prev">&#10094;</div>
		    <!-- 다음 이미지로 이동하는 버튼 -->
		    <div class="carousel-next">&#10095;</div>
		</div>


	<!-- ================================================================================================= -->
	<div class="separator"></div>
	<div class="review_main_subject">
		<h2 class="review_subject">
			리뷰&nbsp;<span class="review_subject_count">${reviewCount}</span>
		</h2>
		<label class="checkbox-container"><input type="checkbox"><span
			class="checkmark"></span>사진/영상 리뷰만 
	</div>
	</div>
	<div class="menu_select">
		<span class="menu_select_subject">&nbsp;&nbsp;&nbsp;&nbsp;메뉴&nbsp;</span>
			<button class="menu_button" id="mazeBtn">마제소바</button>
			<button class="menu_button" id="mazeBtn">껍데기</button>
			<button class="menu_button" id="mazeBtn">라멘</button>
			<button class="menu_button" id="mazeBtn">돈코츠라멘</button>
			<button class="menu_button" id="mazeBtn">하이볼</button>
	</div>
	<br>
	<div class="menu_select">
		<span class="menu_select_subject">&nbsp;&nbsp;&nbsp;&nbsp;특징&nbsp;</span>
			<button class="menu_button" id="mazeBtn">맛</button>
			<button class="menu_button" id="mazeBtn">만족도</button>
			<button class="menu_button" id="mazeBtn">서비스</button>
			<button class="menu_button" id="mazeBtn">대기시간</button>
			<button class="menu_button" id="mazeBtn">음식량</button>
	</div>
	<br>
	<br>
	<div class="reviewer_order">최신순 | 별점순 | 좋아요순</div>
	<div class="separator"></div>
	<!-- ========================================================================================= -->
	<c:forEach items="${reviews}" var="review">
	<ul class="review_list">
		<li class="review_list1">
			<div class="reviewer">
			<div class="reviewer_photo">
				<a href="사용자 사진 크게보기" target="_blank" role="button" class="profile_link">
					<div class="profile_image">
						<img src="${pageContext.request.contextPath}/resources/img/profile.png" alt="프로필" width="38" height="38">
					</div>
				</a>	 
					<!-- 사용자가 썼던 리뷰를 볼 수 있는 창 연결 -->
<!-- 				 <a href="마이페이지 프로필 연결" target="_blank" role="button" class="review_details"> -->
			<div class="reviewer_info">
			    <div class="reviewer_name">${review.user_id}</div>
			    <div class="score1">
			        <img src="${pageContext.request.contextPath}/resources/img/review_star.png">
			        <fmt:formatNumber value="${review.review_score / 2}" type="number" maxFractionDigits="1"/>
			    </div>
			</div>

			</div>
			<div class="reviewer_info"></div>
			<div class="review_photos">
	        	<c:if test="${not empty review.review_img_1}">
					<img src="${pageContext.request.contextPath}/resources/upload/${review.review_img_1}" alt="Review Image" />
					<div id="image-popup" class="image-popup" style="display: none;">
					    <span class="close-popup">&times;</span>
					    <img id="popup-img" class="popup-content">
					</div>
	        	</c:if>
			</div>
			<p class="review_content">${review.review_content}</p>
			<div class="review-actions">
					<div class="review-action1">
						<i class="far fa-comment" id="commentIcon" style="cursor: pointer;"></i>
						<!-- 댓글 아이콘 -->
						<i class="far fa-heart" id="heartIcon" style="cursor: pointer;"></i>
						<!-- 하트 아이콘 -->
					</div>
				</div>
			</div>
		</div>
		<br>
			<div class="review-actions">
				<div class="review-action2">
						<div class="review-action-buttons">
						    <form action="${pageContext.request.contextPath}/zzimkong/review/delete" method="POST">
						        <input type="hidden" name="review_num" value="${review.review_num}">
						        <input type="submit" class="review_delete" value="삭제" onclick="return confirm('리뷰를 삭제하시겠습니까?');">
						    </form>
						    <a href="modify?review_num=${review.review_num}">
						        <button class="review_modify">수정</button>
						    </a>
						    <a href="${pageContext.request.contextPath}/review/report" class="review_report_btn" role="button">리뷰 신고하기</a>
						</div>
						<span class="comment-icon" onclick="showCommentForm()"></span><br><br>
            <div class="review_date">
                <fmt:formatDate value="${review.review_update}" pattern="yy. MM. dd (E)" /> 작성
            </div>
			   </div>
			</div>
		</li>
	</ul><br>
	<div class="separator"></div>
	</c:forEach>
	<!-- ========================================================================================= -->
	<br><br><br><br><br><br><br><br><br><br>
	<footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>