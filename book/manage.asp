<!--#include file="conn.asp"-->
<!--#include file="chkmanage.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<!--#include file="inc/char.asp"-->
<% 
Response.Buffer =True
Response.ExpiresAbsolute =Now() - 1
Response.Expires=0
Response.CacheControl="no-cache" 
%>
<html>
<head> 
<meta name="Author" content="BlueSailor">
<title>留言删除修改--<%=lybtitle%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<base target="_self">
<script>
function  deletes()//  
       {  
             return  window.confirm(  "真的要删除吗？  ");    
       } 
</script>
<!--#include file="style.asp"-->
</head>
<body>
<!--#include file="menu.asp"--><script language="JavaScript" src="client.js" type="text/JavaScript"></script>
<%if sh=True then%>
<table width="650" height="21" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td valign="bottom"><strong>说明：</strong><font color="#FF0000">回复了的留言</font>将会自动<font color="#FF0000">通过审核</font></td>
  </tr>
</table>
<%end if%>
<form action="selectdele.asp" method="POST" name="selectdele" id="selectdele">
<%                     
sql="select * from guest order by id desc"                     
set rs=server.createobject("adodb.recordset")                     
rs.open sql,conn,1,1                     
if rs.eof and rs.bof then                     
response.write "<p align=center>还 没 有 任 何 留 言</p>"              
else                     
'分页的实现                 
Rs.pagesize=listnum
page=Request("page")
if (page-Rs.pagecount) > 0 then
page=Rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
Rs.absolutepage=page
'编号的实现
j=rs.recordcount
j=j-(page-1)*listnum
i=0
do while not rs.eof and i<listnum
%>

<table width="650" height="76" align="center" cellpadding="0" cellspacing="0" class="lybtable" style="word-break:break-all"> 
  <tr>
      <td width="475" height="18" class="bodytableleft"> <p align="left">
          <input type=checkbox name=del value="<%=rs("id")%>">
          <b>留言人:</b><%=rs("guestname")%>&nbsp;<b>IP:</b><%=rs("ip")%>&nbsp;<a href="admin_lockip.asp?banip=<%=rs("ip")%>&do=lock">封IP</a>&nbsp;<a href="admin_lockip.asp?banip=<%=rs("ip")%>&do=unlock">解IP</a>&nbsp;  
		  <%if sh=True then
		  		if rs("sh")=True then 
				response.Write("未审核")
				else 
				response.write("已审核")
				end if
			end if
		%>		  
		  </td>
      <td width="173" height="13" class="toptable"> <p align="center"> 
          <%if rs("sh")=True then%>
          <a href="admin_sh.asp?id=<%=rs("id")%>"><font color="#FF0000">通过审核</font></a>|  
          <%end if%>
          <a href="admin_editly.asp?id=<%=rs("id")%>"><font color="#FF0000">编辑</font></a>|<a href="dele.asp?action=admin&id=<%=rs("id")%>" onclick=  "return  deletes()"><font color="#FF0000">删除</font></a>|<a href="reply.asp?id=<%=rs("id")%>" ><font color="#FF0000">回复</font></a></td>  
  </tr>
  <tr>
    <td height="53" colspan="2" valign="top"  style="word-break: break-all; font-size: 10pt"  bgcolor="<%=tablebgcolor%>" ><br>
    <br>
　 <p style="padding-left:4px;MARGIN-TOP:2px;MARGIN-BOTTOM:2px;MARGIN-LEFT:2px;MARGIN-RIGHT:2px;word-wrap: break-word">  <%
if len(rs("guestcontent"))>520 then
	response.write ubbcode(left(rs("guestcontent"),520))
else
	response.write ubbcode(rs("guestcontent"))
end if
%>
</p>
<br>可能来自：<%=rs("comefrom")%>
<p>　</td>
  </tr><%if rs("guestreply")<>"" then %>
  <tr class="bodytableleft">
    <td width="475" height="18" valign="top"><b>&nbsp;回&nbsp; 复:</b></td>       
    <td width="173" height="6" valign="top" class="toptable"  style="word-break: break-all; font-size: 10pt">
    <p align="center"> <a href="reply.asp?id=<%=rs("id")%>"> <font color="#FF0000">编辑回复</font></a></td>
  </tr>
  <tr>
    <td height="42" colspan="2"  valign="top" >　 <p style="padding-left:4px;MARGIN-TOP:2px;MARGIN-BOTTOM:2px;MARGIN-LEFT:2px;MARGIN-RIGHT:2px">  <%=ubbcode(rs("guestreply"))%></p> </td>
  </tr><%end if%>
</table>
<table width="650" border="0" align="center">
  <tr>
    <td height="2"><img src="csspic/blank.gif" width="1" height="1"></td>
  </tr>
</table>             
  <div align="center">
  <% 
rs.movenext 
i=i+1 
j=j-1
loop 
%>
  <table width="650" border="0" align="center">
    <tr>
      <td width="273">  
        <input name="Button" type="button" class="noBorder" value="全选"  onclick=checkAll()> 
        <input name="B3" type="submit" class="noBorder" value="删除选中"> <input name="B1" type="reset" class="noBorder" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      </td>
      <td width="363"> 
        <p align="right"> &nbsp;  
        <a href="baniplist.asp" target="_blank">被封IP地址列表</a> 
        </p>
      </td>
    </tr>
  </table></form>
  <%
filename="manage.asp"
response.write "<form method=post action="&filename&">"   
%>
  <table width="650" height="17" align=center cellpadding="0"  cellspacing="0" 

class="bodytablebottom"><tr>
    <td width="100%">&nbsp;总计留言<%=Rs.recordcount%>条&nbsp;共有<%=page%>/<%=Rs.pagecount%>页   
      <% if page=1 then %>
      <%else%>  
      <a href=<%=filename%>?page=<%=page-1%>>上一页</a>&nbsp;   
      <%end if%>
      <% if Rs.pagecount-page <> 0 then %>  
      <a href=<%=filename%>?page=<%=page+1%>>下一页</a>&nbsp;   
      <%else%>
      <%end if%>  
<%  
response.write "转到：<input class=smallInput type='text' name='page' size=4 maxlength=10 value="&page&">"               
response.write "<input class=noborder type='submit' value='Go' name='cndok'>"
%>
    </td>
    <%end if%></tr> 
  </table><table width="650" border="0" align="center">
  <tr>
    <td height="2"><img src="csspic/blank.gif" width="1" height="1"></td>
  </tr>
</table> 
<!--#include file="menu.asp"-->

</body>
</html>