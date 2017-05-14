<!--#include file="conn.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''
'          Jimmy中文站留言簿 Version 1.09	     '
'		 http://www.lunji.com		     '
'	         Powered by BlueSailor	             '
'	 QQ:428140   E-MAIL: bluesailor@etang.com    '
''''''''''''''''''''''''''''''''''''''''''''''''''''''
'*****************************************************
'(特别声明：共享软件，未经本人同意，不得用于商业用途)
'*****************************************************
%>
<%  dim id
    id=request("id")
    set rs=server.createobject("adodb.recordset")
    sql="select * from [guest] where id="&id
   	rs.open sql,conn,1,3
if rs("sessionid")<>session.sessionid then
session("wrong")="你无权编辑此留言。" 
response.redirect "error.asp"
end if
'#################版主防假冒
if request("guestname")="" or strLength(request("guestname"))>20 then
		errmsg=errmsg+"<br>"+"<li>请输入您的用户名(长度不能大于20)。"
		founderr=true
end if
session("guestname")=trim(request("guestname"))
if session("guestname")=admin_name then
  	session("wrong")="版主请用管理中设置的ID来留言"
response.redirect "error.asp"
else 
guestname=trim(request("guestname"))
end if
if len(request("guestcontent"))>maxlen then
		errmsg=errmsg+"<br>"+"<li>留言内容太多，不要乱灌水。"
founderr=true
end if
	
if request("guestcontent")="" then
		errmsg=errmsg+"<br>"+"<li>请请填写留言内容。"
		founderr=true
end if	

if  request("email")<>"" then
if  IsValidEmail(request("email"))=false then
errmsg=errmsg+"<br>"+"<li>您的Email有错误。"
founderr=true
end if
end if

'if request("face")="" then
		'face=30
               ' randomize
                'face=Int((face*rnd)+1)
'else face=request("face")
'end if

if request("oicq")<>"" then
		if chkoicq(request("oicq"))=false then
			errmsg=errmsg+"<br>"+"<li>Oicq号码只能是4-10位数字，您可以选择不输入。"
			founderr=true
		end if
end if

'#################防修改时加太多留言
if guestname=admin_id then
guestname=admin_name
end if
sub saveuserinfo()

   		rs("guestname")=guestname
		if request("from")<>"" then
		rs("from")=(request("from"))
		end if
		if request("email")<>"" then
		rs("email")=(request("email"))
		end if
		if request("homepage")<>"" then
		rs("homepage")=(request("homepage"))
		end if
		if request("oicq")<>"" then
		rs("oicq")=(request("oicq"))
		end if
		if request("guestcontent")<>"" then
		rs("guestcontent")=(request("guestcontent"))
		end if
        rs("guestdate")=NOW()
        rs("secretly")=request("secretly")
        rs("ip")=rs("ip")   
	'rs("face")=face
		rs.update
rsclose()
connclose() 
end sub
if founderr=true then
	call error()
else
	call saveuserinfo()
	if founderr=true then
		call error()
	else
response.redirect "index.asp" 
end if
end if      
%>
