<!--#include file="conn.asp"-->
<!--#include file="connip.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="banip.asp"-->
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
<%if session("postnum")=1 then%>    
<meta http-equiv="refresh" content="0;URL=index.asp"> 
<%
connclose()
end if
%>

<% 
    	dim guestname
	dim email
	dim msn
        dim homepage
	dim myhead
	dim oicq
	dim guestcontent
	dim ip
	dim rs,sql
	dim founderr
	dim errmsg
	dim boardtype
	dim content
	founderr=false
	call chkinput

sub chkinput()
content=ubbcode(request("guestcontent"))
if InStr(content,"*")<>0 then
	session("wrong")="���Ƿ���"
	response.redirect "error.asp"
end if

guestname=ubbcode(request("guestname"))

if InStr(guestname,"*")<>0 then
	session("wrong")="���Ƿ���"
	response.redirect "error.asp"
end if

	guestname=CStr(Replace(guestname,chr(13)&chr(10),""))
'#################��������ð

if guestname=admin_name then
  	errmsg=errmsg+"<br>"+"<li>����Ȩʹ�ð�����"
  	founderr=true
end if
 

if guestname=admin_id then
guestname=admin_name
end if
'#################�ж����ֳ���

if len(request("guestcontent"))>maxlen then
		errmsg=errmsg+"<br>"+"<li>��������̫�࣬��Ҫ�ҹ�ˮ��"
		founderr=true
end if

dim namelen,i,zi,ziasc
namelen=0
for i=1 to len(guestname)
 zi=mid(guestname,i,1)
 ziasc=asc(zi)
 if ziasc<0 then
  namelen=namelen+2
 else
  namelen=namelen+1
  if CStr(server.URLEncode(zi))<>CStr(zi) then
  	errmsg=errmsg+"<br>"+"<li>���ַǷ�"
  	founderr=true
  end if
 end if
next
	if guestname="" or namelen>10 or namelen<2 then
		errmsg=errmsg+"<br>"+"<li><font color=red>�����������û�����������������ĸ���򣱣��������֣�</font>"
		founderr=true
	elseif  server.HTMLEncode(guestname)<>guestname or InStr(guestname," ")<>0 or InStr(guestname," ")<>0 or InStr(guestname,"��")<>0 or InStr(guestname,"��")<>0 or InStr(guestname,"/")<>0 or InStr(guestname,"\")<>0 or InStr(guestname,"_")<>0 or InStr(guestname,"'")<>0 or InStr(guestname,".")<>0 then
		errmsg=errmsg+"<br>"+"<li><font color=red>�����зǷ��ַ�������ȥ�� �� �� �� �� / �� \ �� _ �� . ���Ϳո���ַ���</font>"
		founderr=true
	end if
	if  request("email")<>"" then
                if  IsValidEmail(request("email"))=false then
   		errmsg=errmsg+"<br>"+"<li>����Email�д���"
   		founderr=true
	        end if
	end if

	if request("oicq")<>"" then
		if chkoicq(request("oicq"))=false then
			errmsg=errmsg+"<br>"+"<li>OQ����ֻ����4-10λ���֣�������ѡ�����롣"
			founderr=true
		end if
	end if
	if len(request("guestcontent"))<2 then
		errmsg=errmsg+"<br>"+"<li>��������д�������ݡ�"
		founderr=true
else guestcontent=request("guestcontent")
guestcontent=replace(guestcontent," ","&nbsp;")
guestcontent=replace(guestcontent, ">", "&gt;")
guestcontent=replace(guestcontent, "<", "&lt;")
	end if
	ip=Request.ServerVariables("REMOTE_ADDR")
end sub

sub saveuserinfo()

	set rs=server.createobject("adodb.recordset")
	sql="select * from [guest] where id=null"
	rs.open sql,conn,1,3
		rs.addnew
		rs("guestname")=guestname
		if request("from")<>"" then
		rs("from")=(request("from"))
		end if
		if request("msn")<>"" then
		rs("msn")=(request("msn"))
		end if
		if request("email")<>"" then
		rs("email")=(request("email"))
		end if
		if request("homepage")<>"" then
		    if request("homepage")<>"http://" then
		          rs("homepage")=(request("homepage"))
		    end if
		end if
		if request("oicq")<>"" then
		rs("oicq")=(request("oicq"))
		end if
        rs("ip")=ip  
	if sh=True then 
        rs("sh")=True   
	end if
	if request("myhead")<>"" then
	rs("face")=(request("myhead"))
	else
	rs("face")=1
	end if
        rs("guestcontent")=guestcontent
	If Request("secretly")<>"" Then
        rs("secretly")=request("secretly")
	End If
        rs("comefrom")=getFrom(request.servervariables("remote_addr"))
        rs("sessionid")=session.sessionid
		rs.update
rsclose()
connclose() 
end sub
session("postnum")=1
if founderr=true then
	call error()
else
	call chkinput()
	call saveuserinfo()
	if founderr=true then
		call error()
	else
response.redirect "index.asp" 
end if
end if
connIpclose()
%>