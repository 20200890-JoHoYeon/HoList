<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="Generator" content="EditPlus®">
		<meta name="Author" content="">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<title>게시글 작성하기</title>
		<link rel="stylesheet" href="style.css">	
		<link rel="stylesheet" href="write_style.css">
	</head>
	<body>
		<h1 class="title"><a href="bd_noti.asp" class="main_logo_a">HOLIST</a></h1>
		<hr>
		<div id="main">
			<div id="main_nav_area">
				<span><h2 class="message">NAV</h2></span>
					<a href="bd_noti.asp">공지사항</a>
					<a href="bd_list.asp">일반게시판</a>
				</div>
				<div id="main_con_area">
				<span><h2 class="message">게시글 작성하기</h2></span>
				<form action="bd_list.asp" method="post">
					<table> 	
						<tr><td class="header">제목</td></tr>
						<tr><td><input type="text" placeholder="제목을 입력하세요" name="title"></td></tr>
						<tr><td class="header">작성자</td></tr>
						<tr><td><input type="text" placeholder="제목을 입력하세요" name="title"></td></tr>
						<tr><td class="header">내용</td></tr>
						<tr><td><textarea placeholder="내용을 입력하세요" name="detail"></textarea></td></tr>
						<tr><td><input type="submit" value="등록" onclick="alert('작성 완료!')"></td></tr>
					</table>
				</form>
			</div>
		</div>
		
	</body>
</html>
