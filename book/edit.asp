<!--#include file="conn.asp"-->
<!--#include file="inc/char.asp"-->
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
  dim id
    id=request("id")
    set rs=server.createobject("adodb.recordset")
    sql="select * from [guest] where id="&id
rs.open sql,conn,1,3
if rs("sessionid")=session.sessionid then
%>
<script language="JavaScript">
function Do_submit()
{
lunji_lyedit.action = "update_edit.asp";
lunji_lyedit.submit();
return true;
}
</script>
<html>
<head>
<meta name="Author" content="BlueSailor">
<title>�༭����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!--#include file="style.asp"-->
</head>
<body onkeydown="if(event.keyCode==13 && event.ctrlKey)document.forms[0].submit()" >
<!--#include file="top.asp"-->
<form action=update_edit.asp method=post name="lunji_lyedit">
 <table cellspacing=0 border=1 width=650 style="border-collapse: collapse"  cellpadding="0" height="310" align="center" bordercolor="<%=bordercolor%>">
          <tr class="addfont"> 
            <td height=22 colspan="2" align=center><b>�༭����(��</font><font color="#FF0000">*</font>�ŵı���)</font></b></td>
          </tr>
          <tr> 
            <td width="30%" height="22" align="center" class="addfont"> <div align="right"><b>���������&nbsp;</b></font></div></td>
            <td width="70%" height="22" class="lybtable"> &nbsp;  
<% if rs("guestname")=admin_name then%>
<input type="text" name="guestname" maxlength="10" size="19" value="<%=admin_id%>" readonly="true"> 
<%else%> 
<input type="text" name="guestname" maxlength="10" size="19" value="<%=rs("guestname")%>"> 
<%end if%> 
       
              <font color="#FF0000">*</font> </td>       
          </tr>      
          <tr>       
            <td width="30%" height="22" align="center" class="addfont"> <div align="right"><b>�������&nbsp;</b></font></div></td>      
            <td width="70%" height="22" class="lybtable">&nbsp; <input type="text" name="from" maxlength="10" size="19" value="<%=rs("from")%>">        
            </td>       
          </tr>       
          <tr>        
            <td width="30%" height="22" align="center" class="addfont"> <div align="right"><b>��ҳ��ַ��&nbsp;</b></font></div></td>      
            <td width="70%" height="22" class="lybtable"> &nbsp; <input type="text" name="homepage" value="<%=rs("homepage")%>" size="19">        
            </td>       
          </tr>       
          <tr>        
            <td width="30%" height="22" align="center" class="addfont"> <div align="right"><b>Email��ַ��&nbsp;</b></font></div></td>      
            <td width="70%" height="22" class="lybtable"> &nbsp; <input type="text" name="email" value="<%=rs("email")%>" size="19">        
            </td>       
          </tr>  
          <tr>        
            <td width="30%" height="22" align="center" class="addfont"> <div align="right"><b>MSN��&nbsp;</b></font></div></td>      
            <td width="70%" height="22" class="lybtable"> &nbsp; <input type="text" name="msn" value="<%=rs("msn")%>" size="19">        
            </td>       
          </tr>      
          <tr>        
            <td width="30%" height="22" align="center" class="addfont"> <div align="right"><b>OQ���룺&nbsp;</b></font></div></td>     
            <td width="70%" height="22" class="lybtable"> &nbsp; <input type="text" name="oicq" maxlength="10" value="<%=rs("oicq")%>" size="19" onmouseover=this.focus() onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">      
            </td>      
          </tr> 
<%      
if secret=True then      
%>      
              <tr>      
                
      <td width="220" height="20" align="center" class="addfont"> <p align="right"><b>���Ļ���&nbsp;</b></font></td>       
                <td width="433" height="20" class="lybtable"> &nbsp;   <select size="1" name="secretly">        
      <option selected value=False>��</option>
      <option value=True>��</option>
     </select></td>
              </tr>
<%end if%>
          <tr> 
            <td width="30%" height="22" align="center" valign="middle" class="addfont"> <div align="right"><b>�������ݣ�&nbsp;</b></font></div></td>
            <td width="70%" height="22" class="lybtable"> &nbsp; <textarea name="guestcontent" cols="49" rows="7" wrap="VIRTUAL"><%=rs("guestcontent")%></textarea>         
              <font color="#FF0000">*</font> </td>       
          </tr>      
          <tr>       
            <td height=25 colspan="4" align=center > <input type="hidden" name="id" size="15" value="<%=rs("id")%>">      
              <input type="submit" name="update" value="�ύ" onclick="javascript:this.disabled=true;return Do_submit()">(Ctrl+Enter�ύ)</td>     
          </tr>     
</table>
</form>     
<br>    
<!--#include file="bottom.asp"-->     
</body>     
</html>     
<%     
else     
 Response.Write "����Ȩ�༭�����ԡ�"     
end if
%>