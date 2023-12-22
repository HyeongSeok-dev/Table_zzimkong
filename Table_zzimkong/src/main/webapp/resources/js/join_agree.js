 //가게유의사항 전체체크
function checkbox_allCheck(){
    var checkboxes = document.querySelectorAll("#checkbox_agree1, #checkbox_agree2, #checkbox_agree3");
    document.getElementById("checkAll").addEventListener("click", function(){
        for(var i=0; i<checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });
}
    
    
 //필수항목 체크 안하면 포커스 이동
function next() {
	
  var checkbox1 = document.getElementById("checkbox_agree1");
  var checkbox2 = document.getElementById("checkbox_agree2");

  
  if (!checkbox1.checked) {
    alert("서비스 이용에 동의해주세요.");
    checkbox1.focus();
    return false;
  }
  
  if (!checkbox2.checked) {
    alert("개인정보 수집 및 이용에 동의해주세요.");
    checkbox2.focus();
    return false;
  }
  
  //필수항목 다 체크시 페이지 이동
  location.href = "choice";

} //필수항목체크후 이동
