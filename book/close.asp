<%
if close<>"" then
session("wrong")=close_content
response.redirect("error.asp")
end if
%>