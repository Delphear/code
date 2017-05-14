<!--#include file="conn.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="chkmanage.asp"-->
<%  if request("action")="admin" then
    dim id
    id=request("id")
    set rs=server.createobject("adodb.recordset")
    sql="select * from [guest] where id="&id
   	rs.open sql,conn,1,3
   	rs.Delete
   	rs.Close
    set rs=nothing
    conn.close
    set conn=nothing

 %>
<script language="javascript">
alert("²Ù×÷³É¹¦£¡")
location.href="manage.asp"
</script>    
<%end if%>