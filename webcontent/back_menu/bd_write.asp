<!-- #include virtual = "/import/dbOpen.asp" -->

<div id="main_con_area_notis">
	<div class="main_con_area_noti">
		<span><h2 id="form_title" class="message">게시글 작성하기</h2></span>
		<div class="table-responsive">
			<table>
			<%
				'함수: 수정 기능 사용 시 데이터 사전조회 
				Function GetPostData(conn, regModeYN, postId)
					Dim Rs, title, modDate, writeName, content, SQL

					If regModeYN = "N" Then
						SQL = "SELECT Title, modDate, writeName, content FROM tbl_board WHERE Seq = " & postId
						Set Rs = Server.CreateObject("ADODB.Recordset")
						Rs.Open SQL, conn, 0, 1, adCmdText
						
						title = Trim(Rs("Title"))
						modDate = Trim(Rs("modDate"))
						writeName = Trim(Rs("writeName"))
						content = Trim(Rs("content"))
						
						Rs.Close
						
						Else
							title = ""
							modDate = ""
							writeName = ""
							content = ""
					End If
					
					GetPostData = Array(title, modDate, writeName, content)
				End Function
				

				' Main code block
				Dim postId, regModeYN, title, modDate, writeName, content
				regModeYN = Request.Cookies("regModeYN")
				If regModeYN = "N" Then
					postId = Request.Cookies("PostId")
					Else
					postId = ""
				End If
				Dim postData
				postData = GetPostData(conn, regModeYN, postId)

				title = postData(0)
				modDate = postData(1)
				writeName = postData(2)
				content = postData(3)
			%>

				<tr>
					<td class="header">제목</td>
					<td>
						<input class="bd_input" id="txtTitle" type="text" name="title" placeholder="제목을 입력해주세요." 
							   value="<%= title %>">
					</td>
				</tr>
				<tr id="date_tr">
					<td class="header">날짜</td>
					<td><input class="bd_view_input" type="text" name="date" 
							   value="<%= modDate %>" readonly></td>
				</tr>
				<tr>
					<td class="header">작성자</td>
					<td>
						<input id="txtWriteId" type="hidden" name="writeId" placeholder="작성자를 입력해주세요." 
							   value="1">
						<input class="bd_input" id="txtWriter" type="text" name="writer" placeholder="작성자를 입력해주세요." 
							   value="<%= writeName %>">
					</td>
				</tr>
				<tr>
					<td class="header">내용</td>
					<td><textarea class="bd_input bd_input_con" id="txtMessage" name="detail" placeholder="내용을 입력해주세요."><%= content %></textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="write_table_area">		
						<div class="button-container">
							<input class="gray_btn" type="button" value="취소" onclick="cancelFunction()">
							<input class="gray_btn" type="button" name="reg_submit" value="수정" onclick="regPostFunction()">
						</div>	
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

    regModeYN = getCookie('regModeYN');
    console.log(regModeYN);

    function cancelFunction() {
        if (regModeYN == 'Y') {
            if (confirm("등록을 취소 하시겠습니까?") == false) return false;
        }  
		else if (regModeYN == 'N') {
            if (confirm("수정을 취소 하시겠습니까?") == false) return false;
        }
        fnCheckMenu('bd_list'); // Redirect to bd_list.asp
    }

	function regPostFunction() {
		let title = document.querySelector('#txtTitle').value;
		let writeId = document.querySelector('#txtWriteId').value;
		let writer = document.querySelector('#txtWriter').value;
		let content = document.querySelector('#txtMessage').value;

		if (title === "") {
			alert("제목을 입력해주세요.");
			document.querySelector('#txtTitle').focus();
			return false;
		} else if (writer === "") {
			alert("작성자를 입력해주세요.");
			document.querySelector('#txtWriter').focus();
			return false;
		} else if (content === "") {
			alert("내용을 입력해주세요.");
			document.querySelector('#txtMessage').focus();
			return false;
		}
		// AJAX를 사용하여 서버에 데이터 전송
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "/board/webcontent/back_menu/bd_action.asp", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
				if (regModeYN == 'Y') {
					alert("등록되었습니다.");
					fnCheckMenu('bd_list');
				}  
				else if (regModeYN == 'N') {
					alert("수정하였습니다.");
					fnCheckMenu('bd_view');
				}
				
			} else if (this.readyState === XMLHttpRequest.DONE && this.status !== 200) {
				alert("데이터 전송 중 오류가 발생했습니다. 다시 시도해주세요.");
			}
		}
				let data = "regModeYN=" + regModeYN + "&postId=" + (regModeYN == 'N' ? getCookie('PostId') : "") + 
				   "&title=" + encodeURIComponent(title) + "&content=" + encodeURIComponent(content) + 
				   "&writeId=" + encodeURIComponent(writeId) + "&writer=" + encodeURIComponent(writer);
		xhr.send(data);
	}


	

    if (regModeYN == 'N') {
		selected_postId = getCookie('PostId');
		console.log(selected_postId);
    }  
	else if (regModeYN == 'Y') {
        document.querySelector('#date_tr').style.display = 'none';
    }
	 document.querySelector('#date_tr').style.outline = 'none';

    // Update the title and button text
    titleElement = document.getElementById("form_title");
    btnElement = document.querySelector('input[name="reg_submit"]');
    if (regModeYN == 'Y') {
        titleElement.textContent = "게시글 작성하기";
        btnElement.value = "등록";
    } 
	else if (regModeYN == 'N') {
        titleElement.textContent = "게시글 수정하기";
        btnElement.value = "완료";
    }
</script>

<%
	Set Rs = Nothing
	Set Conn = Nothing
%>
