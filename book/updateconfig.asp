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
listnum=Trim(request.form("listnum"))
lybtitle=Request("lybtitle")
weburl=Request("weburl")
rightre=Request("rightre")
rightnum=Request("rightnum")
secret=Request("secret")
smile=Request("smile")
ubb=Request("ubb")
maxlen=Request("maxlen")
lunjilybstyle=Request("lunjilybstyle")
killwords=Request("killwords")
sh=Request("sh")
close=Request("close")
close_content=Trim(Request("close_content"))

set rs=server.createobject("adodb.recordset")
sql="select * from [lybconfig] where id=1"
rs.open sql,conn,1,3
rs("lybtitle")=lybtitle
rs("listnum")=listnum
rs("rightre")=rightre
rs("weburl")=weburl
rs("rightnum")=rightnum
rs("secret")=secret
rs("smile")=smile
rs("ubb")=ubb
rs("maxlen")=maxlen
rs("lunjilybstyle")=lunjilybstyle
rs("killwords")=killwords
rs("sh")=sh
rs("close")=close
rs("close_content")=close_content
rs.update
%>
<!--#include file="inc/const2.asp"-->
<head><title>成功修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!--#include file="style.asp"-->
</head><body>
<!--#include file="menu.asp"-->
<p align=center>成功修改</p></body>
</html>
<%
connclose() 
%>