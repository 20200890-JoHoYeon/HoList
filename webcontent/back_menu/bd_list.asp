<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="Generator" content="EditPlus®">
		<meta name="Author" content="">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<title>게시글 리스트</title>
		<link rel="stylesheet" href="/board/css/style.css">
		<script src="/board/js/js_bd_dummyData.js"></script>
		<script src="/board/js/js_bd_list.js"></script>
	</head>
	<body>
		<!-- #include virtual = "/board/DTD/main_nav.asp" --> 
		<div id="main">
			<!-- #include virtual = "/board/DTD/main_side_nav.asp" -->
			<div id="main_con_area">
			<span><h2 class="message">게시글 리스트</h2></span>
			<table id="boardTable">
				<thead>
					<tr>
						<th>번호</th>
						<th class="tb_title">제목</th>
						<th class="tb_title">작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody id="boardTableBody">
				</tbody>
			</table>
			<div id="pagination">
                <button id="prevBtn" >이전</button>
                <button id="nextBtn" >다음</button>
            </div>

			<!-- Pagination controls -->
			<button class="reg_btn"onclick="location.href='/board/webcontent/back_menu/bd_write.asp'">게시글 작성</button>
		</div>
	</body>
</html>
