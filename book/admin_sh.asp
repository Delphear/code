<!--#include file="conn.asp"-->
<!--#include file="chkmanage.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''
'          Jimmy中文站留言簿 Version 1.09	     '
'		 http://www.lunji.com		     '
'	         Powered by BlueSailor	             '
'	 QQ:428140   E-MAIL: bluesailor@etang.com    '
''''''''''''''''''''''''''''''''''''''''''''''''''''''
'*****************************************************
'(特别声明：共享软件，未经本人同意，不得用于商业用途)
'*****************************************************
%>
<%
id=request("id")
set rs=server.createobject("adodb.recordset")
sql="select id,sh from [guest] where id="&id
rs.open sql,conn,1,3
rs("sh")=false
	rs.update
rsclose()
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>成功修改</title>
<!--#include file="style.asp"-->
</head><body>
<script language="javascript">
alert("通过申核！")
history.go(-1)
</script>
</body> 
</html> 
<%connclose()%> 
