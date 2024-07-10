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
							<input class="gray_btn" type="button" value="수정" onclick="regFunction()">
							<input class="gray_btn" type="button" value="삭제" onclick="deleteFunction()">								
						</div>
					</div>	
				</td>
			</tr>		
		</table>
	</div>
</div>
<script src="/board/js/js_bd_view.js"></script>
				
