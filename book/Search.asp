<!--#include file="conn.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
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
<html>
<head>
<meta name="Author" content="BlueSailor">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��������--<%=lybtitle%></title>
<SCRIPT language=javascript>
function check(key) {
if (key.keyword.value=="") {
alert("��ѯ����Ϊ�գ�����д��")
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
             <font color="#000000">&nbsp;<b> ��ѯ��ʽ��</b>
        <select size="1" name="classid" >
          <option selected>��������</option>
          <option>�ظ�����</option>
          <option>����</option>
        </select>
          �ؼ��֣�
        <input        
            type="text" size="28" maxlength="12" name="keyword"       
>
        <input type="submit" name="B1"  value="��ѯ(S)" accesskey="s"   class=noborder> 
            &nbsp;        
            </font>  
     </td>
  </tr>
</table></form>    
<br><br><br><br><br>
<br><!--#include file="bottom.asp"-->
��</body></html>
<%
connclose()    
%>    