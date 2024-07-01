<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="Generator" content="EditPlus®">
		<meta name="Author" content="">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<title>게시글 리스트</title>
		<link rel="stylesheet" href="style.css">	
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
				<span><h2 class="message">게시글 리스트</h2></span>
				<table id="boardTable">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody id="boardTableBody">
					</tbody>
				</table>
			</div>
			<button class="reg_btn"onclick="location.href='bd_write.asp'">작성</button>
		</div>
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				var dummyData = [
					{ 번호: 1, 제목: '첫 번째 게시글 제목', 작성자: '작성자1', 작성일: '2024-07-01' },
					{ 번호: 2, 제목: '두 번째 게시글 제목', 작성자: '작성자2', 작성일: '2024-07-02' },
					{ 번호: 3, 제목: '세 번째 게시글 제목', 작성자: '작성자3', 작성일: '2024-07-03' },

				];

				var tbody = document.getElementById('boardTableBody');
				dummyData.forEach(function(data) {
					var row = document.createElement('tr');


					var cell1 = document.createElement('td');
					cell1.textContent = data['번호'];
					row.appendChild(cell1);

					var cell2 = document.createElement('td');
					var link = document.createElement('a');
					link.href = 'bd_view.asp';
					link.textContent = data['제목'];
					cell2.appendChild(link);
					row.appendChild(cell2);


					var cell3 = document.createElement('td');
					cell3.textContent = data['작성자'];
					row.appendChild(cell3);


					var cell4 = document.createElement('td');
					cell4.textContent = data['작성일'];
					row.appendChild(cell4);


					tbody.appendChild(row);
				});
			});

		</script> 
	</body>
</html>
