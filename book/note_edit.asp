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
sql="select notetitle,notebbs,notedate from lybconfig where id=1"
rs.open sql,conn,1,3
%>
<html>
<head>
<meta name="Author" content="BlueSailor">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�޸Ĺ���--<%=lybtitle%></title>
<!--#include file="style.asp"-->
</head>
<body>
<div align="center"> <!--#include file="menu.asp"-->
<form method="POST" action="update_editnote.asp"> 
 <center>  
<table width="550" border="1" style="border-collapse: collapse"  cellspacing="0" height="345" align="center"  bordercolor="<%=bordercolor%>" >     
    <tr class="addfont"> 
     <td height="20" colspan="2">   
     <p align="center">�޸Ĺ���</td> 
   </tr>    <tr class="lybtable">      <td width="33%" height="21">&nbsp;<b> �� ��:���հ׼��޹��棩</b></td>       
  <td width="67%" height="21"> 
 <p>
 &nbsp;<input type="text" name="notetitle" size="37" value="<%=rs.fields("notetitle")%>"></p> 
          </td>    </tr>    
    <tr class="lybtable">
      <td width="33%" height="10">&nbsp; <b>UBB</b></td>    
        <td width="67%" height="10"> &nbsp; 
          <script src=code.js></script>
<!--#include file=ubb.inc --> 
          </td>    
    </tr>
    <tr class="lybtable">      <td width="33%" height="259">&nbsp;<b> �� ��:</b></td>    
     <td width="67%" height="259">
&nbsp;<textarea rows="18" name="guestcontent" cols="42"><%=rs.fields("notebbs")%></textarea></td> 
   </tr>    <tr class="lybtable">      <td width="100%" height="12" colspan="2"> 
 <p align="center"><input name="B1" type="submit" class="noBorder" value="����">&nbsp;&nbsp;&nbsp;&nbsp;         
<input name="B2" type="reset" class="noBorder" value="��д"></p>      </td>    </tr>  </table>  
</center>
  </form>
</body>
</html>
<%
rsclose()
connclose() 
%>