<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="Generator" content="EditPlus®">
		<meta name="Author" content="">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<title>게시글 상세조회</title>
		<link rel="stylesheet" href="/board/css/style.css">	
		<link rel="stylesheet" href="/board/css/write_style.css">
		<script src="/board/js/js_bd_dummyData.js"></script>
		<script src="/board/js/js_bd_view.js"></script>
	</head>
	<body>
		<!-- #include virtual = "/board/DTD/main_nav.asp" --> 
		<div id="main">
			<!-- #include virtual = "/board/DTD/main_side_nav.asp" -->
				<div id="main_con_area">
				<span><h2 class="message">게시글 상세조회</h2></span>
				
					<table>
						
						<tr>
							<tr><td class="header">제목</td><td><input type="text" name="title" class="view_input" value="조회된 테스트 내용입니다." readonly></td></tr>

							<tr><td class="header">날짜</td><td><input type="text" name="date" class="view_input" value="조회된 테스트 내용입니다." readonly></td></tr>	
						</tr>
						<tr><td class="header">작성자</td><td><input type="text" name="writer" class="view_input" value="조회된 테스트 내용입니다." readonly></td></tr>
						<tr></tr>
						<tr><td class="header">내용</td><td><textarea name="detail" readonly>조회된 테스트 내용입니다.</textarea></td></tr>
						<tr>
							<td colspan="2" class="write_table_area">		
								<div class="button-container">
									<input class="gray_btn" type="button" value="취소" onclick="cancelFunction()">
									<div>
										<input class="gray_btn" type="button" value="수정" onclick="regFunction()">
										<input class="gray_btn" type="button" value="삭제" onclick="deleteFunction()">								
									</div>
									
								</div>	
							</td>
						</tr>		
					</table>
				
			</div>
		</div>
	</body>
</html>
