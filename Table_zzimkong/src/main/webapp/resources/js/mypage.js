	/* 회원정보 수정 - 이메일 */
window.onload = function() {
	document.modifyForm.emailDomain.onchange = function() {
		console.log(document.modifyForm.emailDomain.value);
		document.modifyForm.email2.value = document.modifyForm.emailDomain.value;
	  if(document.modifyForm.emailDomain.value == "") { // 직접 입력 선택 시
	    	document.modifyForm.email2.focus(); // 포커스 요청
	    	document.modifyForm.email2.readOnly = false; // 입력창 잠금 해제(readonly 아님!)
	    	document.modifyForm.email2.style.background = "";
	    } else { // 도메인 선택 시
	    	document.modifyForm.email2.readOnly = true; // 입력창 잠금 해제
//	    	document.modifyForm.email2.value = "";
	    }
	};
	
};

	/* 예약 취소 모달창 my_list.jsp */
	function cancelReservation(){
			confirm("예약을 취소하시겠습니까?");
			if(true) {
				alert("예약이 취소되었습니다.");
			}
		}

document.addEventListener('DOMContentLoaded', function() {

    /* 북마크 추가/삭제 */
    var likeButtons = document.querySelectorAll('.like_button');
    
    likeButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            this.classList.toggle('active');
            // SVG 아이콘 내부 색상 변경 로직을 여기에 추가할 수 있습니다.
        });
    });

		
	/* 최근 본 매장 슬라이드 */
	const carousel = document.querySelector(".carousel"),
	firstImg = carousel.querySelectorAll("img")[0],
	arrowIcons = document.querySelectorAll(".wrapper i");
	
	let isDragStart = false, isDragging = false, prevPageX, prevScrollLeft, positionDiff;
	
	const showHideIcons = () => {
	    // showing and hiding prev/next icon according to carousel scroll left value
	    let scrollWidth = carousel.scrollWidth - carousel.clientWidth; // getting max scrollable width
	    arrowIcons[0].style.display = carousel.scrollLeft == 0 ? "none" : "block";
	    arrowIcons[1].style.display = carousel.scrollLeft == scrollWidth ? "none" : "block";
	}
	
	arrowIcons.forEach(icon => {
	    icon.addEventListener("click", () => {
	        let firstImgWidth = firstImg.clientWidth + 14; // getting first img width & adding 14 margin value
	        // if clicked icon is left, reduce width value from the carousel scroll left else add to it
	        carousel.scrollLeft += icon.id == "left" ? -firstImgWidth : firstImgWidth;
	        setTimeout(() => showHideIcons(), 60); // calling showHideIcons after 60ms
	    });
	});
	
	const autoSlide = () => {
	    // if there is no image left to scroll then return from here
	    if(carousel.scrollLeft - (carousel.scrollWidth - carousel.clientWidth) > -1 || carousel.scrollLeft <= 0) return;
	
	    positionDiff = Math.abs(positionDiff); // making positionDiff value to positive
	    let firstImgWidth = firstImg.clientWidth + 14;
	    // getting difference value that needs to add or reduce from carousel left to take middle img center
	    let valDifference = firstImgWidth - positionDiff;
	
	    if(carousel.scrollLeft > prevScrollLeft) { // if user is scrolling to the right
	        return carousel.scrollLeft += positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
	    }
	    // if user is scrolling to the left
	    carousel.scrollLeft -= positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
	}
	
	const dragStart = (e) => {
	    // updatating global variables value on mouse down event
	    isDragStart = true;
	    prevPageX = e.pageX || e.touches[0].pageX;
	    prevScrollLeft = carousel.scrollLeft;
	}
	
	const dragging = (e) => {
	    // scrolling images/carousel to left according to mouse pointer
	    if(!isDragStart) return;
	    e.preventDefault();
	    isDragging = true;
	    carousel.classList.add("dragging");
	    positionDiff = (e.pageX || e.touches[0].pageX) - prevPageX;
	    carousel.scrollLeft = prevScrollLeft - positionDiff;
	    showHideIcons();
	}
	
	const dragStop = () => {
	    isDragStart = false;
	    carousel.classList.remove("dragging");
	
	    if(!isDragging) return;
	    isDragging = false;
	    autoSlide();
	}
	
	carousel.addEventListener("mousedown", dragStart);
	carousel.addEventListener("touchstart", dragStart);
	
	document.addEventListener("mousemove", dragging);
	carousel.addEventListener("touchmove", dragging);
	
	document.addEventListener("mouseup", dragStop);
	carousel.addEventListener("touchend", dragStop);
	
	
	/* 회원정보 수정 - 이메일 */
	document.modifyForm.emailDomain.onchange = function() {
		document.modifyForm.email2.value = document.modifyForm.emailDomain.value;
		if(document.modifyForm.emailDomain.value == "") { // 직접 입력 선택시
			document.modifyForm.email2.fucus(); // 포커스 요청
			document.modifyForm.email2.readOnly = false; // // 입력창 잠금 해제(readonly 아님!)
			document.modifyForm.email2.style.background = "";
		} else { // 도메인 선택시
			document.modifyForm.email2.readOnly = true; // 입력창 잠금 해제
			document.modifyForm.email2.style.background = "lightgray";
		}
	};
	
	});
