<!-- #include virtual = "/import/dbOpen.asp" -->

<div id="main_con_area_notis">
    <div class="main_con_area_noti">
        
		<div class="table-responsive">
			<table>
				<tr>
					<td colspan="2">		
						<div class="button-container">
						<span><h2 class="message">게시글 상세조회</h2></span>
							
							<div>
								<input class="bd_view_btn" type="button" value="이전" onclick="cancelFunction()">
								<input class="bd_view_btn" type="button" value="수정" onclick="editFunction()">
								<input class="bd_view_btn bd_view_delete_btn" type="button" value="삭제" onclick="deleteFunction()">								
							</div>
						</div>	
					</td>
				</tr>
			<%
				'Rs로 디비를 연결, postId로 클릭된 게시글 Seq번호 담긴 쿠키 불러오기 
				Dim Rs, postId
				postId = Request.Cookies("PostId")
					
				SQL = "SELECT Title, regDate, modDate, writeName, content FROM tbl_board WHERE Seq = " & postId
					'데이터 테스트 출력
					'If postId <> "" Then
					'		Response.Write("쿠키에서 읽은 사용자 이름: " & postId)
					'	Else
					'		Response.Write("사용자 이름 쿠키가 존재하지 않습니다.")
					'End If
					'Response.Write("<div>Post ID: " & postId & "</div>")
					'Response.Write("<div>Post ID: " & SQL & "</div>")
					'Set Rs = conn.Execute(SQL)
				Set Rs = Server.CreateObject("ADODB.Recordset")
				Rs.Open SQL, conn, 0, 1, adCmdText
				
				Dim mod_date 
				mod_date =" (최종 수정일: " & Trim(Rs("modDate")) & ")"
				
				If Not Rs.EOF Then
				
			%>
					<tr>
						<td class="header">제목</td>
						<td><input class="bd_view_input" type="text" name="title" value="<%= Trim(Rs("Title")) %>" readonly></td>
					</tr>
					<tr>
						<td class="header">날짜</td>
						<td class="bd_view_input_mod_date_area">
							<%= Trim(Rs("regDate")) %>
							<span class="bd_view_input_mod_date"><%= mod_date %></span>
						</td>
					</tr>
					<tr>
						<td class="header">작성자</td>
						<td><input class="bd_view_input" type="text" name="writer"  value="<%= Trim(Rs("writeName")) %>" readonly></td>
					</tr>
					<tr>
						<td class="header">내용</td>
						<td><textarea class="bd_view_input bd_input_con bd_view_input_con " name="detail" readonly><%= Trim(Rs("content")) %></textarea></td>
					</tr>
			<%
				End If
				Rs.Close
			%>
				
			</table>
			<br/>


			<!-- 게시글 덧글 연결 -->
			<table>
				<tr>
					<td colspan="2">		
						<div class="button-container">
						<span><h2 class="message">게시글 덧글란</h2></span>
							
							<div>
								<span class="bd_view_btn">COUNT</span>
								<span class="bd_view_btn bd_view_delete_btn">0</span>								
							</div>
						</div>	
					</td>
				</tr>
				<tr>
					<td colspan="2">	

						<div class="message_noti bd_comment_list_area" id="commentList"> 
						</div>
						<div id="main_con_area_notis ">
							<div class="main_con_area_noti" id="introduction">
								<h2 class="message_noti">덧글 작성란</h2><br>
								<div class="message_noti bd_view_comment_area">
									<textarea class="multiply_input multiply_input_long bd_view_comment_textarea" onkeydown="handleKeyDown(event)" type="text" value="" id="one_value" name="one_value"></textarea>
									<input class="star_btn bd_view_comment_btn" id="add_comment_btn" type="button" onclick="fnAddComment()" value="작성">
								</div><br><br>
							</div><br>
						</div><br><br>
					</td>
				</tr>
			</table>
		</div>
    </div>	
</div>

<script>
	function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';')[0];
    }

    function cancelFunction() {
        fnCheckMenu('bd_list');
    }

    function editFunction() {
		document.cookie = "regModeYN=" + 'N' + "; path=/";
        fnCheckMenu('bd_write');
    }

	function deleteFunction() {
		let postId = getCookie('PostId');
		if (confirm("이 게시글을 삭제하시겠습니까?")) {
			// AJAX를 사용하여 서버에 삭제 요청 보내기
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "/board/webcontent/back_menu/bd_action.asp", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
					alert("게시글이 삭제되었습니다.");
					fnCheckMenu('bd_list');
				} else if (this.readyState === XMLHttpRequest.DONE && this.status !== 200) {
					alert("게시글 삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
				}
			}
			 xhr.send("regModeYN=D&postId=" + encodeURIComponent(postId));
		}
	}

	//함수: 덧글 입력 엔터 키보드 처리
	function handleKeyDown(event) {
		if (event.shiftKey && event.key === "Enter") {
			// Shift + Enter 조합일 때는 기본 동작 방지하지 않음
			return;
		}

		if (event.key === "Enter") {
			event.preventDefault(); // 엔터 키 기본 동작 방지 (폼 제출 방지)
			fnAddComment();
		}
	}
	
	//함수: 덧글 둥록 처리
	function fnAddComment() {
		//작성자 임의로 세션 생성
		let username = "조호연";
		sessionStorage.setItem("username", username);

		let now = new Date();
		let year = now.getFullYear();
		let month = now.getMonth() + 1;
		let date = now.getDate();
		let hours = now.getHours();
		let minutes = now.getMinutes();
		let seconds = now.getSeconds();

		// 시, 분, 초를 두 자리 숫자로 표시하기 위해 필요한 처리
		hours = (hours < 10 ? "0" : "") + hours;
		minutes = (minutes < 10 ? "0" : "") + minutes;
		seconds = (seconds < 10 ? "0" : "") + seconds;   
			 
		 

		// 날짜와 시간 문자열 생성
		dateString = year + "-" + month + "-" + date;
		timeString = hours + ":" + minutes + ":" + seconds;

		let commentInput = document.getElementById("one_value");
		let comment = commentInput.value.trim(); // 앞뒤 공백 제거

		if (comment === "") {
			alert("내용을 입력해주세요.");
			commentInput.focus();
			return;
		}

		let writer = sessionStorage.getItem("username");

		// Create elements for new comment
		let commentElementDiv = document.createElement("div");
		let timeElementDiv = document.createElement("div");
		let writerElementDiv = document.createElement("div");
		let breakElement = document.createElement("br");

		writerElementDiv.textContent = writer;
		timeElementDiv.textContent = dateString + " " + timeString;
		commentElementDiv.textContent = comment;
		commentElementDiv.classList.add("comment");

		// Add elements to comment list
		let commentList = document.getElementById("commentList");
		commentList.appendChild(writerElementDiv);
		commentList.appendChild(timeElementDiv);
		commentList.appendChild(commentElementDiv);
		commentList.appendChild(breakElement);
		commentList.appendChild(breakElement);

		// Clear input field after adding comment
		commentInput.value = "";
		commentInput.focus();
	}

	
</script>

<%
	Set Rs = Nothing 
	Set Conn = Nothing 
%>