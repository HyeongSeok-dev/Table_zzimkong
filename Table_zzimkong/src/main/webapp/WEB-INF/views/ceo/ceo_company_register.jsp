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
<body>
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>신규 입점 신청</h3></span>
			</div>
		</div>
		<div class="text_inner">
			<form action="" method="post" name="ceoComForm">
				<table>
					<tr>
						<th>사업자등록번호</th>
						<td colspan="5">
							<div>
								<input type="search" name="comNum" placeholder="사업자등록번호를 입력해 주세요." id="comNumText">
								<button type="submit" class="button_olive">번호찾기</button>
							</div>	
						</td>
					</tr>
					<tr>
						<th>상호명</th>
						<td colspan="2"><input type="text" name="comName" value="" readonly="readonly"></td>
						<th>대표자명</th>
						<td colspan="2"><input type="text" name="ceoName" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<th>업태</th>
						<td colspan="2"><input type="text" name="comState" value="" readonly="readonly"></td>
						<th>전화번호</th>
						<td colspan="2"><input type="text" name="comPhoneNum" value=""></td>
					</tr>
					<tr>
					</tr>	
					<tr>
						<th>주소</th>
						<td colspan="5">
						<input type="text" name="comAddress" maxlength="5" size="50" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<th>영업시작시간</th>
						<td colspan="2">
							<select class="hour" name="openHour">
							    <!-- 0시부터 23시까지 -->
							    <option value="">시</option>
							    <script type="text/javascript">
							        for(var i = 0; i < 24; i++){
							            document.write('<option value="'+ i +'">'+ i +'</option>');
							        }
							    </script>
							</select>
							:
							<select class="minute" name="openMin">
								<!-- 0분부터 59분까지 -->
							    <option value="">분</option>
							    <script type="text/javascript">
							        for(var i = 0; i < 60; i++){
							            document.write('<option value="'+ i +'">'+ i +'</option>');
							        }
							    </script>
							</select>
						</td>
						<th>영업종료시간</th>
						<td colspan="2">
							<select class="hour" name="closeHour">
							    <!-- 0시부터 23시까지 -->
							    <option value="">시</option>
							    <script type="text/javascript">
							        for(var i = 0; i < 24; i++){
							            document.write('<option value="'+ i +'">'+ i +'</option>');
							        }
							    </script>
							</select>
							:
							<select class="minute" name="closeMin">
								<!-- 0분부터 59분까지 -->
							    <option value="">분</option>
							    <script type="text/javascript">
							        for(var i = 0; i < 60; i++){
							            document.write('<option value="'+ i +'">'+ i +'</option>');
							        }
							    </script>
							</select>
						</td>
					</tr>	
					<tr>
						<th>시간당 최대 인원</th>
						<td colspan="2"><input name="perHourMaxTable" type="text" value="10명"></td>
						<th>건당 최대 인원</th>
						<td colspan="2"><input name="perResMaxPerson" type="text" value="20명"></td>
					</tr>
					<tr>
						<th>광고신청 유무</th>
						<td colspan="2">
							<select name="adRegister">
								<option name="application" value="신청">신청</option>
								<option name="unapplied" value="미신청">미신청</option>
							</select>
						</td>
						<th>광고 단계</th>
						<td colspan="2">
							<select name="adLevel">
								<option value="0단계">0단계</option>
								<option value="1단계">1단계</option>
								<option value="2단계">2단계</option>
								<option value="3단계">3단계</option>
							</select>
						</td>
					</tr>
				</table>
				<br><br>
			<button type="submit" class="button_olive">신청</button>
			<button type="reset" class="button_grey2">초기화</button>
			</form>
		</div>	
	</section>
</body>
</html>