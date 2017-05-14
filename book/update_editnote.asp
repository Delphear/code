<!--#include file="conn.asp"-->
<!--#include file="chkmanage.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''
'          Jimmy中文站留言簿 Version 1.08	     '
'		 http://www.lunji.com		     '
'	         Powered by BlueSailor	             '
'	 QQ:428140   E-MAIL: bluesailor@etang.com    '
''''''''''''''''''''''''''''''''''''''''''''''''''''''
'*****************************************************
'(特别声明：共享软件，未经本人同意，不得用于商业用途)
'*****************************************************
%>
<%
notetitle=request("notetitle")
notebbs=request("guestcontent")
set rs=server.createobject("adodb.recordset")
sql="select notetitle,notebbs,notedate from [lybconfig] where id=1"
rs.open sql,conn,1,3
rs("notebbs")=(request("guestcontent"))
rs("notetitle")=(request("notetitle"))
rs("notedate")=Date()
	rs.update
rsclose()
connclose() 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>成功修改</title>
<!--#include file="style.asp"-->
</head><body><!--#include file="menu.asp"--><br><br><p align="center">成功修改!</p> 
</body> 
</html> 

