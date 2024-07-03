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
			</div>
			<button class="reg_btn"onclick="location.href='/board/webcontent/back_menu/bd_write.asp'">게시글 작성</button>
		</div>
		<script>
			document.addEventListener('DOMContentLoaded', function() {
					var dummyData = [
						{ 번호: 1, 제목: '첫 번째 게시글 제목', 작성자: '작성자1', 작성일: '2024-07-01', 내용: '첫 번째 게시글 내용입니다.' },
						{ 번호: 2, 제목: '두 번째 게시글 제목', 작성자: '작성자2', 작성일: '2024-07-02', 내용: '두 번째 게시글 내용입니다.' },
						{ 번호: 3, 제목: '세 번째 게시글 제목', 작성자: '작성자3', 작성일: '2024-07-03', 내용: '세 번째 게시글 내용입니다.' },
						{ 번호: 4, 제목: '네 번째 게시글 제목', 작성자: '작성자4', 작성일: '2024-07-04', 내용: '네 번째 게시글 내용입니다.' },
						{ 번호: 5, 제목: '다섯 번째 게시글 제목', 작성자: '작성자5', 작성일: '2024-07-05', 내용: '다섯 번째 게시글 내용입니다.' },
						{ 번호: 6, 제목: '여섯 번째 게시글 제목', 작성자: '작성자6', 작성일: '2024-07-06', 내용: '여섯 번째 게시글 내용입니다.' },
						{ 번호: 7, 제목: '일곱 번째 게시글 제목', 작성자: '작성자7', 작성일: '2024-07-07', 내용: '일곱 번째 게시글 내용입니다.' },
						{ 번호: 8, 제목: '여덟 번째 게시글 제목', 작성자: '작성자8', 작성일: '2024-07-08', 내용: '여덟 번째 게시글 내용입니다.' },
						{ 번호: 9, 제목: '아홉 번째 게시글 제목', 작성자: '작성자9', 작성일: '2024-07-09', 내용: '아홉 번째 게시글 내용입니다.' },
						{ 번호: 10, 제목: '열 번째 게시글 제목', 작성자: '작성자10', 작성일: '2024-07-10', 내용: '열 번째 게시글 내용입니다.' },
						{ 번호: 11, 제목: '열 한 번째 게시글 제목', 작성자: '작성자11', 작성일: '2024-07-11', 내용: '열 한 번째 게시글 내용입니다.' },
						{ 번호: 12, 제목: '열 두 번째 게시글 제목', 작성자: '작성자12', 작성일: '2024-07-12', 내용: '열 두 번째 게시글 내용입니다.' },
						{ 번호: 13, 제목: '열 세 번째 게시글 제목', 작성자: '작성자13', 작성일: '2024-07-13', 내용: '열 세 번째 게시글 내용입니다.' },
						{ 번호: 14, 제목: '열 네 번째 게시글 제목', 작성자: '작성자14', 작성일: '2024-07-14', 내용: '열 네 번째 게시글 내용입니다.' },
						{ 번호: 15, 제목: '열 다섯 번째 게시글 제목', 작성자: '작성자15', 작성일: '2024-07-15', 내용: '열 다섯 번째 게시글 내용입니다.' },
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
						window.location.href = '/board/webcontent/back_menu/bd_view.asp?id=' + postId;
					});
				});
			});
		</script> 
	</body>
</html>
