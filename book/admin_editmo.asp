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
<html>
<head>
<meta name="Author" content="BlueSailor">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�޸Ĺ���Ա����</title>
<!--#include file="style.asp"-->
</head>
<body>
<div align="center"> <!--#include file="menu.asp"-->
<form method="POST" action="update_editmo.asp"> 
<table width="650" border="1" style="border-collapse: collapse"  cellspacing="0" height="19" bgcolor="<%=tablebgcolor%>" align="center"  bordercolor="<%=bordercolor%>" >     
    <tr class="addfont"> 
     <td width="57%" height="20" colspan="2">   
     <p align="center"><b>��������</b></td> 
     <td width="43%" height="20">   
     <p align="center"><b>˵���ĵ�</b></td> 
   </tr>    <tr class="lybtable">      <td width="17%" height="1" align="right">&nbsp;<b>����:</b></td>    
  <td width="40%" height="1"> 
 <p>
 <input type="text" name="admin_name" size="20" value="<%=admin_name%>">(<font color="#FF0000">*</font>)</p> 
          </td>        
  <td width="43%" height="74" rowspan="9" valign="top"> 
 <p style="line-height: 150%"><br>
 <b><font color="#FF0000">ID</font></b>Ϊ���������ã���<font color="#FF0000">��ʾ����</font>��<font color="#FF0000">��Ҫ��������ظ���Ҳ��Ҫ���õ�̫�򵥣�</font>�Է�����ð��)<br>
 ����<br>
 �����������������<br>
 I D:����Ц123<br>
 ����ʱ���õ��û���Ϊ������Ц123<br>
 ������ʾ�������ǣ������������<br>
 �����ã������������ Ϊ�û���������<br>
 ���ã���ֹ����ð�����<br>
 <br>
 <br>
 (<font color="#FF0000">*</font>)Ϊ������</td>    </tr>    <tr class="lybtable">      
      <td width="17%" height="18" align="right">&nbsp;<b>ID:</b></td> 
     <td width="40%" height="9">
<input type="text" name="admin_id" size="20" value="<%=admin_id%>">(<font color="#FF0000">*</font>)</td> 
   </tr>    
    <tr class="lybtable">
      <td width="17%" height="6" align="right"><b>QQ:</b></td> 
     <td width="40%" height="6">
<input type="text" name="admin_qq" size="20" value="<%=admin_qq%>"></td> 
    </tr>
    <tr class="lybtable">
      <td width="17%" height="5" align="right"><b>E-MAIL:</b></td> 
     <td width="40%" height="5">
<input type="text" name="admin_email" size="20" value="<%=admin_email%>"></td> 
    </tr>
    <tr class="lybtable">
      <td width="17%" height="6" align="right"><b>MSN:</b></td> 
     <td width="40%" height="6">
<input type="text" name="admin_msn" size="20" value="<%=admin_msn%>"></td> 
    </tr>
    <tr class="lybtable">
      <td width="17%" height="6" align="right"><b>ICQ:</b></td> 
     <td width="40%" height="6">
<input type="text" name="admin_icq" size="20" value="<%=admin_icq%>"></td> 
    </tr>
    <tr class="lybtable">
      <td width="17%" height="3" align="right"><b>��ҳ��</b></td> 
     <td width="40%" height="3">
<input type="text" name="admin_homepage" size="20" value="<%=admin_homepage%>"></td> 
    </tr>
    <tr class="lybtable">
      <td width="17%" height="26" align="right"><b>˵����</b></td> 
     <td width="40%" height="26">
<textarea rows="4" name="admin_note" cols="27"><%=admin_note%></textarea></td> 
    </tr>
    <tr class="lybtable">      <td width="57%" height="12" colspan="2"> 
 <p align="center"><input name="B1" type="submit" class="noBorder" value="����">&nbsp;&nbsp;&nbsp;&nbsp;         
<input name="B2" type="reset" class="noBorder" value="��д"></p>      </td>    </tr>  </table>  
  </form>
</body>
</html>
<%
connclose() 
%>