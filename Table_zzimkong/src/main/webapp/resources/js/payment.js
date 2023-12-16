$(function() {
	$("#checkAllAgree").on("click", function() {
		for(let i = 0; i < document.payForm.agreement.length; i++) {
			document.payForm.agreement[i].checked = document.querySelector("#checkAllAgree").checked;
		}
	});
});