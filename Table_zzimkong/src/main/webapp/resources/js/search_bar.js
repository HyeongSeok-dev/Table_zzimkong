$(document).ready(function() {
	// 모든 모달창을 숨깁니다.
	$('.modal').hide();

	// 모달창을 열고 닫는 코드
	$('.filter_wrapper').click(function() {
		$('#filterModal').show();
	});

	$('.search_info').first().click(function() {
		$('#myModal').show();
	});
	// 닫기 버튼을 클릭했을 때, 해당 버튼이 속한 모달창만을 닫습니다.
	$(document).on('click', '.close', function() {
		$(this).closest('.modal').hide();
	});

	// 모달창 바깥 부분을 클릭했을 때, 해당 부분이 속한 모달창만을 닫습니다.
	$(window).click(function(event) {
		if ($(event.target).hasClass('modal')) {
			$(event.target).hide();
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

		// Close the modal
		modal.css("display", "none");
	});


	//필터부분

	var selections = {};

	$('.sub-list, .detail-list').css('display', 'none');

	$('.filter-item > span').click(function() {
		var filterItem = $(this).parent();
		var filterId = filterItem.attr('id');
		var subList = $(this).siblings('.sub-list').clone(true);
		$('.sub-list-wrap').empty().append(subList);

		// 디테일 리스트를 비웁니다.
		$('.detail-list-wrap').empty();

		subList.css('display', 'flex');

		// 선택 정보를 복원합니다.
		if (selections[filterId]) {
			// 라디오 버튼 선택 정보를 복원합니다.
			if (selections[filterId].radio) {
				subList.find('input[type="radio"]').each(function() {
					var radioId = $(this).attr('id');
					if (selections[filterId].radio === radioId) {
						$(this).prop('checked', true);
					}
				});
			}

			// range 선택 정보를 복원합니다.
			if (selections[filterId].range) {
				subList.find('input[type="range"]').val(selections[filterId].range);
			}
		}
	});

	// 선택 정보를 저장합니다.
	$(document).on('change', '.sub-list input, .detail-list input', function() {
		var filterId = $(this).closest('.filter-item').attr('id');
		var inputType = $(this).attr('type');

		if (!selections[filterId]) {
			selections[filterId] = {};
		}

		if (inputType === 'radio') {
			var radioId = $(this).attr('id');
			selections[filterId].radio = radioId;
		} else if (inputType === 'range') {
			var rangeValue = $(this).val();
			selections[filterId].range = rangeValue;
		}
	});

	// subList가 DOM에 추가된 후에 이벤트 핸들러를 바인딩합니다.
	$(document).on('input', '.sub-list-wrap #price', function() {
		$('#priceValue').text($(this).val());
	});

	$('.sub-list > li').click(function() {
		var detailList = $(this).find('.detail-list').clone(true);
		$('.detail-list-wrap').empty().append(detailList);
		detailList.css('display', 'flex');
	});

	$("#applyBtn").click(function() {
		for (var filterId in selections) {
			if (selections.hasOwnProperty(filterId)) {
				var selection = selections[filterId];

				// 숨겨진 폼 필드를 생성합니다.
				var hiddenFieldForRadio = $("<input>", {
					type: "hidden",
					name: filterId + "-radio",
					value: selection.radio
				});

				// 폼에 숨겨진 필드를 추가합니다.
				$("form").append(hiddenFieldForRadio);
			}
		}
	});


});