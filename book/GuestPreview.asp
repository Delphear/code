<!--#include file="../conn.asp"-->
<!--#include file="../inc/ubbcode.asp"-->
<%
strHTML=strHTML & "<html>" & vbcrlf
strHTML=strHTML & "<head>" & vbcrlf
strHTML=strHTML & "<title>留言预览</title>" & vbcrlf
strHTML=strHTML & "<link href='../Skin/DefaultSkin.css' rel='stylesheet' type='text/css'>" & vbcrlf
strHTML=strHTML & "</head>" & vbcrlf
strHTML=strHTML & "<body leftmargin='0' topmargin='0'>" & vbcrlf
strHTML=strHTML & "<br><table width='100%' border='0' cellpadding='0' cellspacing='0' class='center_tdbgall' align='center'>" & vbcrlf
strHTML=strHTML & "<tr>" & vbcrlf
strHTML=strHTML & "  <td align='center' valign='top' class='main_title_760'>" & vbcrlf
strHTML=strHTML & "    <table width='100%' border='0' cellspacing='0' cellpadding='0' height='22'>" & vbcrlf
strHTML=strHTML & "      <tr>" & vbcrlf
strHTML=strHTML & "        <td ><font color=green>&nbsp;&nbsp;主题：</font>&nbsp;" & request.form("title") & "</td>"
strHTML=strHTML & "        <td width='200'><img src='images/posttime.gif' width='11' height='11' align='absmiddle'><font color='#006633'>&nbsp; " & now() & "</font></td>" & vbcrlf
strHTML=strHTML & "      </tr>" & vbcrlf
strHTML=strHTML & "    </table>" & vbcrlf
strHTML=strHTML & "  </td>" & vbcrlf
strHTML=strHTML & "</tr>" & vbcrlf
strHTML=strHTML & "<tr> " & vbcrlf
strHTML=strHTML & "  <td height='160' valign='top' class='main_tdbg_760'>" & ubbcode(request.form("content")) 
strHTML=strHTML & "  </td>" & vbcrlf
strHTML=strHTML & "</tr>" & vbcrlf
strHTML=strHTML & "<tr> " & vbcrlf
strHTML=strHTML & "  <td height='20' valign='top' align='center'>【<a href='javascript:window.close();'>关闭窗口</a>】" 
strHTML=strHTML & "  </td>" & vbcrlf
strHTML=strHTML & "</tr>" & vbcrlf
strHTML=strHTML & "</table>" & vbcrlf
strHTML=strHTML & "</body>"
strHTML=strHTML & "</html>"
response.write strHTML
%>