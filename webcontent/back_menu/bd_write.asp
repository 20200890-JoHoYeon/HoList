<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="Generator" content="EditPlus®">
		<meta name="Author" content="">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<title>게시글 작성하기</title>
		<link rel="stylesheet" href="/board/css/style.css">	
		<link rel="stylesheet" href="/board/css/write_style.css">
		<script src="/board/js/js_bd_dummyData.js"></script>
		<script src="/board/js/js_bd_write.js"></script>
	</head>
	<body>
		<!-- #include virtual = "/board/DTD/main_nav.asp" --> 
		<div id="main">
			<!-- #include virtual = "/board/DTD/main_side_nav.asp" -->
				<div id="main_con_area">
				<span><h2 id="form_title" class="message">게시글 작성하기</h2></span>
				<form action="bd_list.asp" method="post" accept-charset="utf-8" onsubmit="return regFunction();">
					<table>
						<tr>
							<tr><td class="header">제목</td><td><input id="txtTitle" type="text" name="title" placeholder="제목을 입력해주세요."  value=""></td></tr>					
							<tr id="date_tr"><td class="header">날짜</td><td><input type="text" name="date" value=""></td></tr>				
						</tr>
						<tr><td class="header">작성자</td><td><input id="txtWriter" type="text" name="writer" placeholder="작성자를 입력해주세요." value=""></td></tr>
						<tr></tr>
						<tr><td class="header">내용</td><td><textarea id="txtMessage" name="detail" placeholder="내용을 입력해주세요." ></textarea></td></tr>
						<tr>
							<td colspan="2" class="write_table_area">		
								<div class="button-container">
									<input class="gray_btn" type="button" value="취소" onclick="cancelFunction()">
									<input class="gray_btn" type="submit" name="reg_submit"  value="수정">
								</div>	
							</td>
						</tr>		
					</table>
				</form>
			</div>
		</div>
		
	</body>
</html>
