<!--#include file="conn.asp"-->
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
<title>搜索留言--<%=lybtitle%></title>
<SCRIPT language=javascript>
function check(key) {
if (key.keyword.value=="") {
alert("查询不能为空！请填写。")
key.keyword.focus()
return false 
}
else
return true 
}
</SCRIPT>
<!--#include file="style.asp"-->
</head>

<body><!--#include file="top.asp"--><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<form action="searchresult.asp" method="POST"
        onsubmit="return check(this)">
<table width="650" height="64" align="center" cellpadding="0" cellspacing="0" class="lybtable">
  <tr>
    <td width="100%" height="64"><div align="center">
             <font color="#000000">&nbsp;<b> 查询方式：</b>
        <select size="1" name="classid" >
          <option selected>留言内容</option>
          <option>回复内容</option>
          <option>姓名</option>
        </select>
          关键字：
        <input        
            type="text" size="28" maxlength="12" name="keyword"       
>
        <input type="submit" name="B1"  value="查询(S)" accesskey="s"   class=noborder> 
            &nbsp;        
            </font>  
     </td>
  </tr>
</table></form>    
<br><br><br><br><br>
<br><!--#include file="bottom.asp"-->
　</body></html>
<%
connclose()    
%>    