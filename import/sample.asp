<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.CharSet = "UTF-8" %>
<%
	Response.CacheControl = "no-cache"
	Response.AddHeader "Pragma", "no-cache"
	Response.AddHeader "Cache-Control", "no-store"
	Response.Expires = -1
%>
<!-- #include virtual = "/import/dbOpen.asp"-->
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>데이터베이스 읽기 테스트</title>
</head>
<body>
<%
	Set Rs = Server.CreateObject("ADODB.Recordset")			' DB 의 Record 를 가져오는 객체 선언 (메모리 Open)
%>

	<table>
		<tr>
			<td>Seq</td>
			<td>Title</td>
			<td>WriteId</td>
			<td>writeName</td>
			<td>RegDate</td>
			<td>modDate</td>
		</tr>

<%
	SQL = "select Seq, Title, WriteId, writeName, RegDate, modDate "
	SQL = SQL & "  from tbl_board "
	SQL = SQL & " order by Seq desc"		' 쿼리 구문

'Response.write sql & "<br/>"
'	SQL = "select Seq, Title, WriteId, writeName, RegDate, modDate " _vbCr
'		  "  from tbl_board " _ vbCr
'		  " order by Seq desc"

	Rs.Open SQL, conn, 0, 1, adCmdText				' 해당 레코드를 연다  Rs.Open (Rs 레코드를 열어라), conn (conn 객체에서) 0, 1, adCmdText (읽기전용으로)
	If Rs.EOF Or Rs.BOF Then 
			%>
				<tr>
					<td colspan="6">데이터가 없습니다.</td>
				</tr>
			<%
		Else 
			Do Until Rs.EOF		' 레코드의 끝이 나올때까지 반복
			%>
				<tr>
					<td><%= Trim(Rs("Seq")) %></td>
					<td><%= Trim(Rs("Title")) %></td>
					<td><%= Trim(Rs("WriteId")) %></td>
					<td><%= Trim(Rs("writeName")) %></td>
					<td><%= Trim(Rs("RegDate")) %></td>
					<td><%= Trim(Rs("modDate")) %></td>
				</tr>			
			<%
			Rs.MoveNext
			Loop 
	End If 

	Rs.close


'Response.write "abcdefg"


%>
	</table>
  

<%
' <form 에서 action="action.asp  " 일때 action.asp 에 있는 데이터

Seq			= Trim(Request.Form("Seq"))			' 바로 전 데이터 값의 Name
title		= Request.Form("title")				' 제목
write		= Request.Form("writer")
detail		= Request.Form("detail")

'	SQL = "insert into tbl_board (Title, WriteId, writeName, RegDate, modDate) values ('테스트4', 'test4', '홍길동', getdate(), getdate())"
	SQL = "insert into tbl_board (Title, WriteId, writeName, RegDate, modDate) values ("
	SQL = SQL & " '" & title & "', 'test4', '" & write & "', getdate(), getdate())"
	conn.execute SQL		' SQL 구문 실행



' SQL = "Update "
' conn.execute SQL
%>
</body>
</html>
<%
	Set Rs = Nothing			' DB 의 Record 를 가져오는 객체 닫음 (메모리 close)
	Set Conn = Nothing			' DB Open 을 닫아줌 (메모리 close)




%>