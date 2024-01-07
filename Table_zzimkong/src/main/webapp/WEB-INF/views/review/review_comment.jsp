<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review_comment.css">
<style type="text/css">
	#articleForm {
		width: 500px;
		height: 600px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		border: 1px solid black;
		border-collapse: collapse; 
	 	width: 500px;
	}
	
	th {
		text-align: center;
	}
	
	td {
		width: 150px;
		text-align: center;
	}
	
	#basicInfoArea {
		min-height: 130px;
		text-align: center;
	}
	
	#articleContentArea {
		background: orange;
		margin-top: 20px;
		height: 350px;
		text-align: center;
		overflow: auto;
		white-space: pre-line;
	}
	
	#commandList {
		margin: auto;
		width: 500px;
		text-align: center;
	}
	
	/* -------------- 댓글 영역 --------------- */
	#replyArea {
		width: 500px;
		height: 150px;
		margin: auto;
		margin-top: 20px;
		margin-bottom: 50px;
	}
	
	#replyTextarea {
		width: 400px;
		height: 50px;
		resize: none;
		vertical-align: middle;
	}
	
	#replySubmit {
		width: 85px;
		height: 55px;
		vertical-align: middle;
	}
	
	#replyListArea {
		font-size: 12px;
		margin-top: 20px;
	}
	
	#replyListArea table, tr, td {
		border: none;
	}
	
	.replyContent {
		width: 300px;
		text-align: left;
	}
	
	.replyContent img {
		width: 10px;
		height: 10px;
	}
	
	.replyWriter {
		width: 80px;
	}
	
	.replyDate {
		width: 100px;
	}
	
	/* 대댓글 */
	#reReplyTextarea {
		width: 350px;
		height: 20px;
		vertical-align: middle;
		resize: none;
	}
	
	#reReplySubmit {
		width: 65px;
		height: 25px;
		vertical-align: middle;
		font-size: 12px;
	}
</style>
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/resources/css/global.css"> --%>
<!-- Js -->
<script src="${pageContext.request.contextPath}/resources/js/review_comment.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">


// 대댓글 작성 아이콘 클릭 시
function reReplyWriteForm(comment_num, comment_re_ref, comment_re_lev, comment_re_seq) {
//		console.log(reply_num + ", " + reply_re_ref + ", " + reply_re_lev + ", " + reply_re_seq);

	// 기존에 존재하는 대댓글 입력폼이 있을 경우 해당 폼 요소 제거(tr 태그 제거)
	// => "reReplyTr" id 선택자 활용
	$("#reReplyTr").remove();

	// 지정한 댓글 아래쪽에 대댓글 입력폼 표시
	// => 댓글 지정하기 위해 댓글 tr 태그의 id 값 활용() - $("#replyTr_" + reply_num)
	// => 지정한 댓글 아래쪽에 댓글 입력폼 표시를 위해 after() 메서드 활용
	$("#replyTr_" + comment_num).after(
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
					$("#replyTr_" + comment_num).remove();
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
</div><!-- <div class="review-button"  id="closeButton"> -->
<%--     <img src="${pageContext.request.contextPath}/resources/img/comment_close.png" alt="닫기"  />  --%>
<!-- </div> -->
	<%-- 목록은 BoardList.bo 서블릿 요청(파라미터 : 페이지번호) --%>
	
<!-- 	<p class="no-comments">등록된 댓글이 없습니다.</p> -->
	<section id="replyArea">
		<div id="replyListArea"> <%-- 댓글 나오는 목록 --%>
			<table>
				<%-- 댓글 내용(reply_content), 작성자(reply_name), 작성일시(reply_date) 표시 --%>
				<%-- 반복문을 통해 List 객체로부터 Map 객체 꺼내서 출력 --%>
				<%-- tinyReplyReview : tinyReplyReview --%>
				<c:forEach var="tinyReplyReview" items="${tinyReplyReviewList}">
					<%-- 댓글 1개에 대한 제어(대댓글 작성 폼 표시, 댓글 제거)를 위한 id 값 지정 --%>
					<%-- 각 댓글(tr 태그)별 고유 id 생성하기 위해 댓글 번호를 id 에 조합 --%>
					<tr id="replyTr_${tinyReplyReview.comment_num}">
						<td class="replyContent">
							<%-- 대댓글 구분을 위해 reply_re_lev 값이 0 보다 크면 들여쓰기(공백 2칸) --%>
							<%-- foreach 활용하여 1 ~ reply_re_lev 까지 반복 --%>
							<c:forEach var="i" begin="1" end="${tinyReplyReview.comment_re_lev}">
								&nbsp;&nbsp;
							</c:forEach>
 							${tinyReplyReview.comment_content}
							<%-- 세션 아이디 존재할 경우 대댓글 작성 이미지(reply-icon.png) 추가 --%>
							<c:if test="${not empty sessionScope.sId}">
								<%-- 대댓글 작성 아이콘 클릭 시 자바스크립트 함수 reReplyWriteForm() 호출 --%>
								<%-- 파라미터 : 댓글 번호, 댓글 참조글번호, 댓글 들여쓰기레벨, 댓글 순서번호 --%>
								<a href="javascript:reReplyWriteForm(${tinyReplyReview.comment_num}, ${tinyReplyReview.comment_re_ref}, ${tinyReplyReview.comment_re_lev}, ${tinyReplyReview.comment_re_seq})">
									<img src="${pageContext.request.contextPath }/resources/img/reply-icon.png">
								</a>
								<%-- 또한, 세션 아이디가 댓글 작성자와 동일하거나 관리자일 경우 --%>
								<%-- 댓글 삭제 이미지(delete-icon.png) 추가 --%>
 								<c:if test="${sessionScope.sId eq tinyReplyReview.user_id or sessionScope.sId eq 'admin'}"> 
<%--  									댓글 삭제 아이콘 클릭 시 자바스크립트 함수 confirmReplyDelete() 호출 --%> 
<%-- 									파라미터 : 댓글 번호 --%>
<%--  									<a href="javascript:void(0)" onclick="confirmReplyDelete(${tinyReplyReview.comment_num})">  --%>
 										<a href="javascript:void(0)" onclick="confirmReplyDelete(${tinyReplyReview.comment_num}, ${param.review_num})">
 											<img src="${pageContext.request.contextPath}/resources/img/delete-icon.png"> 
										</a>
 									</c:if> 							
 								</c:if>
						</td>
						<td class="replyWriter">${tinyReplyReview.user_id}</td>
						<td class="replyDate">
<%-- 							${tinyReplyReview.reply_date} --%>
							<%--
							만약, 테이블 조회 결과를 Map 타입으로 저장 시 날짜 및 시각 데이터가
							JAVA 8 부터 지원하는 LocalXXX 타입으로 관리된다! (ex. LocalDate, LocalTime, LocalDateTime)
							=> 일반 Date 타입에서 사용하는 형태로 파싱 후 다시 포맷 변경하는 작업 필요 
							=> JSTL fmt 라이브러리의 <fmt:parseDate> 태그 활용하여 파싱 후
							   <fmt:formatDate> 태그 활용하여 포맷팅 수행
							=> 1) <fmt:parseDate>
							      var : 파싱 후 해당 날짜를 다룰 객체명
							      value : 파싱될 대상 날짜 데이터
							      pattern : 파싱 대상 날짜 데이터의 형식(이 때, 시각을 표시하는 문자 T 는 단순 문자로 취급하기 위해 'T' 로 표기)
							      type : 대상 날짜 파싱 타입(time : 시각, date : 날짜, both : 둘 다)
							   2) <fmt:formatDate>
							      value : 출력(포맷팅)할 날짜 데이터
							      pattern : 포맷팅 할 날짜 형식
							--%>
							<fmt:parseDate var="parsedReplyDate" value="${tinyReplyReview.comment_update}" pattern="yyyy-MM-dd'T'HH:mm" type="both" />
							<%--${parsedReplyDate}--%> <%-- Wed Jan 03 10:25:00 KST 2024 --%> 
							<%--<fmt:formatDate value="${parsedReplyDate}" />--%> <%-- 2024. 1. 3. --%>
							<fmt:formatDate value="${parsedReplyDate}" pattern="MM-dd HH:mm" />
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>

<div class="comment-container">
<!--     <div class="comment-box" contenteditable="true" placeholder="리뷰에 따뜻한 댓글을 달아주세요."></div> -->
<!-- 	<section id="replyArea"> -->
	<form action="ReviewTinyReplyWrite" method="post">
<%-- 			<input type="hidden" name="board_num" value="${review.review_num}"> --%>
			<input type="hidden" name="review_num" value="${param.review_num}">
<%-- 			<input type="hidden" name="com_id" value="${param.com_id}"> --%>
		    <input type="hidden" name="com_id" value="${param.com_id}"> <!-- 이 부분 추가 -->	
			<%-- 만약, 아이디를 전송해야할 경우 reply_name 파라미터 포함 --%>
			<%-- 단, 현재는 별도의 닉네임등을 사용하지 않으므로 임시로 세션아이디 전달 --%>
			<%-- (실제로 세션 아이디 사용시에는 컨트롤러에서 HttpSession 객체를 통해 접근) --%>
			<input type="hidden" name="user_id" value="${sessionScope.sId}">
			
			<%-- 세션 아이디가 없을 경우(미로그인 시) 댓글 작성 차단 --%>
			<%-- textarea 및 버튼 disabled 처리 --%>
	<hr class="separator">
			<c:choose>
				<c:when test="${empty sessionScope.sId}"> <%-- 세션 아이디 없음 --%>
					<textarea id="replyTextarea" name="comment_content" placeholder="로그인 한 사용자만 작성 가능합니다" disabled></textarea>
					<input type="submit" value="댓글쓰기" id="replySubmit" disabled>
				</c:when>
				<c:otherwise>
					<textarea id="replyTextarea" name="comment_content" required></textarea>
					<input type="submit" value="댓글쓰기" id="replySubmit">	
<!-- 				    <button class="submit-comment">등록</button> -->
				</c:otherwise>
			</c:choose>
		</form>
	</section>
</div>
</body>
</html>