<!-- #include virtual = "/import/dbOpen.asp" -->

<div id="main_con_area_notis">
    <div class="main_con_area_noti ">
        <span><h2 class="message">게시글 리스트</h2></span>
        <%
			currentPage = 1  '현재페이지
            '페이지네이션
            If IsNumeric(currentPage) Then  
				currentPage = CInt(Request.Cookies("currentPage")) '현재페이지
				Else
					currentPage = 1  '현재페이지
            End If
            itemsPerPage = 10 

            ' SQL query for pagination
			SQL = "SELECT * FROM ("
			SQL = SQL & " SELECT ROW_NUMBER() OVER (ORDER BY Seq DESC) AS rowNum, COUNT(Seq) OVER () AS totalCount, "
			SQL = SQL & " Seq, Title, WriteId, writeName, RegDate, modDate "
			SQL = SQL & " FROM tbl_board "
			SQL = SQL & ") AS A "
			SQL = SQL & " WHERE rowNum >= ((" & currentPage & " - 1) * " & itemsPerPage & ") + 1 AND rowNum <= (" & itemsPerPage & " * " & currentPage & ")"

           

            ' 토탈 레코드
            totalRecordsSQL = "SELECT COUNT(*) AS TotalCount FROM tbl_board"
			Set RsTotal = Server.CreateObject("ADODB.Recordset")
			RsTotal.Open totalRecordsSQL, conn, 0, 1, adCmdText

			totalRecords = RsTotal("TotalCount")
			RsTotal.Close
			Set RsTotal = Nothing
            totalPages = Int((totalRecords + itemsPerPage - 1) / itemsPerPage)

			Set Rs = Server.CreateObject("ADODB.Recordset")
            Rs.Open SQL, conn, 0, 1, adCmdText

            %>
            <div class="table-responsive table-list_area">
                <table>
                    <thead>
                        <tr>
                            <td class="tb_seq">번호</td>
                            <td class="tb_title">제목</td>
                            <td class="tb_write">작성자</td>
                            <td class="tb_date">등록일</td>
                            <td class="tb_date">수정일</td>
                        </tr>
                    </thead>
                    <tbody id="tbDataArea">
                        <%
                        If Rs.EOF Then 
                            %>
                            <tr>
                                <td colspan="5">데이터가 없습니다.</td>
                            </tr>
                            <%
                        Else 
                            Do Until Rs.EOF
                                %>
                                <tr onclick="fn_handle_title_Click('<%= Trim(Rs("Seq")) %>')">
                                    <td><%= Trim(Rs("Seq")) %></td>
                                    <td><%= Trim(Rs("Title")) %></td>
                                    <td><%= Trim(Rs("writeName")) %></td>
                                    <td><%= FormatDateTime(CDate(Rs("RegDate")), vbShortDate) %></td>
                                    <td><%= FormatDateTime(CDate(Rs("modDate")), vbShortDate) %></td>
                                </tr>
                                <%
                                Rs.MoveNext
                            Loop 
                        End If 
                        %>
                    </tbody>
                </table>
            </div>
            <%
            Rs.Close
            Set Rs = Nothing
        %>
		
		<div id="pagination">
			<button class="gray_btn" onclick="prevPage()">이전</button>
			<button class="gray_btn" onclick="nextPage()">다음</button>
		</div>
		<div>
			<span>총 게시글 수: <%= totalRecords %><span/>
			<span>현재 페이지: <%
								If IsNumeric(currentPage) Then
									Response.Write(currentPage)
								Else
									Response.Write(1)
								End If
							%> / <%= totalPages %><span/>
		</div>
		

        <button class="reg_btn" onclick="regFunction()">게시글 작성</button>
    </div>
</div>


<script>
    function regFunction() {
        document.cookie = "regModeYN=" + 'Y' + "; path=/";
        fnCheckMenu('bd_write');
    }

    function fn_handle_title_Click(value) {
        document.cookie = "PostId=" + value + "; path=/";
        console.log('클릭된 게시물 번호:', value);

		fnCheckMenu('bd_view');
		//fnCheckMenu1('bd_view', value)
    }

    function prevPage() {
        var currentPage =	<%
								If IsNumeric(currentPage) Then
									Response.Write(currentPage)
								Else
									Response.Write(1)
								End If
							%>

        if (currentPage > 1) {
            document.cookie = "currentPage=" + (currentPage - 1) + "; path=/";
            fnCheckMenu('bd_list');
        }
    }

    function nextPage() {
        var currentPage =	<%
								If IsNumeric(currentPage) Then
									Response.Write(currentPage)
								Else
									Response.Write(1)
								End If
							%>
        var totalPages = <%= totalPages %>;
        if (currentPage < totalPages) {
            document.cookie = "currentPage=" + (currentPage + 1) + "; path=/";
            fnCheckMenu('bd_list');
        }
    }
	
</script>

<%
    Set Conn = Nothing 
%>
