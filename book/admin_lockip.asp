<!--#include file="conn.asp"-->
<!--#include file="chkmanage.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
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
<title>�޸�����--<%=lybtitle%></title>
<!--#include file="style.asp"-->
</head>
<body>
<br><br><!--#include file="menu.asp"--><br><br>
  
<center><%response.write "�����ɹ�"%></center></body></html>