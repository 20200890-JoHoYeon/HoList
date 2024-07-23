<!-- #include virtual = "/import/dbOpen.asp" -->
<%
Function commentWriteData(conn, regModeYN, postId, tailContent, writeId, writeName)
    Dim SQL

    If regModeYN = "CN" Then
        ' 수정 모드
        'SQL = ""
		Else
			' 등록 모드 CY 
			
			SQL = "INSERT INTO tbl_board_tail (bd_Seq, tailContent, writeId, writeName, regDate, modDate) " & _
				  "VALUES ('" & postId & "', '" & tailContent & "', '" & writeId & "', '" & writeName & "', GETDATE(), GETDATE())"
    End If

	conn.Execute(SQL)                                                       
End Function

Function commentDeleteData(conn, postId)
'    Dim SQL
'    SQL = ""
'    conn.Execute(SQL)
End Function



Function fnStringReplace(strText, mode)
    strText = Replace(Trim(strText), "'", "`")
    strText = Replace(strText, "<", "[")
    strText = Replace(strText, ">", "]")

    Select Case mode
        Case "pass"
        Case Else 
            strText = Replace(strText, "바보", "ㅂㅂ")
            strText = Replace(strText, "멍청이", "ㅁㅊㅇ")
            strText = Replace(strText, "똥개", "ㄸㄱ")
    End Select
    fnStringReplace = strText
End Function

' 클라이언트로부터 전송된 데이터 받기
regModeYN	= Request.Form("regModeYN")
postId		= Request.Form("postId")
tailContent		= fnStringReplace(Request.Form("tailContent"),"")
writeId		= Request.Form("writeId")
writeName		= fnStringReplace(Request.Form("writeName"),"")

If regModeYN = "CD" Then
    '댓글 삭제 모드
		Call deleteData(conn, postId)
	Else
		'댓글 등록/수정 모드
		Call commentWriteData(conn, regModeYN, postId, tailContent, writeId, writeName)
End If

Response.Write "성공"
%>
