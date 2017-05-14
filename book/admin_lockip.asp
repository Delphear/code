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
ip=request("banip")
if request("do")="lock" then
set rs=server.createobject("adodb.recordset")
	sql="select * from [banip]"
	rs.open sql,conn,1,3
	rs.addnew 
	rs("banip")=ip  
rs.update	                           
rsclose()
connclose() 
else
set rs=server.createobject("adodb.recordset")
    sql="select * from [banip] where banip='"&ip&"'"
   	rs.open sql,conn,1,3     
        do while not rs.eof
   	rs.Delete 
        rs.movenext
        loop  	
   	rs.Close
    set rs=nothing
    conn.close
    set conn=nothing
end if
%>
<html>
<head>
<title>修改留言--<%=lybtitle%></title>
<!--#include file="style.asp"-->
</head>
<body>
<br><br><!--#include file="menu.asp"--><br><br>
  
<center><%response.write "操作成功"%></center></body></html>