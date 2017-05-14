<%
if request.cookies("lunjilyb")("username")="" then
response.redirect "login.asp"
end if

if request.cookies("lunjilyb")("password")="" then
response.redirect "login.asp"
end if

if request.cookies("lunjilyb")("randomid")<>12 then
response.redirect "login.asp"
end if

%>