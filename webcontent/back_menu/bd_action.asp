<!-- #include virtual = "/import/dbOpen.asp" -->
<%
Function writeData(conn, regModeYN, postId, title, content, writeId, writer)
    Dim SQL, mSeq

    If regModeYN = "N" Then
        ' 수정 모드
        SQL = "UPDATE tbl_board SET " & _
              "Title = '" & title & "', " & _
              "content = '" & content & "', " & _
              "writeId = '" & writeId & "', " & _
              "writeName = '" & writer & "', " & _
              "modDate = GETDATE() " & _
              "WHERE Seq = " & postId
		Else
			' 등록 모드 Y
			mSeq = 1 ' mSeq 값을 1로 설정
			SQL = "INSERT INTO tbl_board (mSeq, Title, content, writeId, writeName, RegDate, modDate) " & _
				  "VALUES (" & mSeq & ", '" & title & "', '" & content & "', '" & writeId & "', '" & writer & "', GETDATE(), GETDATE())"
    End If

	conn.Execute(SQL)
End Function

Function deleteData(conn, postId)
    Dim SQL
    SQL = "DELETE FROM tbl_board WHERE Seq = " & postId
    conn.Execute(SQL)
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
title		= fnStringReplace(Request.Form("title"),"pass")
content		= fnStringReplace(Request.Form("content"),"")
writeId		= Request.Form("writeId")
writer		= fnStringReplace(Request.Form("writer"),"")

If regModeYN = "D" Then
    '게시글 삭제 모드
		Call deleteData(conn, postId)
	Else
		'게시글 등록/수정 모드
		Call writeData(conn, regModeYN, postId, title, content, writeId, writer)
End If

Response.Write "성공"
%>
