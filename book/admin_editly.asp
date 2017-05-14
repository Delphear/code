<!--#include file="conn.asp"-->
<!--#include file="chkmanage.asp"-->
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
<%
dim guestcontent
dim id
id=request("id")
guestcontent=request("guestcontent")
    set rs=server.createobject("adodb.recordset")
    sql="select guestcontent,id,sh from [guest] where id="&id
   	rs.open sql,conn,1,3
if guestcontent<>"" then
rs("guestcontent")=guestcontent
rs("sh")=false
		rs.update
rsclose()
connclose() 
response.redirect "manage.asp"
end if
%>
<html>
<head>
<meta name="Author" content="BlueSailor">
<title>修改留言--<%=lybtitle%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!--#include file="style.asp"-->
</head>
<body>
<!--#include file="menu.asp"-->
<form name="form1" method="post" action="admin_editly.asp?id=<%=request("id")%>">
<table width=650 border=1 align="center" cellpadding=0 cellspacing=0 style="border-collapse: collapse"  bordercolor="<%=bordercolor%>" >
          <tr class="addfont"> 
            <td height=22 colspan="2" align=center><b>编辑留言</b></td>
          </tr>
          <tr> 
            <td width="30%" height="22" align="center" valign="middle" class="addfont"> 
              <div align="left">&nbsp;留言内容：</div>
            </td>
            <td width="70%" height="22" class="lybtable"> &nbsp;    
              <textarea name="guestcontent" cols="45" rows="8" wrap="VIRTUAL"><%=rs("guestcontent")%></textarea></td>   
          </tr>   
          <tr class="lybtable">    
            <td height=22 colspan="2" align=center>    
              <input name="reply" type="submit" class="noBorder" value="提交">&nbsp;    
              <input name="reset" type="reset" class="noBorder" value="重置"></td>   
          </tr>   
 </table>   
  
</form>
</body>
</html>