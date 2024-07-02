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
		<!-- #include virtual = "/board/bd_DTD/bd_nav.asp" --> 
		<div id="main">
			<!-- #include virtual = "/board/bd_DTD/bd_side_nav.asp" --> 
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
			<button class="reg_btn"onclick="location.href='bd_write.asp'">게시글 작성</button>
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

					// 클릭 이벤트 리스너 추가
					link.addEventListener('click', function(event) {
						event.preventDefault(); // 기본 동작(링크 이동) 방지

						var postId = data['번호']; // 클릭된 게시물의 번호 값
						console.log('클릭된 게시물 번호:', postId);

						// 여기서 postId를 사용하여 필요한 처리를 할 수 있음
						// 예: 조회 페이지로 번호 값을 전송하는 등의 작업을 수행할 수 있음

						// 예시: 다른 페이지로 전송하는 방법
						window.location.href = 'bd_view.asp?id=' + postId;
					});
				});
			});
		</script> 
	</body>
</html>
