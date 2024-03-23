<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="comId" value="${param.com_id}" />

<!DOCTYPE html>
<html>
<head>

<title>리뷰 상세페이지</title>

<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1" />

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review_detail.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Chart.js  -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- datalabels 플러그인 -->
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script type="text/javascript">

	// 변수 선언 
	var contextPath = "${pageContext.request.contextPath}";
	var sId = '<c:out value="${sessionScope.sId}"/>';
	
	// ===================================================================
	// 댓글창 여는 함수
	function showCommentForm(element) {
	    var reviewNum = element.getAttribute('data-review-num');
	    var comId = getParameterByName('com_id');
	    var url = contextPath + "/review/comment?com_id=" + comId + "&review_num=" + reviewNum;
	    var windowName = "commentPopup";
	    var windowSize = "width=565,height=632";
	    window.open(url, windowName, windowSize);
	}	

	document.addEventListener('DOMContentLoaded', function() {
	
		// 정렬 링크를 찾음
	    var sortLinks = document.querySelectorAll('.sort-link');
	    sortLinks.forEach(function(link) {
	        link.addEventListener('click', function(event) {
	        	
	            // 이벤트 기본 동작 방지
	            event.preventDefault();
	
	            // data-sort-type 속성에서 정렬 타입을 읽음
	            var sortType = this.getAttribute('data-sort-type');
	            sortReviews(sortType);
	        });
	    });

	// ===================================================================
	// 최신 리뷰 목록을 불러오기
    sortReviews('newest');
	// ===================================================================
	// 사진 넘기기 
	var carouselInner = document.querySelector('.carousel-inner');
	var images = Array.from(carouselInner.children);
	var imageWidth = images[0].getBoundingClientRect().width;

	images.forEach(function(img, idx) {
		img.style.left = imageWidth * idx + 'px';
	});

	document.querySelector('.carousel-next').addEventListener(
		'click',
		function() {
			if (currentIndex < images.length - 1) {
				currentIndex++;
				carouselInner.style.transform = 'translateX('
					+ (-imageWidth * currentIndex) + 'px)';
			}
		});

	var currentIndex = 0;
	document.querySelector('.carousel-prev').addEventListener(
		'click',
		function() {
			if (currentIndex > 0) {
				currentIndex--;
				carouselInner.style.transform = 'translateX('
					+ (-imageWidth * currentIndex) + 'px)';
			}
		});

	// ===================================================================
	// 리뷰 메뉴버튼 
	document.querySelectorAll('.menu_button').forEach(button => {
		button.addEventListener('click', function() {
			this.classList.toggle('active');
		});
	});
	// ===================================================================
		var deleteButtons = document.querySelectorAll('.review_delete');
		deleteButtons.forEach(function(deleteButton) {
	    deleteButton.addEventListener('click', function(event) {
        // 팝업창을 표시
        deleteConfirmationPopup.style.display = 'block';

        // 기본 이벤트 방지
        event.preventDefault();
	    });
	}); 
	// ===================================================================
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

    // 순위별로 색상 지정
    var backgroundColors = sortedData.map((value, index) => {
        if (index === 0) return '#03A9F4'; // 1위 
        if (index < 5) return '#80D8FF'; // 2 ~ 5위
        return '#E1F5FE'; // 나머지
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
                    align: 'right', // 데이터 레이블을 막대의 오른쪽 끝에 정렬.
                    offset: 10, // 라벨을 막대 바깥으로 10px 이동.
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
                },
                y: {

                	barThickness: 24,
                   ticks: {
                	   font: {
                		   size: 18,
                		   family: 'Pretendard-Regular',
                	   }
                   },
                   
                   grid: {

                	   
                   }
                }
            },
            
            maintainAspectRatio: false,
            layout: {
                padding: {
                    right: 40 // 라벨값이 잘리지 않도록 오른쪽에 패딩 추가
                },
                backgroundColor: 'transparent' // 차트 배경을 투명하게 설정
            }
        },
        
        // Chart.js 3.x 이상 =>  plugins 배열 대신 options.plugins를 사용.
        plugins: [ChartDataLabels]
    });

});

	
	// =================================================================	
	    // 페이지 로드 시 기본 상태 설정
	    var initialSortType = $('.sort-link.active').data('sort-type') || 'newest';
	    var photoOnly = $('#photoReviewCheckbox').is(':checked');
	    comId = getParameterByName('com_id');  // comId 초기화
	// =================================================================	
	    $('#loadMoreBtn').click(function() {
	        if (!isLoading) {
	            isLoading = true;
	            currentPage++; // 페이지 번호 증가
	            filterReviewsByCheckedMenus(); // 다시 리뷰를 로드하되, 증가된 페이지 번호를 사용
	        }
	    });	    
	// =================================================================	 
	 // 초기 리뷰 목록 로드
   	 filterReviewsByCheckedMenus();

	    // 메뉴 체크박스 변경 감지
  	  $('.menu_checkbox').change(filterReviewsByCheckedMenus);

  	   // '사진만 보기' 체크박스 변경 감지
      $('#photoReviewCheckbox').change(filterReviewsByCheckedMenus);

      // 정렬 링크 클릭 이벤트
      $('.sort-link').click(function(event) {
          event.preventDefault();
          $('.sort-link').removeClass('active');
          $(this).addClass('active');
          filterReviewsByCheckedMenus();
	      });
      
		// =================================================================	
		// 현재 선택된 메뉴 이름을 반환하는 함수
		function getMenuNames() {
		    return $('.menu_checkbox:checked').map(function() {
		        return $(this).val();
		    }).get().join(', ');
		}
		// =================================================================	
		// URL에서 값 가져옴 (지우면 안됨)	
		function getParameterByName(name) {
		    var url = window.location.href;
		    name = name.replace(/[\[\]]/g, "\\$&");
		    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		        results = regex.exec(url);
		    if (!results) return null;
		    if (!results[2]) return '';
	
		    return decodeURIComponent(results[2].replace(/\+/g, " "));
	
		}
// 		    console.log(comId); 
		// =================================================================	
		// 작성 날짜 포맷 변환	
		function formatDate(dateString) {
		    var options = { year: '2-digit', month: '2-digit', day: '2-digit', weekday: 'short' };
		    return new Intl.DateTimeFormat('ko-KR', options).format(new Date(dateString));
		}
		// =================================================================	
		var photoOnly = false; // 전역 변수
		// =================================================================			
		// 체크박스 상태에 따라 리뷰를 필터링하고 서버에 요청하는 함수
		function filterReviewsByCheckedMenus() {
		    var checkedMenuNames = $('.menu_checkbox:checked').map(function() {
		        return this.value;
		    }).get().join(', '); // 체크된 메뉴 이름 수집
	
		    var sortType = $('.sort-link.active').data('sort-type') || 'newest';
		    var photoOnly = $('#photoReviewCheckbox').is(':checked');
			
		    console.log("체크메뉴>>>>>>>>>>>>>> ", checkedMenuNames);
		    console.log("Sort Type:>>>>>>>>>>> ", sortType, "Photo Only: ", photoOnly);
		    
		    // 메뉴 이름만 사용하여 리뷰 필터링
		    if (checkedMenuNames && !photoOnly && sortType === 'newest') {
		        sortReviews(null, false, checkedMenuNames);
		    } else {
		        // 기존 조건에 따라 리뷰 필터링
		        sortReviews(sortType, photoOnly, checkedMenuNames);
		    }
		}
		
		
		$(function() {
		
		sortReviews();
		
		$(window).scroll(function() {
			// 1. window 객체와 document 객체를 활용하여 스크롤 관련 값 가져오기
			let scrollTop = $(window).scrollTop(); // 스크롤바 현재 위치
			let windowHeight = $(window).height(); // 브라우저 창 높이
			let documentHeight = $(document).height(); // 문서 높이
			// 2. 스크롤바 위치값 + 창 높이 + x 값이 문서 전체 높이 이상일 경우
			//    다음 페이지 게시물 목록 로딩하여 화면에 추가
			if(scrollTop + windowHeight + 1 >= documentHeight) {
				pageNum++; // 다음 목록 조회를 위해 현재 페이지번호 1증가
				if(maxPage != "" && pageNum <= maxPage) {
					load_list(); // 다음 페이지 로딩을 위해 load_list() 함수 호출
				}
			}
		});
	});
				
		// =================================================================	
		function sortReviews(sortType, photoOnly,menuNames) { // photoOnly 매개변수 추가
		    console.log("메뉴 네임 넘어오는지 확인: >>>>>>>>>>>>>>" +  sortType +  photoOnly + menuNames); // 로그 출력
		    var comId = getParameterByName('com_id'); // com_id 값을 가져옴
	
		    var requestData = {
		            comId: comId,
		            sortType: sortType,
		            photoOnly: photoOnly,
		            menuName: menuNames
		        };
	    
	    // 체크된 메뉴 이름이 있을 경우에만 requestData 객체에 추가
		  if (checkedMenuNames) {
	        requestData.menuName = checkedMenuNames;
	    }
		    
		    // 체크된 메뉴 이름들을 수집
		    var checkedMenuNames = $('.menu_checkbox:checked').map(function() {
		        return this.value;
		        
		    }).get().join(', ');
		    
		    console.log(">>>Sorting reviews by: ", sortType, ", Photo only: ", photoOnly, ", Menu Names:<<<< ", checkedMenuNames);
		    
		    $.ajax({
			    url: contextPath + '/review/redetail/sortedReviews',
				type: 'GET',
		        data: requestData,
		        dataType: 'json', 
		        success: function(response) {

		        var reviews = response;
	            var reviewsContainer = $('#reviewsContainer');

	            reviewsContainer.empty(); // 기존 리뷰 목록을 비움

		reviews.forEach(function(review) {
			
			// photoOnly가 true일 때, 이미지가 없는 리뷰는 건너뜀
	        if (photoOnly && !review.review_img_1) {
	            return;
	        }
	
	    var commentCount = review.commentCount; // commentCount 추출
	    var formattedDate = formatDate(review.review_update);
	
	    var deleteFormHtml = '';
	    var modifyButtonHtml = '';
	    var reportButtonHtml = '';

	    // sId가 review.user_id와 같거나, sId가 'admin'일 경우에만 삭제 및 수정 버튼 생성
	    if (sId === review.user_id || sId === 'admin') {
	        deleteFormHtml = 
	            '<form action="' + contextPath + '/zzimkong/review/delete" method="POST">' +
	                '<input type="hidden" name="review_num" value="' + review.review_num + '">' +
	                '<input type="submit" class="review_delete" value="삭제" onclick="return confirm(\'리뷰를 삭제하시겠습니까?\');">' +
	            '</form>';

	        modifyButtonHtml = 
	        	'<a href="modify?review_num=' + review.review_num + '&com_id=' + review.com_id + '">' +
	            '<button class="review_modify">수정</button>' +
	        	'</a>';
	        	
	    } else {
	        // sId가 review.user_id나 'admin'이 아닐 때만 신고 버튼 생성
	        reportButtonHtml = 
	            '<a href="' + contextPath + '/review/report?review_num=' + review.review_num + '&com_id=' + review.com_id + '" class="review_report_btn" role="button">리뷰 신고하기</a>';
	    }

	    var imagePopupHtml = '';
	    if (review.review_img_1) {
	        imagePopupHtml = 
	            '<div class="review_photos">' +
	            	// 이미지경로 수정 - 2 (240110)
	                '<img src="${pageContext.request.contextPath}/resources/upload/' + review.review_img_1 + '" alt="Review Image" style="width: 200px; height: 200px;">' +
	                '<div id="image-popup" class="image-popup" style="display: none;">' +
	                    '<span class="close-popup">&times;</span>' +
	                    '<img id="popup-img" class="popup-content">' +
	                '</div>' +
	            '</div>';
	    }
	
	    var reviewHtml = 
	        '<ul class="review_list">' +
	            '<li class="review_list1">' +
	                '<div class="reviewer">' +
	                    '<div class="reviewer_photo">' +
	                        '<a href="#" target="_blank" class="profile_link">' +
	                            '<div class="profile_image">' +
                                      '<img src="' + contextPath + '/resources/upload/' + review.user_img + '" alt="프로필" width="38" height="38">' +
								'</div>' +
	                        '</a>' +
	                    '</div>' +
	                    '<div class="reviewer_info">' +
	                        '<div class="reviewer_name">' + review.user_nick + '</div>' +
	                        '<div class="score1">' +
	                            '<img src="' + contextPath + '/resources/img/review_star.png" width="15" height="15">' +
	                            (review.review_score / 2).toFixed(1) +
	                        '</div>' +
	                    '</div>' +
	                '</div>' +
	                imagePopupHtml +
	                '<p class="review_content">' + review.review_content + '</p>' +
	                '<div class="review-actions">' +
	                    '<div class="review-action1">' +
							'<div class="comment-section">' +
							    '<i class="far fa-comment" data-review-num="' + review.review_num + '" style="cursor: pointer;" onclick="showCommentForm(this);"></i>' + '<span class="comment_count_number">' + commentCount + '</span>' +'</div>'+
	                    '</div>' +
	                    '<div class="review-action2">' +
	                        '<div class="review-action-buttons">' +
	                            deleteFormHtml +
	                            modifyButtonHtml +
	                            reportButtonHtml +
	                        '</div>' +
	                        '<span class="comment-icon" onclick="showCommentForm()"></span><br><br>'+
	    				    '<div class="review_date">' + formattedDate + ' 작성</div>' + 
	                 		'<div class="separator"></div>' + 
	                    '</div>' +
	                '</div>' +
	            '</li>' +
	        '</ul>';
	
	    $('#reviewsContainer').append(reviewHtml);
	});
		        },
		        error: function(error) {
		            console.error("Error: ", error);
		        }
		    });
   		}
	
	// =================================================================	
	// 체크박스 선택 시 해당 리뷰출력 
	$(document).ready(function() {

	// 카테고리 체크박스 변경 감지
	    $('.category_button').change(function() {
	    	var selectedCategories = getSelectedCategories();
	    	
	        if (selectedCategories.length > 0) {
	            filterReviewsByCategories(selectedCategories);
	            
	        } else {
	            // 모든 체크박스가 해제되면 원래의 리뷰 리스트를 불러옴
	            filterReviewsByCheckedMenus();
	        }
	    });
	
	    // 선택된 카테고리를 배열로 반환하는 함수
	    function getSelectedCategories() {
	        return $('.category_button:checked').map(function() {
	            return $(this).data('category');
	        }).get();
	    }

	   // 카테고리 버튼 클릭 이벤트 핸들러
	    $('.category_button').click(function() {
	        var category = $(this).data('category');
	        var comId = Number(getParameterByName('com_id'));
	        loadReviewsByCategory(category,comId);
	    });
	
		// 카테고리별 리뷰 로드 함수
		function loadReviewsByCategory(category,comId) {
	
		    $.ajax({
	            url: contextPath + '/review/redetail/filterByCategory',
		        type: 'GET',
		        data: { category: category, 
		        	comId: comId},
		        dataType: 'json',
		        success: function(reviews) {
		            displayReviews(reviews);
		        },
		        error: function(xhr, status, error) {
		            console.error("Error occurred: " + error);
		        }
		    });
		}
		
		// 리뷰 표시 함수
		function displayReviews(reviews) {
		    var reviewsContainer = $('#reviewsContainer');
		    reviewsContainer.empty();
	
		    reviews.forEach(function(review) {
		    	
	        // photoOnly가 true일 때, 이미지가 없는 리뷰는 건너뜀
	        if (photoOnly && !review.review_img_1) {
	            return;
	        }
	
	        var commentCount = review.commentCount; // commentCount 추출
		    var formattedDate = formatDate(review.review_update); // 서버로부터 받은 review_update 값을 형식화
		    var deleteFormHtml = '';
		    var modifyButtonHtml = '';
		    var reportButtonHtml = '';	
		    var contextPath = "${pageContext.request.contextPath}";
		    var imagePath = review.user_img ? contextPath + '/resources/upload/' + review.user_img : contextPath + '/resources/img/profile.png';
	
 
		    // sId가 review.user_id와 같거나, sId가 'admin'일 경우에만 삭제 및 수정 버튼 생성
		    if (sId === review.user_id || sId === 'admin') { 
		        deleteFormHtml =   
		            '<form action="' + contextPath + '/zzimkong/review/delete" method="POST">' +
		                '<input type="hidden" name="review_num" value="' + review.review_num + '">' +
		                '<input type="submit" class="review_delete" value="삭제" onclick="return confirm(\'리뷰를 삭제하시겠습니까?\');">' +
		            '</form>';
		 
		        modifyButtonHtml = 
		            '<a href="modify?review_num=' + review.review_num + '">' +
		                '<button class="review_modify">수정</button>' +
		            '</a>';
		             
		    }	else {
		        // sId가 review.user_id나 'admin'이 아닐 때만 신고 버튼 생성
		        reportButtonHtml = 
		            '<a href="' + contextPath + '/review/report?review_num=' + review.review_num + '&com_id=' + review.com_id + '" class="review_report_btn" role="button">리뷰 신고하기</a>';
		    }	

		
		    var imagePopupHtml = '';
		    if (review.review_img_1) {
		        imagePopupHtml = 
		            '<div class="review_photos">' +
		            		// 이미지경로 수정(240110) - 1
		            	'<img src="${pageContext.request.contextPath}/resources/upload/' + review.review_img_1 + '" alt="Review Image" style="width: 200px; height: 200px;">' +
		                '<div id="image-popup" class="image-popup" style="display: none;">' +
		                    '<span class="close-popup">&times;</span>' +
		                    '<img id="popup-img" class="popup-content">' +
		                '</div>' +
		            '</div>';
		    }
		
		    var reviewHtml = 
		        '<ul class="review_list">' +
		            '<li class="review_list1">' +
		                '<div class="reviewer">' +
		                    '<div class="reviewer_photo">' +
		                        '<a href="#" target="_blank" class="profile_link">' +
		                            '<div class="profile_image">' +
		                			    '<img src="' + imagePath + '" alt="프로필" width="38" height="38">' +
		                            '</div>' +
		                        '</a>' +
		                    '</div>' +
		                    '<div class="reviewer_info">' +
			                        '<div class="reviewer_name">' + review.user_nick + '</div>' +
		                        '<div class="score1">' +
		                            '<img src="' + contextPath + '/resources/img/review_star.png" width="15" height="15">' +
		                            (review.review_score / 2).toFixed(1) +
		                        '</div>' +
		                    '</div>' +
		                '</div>' +
		                imagePopupHtml +
		                '<p class="review_content">' + review.review_content + '</p>' +
		                '<div class="review-actions">' +
		                    '<div class="review-action1">' +
							'<div class="comment-section">' +
		 				   '<i class="far fa-comment" data-review-num="' + review.review_num + '" style="cursor: pointer;" onclick="showCommentForm(this);"></i>' + '<span class="comment_count_number">' + commentCount + '</span>' +'</div>'+
		                    '</div>' +
		                    '<div class="review-action2">' +
		                        '<div class="review-action-buttons">' +
		                            deleteFormHtml +
		                            modifyButtonHtml +
		                            reportButtonHtml +
		                        '</div>' +
		                        '<span class="comment-icon" onclick="showCommentForm()"></span><br><br>'
		    				    '<div class="review_date">' + formattedDate + ' 작성</div>' + 
		               		  '<div class="separator"></div>' + 
		                    '</div>' +
		                '</div>' +
		            '</li>' +
		        '</ul>';
		
		    $('#reviewsContainer').append(reviewHtml);
			});
		
		}
	// ==================================================================	
	// 하트 아이콘 클릭 이벤트
	$('#reviewsContainer').on('click', '.fa-heart', function() {
	    $(this).toggleClass('far').toggleClass('fas').toggleClass('filled');
	});

	// =================================================================	
	    // 페이지 로드 시 최신순으로 리뷰를 불러옴
    filterReviewsByCheckedMenus();
    
    // 체크박스와 정렬 링크의 이벤트 핸들러 설정
    $('.menu_checkbox, #photoReviewCheckbox').change(filterReviewsByCheckedMenus);

    $('.sort-link').click(function(event) {
        event.preventDefault();
        $('.sort-link').removeClass('active');
        $(this).addClass('active');
        filterReviewsByCheckedMenus();
    });

	});
	// =================================================================	
    $('#reviewsContainer').on('click', '.fa-comment, .fa-heart', function() {
        // 댓글 아이콘 클릭 이벤트
        if ($(this).hasClass('fa-comment')) {
            var contextRoot = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
            var url = contextRoot + "/review/comment";
            var windowName = "commentPopup";
            var windowSize = "width=515,height=632";
            window.open(url, windowName, windowSize);
        }

        // 하트 아이콘 클릭 이벤트
        if ($(this).hasClass('fa-heart')) {
            $(this).toggleClass('far').toggleClass('fas').toggleClass('filled');
        }
    });
    
    // 최신순,별점순 색상유지!
        var links = document.querySelectorAll('.sort-link');
        links.forEach(function(link) {
            link.addEventListener('click', function() {
                links.forEach(l => l.classList.remove('active')); // 다른 모든 링크에서 'active' 클래스 제거
                this.classList.add('active'); // 클릭된 링크에 'active' 클래스 추가
            });
        });
</script>
</head>

<body>
	
	<%-- pageNum 파라미터 가져와서 저장(없을 경우 기본값 1 로 저장) --%>
	<c:set var="pageNum" value="1" />
	<c:if test="${not empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }" />
	</c:if>
	
<jsp:include page="../inc/top2_search_bar.jsp"></jsp:include>
<div class="restaurant_name_with_likes">
    <div class="restaurant_name">
   		<div id="resName"><a href="${pageContext.request.contextPath}/product/detail?com_id=${comId}">${comName}</a>
   		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-heart" aria-hidden="true"></i>
         <span class="like_count_top">${likeCount}</span><span class="like_text">&nbsp;&nbsp;이런 곳 좋아요</span>
        </div>
    <div class="separator"></div>
    </div>
    <div class="likes">
    </div>
</div>
	<br>
	<br>
	<br>
    <div class="average">
        <h5>
			<span class="star_avg">${reviewCount}개 리뷰 별점 평균</span>
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
    <c:choose>
        <c:when test="${visitCount > 0}">
            <form action="${pageContext.request.contextPath}/my/reservation">
                <button type="submit">
                    <span class="write_button_text"><i class="fas fa-pencil-alt"></i>&nbsp;&nbsp;리뷰쓰기</span>
                </button>
            </form>
        </c:when>
    </c:choose>
</div>

	</div>
	<!-- ======================================================================================== -->
<div class="chart-container">
    <canvas id="reviewChart"></canvas>
</div>
	<!-- ======================================================================================== -->
	<br><br><br><br><br>
		<!-- 사진/영상리뷰 제목 -->
		<div class="review_photo_subject">사진 리뷰</div>
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
		<div class="review_subject">리뷰&nbsp;&nbsp;<span class="review_subject_count">${reviewCount}</span>
		</div>
		<label class="checkbox-container">
		    <input type="checkbox" id="photoReviewCheckbox">
		    <span class="checkmark"></span>사진 리뷰만 보기 
		</label>
	</div>
	</div>
	
	<!-- 240109 제거 -->
<!-- 	<div class="menu_select"> -->
<!-- 		<span class="menu_select_subject">&nbsp;&nbsp;&nbsp;&nbsp;대표 메뉴&nbsp;</span> -->
<!-- 	</div> -->
	<br>

	<div class="category_buttons">
	    <span class="menu_select_subject">&nbsp;&nbsp;&nbsp;&nbsp;특징&nbsp;</span>
	
	    <label class="category_label" data-category="taste">
	        <input type="checkbox" class="category_button" data-category="taste">
	        <span class="button_text">맛 ${categoryCount.review_category_count_taste}</span>
	    </label>
	
	    <label class="category_label" data-category="satisfaction">
	        <input type="checkbox" class="category_button" data-category="satisfaction">
	        <span class="button_text">만족도 ${categoryCount.review_category_count_satisfaction}</span>
	    </label>
	
	    <label class="category_label" data-category="service">
	        <input type="checkbox" class="category_button" data-category="service">
	        <span class="button_text">서비스 ${categoryCount.review_category_count_service}</span>
	    </label>
	
	    <label class="category_label" data-category="waiting">
	        <input type="checkbox" class="category_button" data-category="waiting">
	        <span class="button_text">대기 시간 ${categoryCount.review_category_count_waiting}</span>
	    </label>
	
	    <label class="category_label" data-category="quantity">
	        <input type="checkbox" class="category_button" data-category="quantity">
	        <span class="button_text">음식량 ${categoryCount.review_category_count_quantity}</span>
	    </label>
	</div>
	<br>
	<br>
	<!-- ========================================================================================= -->
		<div class="reviewer_order">
				<a href="#" class="sort-link" id="review_newest" data-sort-type="newest">최신순 </a>|
				<a href="#" class="sort-link" id="review_highest" data-sort-type="highest">별점 높은 순 </a>|
				<a href="#" class="sort-link" id="review_lowest" data-sort-type="lowest">별점 낮은 순 </a>
				<!-- 				<a href="#" class="sort-link" id="review_likes_order" data-sort-type="likes"> | 좋아요 순</a> -->
				
		</div>
	<div class="separator"></div>
	<!-- ========================================================================================= --> 
	<div class="reviews_container" id="reviewsContainer">
	</div>
	<!-- "더 보기" 버튼 -->
<!-- <div class="load-more-container" style="text-align: center; margin-top: 20px;"> -->
<!--     <button id="loadMoreBtn" class="load-more-btn">더 보기</button> -->
<!-- </div> -->
	
	<!-- ========================================================================================= -->
	<br><br><br><br><br><br><br><br><br><br>
	<footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>