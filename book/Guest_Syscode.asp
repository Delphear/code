<%@language=vbscript codepage=936 %>
<%
option explicit
response.buffer=false
'强制浏览器重新访问服务器下载页面，而不是从缓存读取页面
Response.Buffer = True 
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
%>
<!--#include file="../conn.asp"-->
<!--#include file="../conn_user.asp"-->
<!--#include file="../inc/ubbcode.asp"-->
<!--#include file="../inc/RegBBS.asp"-->
<!--#include file="../inc/md5.asp"-->
<!--#include file="../inc/function.asp"-->
<!--#include file="../inc/syscode_common.asp"-->
<!--#include file="Channel_Config.asp"-->
<!--#include file="Guest_Function.asp"-->

<%

dim rsGuest,sqlGuest,sql,rs,CheckNum,CheckUrl

dim WriteName,WriteType,WriteSex,WriteEmail,WriteOicq,WriteIcq,WriteMsn
dim WriteHomepage,WriteFace,WriteImages,WriteTitle,WriteContent,WriteIsPrivate
dim SaveEdit,SaveEditId,i
dim AdminReplyContent
dim GImagePath,GFacePath,GEmotPath
dim keyword,skinid
SaveEdit=0							
Const MaxPerPage=6
GImagePath=strInstallDir & "GuestBook/Images/"
GFacePath=strInstallDir & "GuestBook/Images/Face/"
GEmotPath=strInstallDir & "GuestBook/Images/Emote/"
FileName="index.asp"
strFileName=FileName & "?action=" & action & "&keyword=" & keyword

if keyword="" then
	select case Action
		case "write"
			PageTitle="签写留言"
		case "savewrite"
			PageTitle="保存留言"
		case "reply"
			PageTitle="回复留言"
		case "edit"
			PageTitle="编辑留言"
		case "del"
			PageTitle="删除留言"
		case else
			PageTitle="查看留言"
	end select
else
	PageTitle="留言搜索：含有 <font color=red>"&keyword&"</font> 的留言"
end if



'=================================================
'过程名：GuestBook_Left()
'作  用：显示左侧留言功能
'参  数：无
'=================================================
function GuestBook_Left()
	dim grs,strLeft
	strLeft="<br>"
	set grs=conn.execute("select count(*) from PE_Guest where GuestIsPassed=" & PE_False & "")
	if UserLogined=True then
		strLeft=strLeft & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;留言模式：<font color=green>用户模式</font>" & vbcrlf
	else
		strLeft=strLeft & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;留言模式：<font color=green>游客模式</font>" & vbcrlf
	end if
	if EnableCheck=True then
		strLeft=strLeft & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发表模式：<font color=green>审核发表</font>" & vbcrlf
		strLeft=strLeft & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;待审留言：<font color=red>"&grs(0)&"</font> 条" & vbcrlf
	else
		strLeft=strLeft & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发表模式：<font color=green>直接发表</font>" & vbcrlf
	end if
	set grs=nothing

	if UserLogined=True then
		strLeft=strLeft & "<div align='center'><a href='" & FileName & "?action=user' >【我的留言】</a></div>"
	end if
	strLeft=strLeft & "<div align='center'><a href='" & FileName & "' >【查看留言】</a></div>" & vbcrlf
	strLeft=strLeft & "<div align='center'><a href='" & FileName & "?action=write' >【签写留言】</a></div><br>" & vbcrlf
	GuestBook_Left=strLeft
end function

'=================================================
'过程名：GuestBook_Search()
'作  用：显示留言搜索
'参  数：无
'=================================================
function GuestBook_Search()
	dim strGuestSearch
	strGuestSearch="<table border='0' cellpadding='0' cellspacing='0'>"
	strGuestSearch=strGuestSearch & "<form method='post' name='SearchForm' action='" & FileName & "'>"
	strGuestSearch=strGuestSearch & "<tr><td height='40' >"
	strGuestSearch=strGuestSearch & "&nbsp;&nbsp;<input type='text' name='keyword'  size='15' value='关键字' maxlength='50' onFocus='this.select();'>&nbsp;"
	strGuestSearch=strGuestSearch & "<input type='submit' name='Submit'  value='搜索'>"
	strGuestSearch=strGuestSearch & "</td></tr></form></table>"
	GuestBook_Search=strGuestSearch
end function


'=================================================
'过程名：GuestBook()
'作  用：留言本功能调用
'参  数：无
'=================================================
sub GuestBook()
	select case Action
		case "write"
			call WriteGuest()
		case "savewrite"
			call SaveWriteGuest()
		case "reply"
			call ReplyGuest()
		case "edit"
			call EditGuest()
		case "del"
			call DelGuest()
		case "user"
			call ShowAllGuest(3)
		case else
			call GuestMain()
	end select
end sub

'=================================================
'过程名：GuestMain()
'作  用：留言主函数
'参  数：无
'=================================================
sub GuestMain()
	if UserLogined=True then
		ShowAllGuest(1)
	else
		ShowAllGuest(2)
	end if
end sub

'=================================================
'过程名：ShowAllGuest()
'作  用：分页显示所有留言
'参  数：ShowType-----  0为显示所有
'						1为显示已通过审核及用户自己发表的留言
'						2为显示已通过审核的留言（用于游客显示）
'						3为显示用户自己发表的留言
'=================================================
sub ShowAllGuest(ShowType)
	if ShowType=1 then
		sqlGuest="select * from PE_Guest where (GuestIsPassed=" & PE_True & " or GuestName='"&UserName&"')"
	elseif ShowType=2 then
		sqlGuest="select * from PE_Guest where GuestIsPassed=" & PE_True & ""
	elseif ShowType=3 then
		sqlGuest="select * from PE_Guest where GuestName='"&UserName&"'"
	elseif ShowType=4 then
		sqlGuest="select * from PE_Guest where GuestIsPassed=" & PE_False & ""
	else
		if keyword<>"" then
			sqlGuest="select * from PE_Guest where 1=1"
		else
			sqlGuest="select * from PE_Guest"
		end if
	end if
	if keyword<>"" then
		sqlGuest=sqlGuest & " and (GuestTitle like '%" & keyword & "%' or GuestContent like '%" & keyword & "%' or GuestName like '%" & keyword & "%' or GuestReply like '%" & keyword & "%') "
	end if
	sqlGuest=sqlGuest&" order by GuestMaxId desc"
	set rsGuest=server.createobject("adodb.recordset")
	rsGuest.open sqlGuest,conn,1,1
	if rsGuest.bof and rsGuest.eof then
		totalput=0
		response.write "<br><li>没有任何留言</li>"
	else
		totalput=rsGuest.recordcount
		if currentpage<1 then
			currentpage=1
		end if
		if (currentpage-1)*MaxPerPage>totalput then
			if (totalPut mod MaxPerPage)=0 then
				currentpage= totalPut \ MaxPerPage
			else
				currentpage= totalPut \ MaxPerPage + 1
			end if
		end if
		if currentPage>1 then
			if (currentPage-1)*MaxPerPage<totalPut then
				rsGuest.move  (currentPage-1)*MaxPerPage
			else
				currentPage=1
			end if
		end if
		call ShowGuestList()
	end if
	if totalput>0 then
		response.write showpage(strFileName,totalput,MaxPerPage,true,true,"条留言")
	end if
	rsGuest.close
	set rsGuest=nothing
end sub

'=================================================
'过程名：ShowGuestList()
'作  用：显示留言
'参  数：无
'=================================================
sub ShowGuestList()
	dim UserGuestName,UserType,UserSex,UserEmail,UserHomepage,UserOicq,UserIcq,UserMsn
	dim GuestNum,GuestTip,TipName,TipSex,TipEmail,TipOicq,TipHomepage,isdelUser
	GuestNum=0
	response.write showtip()
	strHTML=""
	do while not rsGuest.eof
		isdelUser=0
		if rsGuest("GuestType")=1 then
			dim rsUser
			set rsUser=Conn_User.execute("select * from " & db_User_Table & " where " & db_User_Name & "='" & ReplaceBadChar(rsGuest("GuestName")) & "'")
			if not (rsUser.bof and rsUser.eof) then
				UserGuestName=rsUser(db_User_Name)
				UserSex=rsUser(db_User_Sex)
				UserEmail=rsUser(db_User_Email)
				UserOicq=rsUser(db_User_QQ)
				UserIcq=rsUser(db_User_Icq)
				UserMsn=rsUser(db_User_Msn)
				UserHomepage=rsUser(db_User_Homepage)
			else
				isdelUser=1
			end if
			set rsUser=nothing
		end if
		if rsGuest("GuestType")<>1 or isdelUser=1 then
			UserGuestName=rsGuest("GuestName")
			UserSex=rsGuest("GuestSex")
			UserEmail=rsGuest("GuestEmail")
			UserOicq=rsGuest("GuestOicq")
			UserIcq=rsGuest("GuestIcq")
			UserMsn=rsGuest("GuestMsn")
			UserHomepage=rsGuest("GuestHomepage")
		end if
		TipName=UserGuestName
		if isdelUser=1 then TipName=TipName&"（已删除）"
		if UserEmail="" or isnull(UserEmail) then
			TipEmail="未填"
		else
			TipEmail=UserEmail
		end if
		if UserOicq="" or isnull(UserOicq) then
			TipOicq="未填"
		else
			TipOicq=UserOicq
		end if
		if UserHomepage="" or isnull(UserHomepage) then
			TipHomepage="未填"
		else
			TipHomepage=UserHomepage
		end if
		if UserIcq="" or isnull(UserIcq) then UserIcq="未填"
		if UserMsn="" or isnull(UserMsn) then UserMsn="未填"
		if UserSex=1 then
			TipSex="（酷哥）"
		elseif UserSex=0 then
			TipSex="(靓妹)"
		else
			TipSex=""
		end if
		GuestTip="&nbsp;姓名：" & TipName & "&nbsp;"&TipSex&"<br>&nbsp;主页："&TipHomepage&"<br>&nbsp;OICQ："&TipOicq&"<br>&nbsp;信箱："&TipEmail&"<br>&nbsp;地址："&rsGuest("GuestIP")&"<br>&nbsp;时间："&rsGuest("GuestDatetime")

		strHTML=strHTML & "      <table width='100%' border='0' cellpadding='0' cellspacing='0' class='border'>" & vbcrlf
		strHTML=strHTML & "        <tr>" & vbcrlf
		strHTML=strHTML & "          <td align='center' valign='top'>" & vbcrlf
		strHTML=strHTML & "            <table width='100%' border='0' cellspacing='0' cellpadding='0' class='main_title_575'>" & vbcrlf
		strHTML=strHTML & "              <tr>" & vbcrlf
		strHTML=strHTML & "                <td>" & vbcrlf
		strHTML=strHTML & "                  <font color=green>主题：</font> " & KeywordReplace(rsGuest("GuestTitle")) & vbcrlf
		strHTML=strHTML & "                </td>" & vbcrlf
		strHTML=strHTML & "                <td width='165'>" & vbcrlf
		strHTML=strHTML & "                  <img src='" & GImagePath & "posttime.gif' width='11' height='11' align='absmiddle'>" & vbcrlf
		strHTML=strHTML & "                  <font color='#006633'>：" & rsGuest("GuestDatetime") & "</font>" & vbcrlf
		strHTML=strHTML & "                </td>" & vbcrlf
		strHTML=strHTML & "              </tr>" & vbcrlf
		strHTML=strHTML & "            </table>" & vbcrlf
		strHTML=strHTML & "          </td>" & vbcrlf
		strHTML=strHTML & "        </tr>" & vbcrlf
		strHTML=strHTML & "        <tr>" & vbcrlf
		strHTML=strHTML & "          <td align='center' height='153' valign='top' class='main_tdbg_575'>" & vbcrlf
		strHTML=strHTML & "            <table width='100%' border='0' cellpadding='0' cellspacing='3'>" & vbcrlf
		if rsGuest("GuestIsPassed")=True then
			strHTML=strHTML & "              <tr>" & vbcrlf
		else
			strHTML=strHTML & "              <tr>" & vbcrlf
		end if
		strHTML=strHTML & "                <td width='100' align='center' height='130' valign='top'>" & vbcrlf
		strHTML=strHTML & "                        <img src='" & GFacePath & rsGuest("GuestImages") & ".gif' width='80' height='90' onMouseOut=toolTip() onMouseOver=""toolTip('" & GuestTip & "')""><br><br>" & vbcrlf
		if rsGuest("GuestType")=1 then
			strHTML=strHTML & "                        <font color='#006633'>【用户】<br>" & KeywordReplace(UserGuestName) & "</font>"
		else
			strHTML=strHTML & "                        【游客】<br>" & KeywordReplace(UserGuestName)
		end if
		strHTML=strHTML & "                </td>" & vbcrlf
		strHTML=strHTML & "                <td align='center' height='153' width='1' bgcolor='#B4C9E7'>" & vbcrlf
		strHTML=strHTML & "                </td>" & vbcrlf
		strHTML=strHTML & "                <td>" & vbcrlf
		strHTML=strHTML & "                  <table width='100%' border='0' cellpadding='6' cellspacing='0' height='125' style='TABLE-LAYOUT: fixed'>" & vbcrlf
		strHTML=strHTML & "                    <tr>" & vbcrlf
		strHTML=strHTML & "                      <td align='left' valign='top'><img src='" & GImagePath & "face" & rsGuest("GuestFace") & ".gif' width='19' height='19'>" & vbcrlf
		if rsGuest("GuestIsPrivate")=true and rsGuest("GuestName")<>UserName then
			strHTML=strHTML & "                        <br><br><font color=green>" & vbcrlf
			strHTML=strHTML & "                        **************************************<br>" & vbcrlf
			strHTML=strHTML & "                        * 隐藏留言，管理员和留言用户可以看到 *<br>" & vbcrlf
			strHTML=strHTML & "                        **************************************" & vbcrlf
			strHTML=strHTML & "                        </font>" & vbcrlf
		else
			if rsGuest("GuestIsPrivate")=true then
				strHTML=strHTML & "                        <font color=green>[隐藏]</font>&nbsp;" & vbcrlf
			end if
			strHTML=strHTML & KeywordReplace(ubbcode(dvHTMLEncode(rsGuest("GuestContent"))))
		end if
		strHTML=strHTML & "                      </td>" & vbcrlf
		strHTML=strHTML & "                    </tr>" & vbcrlf
		strHTML=strHTML & "                    <tr>" & vbcrlf
		strHTML=strHTML & "                      <td align='left' valign='bottom'>" & vbcrlf
		if rsGuest("GuestReply")<>"" then
			strHTML=strHTML & "                        <table width='100%' border='0' cellspacing='0' cellpadding='2'>" & vbcrlf
			strHTML=strHTML & "                          <tr>" & vbcrlf
			strHTML=strHTML & "                            <td height='1' bgcolor='#B4C9E7'></td>" & vbcrlf
			strHTML=strHTML & "                          </tr>" & vbcrlf
			strHTML=strHTML & "                          <tr>" & vbcrlf
			strHTML=strHTML & "                            <td valign='top'>" & vbcrlf
			strHTML=strHTML & "                              <table width='100%' border='0' cellpadding='0' cellspacing='0' style='TABLE-LAYOUT: fixed'>" & vbcrlf
			strHTML=strHTML & "                                <tr>" & vbcrlf
			strHTML=strHTML & "                                  <td><font color='#006633'> 管理员<font color='#FF0000'>[" & rsGuest("GuestReplyAdmin") & "]</font>回复:" & vbcrlf & rsGuest("GuestReplyDatetime") & "</font></td>" & vbcrlf
			strHTML=strHTML & "                                </tr>" & vbcrlf
			strHTML=strHTML & "                                <tr>" & vbcrlf
			strHTML=strHTML & "                                  <td valign='bottom'><font color='#006633'>" & KeywordReplace(ubbcode(dvHTMLEncode(rsGuest("GuestReply")))) & "</font></td>" & vbcrlf
			strHTML=strHTML & "                                </tr>" & vbcrlf
			strHTML=strHTML & "                              </table>" & vbcrlf
			strHTML=strHTML & "                            </td>" & vbcrlf
			strHTML=strHTML & "                          </tr>" & vbcrlf
			strHTML=strHTML & "                        </table>" & vbcrlf
		end if
		strHTML=strHTML & "                      </td>" & vbcrlf
		strHTML=strHTML & "                    </tr>" & vbcrlf
		strHTML=strHTML & "                  </table>" & vbcrlf
		strHTML=strHTML & "                  <table width='100%' height='1' border='0' cellpadding='0' cellspacing='0' bgcolor='#B4C9E7'>" & vbcrlf
		strHTML=strHTML & "                    <tr>" & vbcrlf
		strHTML=strHTML & "                      <td></td>" & vbcrlf
		strHTML=strHTML & "                    </tr>" & vbcrlf
		strHTML=strHTML & "                  </table>" & vbcrlf
		strHTML=strHTML & "                  <table width=100% border=0 cellpadding=0 cellspacing=3>" & vbcrlf
		strHTML=strHTML & "                    <tr>" & vbcrlf
		strHTML=strHTML & "                      <td>" & vbcrlf
		if UserHomepage="" or isnull(UserHomepage) then
			strHTML=strHTML & "<img src=" & GImagePath & "nourl.gif width=45 height=16 alt=" & UserGuestName & "没有留下主页地址 border=0>" & vbcrlf
		else
			strHTML=strHTML & "<a href=" & UserHomepage & " target=""_blank"">"
			strHTML=strHTML & "<img src=" & GImagePath & "url.gif width=45 height=16 alt=" & UserHomepage & " border=0></a>" & vbcrlf
		end if
		if UserOicq="" or isnull(UserOicq) then
			strHTML=strHTML & "<img src=" & GImagePath & "nooicq.gif width=45 height=16 alt=" & UserGuestName & "没有留下QQ号码 border=0>" & vbcrlf
		else
			strHTML=strHTML & "<a href=http://search.tencent.com/cgi-bin/friend/user_show_info?ln=" & UserOicq & " target='_blank'>"
			strHTML=strHTML & "<img src=" & GImagePath & "oicq.gif width=45 height=16 alt=" & UserOicq & " border=0 ></a>" & vbcrlf
		end if
		if UserEmail="" or isnull(UserEmail) then
			strHTML=strHTML & "<img src=" & GImagePath & "noemail.gif width=45 height=16 alt=" & UserGuestName & "没有留下Email地址 border=0>" & vbcrlf
		else
			strHTML=strHTML & "<a href=mailto:" & UserEmail & ">"
			strHTML=strHTML & "<img src=" & GImagePath & "email.gif width=45 height=16 border=0 alt=" & UserEmail & "></a>" & vbcrlf
		end if
		strHTML=strHTML & "<img src=" & GImagePath & "other.gif width=45 height=16 border=0 onMouseOut=toolTip() onMouseOver=""toolTip('&nbsp;Icq：" & UserIcq & "<br>&nbsp;Msn：" & UserMsn & "<br>&nbsp;I P：" & rsGuest("GuestIP") & "')"">" & vbcrlf
		strHTML=strHTML & "<a href=" & FileName & "?action=reply&guestid=" & rsGuest("GuestId") & ">"
		strHTML=strHTML & "<img src=" & GImagePath & "reply.gif width=45 height=16 border=0 alt=回复这条留言></a>" & vbcrlf
		if rsGuest("GuestName")=UserName and  rsGuest("GuestIsPassed")=False then
			strHTML=strHTML & "<a href=" & FileName & "?action=edit&guestid=" & rsGuest("GuestId") & ">"
			strHTML=strHTML & "<img src=" & GImagePath & "edit.gif width=45 height=16 border=0 alt=编辑这条留言></a>" & vbcrlf
			strHTML=strHTML & "<a href=" & FileName & "?action=del&guestid=" & rsGuest("GuestId") & " onClick=""return confirm('确定要删除此留言吗？');"">"
			strHTML=strHTML & "<img src=" & GImagePath & "del.gif width=45 height=16  alt=删除这条留言 border=0></a>" & vbcrlf
		end if
        strHTML=strHTML & "                      </td>" & vbcrlf
        strHTML=strHTML & "                    </tr>" & vbcrlf
        strHTML=strHTML & "                  </table>" & vbcrlf
        strHTML=strHTML & "                </td>" & vbcrlf
        strHTML=strHTML & "              </tr>" & vbcrlf
        strHTML=strHTML & "            </table>" & vbcrlf
        strHTML=strHTML & "          </td>" & vbcrlf
        strHTML=strHTML & "        </tr>" & vbcrlf
        strHTML=strHTML & "      </table>" & vbcrlf
        strHTML=strHTML & "      <table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'>" & vbcrlf
        strHTML=strHTML & "        <tr>" & vbcrlf
        strHTML=strHTML & "          <td class='main_shadow'>" & vbcrlf
        strHTML=strHTML & "          </td>" & vbcrlf
        strHTML=strHTML & "        </tr>" & vbcrlf
        strHTML=strHTML & "      </table>" & vbcrlf
		rsGuest.movenext
		GuestNum=GuestNum+1
		if GuestNum>=MaxPerPage then exit do
	loop
	response.write strHTML
end sub


function ShowJS_Guest()
	dim strJS
	strJS="<script language = 'JavaScript'>" & vbcrlf
	strJS=strJS & "function changeimage()" & vbcrlf
	strJS=strJS & "{" & vbcrlf
	strJS=strJS & "  document.myform.GuestImages.value=document.myform.Image.value;" & vbcrlf
	strJS=strJS & "  document.myform.showimages.src='" & GFacePath & "'+document.myform.Image.value+'.gif';" & vbcrlf
	strJS=strJS & "}" & vbcrlf
	strJS=strJS & "function guestpreview()" & vbcrlf
	strJS=strJS & "{" & vbcrlf
	strJS=strJS & "  document.preview.content.value=document.myform.GuestContent.value;" & vbcrlf
	strJS=strJS & "  var popupWin = window.open('GuestPreview.asp', 'GuestPreview', 'scrollbars=yes,width=620,height=230');" & vbcrlf
	strJS=strJS & "  document.preview.submit();" & vbcrlf
	strJS=strJS & "}" & vbcrlf
	strJS=strJS & "function CheckForm()" & vbcrlf
	strJS=strJS & "{" & vbcrlf
	strJS=strJS & "  if(document.myform.GuestName.value==''){" & vbcrlf
	strJS=strJS & "    alert('姓名不能为空！');" & vbcrlf
	strJS=strJS & "    document.myform.GuestName.focus();" & vbcrlf
	strJS=strJS & "    return(false) ;" & vbcrlf
	strJS=strJS & "  }" & vbcrlf
	strJS=strJS & "  if(document.myform.GuestTitle.value==''){" & vbcrlf
	strJS=strJS & "    alert('留言主题不能为空！');" & vbcrlf
	strJS=strJS & "    document.myform.GuestTitle.focus();" & vbcrlf
	strJS=strJS & "    return(false);" & vbcrlf
	strJS=strJS & "  }" & vbcrlf
	strJS=strJS & "  if(document.myform.GuestContent.value==''){" & vbcrlf
	strJS=strJS & "    alert('留言内容不能为空！');" & vbcrlf
	strJS=strJS & "    document.myform.GuestContent.focus();" & vbcrlf
	strJS=strJS & "    return(false);" & vbcrlf
	strJS=strJS & "  }" & vbcrlf
	strJS=strJS & "  if(document.myform.GuestContent.value.length>500){" & vbcrlf
	strJS=strJS & "    alert('留言内容不能超过500字符！');" & vbcrlf
	strJS=strJS & "    document.myform.GuestContent.focus();" & vbcrlf
	strJS=strJS & "    return(false);" & vbcrlf
	strJS=strJS & "  }" & vbcrlf
	strJS=strJS & "  if(document.myform.reg.checked==true){" & vbcrlf
	strJS=strJS & "    if(document.myform.GuestName.value.length>14 || document.myform.GuestName.value.length<4){" & vbcrlf
	strJS=strJS & "      alert('如果注册，用户名长度不能大于14或小于4！');" & vbcrlf
	strJS=strJS & "      document.myform.GuestName.focus();" & vbcrlf
	strJS=strJS & "      return(false);" & vbcrlf
	strJS=strJS & "    }" & vbcrlf
	strJS=strJS & "    if(document.myform.GuestEmail.value==''){" & vbcrlf
	strJS=strJS & "      alert('如果注册，用户Email不能为空且必须正确填写！');" & vbcrlf
	strJS=strJS & "      document.myform.GuestEmail.focus();" & vbcrlf
	strJS=strJS & "      return(false);" & vbcrlf
	strJS=strJS & "    }" & vbcrlf
	strJS=strJS & "    if(document.myform.psw.value=='' || document.myform.psw.value.length<6){" & vbcrlf
	strJS=strJS & "      alert('如果注册，注册密码不能为空，且长度至少六位！');" & vbcrlf
	strJS=strJS & "      document.myform.psw.focus();" & vbcrlf
	strJS=strJS & "      return(false);" & vbcrlf
	strJS=strJS & "    }" & vbcrlf
	strJS=strJS & "    if(document.myform.pswc.value=='' || document.myform.pswc.value!=document.myform.psw.value){" & vbcrlf
	strJS=strJS & "      alert('确认密码不能为空，且需与注册密码相同！');" & vbcrlf
	strJS=strJS & "      document.myform.pswc.focus();" & vbcrlf
	strJS=strJS & "      return(false);" & vbcrlf
	strJS=strJS & "    }" & vbcrlf
	strJS=strJS & "    if(document.myform.question.value==''){" & vbcrlf
	strJS=strJS & "      alert('密码问题不能为空！');" & vbcrlf
	strJS=strJS & "      document.myform.question.focus();" & vbcrlf
	strJS=strJS & "      return(false);" & vbcrlf
	strJS=strJS & "    }" & vbcrlf
	strJS=strJS & "    if(document.myform.answer.value==''){" & vbcrlf
	strJS=strJS & "      alert('问题答案不能为空！');" & vbcrlf
	strJS=strJS & "      document.myform.answer.focus();" & vbcrlf
	strJS=strJS & "      return(false);" & vbcrlf
	strJS=strJS & "    }" & vbcrlf
	strJS=strJS & "  }" & vbcrlf
	strJS=strJS & "}" & vbcrlf
	strJS=strJS & "function showreginfo()" & vbcrlf
	strJS=strJS & "{" & vbcrlf
	strJS=strJS & "  if(document.myform.reg.checked == true){" & vbcrlf
	strJS=strJS & "    reginfo.style.display = '';" & vbcrlf
	strJS=strJS & "  }" & vbcrlf
	strJS=strJS & "  else{" & vbcrlf
	strJS=strJS & "    reginfo.style.display = 'none';" & vbcrlf
	strJS=strJS & "  }" & vbcrlf
	strJS=strJS & "}" & vbcrlf
	strJS=strJS & "function gbcount(message,total,used,remain)" & vbcrlf
	strJS=strJS & "{" & vbcrlf
	strJS=strJS & "  var max;" & vbcrlf
	strJS=strJS & "  max = total.value;" & vbcrlf
	strJS=strJS & "  if(message.value.length > max){" & vbcrlf
	strJS=strJS & "    message.value = message.value.substring(0,max);" & vbcrlf
	strJS=strJS & "    used.value = max;" & vbcrlf
	strJS=strJS & "    remain.value = 0;" & vbcrlf
	strJS=strJS & "    alert('留言不能超过 500 个字!');" & vbcrlf
	strJS=strJS & "  }" & vbcrlf
	strJS=strJS & "  else{" & vbcrlf
	strJS=strJS & "    used.value = message.value.length;" & vbcrlf
	strJS=strJS & "    remain.value = max - used.value;" & vbcrlf
	strJS=strJS & "  }" & vbcrlf
	strJS=strJS & "}" & vbcrlf
	strJS=strJS & "</script>" & vbcrlf
	ShowJS_Guest=strJS
end function

'=================================================
'过程名：WriteGuest()
'作  用：签写留言
'参  数：无
'=================================================
sub WriteGuest()
	if SaveEdit<>1 then
		if UserLogined=False then
			WriteType=0
		else
			WriteType=1
		end if
		WriteName=UserName
		WriteSex="1"
		WriteFace="1"
		WriteImages="01"
		WriteHomepage="http://"
		WriteIsPrivate=False
	end if
	strHTML=ShowJS_Guest()
	strHTML=strHTML & "<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>" & vbcrlf
	strHTML=strHTML & "  <tr>" & vbcrlf
	strHTML=strHTML & "    <td colspan='5' class='main_title_575'><font color=green>" & PageTitle & "</font></td>"
	strHTML=strHTML & "  </tr>" & vbcrlf
	strHTML=strHTML & "  <tr>" & vbcrlf
	strHTML=strHTML & "    <td>" & vbcrlf
	strHTML=strHTML & "      <table width='100%' cellpadding='1' cellspacing='0' class='main_tdbg_575'>" & vbcrlf
	strHTML=strHTML & "        <tr>" & vbcrlf
	strHTML=strHTML & "          <td colspan='5' height='10'></td>" & vbcrlf
	strHTML=strHTML & "        </tr>" & vbcrlf
	strHTML=strHTML & "        <form name='myform' method='post' action='" & FileName & "?action=savewrite' onSubmit='return CheckForm()'>" & vbcrlf
	if WriteType=0 then
		strHTML=strHTML & "          <tr>" & vbcrlf
		strHTML=strHTML & "            <td width='20%' align='center'>&nbsp;&nbsp;<font color=red>*</font>&nbsp;姓&nbsp;&nbsp;名：</td>" & vbcrlf
		strHTML=strHTML & "            <td width='30%'>" & vbcrlf
		strHTML=strHTML & "              <input type='text' name='GuestName' maxlength='14' size='20' value='" & WriteName & "'>"
		strHTML=strHTML & "            </td>" & vbcrlf
		strHTML=strHTML & "            <td width='22%'>&nbsp; </td>" & vbcrlf
		strHTML=strHTML & "            <td colspan='2'>&nbsp; </td>" & vbcrlf
		strHTML=strHTML & "          </tr>" & vbcrlf
		strHTML=strHTML & "          <tr>" & vbcrlf
		strHTML=strHTML & "            <td align='center'>&nbsp;&nbsp;&nbsp;&nbsp;性&nbsp;&nbsp;别：</td>" & vbcrlf
		strHTML=strHTML & "            <td>" & vbcrlf
		strHTML=strHTML & "              <input type='radio' name='GuestSex' value='1' "
		if WriteSex=1 then strHTML=strHTML & " checked"
		strHTML=strHTML & " style='BORDER:0px;'>" & vbcrlf
		strHTML=strHTML & "              男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & vbcrlf
		strHTML=strHTML & "              <input type='radio' name='GuestSex' value='0' "
		if WriteSex=0 then strHTML=strHTML & " checked"
		strHTML=strHTML & " style='BORDER:0px;'>" & vbcrlf
		strHTML=strHTML & "              女 </td>" & vbcrlf
		strHTML=strHTML & "            <td>&nbsp;&nbsp;" & vbcrlf
		strHTML=strHTML & "              <select name='Image' size='1' onChange='changeimage();' >" & vbcrlf
		for i=1 to 9
		  strHTML=strHTML & "                <option value='0" & i & "'>0" & i & "</option>" & vbcrlf
		next
		for i=10 to 23
		strHTML=strHTML & "                  <option value='" & i & "'>" & i & "</option>" & vbcrlf
		next
		strHTML=strHTML & "              </select>" & vbcrlf
		strHTML=strHTML & "            </td>" & vbcrlf
		strHTML=strHTML & "            <td colspan='2'>&nbsp;</td>" & vbcrlf
		strHTML=strHTML & "          </tr>" & vbcrlf
		strHTML=strHTML & "          <tr>" & vbcrlf
		strHTML=strHTML & "            <td align='center'>&nbsp;&nbsp;&nbsp;&nbsp;E-mail：</td>" & vbcrlf
		strHTML=strHTML & "            <td>" & vbcrlf
		strHTML=strHTML & "              <input type='text' name='GuestEmail' maxlength='30' size='20' value='" & WriteEmail & "'>"
		strHTML=strHTML & "            </td>" & vbcrlf
		strHTML=strHTML & "            <td rowspan='4'>" & vbcrlf
		strHTML=strHTML & "              <input type='hidden' name='GuestImages' value='01'>" & vbcrlf
		strHTML=strHTML & "              <img name=showimages src='" & GFacePath & WriteImages & ".gif' width='80' height='90' border='0' onClick=window.open('guestselect.asp?action=face','face','width=480,height=400,resizable=1,scrollbars=1') title=点击选择头像 style='cursor:hand'>" & vbcrlf
		strHTML=strHTML & "              </td>" & vbcrlf
		strHTML=strHTML & "            <td colspan='2' rowspan='4'>" & vbcrlf
		strHTML=strHTML & "              <table width='100%' border='0' cellspacing='0' cellpadding='0' id=reginfo style='DISPLAY: none'>" & vbcrlf
		strHTML=strHTML & "                <tr>" & vbcrlf
		strHTML=strHTML & "                  <td width='35%' align='center'>注册密码：<br>" & vbcrlf
		strHTML=strHTML & "                  </td>" & vbcrlf
		strHTML=strHTML & "                  <td>" & vbcrlf
		strHTML=strHTML & "                    <input type=password maxlength=16 size=16 name=psw>" & vbcrlf
		strHTML=strHTML & "                  </td>" & vbcrlf
		strHTML=strHTML & "                </tr>" & vbcrlf
		strHTML=strHTML & "                <tr>" & vbcrlf
		strHTML=strHTML & "                  <td align='center'>密码确认：</td>" & vbcrlf
		strHTML=strHTML & "                  <td>" & vbcrlf
		strHTML=strHTML & "                    <input type=password maxlength=16 size=16 name=pswc>" & vbcrlf
		strHTML=strHTML & "                  </td>" & vbcrlf
		strHTML=strHTML & "                </tr>" & vbcrlf
		strHTML=strHTML & "                <tr>" & vbcrlf
		strHTML=strHTML & "                  <td align='center'>密码问题：</td>" & vbcrlf
		strHTML=strHTML & "                  <td>" & vbcrlf
		strHTML=strHTML & "                    <input type=text maxlength=30 size=16 name=question>" & vbcrlf
		strHTML=strHTML & "                  </td>" & vbcrlf
		strHTML=strHTML & "                </tr>" & vbcrlf
		strHTML=strHTML & "                <tr>" & vbcrlf
		strHTML=strHTML & "                  <td align='center'>问题答案：</td>" & vbcrlf
		strHTML=strHTML & "                  <td>" & vbcrlf
		strHTML=strHTML & "                    <input type=text maxlength=30 size=16 name=answer>" & vbcrlf
		strHTML=strHTML & "                  </td>" & vbcrlf
		strHTML=strHTML & "                </tr>" & vbcrlf
		strHTML=strHTML & "              </table>" & vbcrlf
		strHTML=strHTML & "            </td>" & vbcrlf
		strHTML=strHTML & "          </tr>" & vbcrlf
		strHTML=strHTML & "          <tr>" & vbcrlf
		strHTML=strHTML & "            <td align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Oicq：</td>" & vbcrlf
		strHTML=strHTML & "            <td>" & vbcrlf
		strHTML=strHTML & "              <input type='text' name='GuestOicq' maxlength='15' size='20' value='" & WriteOicq & "'>"
		strHTML=strHTML & "            </td>" & vbcrlf
		strHTML=strHTML & "          </tr>" & vbcrlf
		strHTML=strHTML & "          <tr>" & vbcrlf
		strHTML=strHTML & "            <td align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Icq：</td>" & vbcrlf
		strHTML=strHTML & "            <td>" & vbcrlf
		strHTML=strHTML & "              <input type='text' name='GuestIcq' maxlength='15' size='20' value='" & WriteIcq & "'>" & vbcrlf
		strHTML=strHTML & "            </td>" & vbcrlf
		strHTML=strHTML & "          </tr>" & vbcrlf
		strHTML=strHTML & "          <tr>" & vbcrlf
		strHTML=strHTML & "            <td align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Msn：</td>" & vbcrlf
		strHTML=strHTML & "            <td>" & vbcrlf
		strHTML=strHTML & "              <input type='text' name='GuestMsn' maxlength='40' size='20' value='" & WriteMsn & "'>" & vbcrlf
		strHTML=strHTML & "            </td>" & vbcrlf
		strHTML=strHTML & "          </tr>" & vbcrlf
		strHTML=strHTML & "          <tr>" & vbcrlf
		strHTML=strHTML & "            <td align='center'>&nbsp;&nbsp;个人主页：</td>" & vbcrlf
		strHTML=strHTML & "            <td colspan='4'>" & vbcrlf
		strHTML=strHTML & "              <input type='text' name='GuestHomepage' maxlength='80' size='37' value='" & WriteHomepage & "'>" & vbcrlf
		strHTML=strHTML & "              &nbsp;&nbsp;&nbsp;&nbsp;" & vbcrlf
		if EnableUserReg=True then
			strHTML=strHTML & "             <input type='checkbox' name='reg' value='1' onClick=showreginfo() style='BORDER:0px;'>" & vbcrlf
			strHTML=strHTML & "              <span id=reginfoshowtext>我想同时注册成为贵站会员</span>" & vbcrlf
		else
			strHTML=strHTML & "              <input type='hidden' name='reg' value='0'>" & vbcrlf
		end if
		strHTML=strHTML & "            </td>" & vbcrlf
		strHTML=strHTML & "          </tr>" & vbcrlf
		strHTML=strHTML & "          <tr>" & vbcrlf
		strHTML=strHTML & "            <td></td>" & vbcrlf
		strHTML=strHTML & "            <td colspan='4' height='5'></td>" & vbcrlf
		strHTML=strHTML & "          </tr>" & vbcrlf
	else
		strHTML=strHTML & "          <tr>" & vbcrlf
		strHTML=strHTML & "            <td align='center'>选择头像：</td>" & vbcrlf
		strHTML=strHTML & "            <td>" & vbcrlf
		strHTML=strHTML & "              <input type='hidden' name='GuestName'  value='" & WriteName & "'>" & vbcrlf
		strHTML=strHTML & "              <input type='hidden' name='reg' value='0'>" & vbcrlf
		strHTML=strHTML & "              <input type='hidden' name='GuestImages' value='" & WriteImages & "'>" & vbcrlf
		strHTML=strHTML & "              <img name=showimages src='" & GFacePath & WriteImages & ".gif' width='80' height='90' border='0' onClick=window.open('guestselect.asp?action=face','face','width=480,height=400,resizable=1,scrollbars=1') title=点击选择头像 style='cursor:hand'>" & vbcrlf
		strHTML=strHTML & "              <select name='Image' size='1' onChange='changeimage();'>" & vbcrlf
		for i=1 to 9
		  strHTML=strHTML & "                <option value='0" & i & "'>0" & i & "</option>" & vbcrlf
		next
		for i=10 to 23
		strHTML=strHTML & "                  <option value='" & i & "'>" & i & "</option>" & vbcrlf
		next
		strHTML=strHTML & "              </select>" & vbcrlf
		strHTML=strHTML & "            </td>" & vbcrlf
		strHTML=strHTML & "            <td>&nbsp;</td>" & vbcrlf
		strHTML=strHTML & "            <td>&nbsp;</td>" & vbcrlf
		strHTML=strHTML & "            <td>&nbsp;</td>" & vbcrlf
		strHTML=strHTML & "          </tr>" & vbcrlf
	end if
	strHTML=strHTML & "          <tr>" & vbcrlf
	strHTML=strHTML & "            <td align='center'><font color=red>*</font>&nbsp;留言主题：</td>" & vbcrlf
	strHTML=strHTML & "            <td colspan='4'>" & vbcrlf
	strHTML=strHTML & "              <input type='text' name='GuestTitle' size='37' maxlength='21' value='" & WriteTitle & "'>" & vbcrlf
	strHTML=strHTML & "            </td>" & vbcrlf
	strHTML=strHTML & "          </tr>" & vbcrlf
	strHTML=strHTML & "          <tr>" & vbcrlf
	strHTML=strHTML & "            <td align='center'>&nbsp;&nbsp;现在心情：</td>" & vbcrlf
	strHTML=strHTML & "            <td colspan='4'>" & vbcrlf
	for i=1 to 20
		strHTML=strHTML & "<input type='radio' name='GuestFace' value='" & i & "'"
		if i=clng(WriteFace) then strHTML=strHTML & " checked"
		strHTML=strHTML & " style='BORDER:0px;width:19;'>"
		strHTML=strHTML & "<img src='" & GImagePath & "face" & i & ".gif' width='19' height='19'>" & vbcrlf
		if i mod 10 =0 then strHTML=strHTML & "<br>"
	next
	strHTML=strHTML & "            </td>" & vbcrlf
	strHTML=strHTML & "          </tr>" & vbcrlf
	strHTML=strHTML & "          <tr>" & vbcrlf
	strHTML=strHTML & "            <td align='center'>&nbsp;&nbsp;&nbsp;Ubb标签：</td>" & vbcrlf
	strHTML=strHTML & "            <td colspan='4'>" & showubb()
	strHTML=strHTML & "            </td>" & vbcrlf
	strHTML=strHTML & "          </tr>" & vbcrlf
	strHTML=strHTML & "          <tr>" & vbcrlf
	strHTML=strHTML & "            <td valign='middle' align='center'><font color=red>*</font>&nbsp;留言内容：<br>" & vbcrlf
	strHTML=strHTML & "              </td>" & vbcrlf
	strHTML=strHTML & "            <td colspan='4' valign='top'>" & vbcrlf
	strHTML=strHTML & "              <textarea name='GuestContent' cols='59' rows='6'    onkeydown=gbcount(this.form.GuestContent,this.form.total,this.form.used,this.form.remain); onkeyup=gbcount(this.form.GuestContent,this.form.total,this.form.used,this.form.remain);>" & WriteContent & "</textarea>" & vbcrlf
	strHTML=strHTML & "            </td>" & vbcrlf
	strHTML=strHTML & "          </tr>" & vbcrlf
	strHTML=strHTML & "          <tr>" & vbcrlf
	strHTML=strHTML & "            <td valign='middle' align='center'></td>" & vbcrlf
	strHTML=strHTML & "            <td colspan='4' valign='top'>" & vbcrlf
	strHTML=strHTML & "                最多字数：<INPUT disabled maxLength=4 name=total size=3 value=500>" & vbcrlf
	strHTML=strHTML & "                已用字数：<INPUT disabled maxLength=4 name=used size=3 value=0>" & vbcrlf
	strHTML=strHTML & "                剩余字数：<INPUT disabled maxLength=4 name=remain size=3 value=500>" & vbcrlf
	strHTML=strHTML & "            </td>" & vbcrlf
	strHTML=strHTML & "          </tr>" & vbcrlf
	strHTML=strHTML & "          <tr>" & vbcrlf
	strHTML=strHTML & "            <td valign='middle' align='center'>&nbsp;&nbsp;是否隐藏：</td>" & vbcrlf
	strHTML=strHTML & "            <td colspan='4' valign='top'>" & vbcrlf
	strHTML=strHTML & "              <input type='radio' name='GuestIsPrivate' value='no' "
	if WriteIsPrivate=False then strHTML=strHTML & " checked"
	strHTML=strHTML & " style='BORDER:0px;'>" & vbcrlf
	strHTML=strHTML & "              正常" & vbcrlf
	strHTML=strHTML & "              <input type='radio' name='GuestIsPrivate' value='yes' "
	if WriteIsPrivate=True then strHTML=strHTML & " checked"
	strHTML=strHTML & " style='BORDER:0px;'>" & vbcrlf
	strHTML=strHTML & "              隐藏 &nbsp;&nbsp;<font color=red>*</font>&nbsp;<font color=green>选择隐藏后，此留言只有管理员和留言者才可以看到。</font></td>" & vbcrlf
	strHTML=strHTML & "          </tr>" & vbcrlf
	strHTML=strHTML & "          <tr>" & vbcrlf
	strHTML=strHTML & "            <td colspan='5' align='center'  height='40'>" & vbcrlf
	strHTML=strHTML & "              <input type='hidden' name='saveedit'  value='" & SaveEdit & "'>"
	strHTML=strHTML & "              <input type='hidden' name='saveeditid'  value='" & SaveEditId & "'>"
	strHTML=strHTML & "              <input type='submit' name='Submit1' value=' 发 表' >" & vbcrlf
	strHTML=strHTML & "              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & vbcrlf
	strHTML=strHTML & "              <input type='button' name='Submit2' value=' 预 览 ' onclick=guestpreview()>" & vbcrlf
	strHTML=strHTML & "              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & vbcrlf
	strHTML=strHTML & "              <input type='reset' name='Submit3' value=' 重 填 ' >" & vbcrlf
	strHTML=strHTML & "            </td>" & vbcrlf
	strHTML=strHTML & "          </tr>" & vbcrlf
	strHTML=strHTML & "        </form>" & vbcrlf
	strHTML=strHTML & "        <form name=preview action='GuestPreview.asp' method=post target=GuestPreview>" & vbcrlf
	strHTML=strHTML & "        <input type=hidden name=title value=''><input type=hidden name=content value=''>" & vbcrlf
	strHTML=strHTML & "        </form>" & vbcrlf
	strHTML=strHTML & "      </table>" & vbcrlf
	strHTML=strHTML & "      <table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'>" & vbcrlf
	strHTML=strHTML & "        <tr>" & vbcrlf
	strHTML=strHTML & "          <td  height='15' align='center' valign='top'>" & vbcrlf
	strHTML=strHTML & "            <table width='98%' border='0' align='center' cellpadding='0' cellspacing='0'>" & vbcrlf
	strHTML=strHTML & "              <tr>" & vbcrlf
	strHTML=strHTML & "                <td height='13' class='tdbg_left2'></td>" & vbcrlf
	strHTML=strHTML & "              </tr>" & vbcrlf
	strHTML=strHTML & "            </table>" & vbcrlf
	strHTML=strHTML & "          </td>" & vbcrlf
	strHTML=strHTML & "        </tr>" & vbcrlf
	strHTML=strHTML & "      </table>" & vbcrlf
	strHTML=strHTML & "    </td>" & vbcrlf
	strHTML=strHTML & "  </tr>" & vbcrlf
	strHTML=strHTML & "</table>" & vbcrlf
	response.write strHTML
end sub

'=================================================
'过程名：ReplyGuest()
'作  用：回复留言
'参  数：无
'=================================================
sub ReplyGuest()
	dim ReplyId
	ReplyId=request("guestid")
	if ReplyId="" then
		call Guest_info("<li>请指定要回复的留言ID！</li>")
		exit sub
	else
		ReplyId=clng(ReplyId)
		sqlGuest="select * from PE_Guest where GuestId=" & ReplyId
	end if
	set rsGuest=server.createobject("adodb.recordset")
	rsGuest.open sqlGuest,conn,1,1
	if rsGuest.bof and rsGuest.eof then
		response.write "<br><li>没有任何留言</li>"
		exit sub
	else
		WriteTitle="Re: "&rsGuest("GuestTitle")
		call ShowGuestList()
	end if
	rsGuest.close
	set rsGuest=nothing
	call WriteGuest()
end sub


'=================================================
'过程名：EditGuest()
'作  用：编辑留言
'参  数：无
'=================================================
sub EditGuest()
	dim EditId
	EditId=request("guestid")
	if EditId="" then
		call Guest_info("<li>请指定要编辑的留言ID！</li>")
		exit sub
	else
		EditId=clng(EditId)
		sqlGuest="select * from PE_Guest where GuestId=" & EditId
	end if
	set rsGuest=server.createobject("adodb.recordset")
	rsGuest.open sqlGuest,conn,1,1
	if rsGuest.bof and rsGuest.eof then
		response.write "<br><li>找不到您指定的留言！</li>"
		exit sub
	end if
	
	if rsGuest("GuestName")=UserName and rsGuest("GuestIsPassed")=False then
		WriteName=rsGuest("GuestName")
		WriteType=rsGuest("GuestType")
		WriteSex=rsGuest("GuestSex")
		WriteEmail=rsGuest("GuestEmail")
		WriteOicq=rsGuest("GuestOicq")
		WriteIcq=rsGuest("GuestIcq")
		WriteMsn=rsGuest("GuestMsn")
		WriteHomepage=rsGuest("GuestHomepage")
		WriteFace=rsGuest("GuestFace")
		WriteImages=rsGuest("GuestImages")
		WriteTitle=rsGuest("GuestTitle")
		WriteContent=rsGuest("GuestContent")
		WriteIsPrivate=rsGuest("GuestIsPrivate")
		SaveEdit=1
		SaveEditId=EditId
		call ShowGuestList()
		call WriteGuest()
	else
		call Guest_info("<li>用户只可以编辑自己发表的留言，且留言未通过审核！</li>")
	end if    
	rsGuest.close
	set rsGuest=nothing
end sub

'=================================================
'过程名：DelGuest()
'作  用：删除留言
'参  数：无
'=================================================
sub DelGuest()
	dim delid
	delid=trim(Request("guestid"))
	if delid="" then
		call Guest_info("<li>请指定要删除的留言ID！</li>")
		exit sub
	end if
	if instr(delid,",")>0 then
		delid=ReplaceBadChar(replace(delid," ",""))
		sql="Select * from PE_Guest where GuestID in (" & delid & ")"
	else
		delid=clng(delid)
		sql="select * from PE_Guest where GuestID=" & delid
	end if
	Set rs=Server.CreateObject("Adodb.RecordSet")
	rs.Open sql,conn,1,3
	if rs.bof and rs.eof then
		response.write "<br><li>找不到您指定的留言！</li>"
		exit sub
	end if

	if rs("GuestName")<>UserName or rs("GuestIsPassed")=True then
		call Guest_info("<li>您没有使用此功能的权限！</li>")
	else
		do while not rs.eof
			rs.delete
			rs.update
			rs.movenext
		loop
		call Guest_info("<li>删除留言成功！</li>")
	end if    
	rs.close
	set rs=nothing
end sub

'**************************************************
'函数名：KeywordReplace
'作  用：标示搜索关键字
'参  数：strChar-----要转换的字符
'返回值：转换后的字符
'**************************************************
function KeywordReplace(strChar)
	if strChar="" then
		KeywordReplace=""
	else
		KeywordReplace=	replace(strChar,""&keyword&"","<font color=red>"&keyword&"</font>")
	end if
end function

'=================================================
'过程名：SaveWriteGuest()
'作  用：保存留言
'参  数：无
'=================================================
sub SaveWriteGuest()
	dim SaveEditId,GuestName,GuestSex,GuestOicq,GuestEmail,GuestHomepage,GuestFace,GuestImages,GuestIcq,GuestMsn
	dim GuestTitle,GuestContent,GuestIsPrivate,GuestIsPassed
	dim GuestPassword,GuestPasswordConfirm,GuestQuestion,GuestAnswer,GuestUserlevel
	dim sqlMaxId,rsMaxId,MaxId,Saveinfo,sqlReg,rsReg,trs,tmpUserLevel

	GuestContent=request("GuestContent")
	if UserLogined=False then
		GuestName=dvHTMLEncode(trim(request("GuestName")))
		GuestSex=trim(request("GuestSex"))
		GuestOicq=dvHTMLEncode(trim(request("GuestOicq")))
		GuestIcq=dvHTMLEncode(trim(request("GuestIcq")))
		GuestMsn=dvHTMLEncode(trim(request("GuestMsn")))
		GuestEmail=dvHTMLEncode(trim(request("GuestEmail")))
		GuestHomepage=dvHTMLEncode(trim(request("GuestHomepage")))
		if GuestHomepage="http://" or isnull(GuestHomepage) then GuestHomepage=""
	else
		GuestName=UserName
	end if
	GuestImages=trim(request("GuestImages"))
	GuestFace=trim(request("GuestFace"))
	GuestTitle=dvHTMLEncode(trim(request("GuestTitle")))
	GuestIsPrivate=trim(request("GuestIsPrivate"))
	if GuestIsPrivate="yes" then
		GuestIsPrivate=True
	else
		GuestIsPrivate=False
	end if
	if EnableCheck=True then
		GuestIsPassed=False
	else
		GuestIsPassed=True
	end if
	SaveEdit=request("saveedit")
		
	if GuestName="" or GuestTitle="" or GuestContent="" then
		call Guest_info("<li>留言发送失败！</li><li>请将必要的信息填写完整！</li>")
		exit sub
	end if

	if SaveEdit=1 then
		SaveEditId=request("saveeditid")
		if SaveEditId="" then
			call Guest_info("<li>请指定要编辑的留言ID！</li>")
			exit sub
		else
			sqlMaxId="select max(GuestMaxId) as MaxId from PE_Guest"
			set rsMaxId=conn.execute(sqlMaxId)
			MaxId=rsMaxId("MaxId")
			set rsMaxId=nothing
			if MaxId="" or isnull(MaxId) then MaxId=0
			set rsGuest=server.createobject("adodb.recordset")
			sql="select * from PE_Guest where GuestID=" & clng(SaveEditId)
			rsGuest.open sql,conn,1,3
			rsGuest("GuestName")=GuestName
			rsGuest("GuestSex")=GuestSex
			rsGuest("GuestOicq")=GuestOicq
			rsGuest("GuestIcq")=GuestIcq
			rsGuest("GuestMsn")=GuestMsn
			rsGuest("GuestEmail")=GuestEmail
			rsGuest("GuestHomepage")=GuestHomepage
			rsGuest("GuestIP")=Request.ServerVariables("REMOTE_ADDR")
			rsGuest("GuestTitle")=GuestTitle
			rsGuest("GuestFace")=GuestFace
			rsGuest("GuestContent")=GuestContent
			rsGuest("GuestDatetime")=now()
			rsGuest("GuestImages")=GuestImages
			rsGuest("GuestMaxId")=MaxId+1
			rsGuest("GuestIsPrivate")=GuestIsPrivate
			rsGuest("GuestIsPassed")=GuestIsPassed
			rsGuest.update
			if EnableCheck=True then
				call Guest_info("<li>留言编辑成功！</li><li>只有管理员审核通过的留言才会显示出来。</li>")
			else
				call Guest_info("<li>留言编辑成功！</li>")
			end if
			rsGuest.close
			set rsGuest=nothing
		end if
	else
		if GuestContent<>session("OldGuestContent") then 
			session("OldGuestContent")=GuestContent
			sqlMaxId="select max(GuestMaxId) as MaxId from PE_Guest"
			set rsMaxId=conn.execute(sqlMaxId)
			MaxId=rsMaxId("MaxId")
			set rsMaxId=nothing
			if MaxId="" or isnull(MaxId) then MaxId=0
			set rsGuest=server.createobject("adodb.recordset")
			sql="select * from PE_Guest"
			rsGuest.open sql,conn,1,3
			rsGuest.addnew
			if UserLogined=False then
				rsGuest("GuestType")=0
			else
				rsGuest("GuestType")=1
			end if
			rsGuest("GuestName")=GuestName
			rsGuest("GuestSex")=GuestSex
			rsGuest("GuestOicq")=GuestOicq
			rsGuest("GuestIcq")=GuestIcq
			rsGuest("GuestMsn")=GuestMsn
			rsGuest("GuestEmail")=GuestEmail
			rsGuest("GuestHomepage")=GuestHomepage
			rsGuest("GuestIP")=Request.ServerVariables("REMOTE_ADDR")
			rsGuest("GuestTitle")=GuestTitle
			rsGuest("GuestFace")=GuestFace
			rsGuest("GuestContent")=GuestContent
			rsGuest("GuestDatetime")=now()
			rsGuest("GuestImages")=GuestImages
			rsGuest("GuestMaxId")=MaxId+1
			rsGuest("GuestIsPrivate")=GuestIsPrivate
			rsGuest("GuestIsPassed")=GuestIsPassed
			rsGuest.update
			if EnableCheck=True then
				Saveinfo="<li>您的留言已经发送成功！</li><li>只有管理员审核通过的留言才会显示出来。</li>"
			else
				Saveinfo="<li>您的留言已经发送成功！</li>"
			end if

			if request("reg")=1 and UserLogined=False then
				if EnableUserReg<>True then
					Saveinfo= Saveinfo & "<li>注册失败！本站暂停新用户注册服务！</li>"
				else
					GuestPassword=trim(request("psw"))
					GuestPasswordConfirm=trim(request("pswc"))
					GuestQuestion=trim(request("question"))
					GuestAnswer=trim(request("answer"))
					set rsReg=server.createobject("adodb.recordset")
					sql="select * from " & db_User_Table & " where " & db_User_Name & "='"&ReplaceBadChar(GuestName)&"'"
					rsReg.open sql,Conn_User,1,3
					if not rsReg.eof and not rsReg.bof then
						Saveinfo= Saveinfo & "<li>注册失败！您输入的名字已经被注册。</li>"
					elseif GuestName="" or strLength(GuestName)>14 or strLength(GuestName)<4 then
						Saveinfo= Saveinfo & "<li>注册失败！输入用户名不符合要求(不能大于14小于4)</li>"
					elseif GuestPassword<>GuestPasswordConfirm then
						Saveinfo= Saveinfo & "<li>注册失败！密码与确认密码不相符。</li>"
					elseif GuestEmail="" or IsValidEmail(GuestEmail)=false then
						Saveinfo= Saveinfo & "<li>注册失败！您的Email为空或有错误</li>"
					else
						rsReg.addnew
						rsReg(db_User_Name)=GuestName
						rsReg(db_User_Sex)=GuestSex
						rsReg(db_User_Password)=md5(GuestPassword)
						rsReg(db_User_Question)=GuestQuestion
						rsReg(db_User_Answer)=md5(GuestAnswer)
						rsReg(db_User_Email)=GuestEmail
						rsReg(db_User_Homepage)=GuestHomepage
						rsReg(db_User_QQ)=GuestOicq
						rsReg(db_User_Icq)=GuestIcq
						rsReg(db_User_Msn)=GuestMsn
						rsReg(db_User_LoginTimes)=1
						rsReg(db_User_RegDate)=now()
						'rsReg(db_User_LastLoginTime)=NOW()
						rsReg("ArticleCount")=0
						rsReg("ArticleChecked")=0
						set trs=conn.execute("select * from PE_UserLevel where UserLevel=999")
						tmpUserLevel=trs("UserLevel")
						rsReg("UserLevel")=tmpUserLevel
						rsReg("ChargeType")=trs("DefaultChargeType")
						rsReg("UserPoint")=trs("DefaultPoint")
						rsReg("BeginDate")=formatdatetime(now(),2)
						rsReg("Valid_Num")=trs("DefaultValidNum")
						rsReg("Valid_Unit")=trs("DefaultValidUnit")
						set trs=nothing

						randomize
						CheckNum = int(7999*rnd+2000) '随机验证码
						rsReg("CheckNum")=CheckNum
						if EmailCheckReg=True then
							rsReg("UserState")=3000
							CheckUrl=Request.ServerVariables("HTTP_REFERER")
							CheckUrl=left(CheckUrl,instrrev(CheckUrl,"/")) & "User_RegCheck.asp?Action=Check&UserName=" & GuestName & "&Password=" & GuestPassword & "&CheckNum=" & CheckNum
							call SendRegEmail(GuestEmail,GuestName)
						else
							if AdminCheckReg=True then
								rsReg("UserState")=2000
							else			
								rsReg("UserState")=999
								Response.Cookies("asp163")("UserName")=GuestName
								Response.Cookies("asp163")("Password") =md5(GuestPassword)
								Response.Cookies("asp163")("UserLevel")=tmpUserLevel
							end if
						end if

						if UserTableType="Dvbbs6.0" or UserTableType="Dvbbs6.1" then
							rsReg(db_User_UserClass) = FU_UserClass
							rsReg(db_User_TitlePic) = FU_TitlePic
							rsReg(db_User_UserGroupID) = FU_UserGroupID
							rsReg(db_User_Face) = FU_Face
							rsReg(db_User_FaceWidth) = FU_FaceWidth
							rsReg(db_User_FaceHeight) = FU_FaceHeight
							rsReg(db_User_UserWealth) = FU_UserWealth
							rsReg(db_User_UserEP) = FU_UserEP
							rsReg(db_User_UserCP) = FU_UserCP
							rsReg(db_User_UserGroup) = FU_UserGroup
							rsReg(db_User_Showre) = FU_Showre
						end if 
						rsReg.update
						call UpdateUserNum(GuestName)

						if EmailCheckReg=True then
							Saveinfo= Saveinfo & "<li>系统已经发送了一封确认信到你注册时填写的信箱中，你必须在收到确认信并通过确认信中链接进行确认后，你才能正式成为本站的注册用户。</li>"
						else
							if AdminCheckReg="Yes" then
								Saveinfo= Saveinfo & "<li>请等待管理通过你的注册申请后，你就可以正式成为本站的注册用户了。</li>"
							else			
								Saveinfo= Saveinfo & "<li>用户注册成功！欢迎您的加入！！！</li>"
							end if
						end if		
					end if
					rsReg.close
					set rsReg=nothing
				end if
			end if
			rsGuest.close
			set rsGuest=nothing

			call Guest_info(Saveinfo)
		else
			call Guest_info("<li>请不要连续发送内容相同的留言或空留言！</li>")
		end if
	end if
end sub

'=================================================
'过程名：SendRegEmail()
'作  用：发送注册确认信
'参  数：无
'=================================================
sub SendRegEmail(Email,RegUserName)
	dim MailtoAddress,MailtoName,Subject,MailBody,FromName,MailFrom,Priority
	MailtoAddress=Email
	MailtoName=RegUserName
	Subject="注册确认信"
	MailBody="这是一封注册确认信。你的验证码是：" & CheckNum & vbcrlf & "<br>请点此进行确认：<a href='" & CheckUrl & "'>" & CheckUrl & "</a>"
	FromName=SiteName
	MailFrom=WebmasterEmail
	Priority=3
	ErrMsg=SendMail(MailtoAddress,MailtoName,Subject,MailBody,FromName,MailFrom,Priority)
	if ErrMsg<>"" then FoundErr=True
end sub


'=================================================
'过程名：Guest_info()
'作  用：留言操作信息
'参  数：info 提示信息内容
'=================================================
sub Guest_info(info)
	dim strInfo
	strInfo=strInfo & "<table cellpadding=0 cellspacing=0 border=0 width=100% align=center>" & vbcrlf
	strInfo=strInfo & "<tr align='center'><td class='main_title_575'>留言操作反馈信息</td></tr>" & vbcrlf
	strInfo=strInfo & "<tr><td class='main_tdbg_575'><table cellpadding=5 cellspacing=0 border=0 width=100% align=center><tr><td height='100' valign='top'>" & info &"</td></tr>" & vbcrlf
	strInfo=strInfo & "<tr align='center' class='tdbg'><td><a href='" & FileName & "'>【查看留言】</a><a href='" & FileName & "?action=write'>【签写留言】</a>" & vbcrlf
	strInfo=strInfo & "</td></tr></table></td></tr></table><br>" & vbcrlf
	response.write strInfo
end sub
%>
