<!-- #include virtual = "/import/dbOpen.asp" -->

<!-- 
DECLARE @currentPage INT = 1; 
DECLARE @itemsPerPage INT = 10;

SELECT * FROM (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY bd.Seq DESC) AS rowNum,
        COUNT(bd.Seq) OVER () AS totalCount,
        COALESCE(bt.CommentCount, 0) AS totalCommentCount,
        bd.Seq,
        bd.Title,
        bd.WriteId,
        bd.writeName,
        bd.RegDate,
        bd.modDate
    FROM 
        tbl_board AS bd
    LEFT JOIN (
        SELECT 
            bd_Seq,
            COUNT(*) AS CommentCount
        FROM 
            tbl_board_tail
        GROUP BY 
            bd_Seq
    ) AS bt ON bd.Seq = bt.bd_Seq
) AS A
WHERE 
    rowNum >= ((@currentPage - 1) * @itemsPerPage) + 1 
    AND rowNum <= (@itemsPerPage * @currentPage);
-->


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
			
            ' SQL 쿼리 문장
			sql = "SELECT * FROM ( "
			sql = sql & "    SELECT  "
			sql = sql & "        ROW_NUMBER() OVER (ORDER BY bd.Seq DESC) AS rowNum, "
			sql = sql & "        COUNT(bd.Seq) OVER () AS totalCount, "
			sql = sql & "        bt.CommentCount AS totalCommentCount, "
			sql = sql & "        bd.Seq, "
			sql = sql & "        bd.Title, "
			sql = sql & "        bd.WriteId, "
			sql = sql & "        bd.writeName, "
			sql = sql & "        bd.RegDate, "
			sql = sql & "        bd.modDate "
			sql = sql & "    FROM  "
			sql = sql & "        tbl_board AS bd "
			sql = sql & "    LEFT JOIN ( "
			sql = sql & "        SELECT  "
			sql = sql & "            bd_Seq, "
			sql = sql & "            COUNT(*) AS CommentCount "
			sql = sql & "        FROM  "
			sql = sql & "            tbl_board_tail "
			sql = sql & "        GROUP BY  "
			sql = sql & "            bd_Seq "
			sql = sql & "    ) AS bt ON bd.Seq = bt.bd_Seq "
			sql = sql & ") AS A "
			sql = sql & "WHERE  "
			sql = sql & "    rowNum >= ((" & currentPage - 1 & ") * " & itemsPerPage & ") + 1  "
			sql = sql & "    AND rowNum <= (" & itemsPerPage & " * " & currentPage & "); "

            ' 토탈 레코드
			Set Rs = Server.CreateObject("ADODB.Recordset")
            Rs.Open SQL, conn, 0, 1, adCmdText

			totalRecords = Rs("TotalCount")
            totalPages = Int((totalRecords + itemsPerPage - 1) / itemsPerPage)

			

            %>
            <div class="table-responsive table-list_area">
                <table>
                    <thead>
                        <tr>
                            <td class="tr_seq">번호</td>
                            <td class="tr_title">제목</td>
                            <td class="tr_write">작성자</td>
                            <td class="tr_date">등록일</td>
                            <td class="tr_date">수정일</td>
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

								Dim totalCommentCount 
								If Trim(Rs("totalCommentCount"))  Then
									totalCommentCount = "(" & Trim(Rs("totalCommentCount")) & ")"
								Else
									totalCommentCount = ""
								End If
                                %>
                                <tr class="td_action" onclick="fn_handle_title_Click('<%= Trim(Rs("Seq")) %>')">
                                    <td><%= Trim(Rs("Seq")) %></td>
                                    <td><%= Trim(Rs("Title")) %><span> <%= totalCommentCount %></span></td>
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
