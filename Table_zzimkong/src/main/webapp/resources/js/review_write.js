document.addEventListener('DOMContentLoaded', function() {    
	// ==================================================================================
	
	    function submitReview() {
        // 폼 검증 또는 기타 로직을 여기에 추가할 수 있음

        // 폼 데이터를 제출하는 코드
        document.reviewWriteForm.action = "${pageContext.request.contextPath}/review/complete?com_id=" + currentComId;
        document.reviewWriteForm.submit();
    }
	// ==================================================================================
		// 사진 추가 
	    document.getElementById('photoBtn').addEventListener('click', function() {
	        document.getElementById('photoInput').click();
	    });
	    
	    document.getElementById('photoInput').addEventListener('change', handleImagePreview);
	// ==================================================================================
		function updateCheckboxValue(checkbox) {
		  var hiddenInput = document.getElementsByName(checkbox.id.replace("_checkbox", ""))[0];
		  hiddenInput.value = checkbox.checked ? "1" : "0";
		
		  var label = document.querySelector('label[for="' + checkbox.id + '"]');
		  if (checkbox.checked) {
		    label.classList.add('active');
		  } else {
		    label.classList.remove('active');
		  }
		}
		
		// 모든 체크박스에 대한 이벤트 리스너 설정
		var checkboxes = document.querySelectorAll('input[type="checkbox"]');
		checkboxes.forEach(function(checkbox) {
		  checkbox.addEventListener('change', function() {
		    updateCheckboxValue(this);
		  });
		});
    	//----------------------------
	// 팝업 열기
	window.openPopup = function() {
		document.getElementById('popup').style.display = 'block';
	}

	// 팝업 닫기
	window.closePopup = function() {
		document.getElementById('popup').style.display = 'none';
	}

	// ==================================================================================
	// 좋아요 토스트 메시지
	var likeButton = document.getElementById('likeButton');
	var checkbox = likeButton.querySelector('input[type="checkbox"]');
	var toastMessage = document.getElementById('toastMessage');
	
	checkbox.addEventListener('change', function() {
	    likeButton.classList.toggle('active', this.checked);
	    toastMessage.textContent = this.checked ? '좋아요가 반영되었습니다' : '좋아요가 취소되었습니다';
	    toastMessage.classList.add('show');
	    setTimeout(function() {
	        toastMessage.classList.remove('show');
		    }, 2000);
		});
	//----------------------------
    
    
});
	// ==================================================================================
	// 이미지 프리뷰 및 제거 
	function handleImagePreview(event) {
	    var file = event.target.files[0];
	    var imagePreview = document.getElementById('imagePreview');
	    var previewContainer = document.getElementById('previewContainer');
	    if (file) {
	        var reader = new FileReader();
	        
	        reader.onload = function(e) {
	            imagePreview.src = e.target.result;
	            previewContainer.style.display = 'block'; // 컨테이너 보이기
	        };
	        
	        reader.readAsDataURL(file);
	    }
	}

	function removePreview() {
	    var photoInput = document.getElementById('photoInput');
	    var imagePreview = document.getElementById('imagePreview');
	    var previewContainer = document.getElementById('previewContainer');
	    photoInput.value = ""; 
	    imagePreview.src = ""; 
	    previewContainer.style.display = 'none';
	}
	// ==================================================================================
        // updateCheckboxValue 함수를 전역 스코프로 이동
        function updateCheckboxValue(checkbox) {
            var hiddenInput = document.getElementsByName(checkbox.id)[0];
            hiddenInput.value = checkbox.checked ? 1 : 0;
        }

        // toggleKeywords 함수도 전역 스코프로 이동
        function toggleKeywords(checkbox) {
            var keywordCheckboxes = document.querySelectorAll('.keyword_category input[type="checkbox"]');
            keywordCheckboxes.forEach(function(item) {
                if (item !== checkbox) {
                    item.checked = false;
                    item.disabled = checkbox.checked;
                    document.getElementsByName(item.id)[0].value = '0';
                }
            });
        }

	// ==================================================================================
	// 이미지 프리뷰 
	function handleImagePreview(event) {
	    var file = event.target.files[0];
	    var imagePreview = document.getElementById('imagePreview');
	    var previewContainer = document.getElementById('previewContainer');
	    if (file) {
	        var reader = new FileReader();
	        
	        reader.onload = function(e) {
	            imagePreview.src = e.target.result;
	            imagePreview.style.display = 'block';
	            previewContainer.style.display = 'block';
	        };
	        
	        reader.readAsDataURL(file);
	    }
	}
	// ==================================================================================
	// 이미지 프리뷰 삭제 함수
	function removePreview() {
	    var photoInput = document.getElementById('photoInput');
	    var imagePreview = document.getElementById('imagePreview');
	    var previewContainer = document.getElementById('previewContainer');
	    photoInput.value = "";
	    imagePreview.style.display = 'none';
	    previewContainer.style.display = 'none';
	}
