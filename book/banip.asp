<%
ip=request.servervariables("remote_addr")
set rs=server.createobject("adodb.recordset")
	sql="select * from [banip] where banip='"&ip&"'"
	rs.open sql,conn,1,3
	do while not rs.eof	
	session("wrong")="非法的IP，请与管理员联系解锁！！！"	                                
	response.redirect "error.asp"	
loop
rsclose()
%>