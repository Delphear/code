<!--#include file="conn.asp"-->
<!--#include file=md5.asp -->
<%
dim rs,sql,uid,pwd,expTime
uid=trim(request.form("username"))
pwd=trim(request.form("password"))
pwd=MD5(pwd)
expTime=trim(request.form("expTime"))
set rs=server.createobject("adodb.recordset")
sql="select * from admin where username='"&uid&"'"
rs.open sql,conn,1,1
if not rs.eof then
if rs("password")=pwd then	
	rs.close
set rs=nothing
Response.Cookies("lunjilyb")("username")=uid
Response.Cookies("lunjilyb")("password")=pwd
Response.Cookies("lunjilyb")("randomid")=12
if expTime<>"" then
			response.cookies("lunjilyb").expires=expTime
end if
response.redirect "admin-index.asp"
else
rs.close
set rs=nothing
end if
else
rs.close
set rs=nothing
end if
%>
<script language="javascript">
alert("·Ç·¨µÇÂ½£¡")
location.href="login.asp"
</script>
