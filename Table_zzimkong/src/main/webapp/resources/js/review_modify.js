document.addEventListener('DOMContentLoaded', function() {

	// ==================================================================================
    var photoBtn = document.getElementById('photoBtn');
    var photoInput = document.getElementById('photoInput');

    if (photoBtn && photoInput) {
        photoBtn.addEventListener('click', function() {
            photoInput.click();
        });

        photoInput.addEventListener('change', handleImagePreview);
    } else {
        console.error('photoBtn 또는 photoInput 요소를 찾을 수 없습니다.');
    }
    
	// ==================================================================================
	function handleImagePreview(event) {
	    var file = event.target.files[0];
	    if (file) {
	        var reader = new FileReader();
	        
	        reader.onload = function(e) {
	            var imagePreview = document.getElementById('imagePreview');
	            var previewContainer = document.getElementById('previewContainer');
	            
	            imagePreview.src = e.target.result;
	            previewContainer.style.display = 'block';
	        };
	        
	        reader.readAsDataURL(file);
	    }
	}
	// ==================================================================================
//	function removePreview() {
//	    var photoInput = document.getElementById('photoInput');
//	    var imagePreview = document.getElementById('imagePreview');
//	    var previewContainer = document.getElementById('previewContainer');
//	    photoInput.value = ""; 
//	    imagePreview.src = ""; 
//	    previewContainer.style.display = 'none';
//	}
	// ==================================================================================
// 이미지 프리뷰 삭제 함수
function removePreview(review_img_id) {
    var photoInput = $("#photoInput" + review_img_id);
    var imagePreview = $("#imagePreview" + review_img_id);
    var previewContainer = $("#previewContainer" + review_img_id);

    if (photoInput.length && imagePreview.length && previewContainer.length) {
        photoInput.val('');
        imagePreview.attr('src', '');
        previewContainer.hide();
    } else {
        console.error('removePreview 함수: 지정된 ID를 가진 요소를 찾을 수 없습니다.');
    }
}



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

	// ==================================================================================
    // 이미지 프리뷰 함수
    function handleImagePreview(event, index) {
        var file = event.target.files[0];
        var reader = new FileReader();

        reader.onload = function(e) {
            var previewHTML = `
                <div class="image_wrapper">
                    <img src="${e.target.result}" alt="Image Preview" class="imagePreview"/>
                    <div class="remove_btn" onclick="removePreview(${index})">X</div>
                </div>
            `;
            document.getElementById('previewContainer' + index).innerHTML = previewHTML;
            document.getElementById('previewContainer' + index).style.display = 'block';
        };

        reader.readAsDataURL(file);
    }

    
// ==================================================================================
 // 이미지 프리뷰 삭제 함수
    function removePreview(index) {
        document.getElementById('photoInput' + index).value = "";
        var previewContainer = document.getElementById('previewContainer' + index);
        previewContainer.innerHTML = "";
        previewContainer.style.display = 'none';
    }

// ==================================================================================
   // 파일 입력 변경 이벤트 리스너
    document.querySelectorAll('input[type="file"]').forEach(function(input) {
        input.addEventListener('change', function() {
            handleImagePreview(event, input.getAttribute('id').replace('photoInput', ''));
        });
    });
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
// ==================================================================================
	// 팝업 열기
	window.openPopup = function() {
		document.getElementById('popup').style.display = 'block';
	}

	// 팝업 닫기
	window.closePopup = function() {
		document.getElementById('popup').style.display = 'none';
	}
// ==================================================================================
	// 좋아요 버튼
	var likeButton = document.getElementById('likeButton');
	if (likeButton) {
		var checkbox = likeButton.querySelector('input[type="checkbox"]');
		if (checkbox) {
			checkbox.addEventListener('change', function() {
				likeButton.classList.toggle('active', this.checked);
				toastMessage.textContent = this.checked ? '좋아요가 반영되었습니다' : '좋아요가 취소되었습니다';
				toastMessage.classList.add('show');
				setTimeout(function() {
					toastMessage.classList.remove('show');
				}, 2000);
			});

			// 초기 상태 설정
			if (checkbox.checked) {
				likeButton.classList.add('active');
			} else {
				likeButton.classList.remove('active');
			}
		}
	}


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
	function removePreview(index) {
		$("#photoInput" + index).val('');
		$("#previewContainer" + index).html('').hide();
	}
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
	
		});
// ==================================================================================
// 체크박스 값 checked 시 0에서 1로 변경
//   updateCheckboxValue 함수를 전역 스코프로 이동
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