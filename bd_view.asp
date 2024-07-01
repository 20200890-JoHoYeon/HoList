
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="Generator" content="EditPlus®">
		<meta name="Author" content="">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<title>게시글 상세조회</title>
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
				<span><h2 class="message">게시글 상세조회</h2></span>
				<form action="bd_edit.asp" method="post" accept-charset="utf-8">
					<table> 	
						<tr><td class="header">제목</td></tr>
						<tr><td><input type="text" name="title" value="조회된 테스트 내용입니다." readonly></td></tr>
						<tr><td class="header">작성자</td></tr>
						<tr><td><input type="text" name="title" value="조회된 테스트 내용입니다." readonly></td></tr>
						<tr><td class="header">내용</td></tr>
						<tr><td><textarea name="detail" readonly>조회된 테스트 내용입니다.</textarea></td></tr>
						<tr><td><input type="submit" value="수정"></td></tr>
					</table>
				</form>
			</div>
		</div>
		
	</body>
</html>
