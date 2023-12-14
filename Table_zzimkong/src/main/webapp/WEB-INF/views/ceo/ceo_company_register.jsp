<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script type="text/javascript">
	
</script>
</head>
<body class="info_window">
	<section>
		<h3>업체 입점 신청</h3>
		<br><br>
		<form action="" method="post" name="ceoComForm">
			<table>
				<tr>
					<th>사업자등록번호</th>
					<td colspan="5">
						<div>
							<input type="text" placeholder="사업자등록번호를 입력해 주세요." id="comNumText">
							<button type="button" class="button_olive"  onclick="">번호찾기</button>
						</div>	
					</td>
				</tr>
				<tr>
					<th>상호명</th>
					<td colspan="2"><input type="text" value="" readonly="readonly"></td>
					<th>대표자명</th>
					<td colspan="2"><input type="text" value="" readonly="readonly"></td>
				</tr>
				<tr>
					<th>업태</th>
					<td colspan="2"><input type="text" value="" readonly="readonly"></td>
					<th>전화번호</th>
					<td colspan="2"><input type="text" value=""></td>
				</tr>
				<tr>
				</tr>	
				<tr>
					<th>주소</th>
					<td colspan="5"><input type="text" maxlength="5" size="50" value="" readonly="readonly"></td>
				</tr>
				<tr>
					<th>영업시작시간</th>
					<td colspan="2">
						<select class="hour">
						    <!-- 0시부터 23시까지 -->
						    <option value="">시</option>
						    <script>
						        for(var i = 0; i < 24; i++){
						            document.write('<option value="'+ i +'">'+ i +'</option>');
						        }
						    </script>
						</select>
						:
						<select class="minute">
							<!-- 0분부터 59분까지 -->
						    <option value="">분</option>
						    <script>
						        for(var i = 0; i < 60; i++){
						            document.write('<option value="'+ i +'">'+ i +'</option>');
						        }
						    </script>
						</select>
					</td>
					<th>영업종료시간</th>
					<td colspan="2">
						<select class="hour">
						    <!-- 0시부터 23시까지 -->
						    <option value="">시</option>
						    <script>
						        for(var i = 0; i < 24; i++){
						            document.write('<option value="'+ i +'">'+ i +'</option>');
						        }
						    </script>
						</select>
						:
						<select class="minute">
							<!-- 0분부터 59분까지 -->
						    <option value="">분</option>
						    <script>
						        for(var i = 0; i < 60; i++){
						            document.write('<option value="'+ i +'">'+ i +'</option>');
						        }
						    </script>
						</select>
					</td>
				</tr>	
				<tr>
					<th>시간당 최대 테이블</th>
					<td colspan="2"><input type="text" value="10명"></td>
					<th>건당 최대인원</th>
					<td colspan="2"><input type="text" value="20명"></td>
				</tr>
				<tr>
					<th>광고신청 유무</th>
					<td colspan="2">
						<select>
							<option>신청</option>
							<option>미신청</option>
						</select>
					</td>
					<th>광고 단계</th>
					<td colspan="2">
						<select>
							<option>0단계</option>
							<option>1단계</option>
							<option>2단계</option>
							<option>3단계</option>
						</select>
					</td>
				</tr>
				
			</table>
			<br>
			<button type="submit" class="button_olive">신청</button>
			<button type="reset" class="button_grey2">초기화</button>
		</form>
	</section>
</body>
</html>