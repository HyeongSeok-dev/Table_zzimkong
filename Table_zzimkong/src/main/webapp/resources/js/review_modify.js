document.addEventListener('DOMContentLoaded', function() {    
	// ==================================================================================
	// 사진 추가 
    document.getElementById('photoBtn').addEventListener('click', function() {
        document.getElementById('photoInput').click();
    });
    
    document.getElementById('photoInput').addEventListener('change', handleImagePreview);
	// ==================================================================================
	// 체크박스 숨기기
    function toggleLabelColor(checkbox) {
        var label = document.querySelector('label[for="' + checkbox.id + '"]');
        if (checkbox.checked) {
            label.classList.add('active');
        } else {
            label.classList.remove('active');
        }
    }

    var checkboxes = document.querySelectorAll('.hidden_checkbox');
    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            toggleLabelColor(checkbox);
            updateCheckboxValue(checkbox); 
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
	// 체크박스 선택 시 value 0 -> 1로 변경
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
//	document.addEventListener('DOMContentLoaded', function() {
//	//----------------------------
//	// 팝업 열기
//	window.openPopup = function() {
//		document.getElementById('popup').style.display = 'block';
//	}
//
//	// 팝업 닫기
//	window.closePopup = function() {
//		document.getElementById('popup').style.display = 'none';
//	}
//
//	// ==================================================================================
//	// 좋아요 토스트 메시지
//	var likeButton = document.getElementById('likeButton');
//	var checkbox = likeButton.querySelector('input[type="checkbox"]');
//	var toastMessage = document.getElementById('toastMessage');
//	
//	checkbox.addEventListener('change', function() {
//	    likeButton.classList.toggle('active', this.checked);
//	    toastMessage.textContent = this.checked ? '좋아요가 반영되었습니다' : '좋아요가 취소되었습니다';
//	    toastMessage.classList.add('show');
//	    setTimeout(function() {
//	        toastMessage.classList.remove('show');
//		    }, 2000);
//		});
	//----------------------------
//	});
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
	document.addEventListener('DOMContentLoaded', (event) => {
    // Get the checkbox
    const likeCheckbox = document.querySelector('input[name="review_like"]');
    // Get the label
    const likeLabel = document.getElementById('likeButton');

    // Function to update the class based on the checkbox
    function updateLikeButton() {
        if (likeCheckbox.checked) {
            likeLabel.classList.add('active');
        } else {
            likeLabel.classList.remove('active');
        }
    }

    // Event listener for changes on the checkbox
    likeCheckbox.addEventListener('change', updateLikeButton);

    // Call the function on load to set the initial state
    updateLikeButton();
});
	// ==================================================================================
	// 좋아요 버튼 반영
	document.addEventListener('DOMContentLoaded', function() {
	    var likeCheckbox = document.querySelector('input[name="review_like"]');
	    var likeButton = document.getElementById('likeButton');

	    function updateLikeButton() {
	        if (likeCheckbox.checked) {
	            likeButton.classList.add('active');
	        } else {
	            likeButton.classList.remove('active');
	        }
	    }
	    likeCheckbox.addEventListener('change', updateLikeButton);
	
	    updateLikeButton();
});
	// ==================================================================================
//document.getElementById('photoInput').addEventListener('change', function(event) {
//    var reader = new FileReader();
//    reader.onload = function() {
//        var output = document.getElementById('imagePreview');
//        output.src = reader.result;
//        document.getElementById('previewContainer').style.display = 'block';
//    };
//    reader.readAsDataURL(event.target.files[0]);
//});
//
//function removePreview() {
//    document.getElementById('previewContainer').style.display = 'none';
//    document.getElementById('photoInput').value = ""; // 이 부분이 이미지를 제거합니다.
//}
	// ==================================================================================
function handleImagePreview(event) {
    var file = event.target.files[0];
    var imagePreview = document.getElementById('imagePreview');
    if (file) {
        var reader = new FileReader();
        
        reader.onload = function(e) {
            imagePreview.src = e.target.result;
            imagePreview.style.display = 'block';
        };
        
        reader.readAsDataURL(file);
    }
}

function removePreview() {
    var imagePreview = document.getElementById('imagePreview');
    imagePreview.src = "";
    imagePreview.style.display = 'none';
}
	// ==================================================================================
//    var deleteRequests = []; // 삭제 요청을 저장할 배열
//
//    function requestDeleteFile(review_num, review_img) {
//        if(confirm("삭제하시겠습니까?")) {
//            // 배열에 삭제 요청 정보 추가
//            deleteRequests.push({ review_num: review_num, review_img: review_img });
//
//            // 페이지에서 이미지 숨기기
//            // 이미지를 숨기는 코드를 여기에 추가하세요.
//        }
//    }
//
//    // 수정 버튼 클릭 시 처리
//    function submitForm() {
//        // 폼 데이터를 생성
//        var formData = new FormData(document.reviewModifyForm);
//        
//        // 삭제 요청 배열을 JSON 문자열로 변환하여 formData에 추가
//        formData.append("deleteRequests", JSON.stringify(deleteRequests));
//
//        // AJAX 요청을 사용하여 formData를 서버로 전송
//        $.ajax({
//            url: "reviewModifyPro", 
//            type: "POST",
//            data: formData,
//            processData: false,
//            contentType: false,
//            success: function(response) {
//                // 처리 결과에 따라 사용자에게 알림
//                // 성공 또는 실패 메시지를 표시하는 코드를 여기에 추가하세요.
//            }
//        });
//    }
