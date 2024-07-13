<div id="main_con_area_notis">
	<div class="main_con_area_noti">
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
							<input class="gray_btn" type="button" value="수정" onclick="editFunction()">
							<input class="gray_btn" type="button" value="삭제" onclick="deleteFunction()">								
						</div>
					</div>	
				</td>
			</tr>		
		</table>
	</div>
</div>
<script>


	selectPostId = localStorage.getItem('postId');
	console.log('Stored selectPostId:', selectPostId);

	
	postData = dummyData.find(function(data) {
		return data['번호'] == selectPostId;
	});


	console.log('ddd',postData['내용']);

	function fnPostDataPrint() {
		
		if (postData) {
			document.querySelector('input[name="title"]').value = postData['제목'];
			document.querySelector('input[name="date"]').value = postData['작성일'];
			document.querySelector('input[name="writer"]').value = postData['작성자'];
			document.querySelector('textarea[name="detail"]').value = postData['내용'];
			document.querySelector('input[name="title"]').style.border = 'none';
			document.querySelector('input[name="date"]').style.border = 'none';
			document.querySelector('input[name="writer"]').style.border = 'none';
			document.querySelector('textarea[name="detail"]').style.border = 'none';

		}

	}

	fnPostDataPrint();


	function cancelFunction() {
		fnCheckMenu('bd_list');// 취소 버튼 클릭 시 bd_list.asp 페이지로 이동
	}
	function editFunction() {
		fnCheckMenu('bd_write');
		regModeYN ='N';
			console.log('-------------------regModeYN: ',regModeYN);
	}
	function deleteFunction() {	
		if (confirm("삭제하시겠습니까?") == false) return false;
		fnCheckMenu('bd_list');// 취소 버튼 클릭 시 bd_list.asp 페이지로 이동 
	}
</script>