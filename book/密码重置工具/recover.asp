<!--#include file="conn.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<!--#include file=md5.asp -->
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
set rs=server.createobject("adodb.recordset")
sql="select * from [admin] where id=1"
rs.open sql,conn,1,3
rs("username")="admin"
rs("password")="7a57a5a743894a0e"
	rs.update
rsclose()
connclose() 
%>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ɹ��޸�--<%=lybtitle%>
</title>
<!--#include file="style.asp"-->
</head><body>
<!--#include file="menu.asp"--><br><br>
<p align="center">�ɹ��޸�!</p> 
</body> 
