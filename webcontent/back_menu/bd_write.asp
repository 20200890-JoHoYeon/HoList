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
		<script>
			function cancelFunction() {
				window.location.href = 'bd_list.asp'; // 취소 버튼 클릭 시 bd_list.asp 페이지로 이동
			}
			document.addEventListener('DOMContentLoaded', function() {
			var urlParams = new URLSearchParams(window.location.search);
			postId = urlParams.get('id');

			console.log("postId:", postId);

			

			// 예시로 사용할 더미 데이터
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

			// URL에서 id 값을 가져옵니다.
			
			
			

			// postId로 해당 게시물 데이터를 찾습니다.
			var postData = dummyData.find(function(data) {
				return data['번호'] == postId;
			});

			// 만약 해당 게시물 데이터를 찾았다면, 폼에 데이터를 채웁니다.
			if (postData) {
				document.querySelector('input[name="title"]').value = postData['제목'];
				document.querySelector('input[name="date"]').value = postData['작성일'];
				document.querySelector('input[name="writer"]').value = postData['작성자'];
				document.querySelector('textarea[name="detail"]').value = postData['내용'];
			}
			

			// h2 태그의 텍스트를 변경하는 부분
			var titleElement = document.getElementById("form_title");
			var btnElement = document.querySelector('input[name="reg_submit"]');
			if (postId != null) {
				titleElement.textContent = "게시글 수정하기";
				btnElement.value="완료"

			} else {
				titleElement.textContent = "게시글 작성하기";
				btnElement.value="등록"
			}
		});

		</script> 
	</head>
	<body>
		<!-- #include virtual = "/board/DTD/main_nav.asp" --> 
		<div id="main">
			<!-- #include virtual = "/board/DTD/main_side_nav.asp" -->
				<div id="main_con_area">
				<span><h2 id="form_title" class="message">게시글 작성하기</h2></span>
				<form action="bd_list.asp" method="post" accept-charset="utf-8">
					<table>
						<tr>
							<tr><td class="header">제목</td><td><input type="text" name="title" value=""></td></tr>					
							<tr><td class="header">날짜</td><td><input type="text" name="date" value=""></td></tr>
							
						</tr>
						<tr><td class="header">작성자</td><td><input type="text" name="writer" value=""></td></tr>
						<tr></tr>
						<tr><td class="header">내용</td><td><textarea name="detail"></textarea></td></tr>
						<tr>
							<td colspan="2" class="write_table_area">		
								<div class="button-container">
									<input class="gray_btn" type="submit" name="reg_submit" value="수정">
									<input class="gray_btn" type="button" value="취소" onclick="cancelFunction()">
								</div>	
							</td>
						</tr>		
					</table>
				</form>
			</div>
		</div>
		
	</body>
</html>