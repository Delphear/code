<!--#include file="conn.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<!--#include file="inc/char.asp"-->
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
<head><title><%=lybtitle%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="style.asp">
</head>
<body>
<div align="center">
  <center>
  <table border="1" width="360" height="1" style="border-collapse: collapse"  cellspacing="0" cellpadding="0" bordercolor="#000000">
    <tr>
      <td width="356" height="16">
        <p align="center">IP������</td>
    </tr>
     <tr>
      <td width="356" height="100" style="padding: 6px"> 
<%
	set rs=server.createobject("adodb.recordset")
	sql="select * from banip"
	rs.open sql,conn,1,1
	Do while not rs.eof
	Response.Write rs("banip")&"<br>"
	rs.movenext
	Loop
	rs.close
	set rs=Nothing
	conn.close
	set conn=Nothing
    %></td>
    </tr>
    <tr>
      <td width="356" height="12" style="padding: 4px"> 
 <p align="center"><a href="javascript:window.close();">[�رմ���]</a></p>      </td>
    </tr>
   
  </table>
  </center>
</div>
</body></html>