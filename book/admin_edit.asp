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
set rs=server.createobject("adodb.recordset")
sql="select username,password from admin where id=1"
rs.open sql,conn,1,3
%>
<html>
<head>
<meta name="Author" content="BlueSailor">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�޸Ĺ���Ա����--<%=lybtitle%></title>
<!--#include file="style.asp"-->
</head>
<body topmargin="1" bgcolor="<%=bodybgcolor%>" alink=<%=alink%> vlink=<%=vlink%> link=<%=link%> >
<div align="center"> <!--#include file="menu.asp"-->
<form method="POST" action="update_editadmin.asp"> 
 <center>  
<table width="350" border="1"  bordercolor="<%=bordercolor%>" style="border-collapse: collapse"  cellspacing="0" height="19" align="center">     
<tr class="addfont"> 
     <td width="100%" height="20" colspan="2"  bgcolor="<%=add_leftbg%>">   
     <p align="center"><b><font color="#FFFFFF">�޸Ĺ���Ա����</font></b></td> 
</tr>    
<tr class="lybtable">      <td width="32%" height="1">&nbsp;<b>�ʺ�:</b></td>    
  <td width="68%" height="1"> 
 <p><input type="text" name="name" size="22" value="<%=rs.fields("username")%>"></p> 
          </td>    
</tr>    
<tr class="lybtable">      <td width="32%" height="9">&nbsp;<b>������:</b></td> 
     <td width="68%" height="9">
<input type="password" name="pass" size="22"></td> 
   </tr>    
<tr class="lybtable">      <td width="32%" height="9">&nbsp;<b>������:</b></td> 
     <td width="68%" height="9">
<input type="password" name="pass1" size="22"></td> 
   </tr>   
<tr class="lybtable">      <td width="32%" height="9">&nbsp;<b>ȷ��������:</b></td> 
     <td width="68%" height="9">
<input type="password"" name="pass2" size="22"></td> 
   </tr>     <tr class="lybtable">      <td width="100%" height="12" colspan="2"> 
 <p align="center"><input name="B1" type="submit" class="noBorder" value="����">&nbsp;&nbsp;&nbsp;&nbsp;  
 <input name="B2" type="reset" class="noBorder" value="��д"></p>      </td>    </tr>  </table>  
</center>
  </form>
</body>
</html>
<%
connclose()    
%>    