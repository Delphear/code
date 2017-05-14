<!--#include file="conn.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<!--#include file="chkmanage.asp"-->
<%
MailServer=Trim(Request.Form("MailServer"))
ServerUserName=Trim(Request.Form("ServerUserName"))
ServerPassword=Trim(Request.Form("ServerPassword"))
MailFrom=Trim(Request.Form("MailFrom"))
SendName=Trim(Request.Form("SendName"))

set rs=server.createobject("adodb.recordset")
SQL="Select * From mailconfig Where id=1"
rs.open SQL,conn,1,3
If MailServer<>"" Then
rs("MailServer")=MailServer
End If

If ServerUserName<>"" Then
rs("ServerUserName")=ServerUserName
End If

If ServerPassword<>"" Then
rs("ServerPassword")=ServerPassword
End If

If MailFrom<>"" Then
rs("MailFrom")=MailFrom
End If

If SendName<>"" Then
rs("SendName")=SendName
End If


rs.update

%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>说明</title>
<STYLE type="text/css">
<!--
td {  font-family: "Verdana", "Arial"; font-size: 12px; color: #333333
}
a:link {
	font-size: 10pt;
	color: 000000;
	text-decoration: none;
}
a:visited {
	font-size: 10pt;
	color: #000000;
	text-decoration: none;
}
--></STYLE>
<!--#include file="style.asp"-->
</head>

<body>
<!--#include file="menu.asp"--><br>
<div align="center">
  <center>
  <table border="0" width="265" height="129" cellspacing="1" cellpadding="0" bgcolor="#C0C0C0">
    <tr>
      <td width="265" height="22" bgcolor="#F5F5F5"><b>&nbsp;说&nbsp;明</b></td>
    </tr>
    <tr>
      <td width="265" height="78" valign="top" bgcolor="#FFFFFF" style="padding:4px">成功修改</td>
    </tr>
    <tr>
      <td width="245" height="22" valign="middle" bgcolor="#FFFFFF">
        <p align="center"><a href="#" onclick=history.go(-1)>返回上一页</a></td>
    </tr>
  </table>
  </center>
</div>

</body>

</html>
<%connclose()%>