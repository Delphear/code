<!--#include file="conn.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="inc/sqlfilter.asp"-->
<!--#include file="close.asp"-->
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
<meta name="Author" content="BlueSailor">
<title><%=lybtitle%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="keywords" content="���Բ�����|www.lunji.com">
<meta name="description" content="���Բ�����|www.lunji.com">
<script src=popup.js></script>
<!--#include file="style.asp"-->
</head>
<body>
<!--#include file="top.asp"-->
<table width="650" border="0" align="center">
  <tr>
    <td height="2"><img src="csspic/blank.gif" width="1" height="1"></td>
  </tr>
</table>
<table width="650" height="111" align="center" cellpadding="0" cellspacing="0" class="lybtable">
  <tr> 
    <td height="81"> 
       <p align="center">
       <img border="0" src="images/lunjilyb<%=lunjilybstyle%>.gif" width="333" height="67"><br>
��</td>                     
  </tr>                     
  <tr>
    <td height="30">&nbsp;<a href="add.asp"><img src="images/lunjiqxly<%=lunjilybstyle%>.jpg" alt="ǩд����" width="112" height="30" border="0"></a>| 
      <img border="0" src="pic/teammo.gif">������<a HREF="javascript:popUp()"><%=admin_name%></a>| 
      <img border="0" src="pic/announce.gif">���棺 
      <%if len(notetitle)>0 then %>
      <a href="disnote.asp" target=_blank><%=notetitle%></a><font color="#C0C0C0">[<%=notedate%>]</font> 
      <%else%>
      ��ǰû�й��� 
      <%end if%>
    </td>                     
  </tr>
</table>                     
<table width="650" border="0" align="center">
  <tr> 
    <td height="2"><img src="csspic/blank.gif" width="1" height="1"></td>
  </tr>
</table>
<%                     
sql="select * from guest order by id desc"                     
set rs=server.createobject("adodb.recordset")                     
rs.open sql,conn,1,1                     
if rs.eof and rs.bof then                     
response.write "<p align=center>�� û �� �� �� �� ��</p>"              
else  
'��ҳ��ʵ��                 
Rs.pagesize=listnum
page=SafeRequest("page",1)
if page = "" then
page = 1
end if
if (page-Rs.pagecount) > 0 then
page=Rs.pagecount
End If
If page<1 Then
page=1
End If
Rs.absolutepage=page
'��ŵ�ʵ��
j=rs.recordcount
j=j-(page-1)*listnum

i=0
do while not rs.eof and i<listnum

ips=split(rs("ip"),".")
ip=""&ips(0)&"."&ips(1)&".*.*"
%> 
<!--#include file="indexlist.asp"-->              
<!--#include file="bottom.asp"-->
</body>                   
</html>