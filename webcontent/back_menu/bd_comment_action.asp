<!-- #include virtual = "/import/dbOpen.asp" -->
<%
Function commentWriteData(conn, regModeYN, postId, tailContent, writeId, writeName)
    Dim SQL

    If regModeYN = "CN" Then
        ' ���� ���
        'SQL = ""
		Else
			' ��� ��� CY 
			
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
            strText = Replace(strText, "�ٺ�", "����")
            strText = Replace(strText, "��û��", "������")
            strText = Replace(strText, "�˰�", "����")
    End Select
    fnStringReplace = strText
End Function

' Ŭ���̾�Ʈ�κ��� ���۵� ������ �ޱ�
regModeYN	= Request.Form("regModeYN")
postId		= Request.Form("postId")
tailContent		= fnStringReplace(Request.Form("tailContent"),"")
writeId		= Request.Form("writeId")
writeName		= fnStringReplace(Request.Form("writeName"),"")

If regModeYN = "CD" Then
    '��� ���� ���
		Call deleteData(conn, postId)
	Else
		'��� ���/���� ���
		Call commentWriteData(conn, regModeYN, postId, tailContent, writeId, writeName)
End If

Response.Write "����"
%>
