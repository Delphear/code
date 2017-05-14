<!--#include file="conn.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<!--#include file="inc/char.asp"-->
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
notebbs=ubbcode(notebbs)
notebbs=replace(notebbs,chr(13),"<br>")
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>公告--<%=notetitle%></title>
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
    <p align="center"><a href="javascript:window.close();">[关闭窗口]</a></td>
  </tr>
</table>

  </center>
</div>

</body>

</html>
<%
connclose() 
%>