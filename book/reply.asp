<!--#include file="conn.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<!--#include file="inc/constmail.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="chkmanage.asp"-->
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
if request("reply")="�ύ" then
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
Response.Write "��֧��JMAIL"
Else

If Request("ifmail")<>"" Then
	MailtoAddress=Request("email")
	MailBody=guestreply
	MailTitle=lybtitle&"�����Իظ�"
	set jmail=server.CreateObject ("jmail.message")
	jmail.Silent=true
	jmail.Charset="gb2312"
	jmail.logging=true
	jmail.from=MailFrom
	jmail.FromName=SendName
	jmail.Subject = MailTitle
	jmail.MailServerUserName = ServerUserName     '��¼�ʼ�������������û���
	jmail.MailServerPassword = ServerPassword     '��¼�ʼ����������������

emailto = MailtoAddress
JMail.AddRecipient emailto

   MailBody = guestname&"����:"& CHR(10)&MailBody
  
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
<title>�ظ�--<%=lybtitle%></title>
<!--#include file="style.asp"-->
</head>
<body>
<!--#include file="menu.asp"-->
<br>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="<%=bordercolor%>" width="650" height="76" align="center">
  <tr>
    <td width="527" height="13" class="bodytableleft" >
    <p align="left">&nbsp;<b>������:</b><%=rs("guestname")%>&nbsp;&nbsp; <b>����ʱ��:</b><%=rs("guestdate")%>&nbsp;              
    <b>������IP:</b><%=rs("ip")%></td>    
    <td width="117" height="13" class="toptable">    
          <p align="center"><font color="#FF0000">    
          <a href="admin_editly.asp?id=<%=rs("id")%>">    
          <font color="#FF0000">�༭</font></a></font>|<a href="dele.asp?action=admin&id=<%=rs("id")%>"><font color="#FF0000">ɾ��</font></a>|<a href="reply.asp?id=<%=rs("id")%>"><font color="#FF0000">�ظ�</font></a></td>    
  </tr>    
  <tr class="lybtable">    
    <td width="644" height="53" colspan="2" valign="top"  style="word-break: break-word; font-size: 10pt" ><br>    
    <br>  
      �� <p style="padding-left:4px;MARGIN-TOP:2px;MARGIN-BOTTOM:2px;MARGIN-LEFT:2px;MARGIN-RIGHT:2px">  <%
if len(rs("guestcontent"))>520 then
	response.write ubbcode(left(rs("guestcontent"),520))
else
	response.write ubbcode(rs("guestcontent"))
end if
%>
</p>
<br>�������ԣ�<%=rs("comefrom")%>
<p>��</td>
  </tr>
</table>
 

<p class="font">
<br>
<form name="form1" method="post" action="reply.asp?id=<%=request("id")%>">
         <table cellspacing=0 border=1 width=650 style="border-collapse: collapse"  cellpadding="0" height="189" align="center" bordercolor="<%=bordercolor%>">    
          <tr class="addfont" >
      <td width="643" height=10 colspan="2" align=center><b>վ���ظ�</b></td>
          </tr>
		  <%
		  If rs("email")<>"" Then
		   %>
          <tr class="addfont" >
            <td height=22 colspan="2"><input type="checkbox" name="ifmail" value="1">
            ͬʱ�����ʼ��ظ� �ʼ���<%=rs("email")%> <input type="hidden" value="<%=rs("email")%>" name="email"></td>
          </tr>
		  <%End If%>
          <tr class="lybtable"> 
            <td width="139" height="1" align="center" valign="middle" > 
              <div align="left">&nbsp;�ظ����ݣ�</div>
            </td>
            <td width="494" height="1">&nbsp;<script src=code.js></script>
<!--#include file=ubb.inc --><br>&nbsp;              
              <textarea name="guestcontent" cols="56" rows="7" wrap="VIRTUAL"><%=rs("guestreply")%></textarea></td>    
          </tr>    
          <tr class="lybtable">     
            <td width="643" height=1 colspan="2" align=center>     
              <input name="reply" type="submit" class="noBorder" value="�ύ">&nbsp;     
              <input name="reset" type="reset" class="noBorder" value="����"></td>    
          </tr>    
        </table>    
</form>    
<%    
rsclose()
connclose()
%>    
