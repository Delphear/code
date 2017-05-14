<!--#include file="inc/char.asp"-->
<!--#include file="badview.asp"-->

<%if request.Cookies("lunjilyb")("username")="" then%>
<html>
<head>
<meta name="Author" content="BlueSailor">

<title>管理员登陆</title>
<!--#include file="css.asp"-->
</head>

<body text="#000000">

<br><br><br>
<form  method="post" action="chklogin.asp">
  <div align="center">
  <table cellpadding=3 cellspacing=1 border=0 width=316 bgcolor="#183EAD" height="43">
    <tr bgcolor=#F0AA06> 
      <td bgcolor="#027CD7" align=center colspan="2" height="23" width="304">
        <p align="center"><font color="#ffffff"><b>管理员登陆</b></font></p>
      </td>
    </tr>
    <center>
    <tr bgcolor=#F0AA06> 
      <td width="81" align="center" height="19" bgcolor="#B5CBFF"> 
        <div align="left">&nbsp;管理员名称：</div>
      </td>
      <td width="213" height="19" bgcolor="#ECF1FF"> &nbsp;<input type="text" name="username" size="15">
      </td>
    </tr>
    <tr bgcolor=#F0AA06> 
      <td width="81" align="center" height="27" bgcolor="#B5CBFF"> 
        <div align="left">&nbsp;管理员密码：</div>
      </td>
      <td width="213" height="27" bgcolor="#ECF1FF">&nbsp;<input type="password" name="password" size="15">
      </td>
    </tr>
<tr align="center"> 
	  <td colspan="2" height="24" bgcolor="#ECF1FF" width="304">
	  登陆保留：<input type=radio name="expTime" value="" checked>不保留 
	  <input type=radio name="expTime" value="<%=dateAdd("d",1,now)%>">1天 
	  <input type=radio name="expTime" value="<%=dateAdd("ww",1,now)%>">1周 
	  <input type=radio name="expTime" value="<%=dateAdd("m",1,now)%>">1月 
	  <input type=radio name="expTime" value="<%=dateAdd("yyyy",1,now)%>">1年 
	  </td> 
	</tr> 
    <tr bgcolor=#F0AA06>  
      <td bgcolor="#B5CBFF" align=center colspan="2" height="1" width="304">  
        <input name="Submit3" type="submit" class="noBorder" value="提交"> 
      </td> 
    </tr> 
  </table> 
    
  </div> 
  </form> 
<br> 
 
</body> 
</html> 
<% 
else 
response.redirect "admin-index.asp" 
end if 
%>
