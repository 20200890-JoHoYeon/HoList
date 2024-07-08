<div id="main_con_area_notis">
	<div class="main_con_area_noti">
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
			<button id="prevBtn">이전</button>
			<button id="nextBtn">다음</button>
			<button id="nextBtn" onclick="fnCheckMenu('bd_write')">게시글 작성</button>
		</div>

		<!-- Pagination controls -->
		<button class="reg_btn"onclick="fnCheckMenu('bd_write')">게시글 작성</button>

	</div>
</div>
