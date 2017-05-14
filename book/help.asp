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
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=lybtitle%>帮助系统</title>
<meta name="keywords" content="留言簿下载|www.lunji.com">
<meta name="description" content="留言簿下载|www.lunji.com">
<!--#include file="style.asp"-->
</head>
<body>
<div align="center">
  <center>
  <table width="88%" height="368" cellpadding="0" cellspacing="0" class="lybtable">
    <tr>
      <td width="100%" height="24" bgcolor="#BCC9FE" class="toptable" style="font-size: 12pt">
      <p align="center"><b><%=lybtitle%>帮助系统</b></td>
    </tr>
    <tr>
        <td width="100%" height="343" valign="top" style="padding: 6"><b> 一、欢迎使用<%=lybtitle%>帮助系统：</b> 
          <p style="line-height: 150%">
      1、在留言时用的用户名不能为空或大于10，也不可使用<>[]等非法字符<br>
      2、不能冒充版主留言<br>
      3、您的留言字数不能为空或太少，或恶意灌水<br>
      4、你可以使用UBB语法来留言如要显示红色字，则用[color=red]红字[/color]，显示出的留言结果为：<font color="#FF0000">红字</font><br />
      5、email.homepage等项可为空，但不可乱输入<br>
      6、版主可设定防伪ID来防止普通用户假冒<br>
      7、支持版权、管理员密码、管理员密码的在线维护<br>
      8、本版本个人用户可免费使用，但不得用于商业目的<br>
      9、可以修改版权，但请保留版本号处的链接，也算是对作者的劳动成果的一种尊重，违者必究<br>
      10、商业用户请注册。
      <br>
      <b>二、不得利用本留言簿进行以下活动：</b></p>
      <p style="line-height: 150%">
      （一）煽动抗拒、破坏宪法和法律、行政法规实施的；<br style="font-family: 宋体; font-size: 12px; color: #000000">
      （二）煽动颠覆国家政权，推翻社会主义制度的；<br style="font-family: 宋体; font-size: 12px; color: #000000">
      （三）煽动分裂国家、破坏国家统一的；<br style="font-family: 宋体; font-size: 12px; color: #000000">
      （四）煽动民族仇恨、民族歧视，破坏民族团结的；<br style="font-family: 宋体; font-size: 12px; color: #000000">
      （五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br style="font-family: 宋体; font-size: 12px; color: #000000">
      （六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br style="font-family: 宋体; font-size: 12px; color: #000000">
      （七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br style="font-family: 宋体; font-size: 12px; color: #000000">
      （八）损害国家机关信誉的；<br style="font-family: 宋体; font-size: 12px; color: #000000">
      （九）其他违反宪法和法律行政法规的；<br style="font-family: 宋体; font-size: 12px; color: #000000">
      （十）进行商业广告行为的。<br>
　</p>
          <p style="line-height: 150%"> -------------------------------------------------------------------------------------------<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;------- <%=admin_name%></p>
      <p><br><br>
        </tr>
  </table>
  </center>
</div>

</body>

</html>
<%
connclose() 
%>