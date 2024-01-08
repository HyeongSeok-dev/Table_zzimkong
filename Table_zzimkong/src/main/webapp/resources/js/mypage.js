
window.onload = function() {
	// 회원정보 수정 - 이메일
	document.modifyForm.emailDomain.onchange = function() {
		console.log(document.modifyForm.emailDomain.value);
		document.modifyForm.user_email2.value = document.modifyForm.emailDomain.value;
	  if(document.modifyForm.emailDomain.value == "") { // 직접 입력 선택 시
	    	document.modifyForm.user_email2.focus(); // 포커스 요청
	    	document.modifyForm.user_email2.readOnly = false; // 입력창 잠금 해제(readonly 아님!)
	    	document.modifyForm.user_email2.style.background = "";
	    } else { // 도메인 선택 시
	    	document.modifyForm.user_email2.readOnly = true; // 입력창 잠금 해제
//	    	document.modifyForm.email2.value = "";
	    }
	};
} // window.onload 끝

$(document).ready(function() {
	
   // 사진 미리 보기
       $('#file1').change(function() {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = $('<img>').attr('src', e.target.result).css('max-width', '290px').css('max-height', '200px');
            $('#img').empty().append(img);
        }
        reader.readAsDataURL(this.files[0]);
    });
    
    
   // 닉네임 중복확인
	$("#modifyBtn").click(function(e){
	    if($("#u_nick").val() == ""){
	        e.preventDefault(); //버튼의 기본 동작(폼 제출)을 막습니다.
	        alert("닉네임을 입력해주세요.");
	    } else if(isDuplicateNick){
	        e.preventDefault(); //버튼의 기본 동작(폼 제출)을 막습니다.
	        alert("이미 존재하는 닉네임입니다.");
	    }
	});
	let isDuplicateNick = false; //닉네임 중복 여부 저장할 변수
	
	$("#u_nick").blur(function(){
	    //닉네임 입력값 가져오기
	    let user_nick = $("#u_nick").val();
	    
	    $.ajax({
	        url: "MypageCheckDupNick",
	        data: {
	            user_nick : user_nick
	        },
	        dataType: "json",
	        success : function(checkDuplicateResult){
	            if(checkDuplicateResult ){ //중복
	                $("#checkNickResult").html("이미 사용중인 닉네임");
	                $("#checkNickResult").css("color", "red");
	                isDuplicateNick = true;
	            }else{ //중복X
	                $("#checkNickResult").html("사용 가능한 닉네임");
	                $("#checkNickResult").css("color", "blue");
	                isDuplicateNick = false;
	            }
	        } //success
	    }); //ajax
	    
	}); //닉네임 중복확인

	//비밀번호검증===============================
	let isPasswd = true; // 비밀번호 유효성 검증 결과를 저장하는 변수. 기본값은 true로 설정

    //비밀번호 검증 함수
    function validatePassword(){
        let passwd = $("#txtPassword2").val();

        // 비밀번호 필드가 비어있지 않을 때만 검증 수행
        if (passwd) {
            let msg = "";
            let color = "";
            
            //비밀번호 길이 검증
            // 대소문자, 숫자 ,특수문자(!@#$%)를 포함하여 8~16 입력
            let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
            
            if(!lengthRegex.exec(passwd)){ //길이체크
                msg = "영문, 숫자, 특수문자 조합 8 ~ 16자리";
                color = "red";
                isPasswd = false; // 이거!!!!!!
            }else{
                let engUpperRegex = /[A-Z]/; //대문자
                let engLowerRegex = /[a-z]/; //소문자
                let numRegex = /[\d]/; //숫자
                let specRegex = /[!@#$%]/; //특수문자
                
                let count = 0;
                
                if(engUpperRegex.exec(passwd)){count++;}
                if(engLowerRegex.exec(passwd)){count++;}
                if(numRegex.exec(passwd)){count++;}
                if(specRegex.exec(passwd)){count++;}
                
                switch(count){
                    case 4 : msg = "안전"; color = "green"; break;
                    case 3 : msg = "보통"; color = "yellow"; break;
                    case 2 : msg = "위험"; color = "orange"; break;
                    case 1 : case 0 :  msg = "사용 불가능한 비밀번호"; color = "red"; 
                }
                
                if(count >= 2){ //안전,보통,위험 (사용가능)
                    isPasswd = true;
                }else{ //사용 불가능한 비밀번호
                    isPasswd = false;
                }   
                    
            }
            
            $("#checkPasswdResult").html(msg);
            $("#checkPasswdResult").css("color", color);
        }
    }


    //비밀번호 입력창에서 focus를 잃었을 때 비밀번호 검증
    $("#txtPassword2").blur(validatePassword);

    //폼 제출 시 비밀번호 검증
//    $("form").submit(function(e) {
//        validatePassword();
//        if (!isPasswd) {
//            alert('새 비밀번호를 다시 입력해주세요');
//            e.preventDefault(); // 폼 제출을 막음
//        }
//    }); // 컨트롤러에 메시지 지정해놨는데 이거 설정하니까 안나와서 주석처리함

	document.modifyForm.user_passwd1.onkeyup = checkPassword;
	document.modifyForm.user_passwd2.onkeyup = checkPassword;
	
	function checkPassword() {
	    let currentPasswd = document.modifyForm.user_passwd.value;
	    let newPasswd = document.modifyForm.user_passwd1.value;
	    let confirmPasswd = document.modifyForm.user_passwd2.value;
	
	    if(newPasswd == confirmPasswd && newPasswd.length > 0 && confirmPasswd.length > 0) { // 새 비밀번호와 확인란 일치
	        if(currentPasswd == newPasswd) { // 기존 비밀번호와 새 비밀번호 일치
	            document.querySelector("#checkPasswd2Result").innerText = "새 비밀번호가 현재 비밀번호에 입력한 것과 동일합니다.";
	            document.querySelector("#checkPasswd2Result").style.color = "red";
	        } else { // 기존 비밀번호와 새 비밀번호 불일치
	            document.querySelector("#checkPasswd2Result").innerText = "비밀번호 일치";
	            document.querySelector("#checkPasswd2Result").style.color = "#3FAFFC";
	        }
	    } else { // 새 비밀번호와 확인란 불일치
	        document.querySelector("#checkPasswd2Result").innerText = "비밀번호 불일치";
	        document.querySelector("#checkPasswd2Result").style.color = "red";
	    }
	}
		
	
	}); // document.ready 끝

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
	
	
	
}); // document.addEventListener 끝  
	
	

