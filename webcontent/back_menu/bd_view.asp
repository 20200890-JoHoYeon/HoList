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

				'postId	=	Request.QueryString("seq")
					
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


				'게시글 수정일에 문자열 추가하여 출력하기
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
				Set Rs = Nothing 
			%>
			</table>
		</div>
		<br/>
		<div class="table-responsive">
		<!-- 게시글 덧글 조회(추가로 토탈 댓글 카운트도 SELECT) -->
		<%	
			commentRecordsSQL = "SELECT Seq, writeName, regDate, modDate, tailContent, " & _
								"(SELECT COUNT(*) FROM tbl_board_tail WHERE bd_Seq = " & postId & ") AS TotalComment " & _
								"FROM tbl_board_tail " & _
								"WHERE bd_Seq =" &postId

			Set RsComment = Server.CreateObject("ADODB.Recordset")
				RsComment.Open commentRecordsSQL, conn, 0, 1, adCmdText

				TotalComment = 0
				If (CInt(RsComment("TotalComment"))) Then 	
					TotalComment = RsComment("TotalComment")		
				END IF

		%>
			<table>
				<tr>
					<td colspan="2">		
						<div class="button-container">
						<span><h2 class="message">게시글 덧글란</h2></span>
							
							<div>
								<span class="bd_view_btn">COUNT</span>
								<span class="bd_view_btn bd_view_delete_btn"><%= TotalComment %></span>								
							</div>
						</div>	
					</td>
				</tr>
				<tr>
					<td colspan="2">	
						
						<div class="message_noti bd_comment_list_area" id="commentList">
							
							<%
								If RsComment.EOF Then 
									%>
										<div class="comment">댓글이 없습니다.</div>
										<br><br>
									<%
								Else 
									Do Until RsComment.EOF
										'댓글 수정일에 문자열 추가하여 출력하기
										Dim tail_seq, tail_mod_date
								
										tail_mod_date =" (최종 수정일: " & Trim(RsComment("modDate")) & ")"
										%>
											<div class="button-container">
												<span><%= Trim(RsComment("writeName")) %></span> 
													<input class="bd_view_btn bd_view_delete_btn" type="button" value="삭제" onclick="deleteCommentFunction(<%= Trim(RsComment("Seq")) %>)">
											</div>
											<span><%= Trim(RsComment("regDate")) %></span>
											<span><%= tail_mod_date %></span>
											<div class="comment"><%= Trim(RsComment("tailContent"))%></div>
											<br><br>
										<%
										RsComment.MoveNext
									Loop 
								End If 
							%>
							
						</div>
	
						<div id="main_con_area_notis ">
							<div class="main_con_area_noti" id="introduction">
								<h2 class="message_noti">덧글 작성란</h2><br>
								<div class="message_noti bd_view_comment_area">
									<input id="txtWriteId" type="hidden" name="writeId"  value="1">
									<input id="txtwriteName" placeholder="작성자" class="multiply_input bd_view_comment_textarea" onkeydown="handleKeyDown(event)" type="text" value=""  name="#txtWriter"></input>
									<textarea id="txtMessage" placeholder= "댓글을 입력해주세요." class="multiply_input multiply_input_long bd_view_comment_textarea" onkeydown="handleKeyDown(event)" type="text" name="tailContent"></textarea>
									<input class="star_btn bd_view_comment_btn" id="add_comment_btn" type="button" onclick="fnAddComment()" value="작성">
								</div><br><br>
							</div><br>
						</div><br><br>
					</td>
				</tr>
			</table>

		<%
			
			RsComment.Close
			Set RsComment = Nothing
		%>
		</div>
    </div>	
</div>

<script>
	//함수: 쿠키 불러오는 함수
	function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';')[0];
    }
	//함수: 게시글 상세 조회 취소 클릭 시 fnCheckMenu함수(default.asp 위치)를 통해 (리스트 페이지로 이동)
    function cancelFunction() {
        fnCheckMenu('bd_list');
    }

    function editFunction() {
		document.cookie = "regModeYN=" + 'N' + "; path=/";
        fnCheckMenu('bd_write');
    }
	//함수: 게시글 삭제
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

	//함수: 게시글 댓글 삭제
	function deleteCommentFunction(tailSeq) {
		if (confirm("이 댓글을 삭제하시겠습니까?")) {
			// AJAX를 사용하여 서버에 댓글 삭제 요청 보내기
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "/board/webcontent/back_menu/bd_comment_action.asp", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
					alert("댓글이 삭제되었습니다.");
					fnCheckMenu('bd_view');
				} else if (this.readyState === XMLHttpRequest.DONE && this.status !== 200) {
					alert("댓글 삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
				}
			}
			 xhr.send("regModeYN=CD&tailSeq=" + encodeURIComponent(tailSeq));
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

	//함수: 게시글 덧글 작성
	function fnAddComment() {
		let postId = getCookie('PostId');

		writeId = document.querySelector('#txtWriteId').value;
		writeName = document.querySelector('#txtwriteName').value;
		tailContent = document.querySelector('#txtMessage').value;
		

		if (writeName === "") {
			alert("작성자를 입력해주세요.");
			document.querySelector('#txtwriteName').focus();
			return false;
		} else if (tailContent === "") {
			alert("댓글을 입력해주세요.");
			document.querySelector('#txtMessage').focus();
			return false;
		}

		if (confirm("덧글을 작성하시겠습니까?")) {
			// AJAX를 사용하여 덧글 작성 요청 보내기   
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "/board/webcontent/back_menu/bd_comment_action.asp", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
					alert("덧글이 등록되었습니다.");
					fnCheckMenu('bd_view');
				} else if (this.readyState === XMLHttpRequest.DONE && this.status !== 200) {
					alert("댓글 등록 중 오류가 발생했습니다. 다시 시도해주세요.");
				}
			}
			let data = "regModeYN=CY" + "&postId=" + postId + 
				   "&tailContent=" + encodeURIComponent(tailContent) + 
				   "&writeId=" + encodeURIComponent(writeId) + "&writeName=" + encodeURIComponent(writeName);
			xhr.send(data);
		}
	}
</script>

<%
	Set Conn = Nothing 
%>
