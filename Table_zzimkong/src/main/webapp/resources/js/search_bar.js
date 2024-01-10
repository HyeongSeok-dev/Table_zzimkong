$(document).ready(function() {
	//서치바 파라미터 정리
	var formData = {
		persons: $("input[name='persons']").val(),
		time: $("select[name='time']").val(),
		date: $("#reservation-date").val(),
	}; // 폼 데이터를 저장할 객체 생성
	var selectedFilterItemId = null;
	var contextRoot = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
    var today = new Date().toISOString().split('T')[0]; 
    //오늘날짜 이전 제한
    $('#reservation-date').attr('min', today);

	// 모든 모달창을 숨깁니다.
	function closeAllModals() {
		$('.modal').hide();
	}
	closeAllModals();

	// 필터 모달 오프너 클릭 이벤트
	$('.filter_wrapper').off('click').click(function() {
		$('#table_modal').hide();
		$('#filterModal').show(); // 필터 모달 열기
		console.log("필터모달 클릭됨")
	});

	// 테이블 모달 오프너 클릭 이벤트
	$('.search_info').first().click(function() {
		$('#filterModal').hide();
		$('#table_modal').show(); // 테이블 모달 열기
		console.log("테이블모달 클릭됨")
	});

	function cleanFilterModal() {
		$('#filterModal').hide();
		$('#filterModal input[type="radio"]').prop('checked', false);
		$('#filterModal .selected').removeClass('selected');
	}

	// 필터 모달창 닫기 버튼 클릭 이벤트
	$('#filterModal .close').click(cleanFilterModal);
	// 닫기 버튼을 클릭했을 때, 해당 버튼이 속한 모달창만을 닫습니다.
	$(document).off('click', '.close').on('click', '.close', function() {
		$(this).closest('.modal').hide();
	});

	// 모달창 바깥 부분을 클릭했을 때, 해당 부분이 속한 모달창만을 닫습니다.
	$(window).off('click').on('click', function(event) {
		if (!$(event.target).closest('.modal').length && !$(event.target).hasClass('modal-opener')) {
			closeAllModals();
			if ($(event.target).closest('#filterModal')) {
				cleanFilterModal();
			}
		}
	});

	$("#confirm").click(function(event) {
		event.stopPropagation();
		formData['date'] = $("#reservation-date").val();
		formData['persons'] = $("input[name='persons']").val();
		formData['time'] = $("select[name='time']").val();
		console.log("테이블 모달 데이터 적용됨: ", formData);
		console.log($("#reservation-date").val());
		console.log($("select[name='time']").val());
		sendFormDataToCurrentPage();
		$(this).closest('.modal').css('display', 'none');
	});


	//필터부분

	$('.sub-list, .detail-list').css('display', 'none');

	// '.filter-item' 클릭 시 이벤트 핸들러
	$('.filter-item').off('click').click(function() {
		var currentFilterItemId = $(this).attr('id'); // 현재 클릭된 filter-item의 아이디

		// 선택된 filter-item의 아이디가 현재 클릭된 아이디와 다르다면 서브 리스트를 업데이트
		if (selectedFilterItemId !== currentFilterItemId) {
			var subList = $(this).find('.sub-list').clone(true); // 해당하는 서브 리스트를 복제합니다.
			$('.sub-list-wrap').empty().append(subList); // 서브 리스트 래퍼에 복제된 서브 리스트를 추가합니다.
			subList.css('display', 'flex'); // 서브 리스트를 표시합니다.

			selectedFilterItemId = currentFilterItemId; // 선택된 filter-item의 아이디를 업데이트
		}

		// 디테일 리스트를 비웁니다.
		$('.detail-list-wrap').empty();

		console.log("필터아이템 클릭됨");
	});

//디테일 리스트 열기
	$(document).on('click', '.sub-list > li', function(event) {
		event.stopPropagation();
		var detailList = $(this).find('.detail-list');
		var clonedDetailList = detailList.clone(true);
		$('.detail-list-wrap').empty().append(clonedDetailList);
		clonedDetailList.css('display', 'flex');
	});


	// 클릭된 li의 상태 변경을 처리하는 함수
	function changeSelectedState(clickedLi) {
		// 동일한 레벨의 다른 li들에서 'selected' 클래스 제거
		clickedLi.siblings().removeClass('selected');
		console.log('색 제거됨');
		// 클릭된 li에 'selected' 클래스 추가
		clickedLi.addClass('selected');
		console.log('색 추가됨');
	}

	// 클릭된 li 내의 라디오 버튼 체크 처리 함수
	function checkRadioButton(clickedLi) {
		var radio = clickedLi.find('input[type="radio"]');
		radio.prop('checked', true);
		console.log('라디오버튼 체크됨');
	}

	// li 클릭 이벤트 핸들러
	$(document).on('click', '.filter-list li, .sub-list li, .detail-list li', function(event) {
		var $li = $(this);
		if ($(event.target).is('label') || $(event.target).parents('label').length) {
		changeSelectedState($li); // 상태 변경
			return;
		}
		changeSelectedState($li); // 상태 변경
		checkRadioButton($li);    // 라디오 버튼 체크
	});
	
	 $('#minPrice, #maxPrice').change(function() {
        // Get the current values
        var minPrice = $('#minPrice').val();
        var maxPrice = $('#maxPrice').val();
		console.log(minPrice, maxPrice)
        // Check if either is 'all'
        if(minPrice == 'all' || maxPrice == 'all') return;

        // Parse to integers
        minPrice = parseInt(minPrice);
        maxPrice = parseInt(maxPrice);

		console.log(minPrice, maxPrice)
        // Check the validity
        if(minPrice > maxPrice) {
            alert("최소 가격은 최대 가격보다 클 수 없습니다.");
             $('#minPrice').val('all'); 
            return false;
        }
        if(maxPrice < minPrice) {
            alert("최대 가격은 최소 가격보다 작을 수 없습니다.");
             $('#maxPrice').val('all'); 
            return false;
        }
    });
    
        // 최소 가격 셀렉트 박스 변경 이벤트
    $("select[name='minPrice']").change(function() {
        formData['minPrice'] = $(this).val();
    });

    // 최대 가격 셀렉트 박스 변경 이벤트
    $("select[name='maxPrice']").change(function() {
        formData['maxPrice'] = $(this).val();
    });

	// '필터 모달' 적용 버튼 클릭 이벤트
	$('#filterModal #applyBtn').click(function(event) {
		// '필터 모달'의 데이터 수집
		event.stopPropagation();
		formData['location'] = $("input[name='location']:checked").val();
		formData['category'] = $("input[name='category']:checked").val();
		formData['mood'] = $("input[name='mood']:checked").val();
		formData['facilities'] = $("input[name='facilities']:checked").val();
		formData['tableType'] = $("input[name='table_type']:checked").val();
		formData['hygiene'] = $("input[name='hygiene']:checked").val();
		console.log("필터 모달 데이터 적용됨: ", formData);
		sendFormDataToCurrentPage();
		if($("input[name='location']:checked").val() != null){
			fetchLocationData();
		}
		$('#filterModal').hide();
	});

	function sendFormDataToCurrentPage() {
		// AJAX 요청
		formData['category'] = $("input[name='category']:checked").val();
		formData['requestURL'] = window.location.pathname.replace(contextRoot, '')
		formData['context'] = $('.search_input_text').val();
		formData['sort'] = $("select[name='sort']").val();
		
		$.ajax({
			url: contextRoot + '/product/searchResult',
			type: 'POST',
			dataType: 'json',
			contentType: 'application/json',
			data: JSON.stringify(formData),
			success: function(response) {
				// 성공적으로 데이터를 받으면 실행할 코드
				console.log("Response: ", response);
          		$(".info_text").text("테이블 인원수: " + response.persons + "명, " + response.displayDate + " " + response.displayTime);
          		if(response.location != null){
          			$(".seleted_location").text(response.location.replace('_',' '));
				}
				if(response.requestURL== "/product/list"){
					console.log("페이지 이동");
					window.location.href = contextRoot + response.requestURL;
				}
			},
			error: function(error) {
				// 에러가 발생했을 때 실행할 코드
				console.log("Error: ", error);

			}
		});
	}
	
	//지역선택에 맞는 정렬
function fetchLocationData() {
    var location_data = $("input[name='location']:checked").val();

    $.ajax({
        url: "fetchLocationData",
        type: 'GET',
        dataType: 'json',
        data: {
            "location": location_data
        },
        success: function(data) {
            var owl1 = $('#owl-example1').empty();
            var owl2 = $('#owl-example2').empty();
            var owl3 = $('#owl-example3').empty();
            var baseWidth = 215; // 기본 너비 설정

            data.companyList.forEach(function(company) {
                // 각 섹션에 해당하는 항목 추가
                var itemHtml = '<div class="owl-item" style="width: ' + baseWidth + 'px;">' +
                               '<div class="owl_example1_items_images">' +
                               '<a href="product/detail?com_id=' + company.com_id + '">' +
                               '<img alt="" src="' + contextRoot + '/resources/upload/' + company.com_img + '"> <br>' +
                               company.com_name +
                               '</a>' +
                               '</div></div>';

                owl1.append(itemHtml);
                owl2.append(itemHtml);
                owl3.append(itemHtml);
            });

            // 제어 요소 추가
            var controlsHtml = '<div class="owl-controls clickable"><div class="owl-pagination"><div class="owl-page active"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div></div><div class="owl-buttons"><div class="owl-prev"></div><div class="owl-next"><i class="fa fa-angle-right"></i></div></div></div>';
            owl1.append(controlsHtml);
            owl2.append(controlsHtml);
            owl3.append(controlsHtml);
        },
        error: function(error) {
            console.log("Error: ", error);
        }
    });
}



	function sendFormDataToNextPage() {
		formData['context'] = $('.search_input_text').val();
		formData['sort'] = $("select[name='sort']").val();
		console.log("검색 데이터: ", formData);
		$.ajax({
			url: contextRoot + '/product/searchResult',
			type: 'POST',
			contentType: 'application/json',
			dataType: 'json',
			data: JSON.stringify(formData),
			success: function(response) {
				// 성공적으로 데이터를 받으면 실행할 코드
				console.log("Response: ", response);
				// product/list 페이지로 리디렉션
				window.location.href = contextRoot + response.redirectURL;
			},
			error: function(error) {
				// 에러가 발생했을 때 실행할 코드
				console.log("Error: ", error);
			}
		});
	}
	//	 검색어 입력창에서 엔터 누를 때
	$(".search_input_text").off('keydown').on('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			sendFormDataToNextPage();
		}
	});

	$(".search_icon").click(function() {
		sendFormDataToNextPage();
	});

	$(".sort").change(function() {
		if($(".sort").val() != 'distance'){
			sendFormDataToNextPage();
		}
	});
	
	//메인(테마카테고리)=================================================================
	$(".foodThemeCategory").click(function() {
		formData['context'] = $(this).val();
		formData['sort'] = $("select[name='sort']").val();
		
		$.ajax({
			url: contextRoot + '/product/searchResult',
			type: 'POST',
			contentType: 'application/json',
			dataType: 'json',
			data: JSON.stringify(formData),
			success: function(response) {
				// 성공적으로 데이터를 받으면 실행할 코드
				console.log("Response: ", response);
				// product/list 페이지로 리디렉션
				window.location.href = contextRoot + response.redirectURL;
			},
			error: function(error) {
				// 에러가 발생했을 때 실행할 코드
				console.log("Error: ", error);
			}
		});
	});
	//메인(카테고리)=================================================================
	 $("button[name='category']").click(function() {
        formData['category'] = $(this).val();
        sendFormDataToNextPage();
    });

	
});

