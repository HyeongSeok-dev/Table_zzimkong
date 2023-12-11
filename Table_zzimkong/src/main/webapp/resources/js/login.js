//아이디찾기 누르면 팝업창(login_findId.jsp)이동
function popupFindId(){
		    window.open("login_findId.jsp", "address_window", "width=450,height=550");
		}
		
		document.getElementById('find_id').addEventListener('click', function(event) {
		    event.preventDefault();
		    popupFindId();
		});
		  
//비밀번호 누르면 팝업창(login_findPasswd.jsp)이동
function popupFindPasswd(){
		    window.open("login_findPasswd.jsp", "address_window", "width=450,height=570");
		}
		
		document.getElementById('find_passwd').addEventListener('click', function(event) {
		    event.preventDefault();
		    popupFindPasswd();
		});