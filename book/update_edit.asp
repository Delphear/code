<!--#include file="conn.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
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
<%  dim id
    id=request("id")
    set rs=server.createobject("adodb.recordset")
    sql="select * from [guest] where id="&id
   	rs.open sql,conn,1,3
if rs("sessionid")<>session.sessionid then
session("wrong")="����Ȩ�༭�����ԡ�" 
response.redirect "error.asp"
end if
'#################��������ð
if request("guestname")="" or strLength(request("guestname"))>20 then
		errmsg=errmsg+"<br>"+"<li>�����������û���(���Ȳ��ܴ���20)��"
		founderr=true
end if
session("guestname")=trim(request("guestname"))
if session("guestname")=admin_name then
  	session("wrong")="�������ù��������õ�ID������"
response.redirect "error.asp"
else 
guestname=trim(request("guestname"))
end if
if len(request("guestcontent"))>maxlen then
		errmsg=errmsg+"<br>"+"<li>��������̫�࣬��Ҫ�ҹ�ˮ��"
founderr=true
end if
	
if request("guestcontent")="" then
		errmsg=errmsg+"<br>"+"<li>������д�������ݡ�"
		founderr=true
end if	

if  request("email")<>"" then
if  IsValidEmail(request("email"))=false then
errmsg=errmsg+"<br>"+"<li>����Email�д���"
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
			errmsg=errmsg+"<br>"+"<li>Oicq����ֻ����4-10λ���֣�������ѡ�����롣"
			founderr=true
		end if
end if

'#################���޸�ʱ��̫������
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
