<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
$(document).ready(function() {
    $(".topup").hide();

    $(window).scroll(function() {
        if ($(this).scrollTop() > 300) {
            $(".topup").show();
        } else {
            $(".topup").hide();
        }
    });

    $(".topup").click(function() {
        $('html, body').animate({
            scrollTop: 0
        }, 'slow');
        return false;
    });
});
</script>

<style>
/* top 버튼 CSS */
.topup {
    position: fixed;
    bottom: 25px;
    right: 30px;
    cursor: pointer;
}
.topup:hover svg circle {
    fill : #3FAFFC;
}
</style>

<%-- 상단으로 --%>
<span class="topup">
	<a href="#">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="2.5rem" height="2.5rem">
			<circle fill="#e8e8e8dd" cx="12" cy="12" r="12"></circle>
			<path fill="#ffffffdd" d="M12 10.828l-4.95 4.95-1.414-1.414L12 8l6.364 6.364-1.414 1.414z"></path>
		</svg>
	</a>
</span>
