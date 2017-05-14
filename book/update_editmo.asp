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
admin_name=request("admin_name")
admin_id=request("admin_id")
admin_qq=request("admin_qq")
admin_email=request("admin_email")
admin_msn=request("admin_msn")
admin_icq=request("admin_icq")
admin_homepage=request("admin_homepage")
admin_note=request("admin_note")

set rs=server.createobject("adodb.recordset")
sql="select admin_name,admin_id,admin_qq,admin_email,admin_msn,admin_icq,admin_homepage,admin_note from [lybconfig] where id=1"
rs.open sql,conn,1,3
rs("admin_name")=(request("admin_name"))
rs("admin_id")=(request("admin_id"))
rs("admin_qq")=(request("admin_qq"))
rs("admin_msn")=(request("admin_msn"))
rs("admin_icq")=(request("admin_icq"))
rs("admin_email")=(request("admin_email"))
rs("admin_name")=(request("admin_name"))
rs("admin_homepage")=(request("admin_homepage"))
rs("admin_note")=(request("admin_note"))
	rs.update
rsclose()
connclose() 
%>
<html>
<head>
<title>成功修改--<%=lybtitle%></title>
<!--#include file="style.asp"-->
</head>
<body>
<!--#include file="menu.asp"-->
<br><br><p align="center">成功修改!</p> 
</body> 
</html> 

