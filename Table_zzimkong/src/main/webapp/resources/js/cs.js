$(document).ready(function() {
	
	$("input[type='file']").change(function() {
	    var currentFileInput = $(this);
	    var currentPreviewContainer = currentFileInput.next(".previewContainer"); // 다음에 있는 미리보기 컨테이너를 찾음
	
	    if (currentFileInput.val() !== "") {
	        // 이미지 미리보기 컨테이너가 존재하지 않으면 동적으로 생성
	        if (currentPreviewContainer.length === 0) {
	            currentPreviewContainer = $("<div>").addClass("previewContainer");
	            currentFileInput.after(currentPreviewContainer);
	        }
	
	        var newPreviewImage = $("<img>").addClass("previewImage").attr("src", "").attr("alt", "이미지 미리보기");
	        currentPreviewContainer.html(newPreviewImage); // 기존 미리보기 이미지 초기화
	        
	        readURL(currentFileInput, newPreviewImage); // 파일 미리보기 함수 호출
	    } else {
	        // 파일이 선택되지 않은 경우 미리보기 이미지 제거
	        currentPreviewContainer.remove();
	    }
	});
	
	// 파일 미리보기 함수
	function readURL(input, previewImage) {
	    if (input[0].files && input[0].files[0]) {
	        var reader = new FileReader();
	
	        reader.onload = function(e) {
	            previewImage.attr("src", e.target.result);
	        }
	
	        reader.readAsDataURL(input[0].files[0]);
	    }
	}
	
	// 초기 상태 설정: 시작 시 member_category_select만 보이게 설정
	$(".member_category_select").show();
	$(".ceo_category_select").hide();
	
	// user_select 값 변경 시 이벤트 처리
	$(".user_select").change(function() {
		if($(this).val() == "1") { // 유저 선택이 "1"인 경우
			$(".member_category_select").show().removeAttr('disabled');
			$(".ceo_category_select").hide().attr('disabled', 'disabled'); // 숨기고, 비활성화
			
		} else if($(this).val() == "2") { // 유저 선택이 "2"인 경우
			$(".ceo_category_select").show().removeAttr('disabled');
			$(".member_category_select").hide().attr('disabled', 'disabled'); // 숨기고, 비활성화
	
		}
	});
});
