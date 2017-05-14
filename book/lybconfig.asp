<!--#include file="conn.asp"-->
<!--#include file="chkmanage.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>参数设置--<%=lybtitle%></title>
<!--#include file="style.asp"-->
</head>
<body><!--#include file="menu.asp"--><div align="center">
  <center><form method="POST" action="updateconfig.asp" >
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="<%=bordercolor%>" width="442" height="333">
      <tr> 
        <td width="100%" height="22" colspan="2" align="center" class="addfont"><strong>参数设置</strong></td>
      </tr>
      <tr> 
        <td width="47%" height="22" align="right" class="addfont">留言簿名称：</td>
        <td width="53%" height="22" class="lybtable"> <input type="text" name="lybtitle" size="20" value="<%=lybtitle%>"></td>
      </tr>
      <tr> 
        <td width="47%" height="22" align="right" class="addfont">网站首页网址：</td>
        <td width="53%" height="22" class="lybtable"> <input type="text" name="weburl" size="20" value="<%=weburl%>"></td>
      </tr>
      <tr> 
        <td width="47%" height="22" align="right" class="addfont">每页显示留言条数：</td>
        <td width="53%" height="22" class="lybtable"> <input type="text" name="listnum" size="20" value="<%=listnum%>"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
      </tr>
      <tr> 
        <td width="47%" height="22" align="right" class="addfont">版权所有：</td>
        <td width="53%" height="22" class="lybtable"> <input type="text" name="rightre" size="20" value="<%=rightre%>"></td>
      </tr>
      <tr> 
        <td width="47%" height="23" align="right" class="addfont">版本号：</td>
        <td width="53%" height="23" class="lybtable"> <input type="text" name="rightnum" size="20" value="<%=rightnum%>" readonly></td>
      </tr>
      <tr> 
        <td width="47%" height="22" align="right" class="addfont">悄悄话功能：</td>
        <td width="53%" height="11" class="lybtable"> <select size="1" name="secret">
        
	<%
		if secret=True then
	%>
            <option selected value="True">开启</option>
            <option value="False">关闭</option>
            <%else%>
            <option selected value="False">关闭</option>
            <option value="True">开启</option>
            <%end if%>
          </select></td>
      </tr>
      <tr>
        <td width="47%" height="22" align="right" class="addfont">后台审核： </td>
        <td height="30" class="lybtable">
<select size="1" name="sh">
        <%
		if sh=True then
	%>
            <option selected value="True">开启</option>
            <option value="False">关闭</option>
            <%else%>
            <option selected value="False">关闭</option>
            <option value="True">开启</option>
            <%end if%>
          </select>
          (经过审核的留言才能显示)</td>
      </tr>
      <tr> 
        <td width="47%" height="22" align="right" class="addfont">表情图像：</td>
        <td width="53%" height="23" class="lybtable"> <select size="1" name="smile">
        <%
		if smile=True then
	%>
            <option selected value="True">开启</option>
            <option value="False">关闭</option>
            <%else%>
            <option selected value="False">关闭</option>
            <option value="True">开启</option>
            <%end if%>
          </select></td>
      </tr>
      <tr> 
        <td width="47%" height="22" align="right" class="addfont">UBB图像：</td>
        <td width="53%" height="23" class="lybtable"><select size="1" name="ubb">
        <%
		if ubb=True then
	%>
            <option selected value="True">开启</option>
            <option value="False">关闭</option>
            <%else%>
            <option selected value="False">关闭</option>
            <option value="True">开启</option>
            <%end if%>
          </select></td>
      </tr>
      <tr> 
        <td width="47%" height="22" align="right" class="addfont">留言板风格：</td>
        <td width="53%" height="23" class="lybtable"> <select size="1" name="lunjilybstyle">
            <%
if lunjilybstyle=1 then
%>
            <option selected value="1">蓝色</option>
            <option value="2">灰色</option>
            <option value="3">黄色</option>
            <option value="4">绿色</option>
            <%elseif lunjilybstyle=2 then%>
            <option selected value="2">灰色</option>
            <option value="1">蓝色</option>
            <option value="3">黄色</option>
            <option value="4">绿色</option>
            <%elseif lunjilybstyle=3 then%>
            <option selected value="3">黄色</option>
            <option value="1">蓝色</option>
            <option value="2">灰色</option>
            <option value="4">绿色</option>
            <%elseif lunjilybstyle=4 then%>
            <option selected value="4">绿色</option>
            <option value="1">蓝色</option>
            <option value="2">灰色</option>
            <option value="3">黄色</option>
            <%end if%>
          </select></td>
      </tr>
      <tr> 
        <td width="47%" height="22" align="right" class="addfont">留言最大字节数：</td>
        <td width="53%" height="11" class="lybtable"> <input type="text" name="maxlen" size="20" value="<%=maxlen%>"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
      </tr>
      <tr> 
        <td width="47%" height="22" align="right" class="addfont">（用,分开）过滤的语言：</td>
        <td width="53%" height="25" class="lybtable"> <input type="text" name="killwords" size="20" value="<%=killword%>"></td>
      </tr>      <tr> 
        <td width="47%" height="22" align="right" class="addfont">关闭留言簿：</td>
        <td width="53%" height="25" class="lybtable"><input name="close" type="checkbox" id="close" value="close">          
          关闭<br>
  说明文字                    
            <textarea name="close_content" cols="30" rows="4" id="close_content"><%=close_content%></textarea></td>
      </tr>
      <tr class="lybtable"> 
        <td width="100%" height="25" colspan="2" align="right"> <p align="center"> 
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
