<!--#include file="conn.asp"-->
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查看版主资料</title>
<!--#include file="style.asp"-->
</head>
<body>
<table cellpadding="0" cellspacing="0" width="250" height="252" align=center  border="1"  style="border-collapse: collapse"  bordercolor="<%=bordercolor%>" >
  <tr>
    <td width="245" height="23"  class="addfont">
    <p align="center">-==<b>版主资料</b>==-</td>
  </tr>
  <tr>
    <td width="245" height="204"  valign="top">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" width="100%" height="202">
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>网名：</b></td>
        <td width="71%" height="25" class="lybtable"><%=admin_name%>　</td>
      </tr>
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>Q Q:</b></td> 
        <td width="71%" height="25" class="lybtable"><%=admin_qq%>　</td>
      </tr>
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>E-MAIL:</b></td>
          <td width="71%" height="25" class="lybtable"><a href="mailto:<%=admin_email%>"><%=admin_email%></a></td>
      </tr>
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>M S N:</b></td> 
        <td width="71%" height="25" class="lybtable"><%=admin_msn%>　</td>
      </tr>
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>I C Q:</b></td> 
        <td width="71%" height="25" class="lybtable"><%=admin_icq%>　</td>
      </tr>
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>主页：</b></td>
        <td width="71%" height="25" class="lybtable"><%=admin_homepage%>　</td>
      </tr>
      <tr>
        <td width="29%" height="26" class="addfont">
        <p align="right"><b>说明：</b></td>
        <td width="71%" height="52" rowspan="2" valign="top" class="lybtable"><%=admin_note%>　</td>
      </tr>
      <tr>
        <td width="29%" height="26" class="addfont"></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td width="245" height="21" valign="middle" class="lybtable">
    <p align="center"><a href="javascript:window.close();">[关闭窗口]</a></p></td>
  </tr>
</table>

</body>

</html>
<%
connclose() 
%>