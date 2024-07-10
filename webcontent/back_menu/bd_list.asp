<div id="main_con_area_notis">
	<div class="main_con_area_noti">
		<span><h2 class="message">게시글 리스트</h2></span>
		<table id="boardTable">
			<thead>
				<tr>
					<th>번호</th>
					<th class="tb_title">제목</th>
					<th class="tb_write">작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="boardTableBody">

			</tbody>
		</table>

		
		<!-- Pagination controls -->
		<div id="pagination">
			<button id="prevBtn" class="gray_btn">이전</button>
			<button id="nextBtn" class="gray_btn">다음</button>
			<!-- 게시글 작성 버튼 추후 하나만 남길 예정-->
			<button class="gray_btn" onclick="fnCheckMenu('bd_write')">게시글 작성</button>
		</div>

		<!-- 게시글 작성 버튼 추후 하나만 남길 예정-->
		<button class="reg_btn"onclick="fnCheckMenu('bd_write')">게시글 작성</button>
	</div>
</div>
<script src="/board/js/js_bd_list.js"></script>