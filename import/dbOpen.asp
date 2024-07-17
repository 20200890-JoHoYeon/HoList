<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.CharSet = "UTF-8" %>
<%
	Response.CacheControl = "no-cache"
	Response.AddHeader "Pragma", "no-cache"
	Response.AddHeader "Cache-Control", "no-store"
	Response.Expires = -1
%>
<%
	If DB_HOST = "" Then 
		DB_HOST	= "121.140.112.229"
		DB_PORT = "1433"
		DB_NAME	= "jhy"
		DB_USER	= "jhy"
		DB_PASS	= "whghdus2024!"
	End If 

	set Conn = server.CreateObject("ADODB.connection")
	' ConnectionTimeout과 CommandTimeout의 만료 시간 설정
	Conn.ConnectionTimeout = 5				' 데이터베이스에 연결이 이루어지기를 기다렸다가 실행을 중지하고 오류를 발생시킬지를 설정하는 속성 (0 은 접속될때까지)
	Conn.CommandTimeout = 5					' 명령을 실행할때 명령을 종료하고 오류를 발생시키는데 걸리는 시간 (0 이면 접속될때까지 에러 발생시키지 않음)

	Conn.Provider ="SQLOLEDB"
	ProvStr = "Server=" & DB_HOST & "," & DB_PORT & ";Database=" & DB_NAME & ";UID=" & DB_USER & ";PWD=" & DB_PASS & ";"
'	ProvStr = "Provider=SQLOLEDB;Data Source=" & DB_HOST & "," & DB_PORT & ";Initial Catalog=" & DB_NAME & ";User ID=" & DB_USER & ";Password=" & DB_PASS & ";"

	On Error Resume Next
	Conn.Open ProvStr 
	If err <> 0 Then				
			Conn.RollbackTrans		
			Conn.Errors.Clear		
			Response.write "에러 : " & Err & "<br/>"
			Response.write "에러 메세지 : " & Err.Description & "<br/>"
			Response.write "에러 출처 : " & Err.Source & "<br/>"
			Response.write "DB 에러번호 : " & Err.NativeError & "<br/>"
			Response.write "에러 파일 : " & Err.HelpFile & "<br/>"
			Response.write "에러 Context : " & Err.HelpContext & "<br/>"
			Response.end
	End If

	On Error Goto 0	
	On Error Resume Next
%>