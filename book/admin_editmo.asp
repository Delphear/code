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
<html>
<head>
<meta name="Author" content="BlueSailor">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>修改管理员资料</title>
<!--#include file="style.asp"-->
</head>
<body>
<div align="center"> <!--#include file="menu.asp"-->
<form method="POST" action="update_editmo.asp"> 
<table width="650" border="1" style="border-collapse: collapse"  cellspacing="0" height="19" bgcolor="<%=tablebgcolor%>" align="center"  bordercolor="<%=bordercolor%>" >     
    <tr class="addfont"> 
     <td width="57%" height="20" colspan="2">   
     <p align="center"><b>版主资料</b></td> 
     <td width="43%" height="20">   
     <p align="center"><b>说明文档</b></td> 
   </tr>    <tr class="lybtable">      <td width="17%" height="1" align="right">&nbsp;<b>网名:</b></td>    
  <td width="40%" height="1"> 
 <p>
 <input type="text" name="admin_name" size="20" value="<%=admin_name%>">(<font color="#FF0000">*</font>)</p> 
          </td>        
  <td width="43%" height="74" rowspan="9" valign="top"> 
 <p style="line-height: 150%"><br>
 <b><font color="#FF0000">ID</font></b>为版主留言用，可<font color="#FF0000">显示版主</font>，<font color="#FF0000">不要与版主名重复，也不要设置的太简单，</font>以防他人冒充)<br>
 例：<br>
 网名：鱼儿不在网上<br>
 I D:哈哈笑123<br>
 留言时你用的用户名为：哈哈笑123<br>
 留言显示出来的是：鱼儿不在网上<br>
 不可用：鱼儿不在网上 为用户名来留言<br>
 作用：防止他人冒充版主<br>
 <br>
 <br>
 (<font color="#FF0000">*</font>)为必填项</td>    </tr>    <tr class="lybtable">      
      <td width="17%" height="18" align="right">&nbsp;<b>ID:</b></td> 
     <td width="40%" height="9">
<input type="text" name="admin_id" size="20" value="<%=admin_id%>">(<font color="#FF0000">*</font>)</td> 
   </tr>    
    <tr class="lybtable">
      <td width="17%" height="6" align="right"><b>QQ:</b></td> 
     <td width="40%" height="6">
<input type="text" name="admin_qq" size="20" value="<%=admin_qq%>"></td> 
    </tr>
    <tr class="lybtable">
      <td width="17%" height="5" align="right"><b>E-MAIL:</b></td> 
     <td width="40%" height="5">
<input type="text" name="admin_email" size="20" value="<%=admin_email%>"></td> 
    </tr>
    <tr class="lybtable">
      <td width="17%" height="6" align="right"><b>MSN:</b></td> 
     <td width="40%" height="6">
<input type="text" name="admin_msn" size="20" value="<%=admin_msn%>"></td> 
    </tr>
    <tr class="lybtable">
      <td width="17%" height="6" align="right"><b>ICQ:</b></td> 
     <td width="40%" height="6">
<input type="text" name="admin_icq" size="20" value="<%=admin_icq%>"></td> 
    </tr>
    <tr class="lybtable">
      <td width="17%" height="3" align="right"><b>主页：</b></td> 
     <td width="40%" height="3">
<input type="text" name="admin_homepage" size="20" value="<%=admin_homepage%>"></td> 
    </tr>
    <tr class="lybtable">
      <td width="17%" height="26" align="right"><b>说明：</b></td> 
     <td width="40%" height="26">
<textarea rows="4" name="admin_note" cols="27"><%=admin_note%></textarea></td> 
    </tr>
    <tr class="lybtable">      <td width="57%" height="12" colspan="2"> 
 <p align="center"><input name="B1" type="submit" class="noBorder" value="更新">&nbsp;&nbsp;&nbsp;&nbsp;         
<input name="B2" type="reset" class="noBorder" value="重写"></p>      </td>    </tr>  </table>  
  </form>
</body>
</html>
<%
connclose() 
%>