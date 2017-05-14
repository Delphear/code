<%
	response.cookies("lunjilyb")("username")=""
	response.cookies("lunjilyb")("password")=""
        session("loginnum")=0
	response.redirect("index.asp")
%>
