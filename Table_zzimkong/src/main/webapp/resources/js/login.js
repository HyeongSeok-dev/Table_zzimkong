//회원가입 누르면 join_agree.jsp로 이동
function joinAgree() {
    window.location.href = "join/agree";
}

//아이디찾기 누르면 팝업창(login_findId.jsp)이동
function popupFindId(){
		    window.open("login/find/id", "address_window", "width=500,height=550");
}
		
		  
//비밀번호 누르면 팝업창(login_findPasswd.jsp)이동
function popupFindPasswd(){
		    window.open("login/find/passwd", "address_window", "width=500,height=550");
}

$(function() {
        fnInit();
    // 로그인 버튼에 클릭 이벤트 추가
	$("#loginBtn").on("click", function(e) {
	    e.preventDefault();  // 기본 동작(폼 제출) 중지
	    
	    // 아이디 입력 여부 확인
	    var userId = $("#userId").val();  // 아이디 텍스트박스의 값 가져오기
	    if (userId.trim() === "") {  // 값이 비어있는지 확인
	        alert("아이디를 입력해주세요!");
	        return;  // 함수 종료
	    }
	    
	    // 비밀번호 입력 여부 확인
	    var password = $("#passwd").val();  // 비밀번호 텍스트박스의 값 가져오기
	    if (password.trim() === "") {  // 값이 비어있는지 확인
	        alert("비밀번호를 입력해주세요!");
	        return;  // 함수 종료
	    }
	    
	    saveid();  // 아이디 저장 함수 호출
	    $("#loginForm").submit();  // 폼 제출
	});

         
 });
     
function frm_check(){
         saveid();
 }
 
function fnInit(){
    var cookieid = getCookie("saveid");
    console.log(cookieid);
    if(cookieid !=""){
        $("input:checkbox[id='saveId']").prop("checked", true);
        $('#userId').val(cookieid);
    }
    
}    
 
function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setTime(todayDate.getTime() + 0);
	if(todayDate > expiredays){
	    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
	}else if(todayDate < expiredays){
	    todayDate.setDate(todayDate.getDate() + expiredays);
	    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}

        
    console.log(document.cookie);
}
 
function getCookie(Name) {
    var search = Name + "=";
    console.log("search : " + search);
    
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
        offset = document.cookie.indexOf(search);
        console.log("offset : " + offset);
        if (offset != -1) { // 쿠키가 존재하면 
            offset += search.length;
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            console.log("end : " + end);
            // 쿠키 값의 마지막 위치 인덱스 번호 설정 
            if (end == -1)
                end = document.cookie.length;
            console.log("end위치  : " + end);
            
            return unescape(document.cookie.substring(offset, end));
        }
    }
    return "";
}
 
function saveid() {
    var expdate = new Date();
    if ($("#saveId").is(":checked")){
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
        setCookie("saveid", $("#userId").val(), expdate);
        }else{
       expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
        setCookie("saveid", $("#userId").val(), expdate);
             
    }
}
