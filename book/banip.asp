<%
ip=request.servervariables("remote_addr")
set rs=server.createobject("adodb.recordset")
	sql="select * from [banip] where banip='"&ip&"'"
	rs.open sql,conn,1,3
	do while not rs.eof	
	session("wrong")="�Ƿ���IP���������Ա��ϵ����������"	                                
	response.redirect "error.asp"	
loop
rsclose()
%>