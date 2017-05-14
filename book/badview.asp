<%
if session("viewnumber")="" then
session("viewnumber")=1
else 
session("viewnumber")=session("viewnumber")+1
end if
if session("viewnumber")>30 then
	session("wrong")="非法游客，有问题与管理员联系！"
	session("viewnumber")=1
	response.redirect "error.asp"	
end if
%>