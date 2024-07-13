<div id="main_con_area_notis">
	<div class="main_con_area_noti">
		<span><h2 id="form_title" class="message">게시글 작성하기</h2></span>
		
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
							<input class="gray_btn" type="button" name="reg_submit" value="수정" onclick="regPsotFunction()">
						</div>	
					</td>
				</tr>		
			</table>

	</div>
</div>
<script>

	function cancelFunction() {
		if (regModeYN == 'Y') {
			if (confirm("등록을 취소 하시겠습니까?") == false) return false;
		} else {
			if (confirm("수정을 취소 하시겠습니까?") == false) return false;
		}
		fnCheckMenu('bd_list');// 취소 버튼 클릭 시 bd_list.asp 페이지로 이동
	}

	function regPsotFunction() {
		if (document.querySelector('#txtTitle').value === "") {
			alert("제목을 입력해주세요.");
			document.querySelector('#txtTitle').focus();
			return false;
		} else if (document.querySelector('#txtWriter').value === "") {
			alert("작성자를 입력해주세요.");
			document.querySelector('#txtWriter').focus();
			return false;
		} else if (document.querySelector('#txtMessage').value === "") {
			alert("내용을 입력해주세요.");
			document.querySelector('#txtMessage').focus();
			return false;
		}
		
		if (regModeYN == 'Y') {
			alert("등록되었습니다.");
		} else {
			alert("수정하였습니다.");
		}
		console.log(document.querySelector('#txtTitle').value);
		fnCheckMenu('bd_list');
	}

		if (regModeYN == 'N') {
			selectPostId = localStorage.getItem('postId');
			console.log('Stored selectPostId:', selectPostId);

		
			postData = dummyData.find(function(data) {
				return data['번호'] == selectPostId;
			});
			console.log('postData');

			
			if (postData) {

				document.querySelector('input[name="title"]').value = postData['제목'];
				document.querySelector('input[name="date"]').value = postData['작성일'];
				document.querySelector('input[name="writer"]').value = postData['작성자'];
				document.querySelector('textarea[name="detail"]').value = postData['내용'];
				document.querySelector('input[name="date"]').style.border = 'none';
				document.querySelector('input[name="date"]').setAttribute('readonly', true);
			}
		}
		else {
			document.querySelector('#date_tr').style.display = 'none';
		}

		// h2 태그의 텍스트를 변경하는 부분
		titleElement = document.getElementById("form_title");
		btnElement = document.querySelector('input[name="reg_submit"]');
		if (regModeYN == 'Y') {
			titleElement.textContent = "게시글 작성하기";
			btnElement.value="등록"

		} else {
			titleElement.textContent = "게시글 수정하기";
			btnElement.value="완료"
		}


</script>