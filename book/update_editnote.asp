<!--#include file="conn.asp"-->
<!--#include file="chkmanage.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''
'          Jimmy����վ���Բ� Version 1.08	     '
'		 http://www.lunji.com		     '
'	         Powered by BlueSailor	             '
'	 QQ:428140   E-MAIL: bluesailor@etang.com    '
''''''''''''''''''''''''''''''''''''''''''''''''''''''
'*****************************************************
'(�ر����������������δ������ͬ�⣬����������ҵ��;)
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
<title>�ɹ��޸�</title>
<!--#include file="style.asp"-->
</head><body><!--#include file="menu.asp"--><br><br><p align="center">�ɹ��޸�!</p> 
</body> 
</html> 

