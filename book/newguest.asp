<!--#include file="../conn.asp"-->
<%  

dim PEurl
'PEurl="http://www.asp163.net/"  '����д��ʹ�õ�MyPowerϵͳ����ȷ��ַ,Ҫ��"http://"��ͷ
PEurl=request.ServerVariables("SERVER_NAME")
If request.ServerVariables("SERVER_PORT")<>"80" Then
	PEurl = PEurl & ":" & Request.ServerVariables("SERVER_PORT")
End If
PEurl = PEurl & request.ServerVariables("URL")
PEurl=getservepath(PEurl)

'num     ��ʾ����
'tlen    ���Գ���
'orders  ���Ϊ1 ������ʱ������ ������ID����
'info    ��������������Ϣ 0 ����ʾ 1 �û��� 2 ������+��ʱ�� 3 ������ 4 ʱ��

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
	response.Write "document.write(' û���κ�����');"
else
	do while Not rsGuest.eof
		title=rsGuest("GuestTitle")
		if len(title)>tlen then title=left(title,tlen)&"..." end if
		title=htmlencode(title)
		response.write "document.write('<font color=#b70000><b>��</b></font><a href="&PEurl&"Guest_Reply.asp?TopicID=" & rsGuest("TopicID") & "  target=_blank title=" & htmlencode(rsGuest("GuestTitle")) &">');"
		response.write "document.write('"&title&"');"
		response.write "document.write('</a>');"
		select case request("info")
			case 0
			case 1
				response.write "document.write('��[" & rsGuest("GuestName") & "]');"
			case 2		'�����ڸ�ʽ+��ʱ���ʽ 
				response.write "document.write('��[<font color=green>"&formatdatetime(rsGuest("GuestDatetime"),0)&"</font>]');"
			case 3		'�����ڸ�ʽ
				response.write "document.write('��[<font color=green>"&formatdatetime(rsGuest("GuestDatetime"),2)&"</font>]');"
			case 4		'ʱ��
				response.write "document.write('��[<font color=green>"&formatdatetime(rsGuest("GuestDatetime"),4)&"</font>]');"
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

