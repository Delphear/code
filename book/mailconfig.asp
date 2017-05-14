<!--#include file="conn.asp"-->
<!--#include file="chkmanage.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<html>
<head>
<meta name="Author" content="BlueSailor">
<title>JMAIL配置--<%=lybtitle%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!--#include file="style.asp"-->
<style type="text/css">
<!--
.style4 {color: #000000; font-weight: bold; }
-->
</style>
</head>
<body>
<!--#include file="menu.asp"--><br>
  <center><form method="POST" action="updatemailconfig.asp" >
<table width="376" border="1"  bordercolor="<%=bordercolor%>" style="border-collapse: collapse"  cellspacing="0" height="19" align="center">     
<tr align="center" class="addfont"> 
        <td height="23" colspan="2" style="padding:2px"><div align="center"><strong>JMAIL参数设置</strong></div><%
Function TestObj(Str)
On Error Resume Next
TestObj = False
Err.Description = ""
Set TObj = Server.CreateObject(Str)
If Err.Description = "" Then TestObj = True
Set TObj = Nothing
End Function
Response.Write "<LI>你的空间"
If not TestObj("JMail.SmtpMail") then Response.Write "不"
Response.Write "支持JMail</LI>"
%>
        </td>
    </tr>
	        <tr  class="lybtable">
	          <td width="39%" height="23" align="right"><span class="style4"> SMTP服务器地址 ： </span></td>
              <td width="61%" height="23" ><input name="MailServer" type="text" id="MailServer"></td>
      </tr>
	        <tr  class="lybtable">
	          <td height="23" align="right" ><span class="style4">登陆用户名：</span></td>
              <td height="23" ><input name="ServerUserName" type="text" id="ServerUserName"></td>
      </tr>
	        <tr  class="lybtable">
	          <td height="23" align="right" ><span class="style4">登陆密码：</span></td>
              <td height="23" ><input name="ServerPassword" type="text" id="ServerPassword"></td>
      </tr>
	        <tr  class="lybtable">
	          <td height="23" align="right"><span class="style4">发件人信箱：</span></td>
              <td height="23" ><input name="MailFrom" type="text" id="MailFrom"></td>
      </tr>
	        <tr  class="lybtable">
	          <td height="23" align="right"><span class="style4">发件人称呼：</span></td>
	          <td height="23" ><input name="SendName" type="text" id="SendName"></td>
      </tr>
      <tr  class="lybtable"> 
        <td height="31" colspan="2" align="right"> <p align="center"> 
            <input name="B1" type="submit" class="noBorder" value="提交">
			
            &nbsp; 
            <input name="B2" type="reset" class="noBorder" value="重置">
        </td>
      </tr>
    </table> 
  </form> 
</div> 
 
</body> 
 
</html>
