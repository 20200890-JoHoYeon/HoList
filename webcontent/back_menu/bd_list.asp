<!-- #include virtual = "/import/dbOpen.asp"-->

<div id="main_con_area_notis">
	<div class="main_con_area_noti">
		<span><h2 class="message">게시글 리스트</h2></span>
			
	<%
		Set Rs = Server.CreateObject("ADODB.Recordset")			
	%>
		<div class="table-responsive">
			<table>
				<thead>
					<tr>
						<td>번호</td>
						<td class="tb_title">제목</td>
						<td class="tb_write">작성자</td>
						<td>등록일</td>
						<td>수정일</td>
					</tr>
				</thead>
				<tbody id="tbDataArea">
					<%
						SQL = "select   Seq, Title, WriteId, writeName, RegDate, modDate "
						SQL = SQL & "  from tbl_board "
						SQL = SQL & " order by Seq desc"	

						Rs.Open SQL, conn, 0, 1, adCmdText				
						If Rs.EOF Or Rs.BOF Then 
								%>
									<tr>
										<td colspan="6">데이터가 없습니다.</td>
									</tr>
								<%
							Else 
								Do Until Rs.EOF		
								%>
								<tr onclick="fn_handle_title_Click('<%= Trim(Rs("Seq")) %>')">
									<td><%= Trim(Rs("Seq")) %></td>
									<td class="tb_title"><%= Trim(Rs("Title")) %></td>
									<td><%= Trim(Rs("writeName")) %></td>
									<td><%= FormatDateTime(CDate(Rs("RegDate")), vbShortDate) %></td>
									<td><%= FormatDateTime(CDate(Rs("modDate")), vbShortDate) %></td>
								</tr>				
								<%
								Rs.MoveNext
								Loop 
						End If 

						Rs.close

					%>
				</tbody>
			</table>
		</div>

		<!-- Pagination controls -->
		<div id="pagination">
			<button id="prevBtn" class="gray_btn">이전</button>
			<button id="nextBtn" class="gray_btn">다음</button>
			<!-- 게시글 작성 버튼 추후 하나만 남길 예정
			<button class="gray_btn" onclick="fnCheckMenu('bd_write')">게시글 작성</button>-->
		</div>

		<button class="reg_btn"onclick="regFunction()">게시글 작성</button>
	</div>
</div>
<script>

		
	itemsPerPage = 10; // 페이지 당 표시할 게시물 수
	currentPage = 1; // 현재 페이지 번호
	tbBody = document.getElementById('tbDataArea');

	console.log('itemsPerPage:', itemsPerPage);
	console.log('currentPage:', currentPage);

	console.log("tbBody",tbBody);
	
	function regFunction() {
		document.cookie = "regModeYN=" + 'Y' + "; path=/";
		fnCheckMenu('bd_write');
		
	}
	function fn_handle_title_Click(value) {
		document.cookie = "PostId=" + value + "; path=/";
		console.log('클릭된 게시물 번호:', value);
		fnCheckMenu('bd_view');
	}
	/*
	function setupPagination() {
		let prevBtn = document.getElementById('prevBtn');
		let nextBtn = document.getElementById('nextBtn');

		if (!prevBtn || !nextBtn) {
			console.error("이전 또는 다음 버튼 요소를 찾을 수 없습니다.");
			return;
		}

		prevBtn.addEventListener('click', function(event) {
			
			if (currentPage > 1) {
				currentPage--;
				
			}
		});

		nextBtn.addEventListener('click', function(event) {

			if (currentPage < Math.ceil(dummyData.length / itemsPerPage)) {

			}
		});
	}



	setupPagination();
	*/
</script>
<%
	Set Rs = Nothing			' DB 의 Record 를 가져오는 객체 닫음 (메모리 close)
	Set Conn = Nothing			' DB Open 을 닫아줌 (메모리 close)
%>