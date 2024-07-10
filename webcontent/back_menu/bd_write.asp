<div id="main_con_area_notis">
	<div class="main_con_area_noti">
		<span><h2 id="form_title" class="message">게시글 작성하기</h2></span>
		<form action="bd_list.asp" method="post" accept-charset="utf-8" onsubmit="return regFunction();">
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
							<input class="gray_btn" type="submit" name="reg_submit"  value="수정">
						</div>	
					</td>
				</tr>		
			</table>
		</form>
	</div>
</div>
<script src="/board/js/js_bd_write.js"></script>