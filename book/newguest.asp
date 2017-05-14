<!--#include file="../conn.asp"-->
<%  

dim PEurl
'PEurl="http://www.asp163.net/"  '请填写您使用的MyPower系统的正确地址,要以"http://"开头
PEurl=request.ServerVariables("SERVER_NAME")
If request.ServerVariables("SERVER_PORT")<>"80" Then
	PEurl = PEurl & ":" & Request.ServerVariables("SERVER_PORT")
End If
PEurl = PEurl & request.ServerVariables("URL")
PEurl=getservepath(PEurl)

'num     显示数量
'tlen    留言长度
'orders  如果为1 则按留言时间排序 其它按ID排序
'info    留言主题后面的信息 0 不显示 1 用户名 2 短日期+长时间 3 短日期 4 时间

dim sqlGuest,rsGuest,title
dim tlen,num,orders

num=request("num")
if isnumeric(num)=0 or num="" then num=10
tlen=request("tlen")
if isnumeric(tlen)=0 or tlen="" then
	tlen=10
else
	tlen=cint(tlen)
end if
if request("orders")=1 then
	orders="GuestDatetime"
else
	orders="GuestMaxID"
end if

sqlGuest="select top " & num & " * from PE_GuestBook where GuestIsPassed=" & PE_True & " order by " & orders &" desc"
Set rsGuest= Server.CreateObject("ADODB.Recordset")
rsGuest.open sqlGuest,conn,1,1
if rsGuest.bof and rsGuest.eof then 
	response.Write "document.write(' 没有任何留言');"
else
	do while Not rsGuest.eof
		title=rsGuest("GuestTitle")
		if len(title)>tlen then title=left(title,tlen)&"..." end if
		title=htmlencode(title)
		response.write "document.write('<font color=#b70000><b>·</b></font><a href="&PEurl&"Guest_Reply.asp?TopicID=" & rsGuest("TopicID") & "  target=_blank title=" & htmlencode(rsGuest("GuestTitle")) &">');"
		response.write "document.write('"&title&"');"
		response.write "document.write('</a>');"
		select case request("info")
			case 0
			case 1
				response.write "document.write('[" & rsGuest("GuestName") & "]');"
			case 2		'短日期格式+长时间格式 
				response.write "document.write('[<font color=green>"&formatdatetime(rsGuest("GuestDatetime"),0)&"</font>]');"
			case 3		'短日期格式
				response.write "document.write('[<font color=green>"&formatdatetime(rsGuest("GuestDatetime"),2)&"</font>]');"
			case 4		'时间
				response.write "document.write('[<font color=green>"&formatdatetime(rsGuest("GuestDatetime"),4)&"</font>]');"
			case else

		end select

		response.write "document.write('<br>');"
		rsGuest.movenext
	Loop
end if
rsGuest.close
set rsGuest=nothing
conn.close
set conn=nothing


function HTMLEncode(fString)
	if not isnull(fString) then
		fString = replace(fString, ">", "&gt;")
		fString = replace(fString, "<", "&lt;")

		fString = Replace(fString, CHR(32), "&nbsp;")
		fString = Replace(fString, CHR(9), "&nbsp;")
		fString = Replace(fString, CHR(34), "&quot;")
		fString = Replace(fString, CHR(39), "&#39;")
		fString = Replace(fString, CHR(13), "")
		fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
		fString = Replace(fString, CHR(10), "<BR> ")

		HTMLEncode = fString
	end if
end function

Function GetServePath(str)
	Dim tmpstr
	tmpstr=split(str,"/")
	getservepath="http://"&replace(str, tmpstr(ubound(tmpstr)), "")
End  Function
%>

