document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('photoBtn').addEventListener('click', function() {
        document.getElementById('photoInput').click();
    });
    
    document.getElementById('photoInput').addEventListener('change', handleImagePreview);
// ==================================================================================
    // Function to toggle the color of the label when checkbox is checked/unchecked
    function toggleLabelColor(checkbox) {
        var label = document.querySelector('label[for="' + checkbox.id + '"]');
        if (checkbox.checked) {
            label.classList.add('active');
        } else {
            label.classList.remove('active');
        }
    }

    // Add event listeners to all checkboxes
    var checkboxes = document.querySelectorAll('.hidden_checkbox');
    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            toggleLabelColor(checkbox);
            updateCheckboxValue(checkbox); // Existing function call
        });
    });
    
});

// 이 함수들은 전역 스코프에 있어야 하므로 DOMContentLoaded 바깥으로 이동
function updateCheckboxValue(checkbox) {
    var hiddenInput = document.getElementsByName(checkbox.id)[0];
    hiddenInput.value = checkbox.checked ? 1 : 0;
}

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

// ====================================
function updateCheckboxValue(checkbox) {
    var hiddenInput = document.getElementsByName(checkbox.id)[0];
    hiddenInput.value = checkbox.checked ? 1 : 0;
}

// ====================================
// 이미지 프리뷰 및 제거 기능을 위한 함수들
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
    photoInput.value = ""; // input file 값 초기화
    imagePreview.src = ""; // 이미지 프리뷰 소스 초기화
    previewContainer.style.display = 'none'; // 컨테이너 숨기기
}
// ===========================================================================

document.addEventListener('DOMContentLoaded', function() {
// ==================================================================================	
//	 var photoInput = document.getElementById('photoInput');
//    photoInput.addEventListener('change', handleImagePreview);
// =========새로 한거=============================================================
//    var photoInput = document.getElementById('photoInput');
//    var imagePreview = document.getElementById('imagePreview');
//    var previewContainer = document.getElementById('previewContainer');
//    
//    // 이미지 프리뷰 함수
//    photoInput.addEventListener('change', function(event) {
//        var file = event.target.files[0];
//        if (file) {
//            var reader = new FileReader();
//            
//            reader.onload = function(e) {
//                imagePreview.src = e.target.result;
//                previewContainer.style.display = 'block'; // 컨테이너 보이기
//            };
//            
//            reader.readAsDataURL(file);
//        }
//    });
//    
//    // 이미지 프리뷰 삭제 함수
//    window.removePreview = function() {
//        photoInput.value = ""; // input file 값 초기화
//        previewContainer.style.display = 'none'; // 컨테이너 숨기기
//    }
// ======================================================================
//	var keywordButtons = document.querySelectorAll('.keyword_btn');
//	var noKeywordBtn = document.getElementById('noKeywordBtn');
//	var selectedCount = 0;
//
//	keywordButtons.forEach(function(button) {
//		button.addEventListener('click', function() {
//			if (noKeywordBtn.classList.contains('active') && this !== noKeywordBtn) {
//				alert('다른 키워드를 선택할 수 없습니다.'); /* 활성화가 되지 않음 */
//				return;
//			}
//
//			if (this.classList.contains('active')) {
//				this.classList.remove('active');
//				selectedCount--;
//			} else if (selectedCount < 5 || this === noKeywordBtn) {
//				this.classList.add('active');
//				selectedCount++;
//			} else {
//				alert('최대 5개까지만 선택할 수 있습니다.');
//			}
//		});
//	});
	
	// 팝업 열기
	window.openPopup = function() {
		document.getElementById('popup').style.display = 'block';
	}

	// 팝업 닫기
	window.closePopup = function() {
		document.getElementById('popup').style.display = 'none';
	}

// ==================================================================================
	// 사진추가 팝업창
//	document.getElementById('photoBtn').addEventListener('click', function() {
//		document.getElementById('photoInput').click();
//	});
//
//	// 사진 업로드 서버전송
//	document.getElementById('photoInput').addEventListener('change', function() {
//		var file = this.files[0];
//		var formData = new FormData();
//		formData.append('photo', file);
//
//		fetch('https://your-api-url.com/upload', {
//			method: 'POST',
//			body: formData
//		})
//			.then(response => response.json())
//			.then(data => console.log(data))
//			.catch(error => console.error(error));
//	});
	
// ==================================================================================
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
});
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
// 이미지 프리뷰 함수
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


// 이미지 프리뷰 삭제 함수
function removePreview() {
    var photoInput = document.getElementById('photoInput');
    var imagePreview = document.getElementById('imagePreview');
    var previewContainer = document.getElementById('previewContainer');
    photoInput.value = "";
    imagePreview.style.display = 'none';
    previewContainer.style.display = 'none';
}
