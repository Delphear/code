<!--#include file="conn.asp"-->
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�鿴��������</title>
<!--#include file="style.asp"-->
</head>
<body>
<table cellpadding="0" cellspacing="0" width="250" height="252" align=center  border="1"  style="border-collapse: collapse"  bordercolor="<%=bordercolor%>" >
  <tr>
    <td width="245" height="23"  class="addfont">
    <p align="center">-==<b>��������</b>==-</td>
  </tr>
  <tr>
    <td width="245" height="204"  valign="top">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" width="100%" height="202">
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>������</b></td>
        <td width="71%" height="25" class="lybtable"><%=admin_name%>��</td>
      </tr>
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>Q Q:</b></td> 
        <td width="71%" height="25" class="lybtable"><%=admin_qq%>��</td>
      </tr>
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>E-MAIL:</b></td>
          <td width="71%" height="25" class="lybtable"><a href="mailto:<%=admin_email%>"><%=admin_email%></a></td>
      </tr>
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>M S N:</b></td> 
        <td width="71%" height="25" class="lybtable"><%=admin_msn%>��</td>
      </tr>
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>I C Q:</b></td> 
        <td width="71%" height="25" class="lybtable"><%=admin_icq%>��</td>
      </tr>
      <tr>
        <td width="29%" height="25" class="addfont">
        <p align="right"><b>��ҳ��</b></td>
        <td width="71%" height="25" class="lybtable"><%=admin_homepage%>��</td>
      </tr>
      <tr>
        <td width="29%" height="26" class="addfont">
        <p align="right"><b>˵����</b></td>
        <td width="71%" height="52" rowspan="2" valign="top" class="lybtable"><%=admin_note%>��</td>
      </tr>
      <tr>
        <td width="29%" height="26" class="addfont"></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td width="245" height="21" valign="middle" class="lybtable">
    <p align="center"><a href="javascript:window.close();">[�رմ���]</a></p></td>
  </tr>
</table>

</body>

</html>
<%
connclose() 
%>