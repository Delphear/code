<!--#include file="conn.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="badview.asp"-->
<!--#include file="close.asp"-->
<%
function   urldecoding(vstrin)   
  dim   i,strreturn,strSpecial   
  strSpecial   =   "!""#$%&'()*+,./:;<=>?@[\]^`{|}~%"   
  strreturn   =   ""   
  for   i   =   1   to   len(vstrin)   
  thischr   =   mid(vstrin,i,1)   
  if   thischr="%"   then   
  intasc=eval("&h"+mid(vstrin,i+1,2))   
  if   instr(strSpecial,chr(intasc))>0   then   
  strreturn=   strreturn   &   chr(intasc)   
  i=i+2   
  else   
  intasc=eval("&h"+mid(vstrin,i+1,2)+mid(vstrin,i+4,2))   
  strreturn=   strreturn   &   chr(intasc)   
  i=i+5   
  end   if   
  else   
  if   thischr="+"   then   
  strreturn=   strreturn   &   "   "   
  else   
  strreturn=   strreturn   &   thischr   
  end   if   
  end   if   
  next   
  urldecoding   =   strreturn   
  end   function  
%>
<% 
Response.Buffer =True
Response.ExpiresAbsolute =Now() - 1
Response.Expires=0
Response.CacheControl="no-cache" 
session("postnum")=0
%>
<script language="JavaScript">
function Do_submit()
{
lunjily.action = "save.asp";
lunjily.submit();
return true;
}
</script>
<html>
<head>
<meta name="Author" content="BlueSailor">
<title>发表留言--<%=lybtitle%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!--#include file="style.asp"-->
</head>
<body onkeydown="if(event.keyCode==13 && event.ctrlKey)document.forms[0].submit()" >
<!--#include file="top.asp"-->
<form name=lunjily action=save.asp method=post>    
  <table cellspacing=0 border=1 width=650 style="border-collapse: collapse"  cellpadding="0" height="310" align="center" bordercolor="<%=bordercolor%>">
    <tr> 
      <td height=21 colspan="2" class="addfont"><div align="center">发表留言(有<font color="#FF0000">*</font>号的必填)</div></td>
    </tr>
    <tr> 
      <td width="217" height="21" class="addfont"><div align="right">姓名：&nbsp; 
        </div></td>
      <td width="427" height="21" class="bodytableleft"> &nbsp; <input type="text" name="guestname" maxlength="10" size="20" value="<%= request.cookies("userInfo")("username") %>" > 
        <font color="#FF0000">*</font> </td>
    </tr>
    <tr> 
      <td width="217" height="21" class="addfont"> <div align="right">部门：&nbsp; 
        </div></td>
      <td width="427" height="21" class="bodytableleft">&nbsp; <input type="text" name="from" maxlength="10" size="20" value="<%= request.cookies("userInfo")("userbm") %>" > 
      </td>
    </tr>
	<%    
		if smile=True then    
	%>
    <tr> 
      <td width="217" height="22" class="addfont"> <div align="right">选择表情：&nbsp;</div> 
        </div></td>
      <td width="427" height="22" valign="middle" class="bodytableleft"> &nbsp; <img src="images/p1.gif" width="15" height="15" onclick="guestcontent.value+='[img]images/p1.gif[/img]';" style="CURSOR:hand" > 
        <img src="images/p2.gif" width="15" height="15" onclick="guestcontent.value+='[img]images/p2.gif[/img]';" style="CURSOR:hand" > 
        <img src="images/p3.gif" width="15" height="15" onclick="guestcontent.value+='[img]images/p3.gif[/img]';" style="CURSOR:hand" > 
        <img src="images/p4.gif" width="15" height="24" onclick="guestcontent.value+='[img]images/p4.gif[/img]';" style="CURSOR:hand" > 
        <img src="images/p5.gif" width="15" height="15" onclick="guestcontent.value+='[img]images/p5.gif[/img]';" style="CURSOR:hand" > 
        <img src="images/p6.gif" width="15" height="15" onclick="guestcontent.value+='[img]images/p6.gif[/img]';" style="CURSOR:hand" > 
        <img src="images/p7.gif" width="15" height="15" onclick="guestcontent.value+='[img]images/p7.gif[/img]';" style="CURSOR:hand" > 
        <img src="images/p8.gif" width="15" height="15" onclick="guestcontent.value+='[img]images/p8.gif[/img]';" style="CURSOR:hand" > 
        <img border="0" src="images/p9.gif" onclick="guestcontent.value+='[img]images/p9.gif[/img]';" style="CURSOR:hand" > 
        <img border="0" src="images/p10.gif" onclick="guestcontent.value+='[img]images/p10.gif[/img]';" style="CURSOR:hand" > 
        <img border="0" src="images/p11.gif" onclick="guestcontent.value+='[img]images/p11.gif[/img]';" style="CURSOR:hand" > 
        <img border="0" src="images/p12.gif" onclick="guestcontent.value+='[img]images/p12.gif[/img]';" style="CURSOR:hand" > 
        <img border="0" src="images/p13.gif" onclick="guestcontent.value+='[img]images/p13.gif[/img]';" style="CURSOR:hand" ></td>
    </tr>
    <%end if%>
    <%    
if secret=True then    
%>
    <tr> 
      <td width="217" height="22" class="addfont"><div align="right">悄悄话：&nbsp; 
        </div></td>
      <td width="427" height="22" class="bodytableleft"> &nbsp; <select size="1" name="secretly">
          <option selected value="False">否</option>
          <option value="True">是</option>
        </select> </td>
    </tr>
    <%end if%>
    <tr> 
      <td width="217" height="11" class="addfont"> <div align="right">选择头像：&nbsp; 
        </div></td>
      <td width="427" height="11" class="bodytableleft"> <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td><div id="imgBox"></div>
              <input name="myhead" type="hidden" id="myface" size="10" value=""> </center> 
              <script language="JavaScript" src="head.js" type="text/JavaScript"></script> 
              &nbsp;&nbsp;</td>
          </tr>
        </table></td>
    </tr>
	<%    
		if ubb=True then    
	%>
    <tr> 
      <td width="217" height="22" class="addfont"><div align="right">Ubb标签：&nbsp; 
        </div></td>
      <td width="427" height="22" class="bodytableleft"> &nbsp; <script src=code.js></script> 
        <!--#include file=ubb.inc -->
      </td>
    </tr>
    <%end if%>
    <tr> 
      <td width="217" height="95" class="addfont"><div align="right">留言内容：(*) 
          <br>
          UBB：开启 <br>
          最大留言字节数：<%=maxlen%><br>
          <br>
        </div></td>
      <td width="427" height="95" class="bodytableleft"> &nbsp; <textarea name="guestcontent" cols="47" wrap="VIRTUAL" rows="8"
 onfocus=this.select() onmouseover=this.focus()></textarea> 
        <font color="#FF0000">*</font> </td>
    </tr>
    <tr class="addfont"> 
      <td height=22 colspan="2" align=center> <input type="submit" name="Submit3" value="提交" onclick="javascript:this.disabled=true;return Do_submit()"  class=noBorder>
        (Ctrl+Enter提交) <a href="index.asp">查看留言</a></td>
    </tr>
  </table>
</form> <br>    
<!--#include file="bottom.asp"-->    
</body>     
</html>
<%
connclose()    
%>    
