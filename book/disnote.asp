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
<%
notebbs=ubbcode(notebbs)
notebbs=replace(notebbs,chr(13),"<br>")
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����--<%=notetitle%></title>
<!--#include file="style.asp"-->
</head>
<body>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  bordercolor="<%=bordercolor%>" width="456" height="246" align="center">
  <tr>
    <td width="100%" height="20" class="addfont" style="padding-left: 5"><font color="#FFFFFF"><%=notetitle%></font></td>
  </tr>
  <tr>
    <td width="100%" height="204" valign="top" class="lybtable" style="padding: 5"><%=notebbs%></td>
  </tr>
  <tr>
    <td width="100%" height="21" valign="middle" class="lybtable">
    <p align="center"><a href="javascript:window.close();">[�رմ���]</a></td>
  </tr>
</table>

  </center>
</div>

</body>

</html>
<%
connclose() 
%>