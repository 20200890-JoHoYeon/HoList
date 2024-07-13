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
			<tbody id="tbDataArea">
				
			</tbody>
		</table>

		
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

	console.log("dummyData",dummyData);
	console.log("tbBody",tbBody);
	
	function regFunction() {
		fnCheckMenu('bd_write');
		regModeYN ='Y';
		console.log('-------------------------regModeYN: ',regModeYN);
	}

	function displayData() {
		try {
			let startIndex = (currentPage - 1) * itemsPerPage;
			let endIndex = startIndex + itemsPerPage;
			let displayItems = dummyData.slice(startIndex, endIndex);

			tbBody.innerHTML = "";
			displayItems.forEach(function(data) {
				let row = document.createElement('tr');

				let cell1 = document.createElement('td');
				cell1.textContent = data['번호'];
				row.appendChild(cell1);

				let cell2 = document.createElement('td');
				let titleLink = document.createElement('span');
				titleLink.textContent = data['제목'];

				titleLink.addEventListener('click', function() {
					let postId = data['번호'];
					localStorage.setItem('postId', postId);
					console.log('클릭된 게시물 번호:', postId);
					fnCheckMenu('bd_view');
				});

				cell2.appendChild(titleLink);
				row.appendChild(cell2);

				let cell3 = document.createElement('td');
				cell3.textContent = data['작성자'];
				row.appendChild(cell3);

				let cell4 = document.createElement('td');
				cell4.textContent = data['작성일'];
				row.appendChild(cell4);

				tbBody.appendChild(row);
			});
		} catch (error) {
			console.error(error);
		}
	}

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
				displayData();
			}
		});

		nextBtn.addEventListener('click', function(event) {

			if (currentPage < Math.ceil(dummyData.length / itemsPerPage)) {
				currentPage++;
				displayData();
			}
		});
	}


	displayData();
	setupPagination();

</script>