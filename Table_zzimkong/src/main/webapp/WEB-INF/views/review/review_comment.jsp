<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review_comment.css">
<%-- 	href="${pageContext.request.contextPath}/resources/css/global.css"> --%>
<!-- Js -->
<script src="${pageContext.request.contextPath}/resources/js/review_comment.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

// 대댓글 작성 아이콘 클릭 시
function reReplyWriteForm(comment_num, comment_re_ref, comment_re_lev, comment_re_seq) {

	$("#reReplyTr").remove();
    $("#contentRow_" + comment_num).after(
		'<tr id="reReplyTr">'
		+ '	<td colspan="3">'
		+ '		<form action="ReviewTinyReReplyWrite" method="post" id="reReplyForm">'
		+ '			<input type="hidden" name="review_num" value="${param.review_num}">'
		+ '			<input type="hidden" name="user_id" value="${sessionScope.sId}">'
		+ '			<input type="hidden" name="comment_num" value="' + comment_num + '">'
		+ '			<input type="hidden" name="comment_re_ref" value="' + comment_re_ref + '">'
		+ '			<input type="hidden" name="comment_re_lev" value="' + comment_re_lev + '">'
		+ '			<input type="hidden" name="comment_re_seq" value="' + comment_re_seq + '">'
		+ '			<textarea id="reReplyTextarea" name="comment_content"></textarea>'
		+ '			<input type="button" value="댓글쓰기" id="reReplySubmit" onclick="reReplyWrite()">'
		+ '		</form>'
		+ '	</td>'
		+ '</tr>'
	);
}

// 대댓글 작성 요청(AJAX)
function reReplyWrite() {
	// 대댓글 입력항목(textarea) 체크
	if($("#reReplyTextarea").val() == "") {
		alert("내용 입력 필수!");
		$("#reReplyTextarea").focus();
		return;
	}
	
	// "BoardTinyReReplyWrite" 서블릿 주소 요청 - AJAX
	// => 요청메서드 : POST, 응답 데이터 타입 : "text"
	// => 폼 태그 내의 모든 데이터 파라미터로 전달
	$.ajax({
		type: "POST",
		url: "ReviewTinyReReplyWrite",
		data: $("#reReplyForm").serialize(), // 해당 폼의 모든 입력 요소(hidden 포함) 파라미터화
		dataType: "text",
		success: function(result) {
			// 대댓글 등록 요청 결과 처리
			// => 성공 시 화면 갱신, 실패 시 오류 메세지 출력
			if(result == "true") {
				location.reload(); // 페이지 갱신
//					location.href = location.href;
//					location.replace(location.href);
			} else {
				alert("댓글 등록 실패!");
			}
		},
		error: function() {
			alert("요청 실패!");
		}
	});
	
}

// 댓글 삭제 아이콘 클릭 시
function confirmReplyDelete(comment_num,review_num) {
	if(confirm("댓글을 삭제하시겠습니까?")) { // 확인 클릭 시
		// AJAX 활용하여 BoardTinyReplyDelete 서블릿 요청(파라미터 : 댓글번호)
		$.ajax({
			type: "GET",
// 			url: "ReviewTinyReplyDelete",
            url: "ReviewTinyReplyDelete",
			data: {
                "comment_num": comment_num,
                "review_num": review_num  // 리뷰 번호도 전송
			},
			dataType: "text",
			success: function(result) {
				// 댓글 삭제 요청 결과 판별("true"/"false")
				if(result == "true") {
					// 댓글 삭제 성공 시 해당 댓글의 tr 태그 자체 삭제
					// => replyTr_ 문자열과 댓글번호를 조합하여 id 선택자 지정
                    // 댓글 관련된 모든 행 삭제
                    $("#userRow_" + comment_num).remove();
                    $("#contentRow_" + comment_num).remove();
                    location.reload();

				} else if(result == "false") {
					alert("댓글 삭제 실패!");
				} else if(result == "invalidSession") { // 세션아이디 없을 경우
					alert("권한이 없습니다!");
					return;
				}
			},
			error: function() {
				alert("요청 실패!");
			}
		});
	}
}
</script>
<title>리뷰 댓글 작성</title>
</head>
<body>
	<div class="comment-header">
		<h3>${comName}</h3>
	</div>
	<section id="replyArea">
		<div id="replyListArea">
			<%-- 댓글 나오는 목록 --%>
			<table>
				<c:forEach var="tinyReplyReview" items="${tinyReplyReviewList}">
					<tr
						class="${tinyReplyReview.comment_re_lev > 0 ? 'reReply' : 'reply'}"
						id="replyTr_${tinyReplyReview.comment_num}">
						<td class="replyWriter"><img
							src="${pageContext.request.contextPath}/resources/img/profile.png"
							alt="댓글프로필이미지" class="user_icon" />${tinyReplyReview.user_id}</td>
						<td class="replyDate" align="right"><fmt:parseDate
								var="parsedReplyDate" value="${tinyReplyReview.comment_update}"
								pattern="yyyy-MM-dd'T'HH:mm" type="both" /> <fmt:formatDate
								value="${parsedReplyDate}" pattern="MM-dd HH:mm" /></td>
					</tr>
					<!--     <tr> -->
					<tr id="contentRow_${tinyReplyReview.comment_num}">
						<td class="replyContent" colspan="2"><c:forEach var="i"
								begin="1" end="${tinyReplyReview.comment_re_lev}">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </c:forEach> &nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${tinyReplyReview.comment_content}
							<c:if
								test="${sessionScope.sId eq tinyReplyReview.user_id or sessionScope.sId eq 'admin'}">
								<a href="javascript:void(0)"
									onclick="confirmReplyDelete(${tinyReplyReview.comment_num}, ${param.review_num})">
									<img
									src="${pageContext.request.contextPath}/resources/img/delete-icon.png"
									alt="댓글 삭제" class="reviewDelelteIcon">
								</a>
							</c:if> <c:if test="${not empty sessionScope.sId}">
								<a
									href="javascript:reReplyWriteForm(${tinyReplyReview.comment_num}, ${tinyReplyReview.comment_re_ref}, ${tinyReplyReview.comment_re_lev}, ${tinyReplyReview.comment_re_seq})"
									class="comment_icon_text"> <img
									src="${pageContext.request.contextPath}/resources/img/review_comment_icon.webp"
									id="reviewCommentIcon" alt="대댓글 작성">&nbsp;답글 달기
								</a>
								<div class="separator"></div>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>

	<div class="comment-container">
		<form action="ReviewTinyReplyWrite" method="post">
			<input type="hidden" name="review_num" value="${param.review_num}">
			<input type="hidden" name="com_id" value="${param.com_id}">
			<!-- 이 부분 추가 -->
			<input type="hidden" name="user_id" value="${sessionScope.sId}">

			<%-- 세션 아이디가 없을 경우(미로그인 시) 댓글 작성 차단 --%>
			<%-- textarea 및 버튼 disabled 처리 --%>
			<c:choose>
				<c:when test="${empty sessionScope.sId}">
					<%-- 세션 아이디 없음 --%>
					<div class="comment_area">
						<textarea id="replyTextarea" name="comment_content"
							placeholder="로그인 한 사용자만 작성 가능합니다" disabled></textarea>
						<input type="submit" class="submit-comment" value="댓글쓰기"
							id="replySubmit" disabled>
					</div>
				</c:when>
				<c:otherwise>
					<div class="comment_area">
						<textarea id="replyTextarea" name="comment_content"
							placeholder="리뷰에 따뜻한 댓글을 남겨주세요" maxlength="300" required></textarea>
						<input type="submit" class="submit-comment" value="댓글쓰기"
							id="replySubmit">
					</div>
				</c:otherwise>
			</c:choose>
		</form>
	</div>
</body>
</html>