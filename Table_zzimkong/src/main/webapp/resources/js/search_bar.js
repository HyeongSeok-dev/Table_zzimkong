$(document).ready(function() {
	//서치바 파라미터 정리
	var formData = {
		persons: $("input[name='persons']:checked").val(),
		time: $("input[name='time']:checked").val(),
		date: $("#reservation-date").val(),
	}; // 폼 데이터를 저장할 객체 생성
	var isPriceChange = false;
	var currentSliderValue = $('#price').val();
	var selectedFilterItemId = null;
	var contextRoot = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

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
		isPriceChange = false;
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

	$("#confirm").click(function(event) {
		event.stopPropagation();
		formData['date'] = $("#reservation-date").val();
		formData['persons'] = $("input[name='persons']:checked").val();
		formData['time'] = $("input[name='time']:checked").val();
		console.log("테이블 모달 데이터 적용됨: ", formData);
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

	$(document).on('click', '.sub-list > li', function(event) {
		event.stopPropagation();
		var detailList = $(this).find('.detail-list');
		var clonedDetailList = detailList.clone(true);
		$('.detail-list-wrap').empty().append(clonedDetailList);
		clonedDetailList.css('display', 'flex');
	});

	$(document).on('change', '#price', function() {
		var newValue = $(this).val();
		console.log("새로운 가격: ", newValue);
		isPriceChange = true;
		currentSliderValue = newValue;
		$('#priceValue').text(currentSliderValue);
		$('#priceValue').css('display', 'flex');
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
	$(document).on('click', '.filter-list li, .sub-list li, .detail-list li', function() {
		var $li = $(this);
		changeSelectedState($li); // 상태 변경
		checkRadioButton($li);    // 라디오 버튼 체크
	});

	// '필터 모달' 적용 버튼 클릭 이벤트
	$('#filterModal #applyBtn').click(function(event) {
		// '필터 모달'의 데이터 수집
		event.stopPropagation();
		formData['location'] = $("input[name='location']:checked").val();
		formData['category'] = $("input[name='category']:checked").val();
		formData['price'] = isPriceChange ? currentSliderValue : '0';
		formData['mood'] = $("input[name='mood']:checked").val();
		formData['facilities'] = $("input[name='facilities']:checked").val();
		formData['table_type'] = $("input[name='table_type']:checked").val();
		formData['hygiene'] = $("input[name='hygiene']:checked").val();
		console.log("필터 모달 데이터 적용됨: ", formData);
		sendFormDataToCurrentPage();
		$('#filterModal').hide();

		// 필요한 경우 여기서 서버로 데이터 전송
	});

	function sendFormDataToCurrentPage() {
		// AJAX 요청
		$.ajax({
			url: contextRoot + '/product/searchResult',
			type: 'POST',
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


	function SendFormDataToNextPage() {
		formData['context'] = $('.search_input_text').val();
		formData['triggered_by'] = 'next_page';
		console.log("검색 데이터: ", formData);
		$.ajax({
			url: contextRoot + '/product/searchResult',
			type: 'POST',
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
		event.preventDefault();
		if (event.keyCode === 13) {
			SendFormDataToNextPage();
		}
	});

	$(".search_icon").click(function() {
		SendFormDataToNextPage();
	});

});

