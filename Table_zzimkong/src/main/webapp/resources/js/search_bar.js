$(document).ready(function() {
	//서치바 파라미터 정리
	var formData = {}; // 폼 데이터를 저장할 객체 생성
	var isPriceChange = false;
	// 모든 모달창을 숨깁니다.

	function closeAllModals() {
		$('.modal').hide();
	}
	closeAllModals();
	// 필터 모달 오프너 클릭 이벤트
	$('.filter_wrapper').off('click').click(function() {
		closeAllModals(); // 다른 모달 닫기
		$('#filterModal').show(); // 필터 모달 열기
	});

	// 테이블 모달 오프너 클릭 이벤트
	$('.search_info').first().click(function() {
		closeAllModals(); // 다른 모달 닫기
		$('#table_modal').show(); // 테이블 모달 열기
	});

	function cleanFilterModal() {
		$('#filterModal').hide();
		$('#filterModal input[type="radio"]').prop('checked', false);
		$('#filterModal .selected').removeClass('selected');
		isPriceChange = false;
	}

	// 필터 모달창 닫기 버튼 클릭 이벤트
	$('#filterModal .close').click(cleanFilterModal);
	// 닫기 버튼을 클릭했을 때, 해당 버튼이 속한 모달창만을 닫습니다.
	$(document).off('click', '.close').on('click', '.close', function() {
		$(this).closest('.modal').hide();
	});
	// 모달창 바깥 부분을 클릭했을 때, 해당 부분이 속한 모달창만을 닫습니다.
	$(window).off('click').on('click', function(event){
		if (!$(event.target).closest('.modal').length && !$(event.target).hasClass('modal-opener')) {
			closeAllModals();
			if ($(event.target).closest('#filterModal')) {
				cleanFilterModal();
			}
		}
	});

	// Get today's date
	var today = new Date();
	var day = today.getDate();
	var month = today.getMonth() + 1; // January is 0!
	var year = today.getFullYear();

	// Adjust day and month for single digit values
	if (day < 10) {
		day = '0' + day;
	}
	if (month < 10) {
		month = '0' + month;
	}

	// Set min date
	today = year + '-' + month + '-' + day;
	$("#reservation-date").attr('min', today);

	// Radio button slider
	var start = 0;
	var end = 6;

	function showButtons() {
		$('.time-group input[type="radio"], .time-group label').hide();
		$('.time-group input[type="radio"]').slice(start, end).show();
		$('.time-group input[type="radio"]').slice(start, end).next('label').show();
	}

	$('.arrow.left').click(function() {
		if (start > 0) {
			start -= 1;
			end -= 1;
			showButtons();
		}
	});

	$('.arrow.right').click(function() {
		if (end < $('.time-group input[type="radio"]').length) {
			start += 1;
			end += 1;
			showButtons();
		}
	});

	showButtons();

	$("#confirm").click(function() {
		// Get input values
		var date = $("#reservation-date").val();
		var persons = $("input[name='persons']:checked").val();
		var time = $("input[name='time']:checked").val();

		// Format the date
		var today = new Date().toISOString().split('T')[0];
		var tomorrow = new Date(new Date().getTime() + 24 * 60 * 60 * 1000).toISOString().split('T')[0];
		var displayDate;

		if (date == today) {
			displayDate = "오늘";
		} else if (date == tomorrow) {
			displayDate = "내일";
		} else {
			displayDate = date.substring(5).replace('-', '월') + '일'; // 년도를 제외한 날짜만 출력
		}

		// Update the info text
		$(".info_text").text("테이블 인원수: " + persons + "명, " + displayDate + " " + time);

	});


	//필터부분

	$('.sub-list, .detail-list').css('display', 'none');

	// '.filter-item' 클릭 시 이벤트 핸들러
	$('.filter-item').click(function() {
		var subList = $(this).find('.sub-list').clone(true); // 해당하는 서브 리스트를 복제합니다.
		$('.sub-list-wrap').empty().append(subList); // 서브 리스트 래퍼에 복제된 서브 리스트를 추가합니다.
		console.log("필터리스트 클릭됨")

		// 디테일 리스트를 비웁니다.
		$('.detail-list-wrap').empty();
		subList.css('display', 'flex'); // 서브 리스트를 표시합니다.
	});

	$(document).on('click', '.sub-list > li', function(event) {
		event.stopPropagation();
		var detailList = $(this).find('.detail-list');
		var clonedDetailList = detailList.clone(true);
		$('.detail-list-wrap').empty().append(clonedDetailList);
		clonedDetailList.css('display', 'flex');
	});

	$('#price').on('change', function() {
		var newValue = $(this).val();
		$('#priceValue').text(newValue); // Update the displayed price value
		// Trigger a click event on #priceValue
		$('#priceValue').trigger('click');
		isPriceChange = true;
	});

	$(document).on('click', '.filter-list li, .sub-list li, .detail-list li', function(event) {
		var radio = $(this).find('input[type="radio"]');
		// 현재 클릭된 항목에 따라 다른 레벨의 checked 클래스를 제거
		if ($(this).parents('.filter-list').length) {
			// filter-list 클릭 시
			$('.filter-list li').removeClass('selected');
			$('.sub-list li').removeClass('selected');
			$('.detail-list li').removeClass('selected');
		} else if ($(this).parents('.sub-list').length) {
			// sub-list 클릭 시
			event.stopPropagation(); // 이벤트 버블링 중단
			$(this).closest('.sub-list').find('li').removeClass('selected');
			$('.detail-list li').removeClass('selected');
		} else if ($(this).parents('.detail-list').length) {
			// detail-list 클릭 시
			$(this).closest('.detail-list').find('li').removeClass('selected');

		}
		// 선택된 라디오 버튼에 대한 클래스 적용
		radio.prop('checked', true);
		$(this).addClass('selected');
	});


	// 필터 모달창 내의 라디오 버튼 클릭 이벤트 처리
	$(document).on('click', '.filterModal input[type="radio"]', function() {
		var name = $(this).attr('name');
		var value = $(this).val();

		formData[name] = value; // 동일한 name 속성의 값을 교체하거나 새로 추가
		console.log(formData[name]); //동작안함
	});

	function sendFormData() {
		var formData = {
			context: $('.search_input_text').val(),
			persons: $("input[name='persons']:checked").val(),
			time: $("input[name='time']:checked").val(),
			date: $("#reservation-date").val(),
			location: $("input[name='location']:checked").val(),
			category: $("input[name='category']:checked").val(),
			price: $('#price').val(),
			mood: $("input[name='mood']:checked").val(),
			facilities: $("input[name='facilities']:checked").val(),
			table_type: $("input[name='table_type']:checked").val(),
			hygiene: $("input[name='hygiene']:checked").val()
		};

		// AJAX 요청
		$.ajax({
			url: 'product/searchResult',
			type: 'GET',
			dataType: 'json',
			data: formData,
			success: function(response) {
				// 성공적으로 데이터를 받으면 실행할 코드
				console.log("Response: ", response);
			},
			error: function(error) {
				// 에러가 발생했을 때 실행할 코드
				console.log("Error: ", error);
			}
		});
	}

//	 검색어 입력창에서 엔터 누를 때
	$(".search_input_text").off('keypress').on('keypress', function(event) {
		if (event.keyCode === 13) {
			sendFormData();
		}
	});

	// 검색 아이콘 클릭 시
	$(".search_icon").click(sendFormData);


});

