<!--#include file="conn.asp"-->
<!--#include file="chkmanage.asp"-->
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
<%
id=request("id")
set rs=server.createobject("adodb.recordset")
sql="select id,sh from [guest] where id="&id
rs.open sql,conn,1,3
rs("sh")=false
	rs.update
rsclose()
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ɹ��޸�</title>
<!--#include file="style.asp"-->
</head><body>
<script language="javascript">
alert("ͨ����ˣ�")
history.go(-1)
</script>
</body> 
</html> 
<%connclose()%> 
