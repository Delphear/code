<!--#include file="conn.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<!--#include file="inc/constmail.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="chkmanage.asp"-->
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
dim id,ifmail
ifmail = Request("ifmail")
id=Request("id")
    set rs=server.createobject("adodb.recordset")
    sql="select * from [guest] where id="&id
   	rs.open sql,conn,1,3
guestcontent=ubbcode(rs("guestcontent"))
guestcontent=replace(guestcontent,chr(13),"<br>")
%>
<%

guestreply=request("guestcontent")
    set rs=server.createobject("adodb.recordset")
    sql="select * from [guest] where id="&id
   	rs.open sql,conn,1,3
if request("reply")="提交" then
rs("guestreply")=guestreply
rs("sh")=False
guestname = rs("guestname")
rs("redate")=now()
		rs.update


Function TestObj(Str)
On Error Resume Next
TestObj = False
Err.Description = ""
Set TObj = Server.CreateObject(Str)
If Err.Description = "" Then TestObj = True
Set TObj = Nothing
End Function
If not TestObj("JMail.SmtpMail") then 
Response.Write "不支持JMAIL"
Else

If Request("ifmail")<>"" Then
	MailtoAddress=Request("email")
	MailBody=guestreply
	MailTitle=lybtitle&"的留言回复"
	set jmail=server.CreateObject ("jmail.message")
	jmail.Silent=true
	jmail.Charset="gb2312"
	jmail.logging=true
	jmail.from=MailFrom
	jmail.FromName=SendName
	jmail.Subject = MailTitle
	jmail.MailServerUserName = ServerUserName     '登录邮件服务器所需的用户名
	jmail.MailServerPassword = ServerPassword     '登录邮件服务器所需的密码

emailto = MailtoAddress
JMail.AddRecipient emailto

   MailBody = guestname&"您好:"& CHR(10)&MailBody
  
   MailBody = MailBody & CHR(10)& "-------------------------------------"&SendName & CHR(10)
  
	JMail.Body = MailBody
jmail.Send(MailServer)
set JMail = nothing	
End If	
End If	

response.redirect "manage.asp"
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>回复--<%=lybtitle%></title>
<!--#include file="style.asp"-->
</head>
<body>
<!--#include file="menu.asp"-->
<br>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="<%=bordercolor%>" width="650" height="76" align="center">
  <tr>
    <td width="527" height="13" class="bodytableleft" >
    <p align="left">&nbsp;<b>留言人:</b><%=rs("guestname")%>&nbsp;&nbsp; <b>留言时间:</b><%=rs("guestdate")%>&nbsp;              
    <b>留言人IP:</b><%=rs("ip")%></td>    
    <td width="117" height="13" class="toptable">    
          <p align="center"><font color="#FF0000">    
          <a href="admin_editly.asp?id=<%=rs("id")%>">    
          <font color="#FF0000">编辑</font></a></font>|<a href="dele.asp?action=admin&id=<%=rs("id")%>"><font color="#FF0000">删除</font></a>|<a href="reply.asp?id=<%=rs("id")%>"><font color="#FF0000">回复</font></a></td>    
  </tr>    
  <tr class="lybtable">    
    <td width="644" height="53" colspan="2" valign="top"  style="word-break: break-word; font-size: 10pt" ><br>    
    <br>  
      　 <p style="padding-left:4px;MARGIN-TOP:2px;MARGIN-BOTTOM:2px;MARGIN-LEFT:2px;MARGIN-RIGHT:2px">  <%
if len(rs("guestcontent"))>520 then
	response.write ubbcode(left(rs("guestcontent"),520))
else
	response.write ubbcode(rs("guestcontent"))
end if
%>
</p>
<br>可能来自：<%=rs("comefrom")%>
<p>　</td>
  </tr>
</table>
 

<p class="font">
<br>
<form name="form1" method="post" action="reply.asp?id=<%=request("id")%>">
         <table cellspacing=0 border=1 width=650 style="border-collapse: collapse"  cellpadding="0" height="189" align="center" bordercolor="<%=bordercolor%>">    
          <tr class="addfont" >
      <td width="643" height=10 colspan="2" align=center><b>站长回复</b></td>
          </tr>
		  <%
		  If rs("email")<>"" Then
		   %>
          <tr class="addfont" >
            <td height=22 colspan="2"><input type="checkbox" name="ifmail" value="1">
            同时进行邮件回复 邮件：<%=rs("email")%> <input type="hidden" value="<%=rs("email")%>" name="email"></td>
          </tr>
		  <%End If%>
          <tr class="lybtable"> 
            <td width="139" height="1" align="center" valign="middle" > 
              <div align="left">&nbsp;回复内容：</div>
            </td>
            <td width="494" height="1">&nbsp;<script src=code.js></script>
<!--#include file=ubb.inc --><br>&nbsp;              
              <textarea name="guestcontent" cols="56" rows="7" wrap="VIRTUAL"><%=rs("guestreply")%></textarea></td>    
          </tr>    
          <tr class="lybtable">     
            <td width="643" height=1 colspan="2" align=center>     
              <input name="reply" type="submit" class="noBorder" value="提交">&nbsp;     
              <input name="reset" type="reset" class="noBorder" value="重置"></td>    
          </tr>    
        </table>    
</form>    
<%    
rsclose()
connclose()
%>    
