<!--#include file="conn.asp"-->
<!--#include file="chkmanage.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<!--#include file=md5.asp -->
<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''
'          Jimmy����վ���Բ� Version 1.09	     '
'		 http://www.lunji.com		     '
'	         Powered by BlueSailor	             '
'	 QQ:428140   E-MAIL: bluesailor@etang.com    '
''''''''''''''''''''''''''''''''''''''''''''''''''''''
'*****************************************************
'(�ر����������������δ������ͬ�⣬����������ҵ��;)
'*****************************************************
%>
<%
dim pass1,pass2,passtem
pass=request("pass")
pass1=request("pass1")
pass2=request("pass2")
if pass1="" then 
session("wrong")="���벻��Ϊ��" 
response.redirect "error.asp"
end if 
if pass1<>pass2 then
session("wrong")="������������벻ͬ"  
response.redirect "error.asp"
end if
name=request("name")
pass3=request("pass1")
pass3=MD5(pass3)
pass=MD5(pass)
set rs=server.createobject("adodb.recordset")
sql="select * from [admin] where id=1"
rs.open sql,conn,1,3
if pass<>rs("password") then
rsclose()
connclose() 
session("wrong")="���������!"
response.redirect "error.asp"   
end if

rs("username")=name
rs("password")=pass3
	rs.update
rsclose()
connclose() 
%>
<%
Response.Cookies("lunjilyb")("username")=request("name")
Response.Cookies("lunjilyb")("password")=MD5(pass3)
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
