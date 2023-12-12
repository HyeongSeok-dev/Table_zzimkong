$(document).ready(function() {
	// 모든 모달창을 숨깁니다.
	$('.modal').hide();

	// 모달창을 열고 닫는 코드
	$('.filter_wrapper').click(function() {
		$('#filterModal').show();
	});

	$('.search_info').first().click(function() {
		$('#table_modal').show();
	});
	// 닫기 버튼을 클릭했을 때, 해당 버튼이 속한 모달창만을 닫습니다.
	$(document).on('click', '.close', function() {
		$(this).closest('.modal').hide();
	});
	$(document).on('click', '#confirm', function() {
		$(this).closest('.modal').hide();
	});

	// 모달창 바깥 부분을 클릭했을 때, 해당 부분이 속한 모달창만을 닫습니다.
	$(window).click(function(event) {
		if (!$(event.target).closest('.modal').length && !$(event.target).hasClass('modal-opener')) {
			$('.modal').hide();
			console.log("모달창 밖 클릭됨")
		}
	});

	//검색아이콘 폼제출
	$(".search_icon").click(function() {
		$("form").submit();
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

	// When the user hits enter in the search input, submit the form
	$(".search_input_text").keypress(function(event) {
		if (event.keyCode == 13) {
			event.preventDefault();
			// Get input values
			var date = $("#reservation-date").val();
			var persons = $("input[name='persons']:checked").val();
			var time = $("input[name='time']:checked").val();

			// Update the form data
			$("form").find("input[name='date']").val(date);
			$("form").find("input[name='persons']").val(persons);
			$("form").find("input[name='time']").val(time);

			// Submit the form
			$("form").submit();
		}
	});

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

	// 리스트 항목 클릭 시 라디오 버튼 변경 (이벤트 위임 사용)
	$(document).on('click', '.sub-list li, .detail-list li', function(e) {
		var radio = $(this).find('input[type="radio"]');
		var wasChecked = radio.prop('checked');

		if (!wasChecked) { // 이미 선택된 라디오 버튼을 다시 클릭한 경우는 제외
			radio.prop('checked', true); // 상태를 변경

			// 클래스 변경을 강제로 적용
			$('.filter-list li, .sub-list li, .detail-list li').removeClass('selected');
			$(this).addClass('selected');

		}
	});

	$('.sub-list').on('input', '#price', function() {
		$('#priceValue').text($(this).val());
		console.log("슬라이더 값 변경: ", $(this).val());
	});

	$('.filter-item > span').click(function() {
		var subList = $(this).siblings('.sub-list').clone(true);
		$('.sub-list-wrap').empty().append(subList);

		// 디테일 리스트를 비웁니다.
		$('.detail-list-wrap').empty();
		subList.css('display', 'flex');
	});

	$('.sub-list > li').click(function() {
		var detailList = $(this).find('.detail-list').clone(true);
		$('.detail-list-wrap').empty().append(detailList);
		detailList.css('display', 'flex');
	});

});

