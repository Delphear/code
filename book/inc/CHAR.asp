<%
dim WINNT_CHINESE 
   function strLength(str)
       ON ERROR RESUME NEXT
       dim WINNT_CHINESE
       WINNT_CHINESE    = (len("lyb")=2)
       if WINNT_CHINESE then
          dim l,t,c
          dim i
          l=len(str)
          t=l
          for i=1 to l
             c=asc(mid(str,i,1))
             if c<0 then c=c+65536
             if c>255 then
                t=t+1
             end if
          next
          strLength=t
       else 
          strLength=len(str)
       end if
       if err.number<>0 then err.clear
   end function 
%>
<%
sub error()
%><!--#include file="css.asp"--><br>
    <table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor=#777777 align=center style="font-size: 10pt">
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100% style="font-size: 10pt">
    <tr align="center"> 
      <td width="100%" bgcolor=#EEEEEE>留言板错误信息</td>
    </tr>
    <tr> 
      <td width="100%" bgcolor=#FFFFFF><b>产生错误的可能原因：</b><br><br>
<li>您是否仔细阅读了<a href=help.asp>帮助文件</a>
<%=errmsg%>
      </td>
    </tr>
    <tr align="center"> 
      <td width="100%" bgcolor=#EEEEEE>
<a href="javascript:history.go(-1)"> << 返回上一页</a>
      </td>
    </tr>  
    </table>   </td></tr></table>
<%
end sub

function EmailField(fTestString) 
	TheAt = Instr(2, fTestString, "@")
	if TheAt = 0 then 
		EmailField = 0
	else
		TheDot = Instr(cint(TheAt) + 2, fTestString, ".")
		if TheDot = 0 then
			EmailField = 0
		else
			if cint(TheDot) + 1 > Len(fTestString) then
				EmailField = 0
			else
				EmailField = -1
			end if
		end if
	end if
end function 

Function chkoicq(oicq)
    Dim re1
    Set re1 = new RegExp
    re1.IgnoreCase = false
    re1.global = false
    re1.Pattern = "[0-9]{4,9}$"
    chkoicq = re1.Test(oicq)
End Function

function DateToStr(dtDateTime)
    DateToStr = year(dtDateTime) & doublenum(Month(dtdateTime)) & doublenum(Day(dtdateTime)) & doublenum(Hour(dtdateTime)) & doublenum(Minute(dtdateTime)) & doublenum(Second(dtdateTime)) & ""
end function
function doublenum(fNum)
    if fNum > 9 then 
        doublenum = fNum 
    else 
        doublenum = "0" & fNum
    end if
end function

rem ------------ubb代码

function doCode(fString, fOTag, fCTag, fROTag, fRCTag)
    fOTagPos = Instr(1, fString, fOTag, 1)
    fCTagPos = Instr(1, fString, fCTag, 1)
    while (fCTagPos > 0 and fOTagPos > 0)
        fString = replace(fString, fOTag, fROTag, 1, 1, 1)
        fString = replace(fString, fCTag, fRCTag, 1, 1, 1)
        fOTagPos = Instr(1, fString, fOTag, 1)
        fCTagPos = Instr(1, fString, fCTag, 1)
    wend
    doCode = fString
end function

function HTMLEncode(fString)

    fString = replace(fString, ">", "&gt;")
    fString = replace(fString, "<", "&lt;")

    fString = Replace(fString, CHR(13), "")
    fString = Replace(fString, CHR(10) & CHR(10), "</P><P>")
    fString = Replace(fString, CHR(10), "<BR>")
    HTMLEncode = fString
end function

function HTMLDecode(fString)

    fString = replace(fString, "&gt;", ">")
    fString = replace(fString, "&lt;", "<")

    fString = Replace(fString, "", CHR(13))
    fString = Replace(fString, "</P><P>", CHR(10) & CHR(10))
    fString = Replace(fString, "<BR>", CHR(10))
    HTMLDecode = fString
end function

function HTMLDecode1(fString)

    fString = replace(fString, "&gt;", ">")
    fString = replace(fString, "&lt;", "<")
    fString = Replace(fString, "", CHR(13))
    fString = Replace(fString, "</P><P>", CHR(10) & CHR(10))
    fString = Replace(fString, "<BR>", CHR(10))
    HTMLDecode1 = fString
end function

function encodestr(str)
		encodestr=replace(str,"  ","　")
end function

function UBBCode(strContent)
    if strAllowHTML <> "1" then
        strContent = HTMLEncode(strContent)
    end if
dim i
	strContent=encodestr(strContent)

	for i=0 to ubound(killwords)
		strContent=replace(strContent,killwords(i),"***")
	next

        strContent=encodestr(strContent)
	for i=0 to ubound(killwords)
		strContent=replace(strContent,killwords(i),"***")
	next

	set re = New RegExp	
	re.Global = True
	re.IgnoreCase = True
'	re.MultiLine = True

    re.Pattern="(\[IMG\])(.[^\[]*)(\[\/IMG\])"
    strContent=re.Replace(strContent,"<a href=""$2"" target=_blank><IMG SRC=""$2"" border=0 alt=按此在新窗口浏览图片 onload=""javascript:if(this.width>440)this.width=440""></a> ")
	
	re.Pattern = "\[url=(.[^\]]*)\](.[^\[]*)\[\/url]"
	strContent = re.Replace(strContent,"<a target=_blank href=$1>$2</a>")
	re.Pattern = "\[url](.[^\[]*)\[\/url]"
	strContent = re.Replace(strContent,"<a target=_blank href=$1>$1</a>")
	re.Pattern = "^(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
	strContent = re.Replace(strContent,"<a target=_blank href=$1>$1</a>")
	re.Pattern = "(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
	strContent = re.Replace(strContent,"<a target=_blank href=$1>$1</a>")
	re.Pattern = "([^>=""])(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
	strContent = re.Replace(strContent,"$1<a target=_blank href=$2>$2</a>")
	re.Pattern = "^(ftp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
	strContent = re.Replace(strContent,"<a target=_blank href=$1>$1</a>")

   if strAllowflash="1" then
	re.Pattern = "\[FLASH](.[^\[]*)\[\/FLASH]"
	strContent = re.Replace(strContent,"<OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=""$1""><PARAM NAME=quality VALUE=high><embed src=""$1"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400>$1</embed></OBJECT>")
    end if

    	re.Pattern="\[HTML](.[^\[]*)\[\/HTML]"
    	strContent=re.Replace(strContent,"<SPAN><IMG src=pic/code.gif align=absBottom> HTML 代码片段如下:<BR><TEXTAREA style=""WIDTH: 94%; BACKGROUND-COLOR: #f7f7f7"" name=textfield rows=10>$1</TEXTAREA><BR><INPUT onclick=runEx() type=button value=运行此代码 name=Button> [Ctrl+A 全部选择   提示:你可先修改部分代码，再按运行]</SPAN><BR>")
    	re.Pattern="\[COLOR=(.[^\]]*)\](.[^\[]*)\[\/COLOR]"
    	strContent=re.Replace(strContent,"<font color=$1>$2</font>")
    	re.Pattern="\[FACE=(.[^\]]*)\](.[^\[]*)\[\/FACE]"
    	strContent=re.Replace(strContent,"<font face=$1>$2</font>")
    	re.Pattern="\[ALIGN=(.[^\]]*)\](.[^\[]*)\[\/ALIGN]"
    	strContent=re.Replace(strContent,"<p align=$1>$2</p>")
    	re.Pattern="\[QUOTE](.[^\[]*)\[\/QUOTE]"
    	strContent=re.Replace(strContent,"<BLOCKQUOTE><b>引用</b>:<HR>$1<HR></BLOCKQUOTE>")
    	re.Pattern="\[FLY](.[^\[]*)\[\/FLY]"
    	strContent=re.Replace(strContent,"<marquee width=90% behavior=alternate scrollamount=3>$1</marquee>")
    	re.Pattern="\[MOVE](.[^\[]*)\[\/MOVE]"
    	strContent=re.Replace(strContent,"<MARQUEE scrollamount=3>$1</marquee>")
    	re.Pattern="\[GLOW=(.[^\]]*),(.[^\]]*),(.[^\]]*)\](.[^\[]*)\[\/GLOW]"
    	strContent=re.Replace(strContent,"<table width=$1 style=""filter:glow(color=$2, strength=$3)"">$4</table>")
    	re.Pattern="\[SHADOW=(.[^\]]*),(.[^\]]*),(.[^\]]*)\](.[^\[]*)\[\/SHADOW]"
    	strContent=re.Replace(strContent,"<table width=$1 style=""filter:shadow(color=$2, strength=$3)"">$4</table>")

	re.Pattern = "\[b](.[^\[]*)\[\/b]"
	strContent = re.Replace(strContent,"<b>$1</b>")
	re.Pattern = "\[I](.[^\[]*)\[\/I]"
	strContent = re.Replace(strContent,"<I>$1</I>")
	re.Pattern = "\[u](.[^\[]*)\[\/u]"
	strContent = re.Replace(strContent,"<U>$1</U>")

    	re.Pattern ="\[size=1](.[^\[]*)\[\/size]"
    	strContent = re.Replace(strContent,"<font size=1>$1</font>")
    	re.Pattern ="\[size=2](.[^\[]*)\[\/size]"
    	strContent = re.Replace(strContent,"<font size=2>$1</font>")
    	re.Pattern ="\[size=3](.[^\[]*)\[\/size]"
    	strContent = re.Replace(strContent,"<font size=3>$1</font>")
    	re.Pattern ="\[size=4](.[^\[]*)\[\/size]"
    	strContent = re.Replace(strContent,"<font size=4>$1</font>")

    	strContent = doCode(strContent, "[list]", "[/list]", "<ul>", "</ul>")
    	strContent = doCode(strContent, "[list=1]", "[/list]", "<ol type=1>", "</ol id=1>")
    	strContent = doCode(strContent, "[list=a]", "[/list]", "<ol type=a>", "</ol id=a>")
    	strContent = doCode(strContent, "[*]", "[/*]", "<li>", "</li>")
    	strContent = doCode(strContent, "[code]", "[/code]", "<pre id=code><font size=1 face=""Verdana, Arial"" id=code>", "</font id=code></pre id=code>")

  
	UBBCode = strContent
end function


public function translate(sourceStr,fieldStr)
rem 处理逻辑表达式的转化问题
  dim  sourceList
  dim resultStr
  dim i,j
  if instr(sourceStr," ")>0 then 
     dim isOperator
     isOperator = true
     sourceList=split(sourceStr)
     '--------------------------------------------------------
     rem Response.Write "num:" & cstr(ubound(sourceList)) & "<br>"
     for i = 0 to ubound(sourceList)
        rem Response.Write i 
    Select Case ucase(sourceList(i))
    Case "AND","&","和","与"
        resultStr=resultStr & " and "
        isOperator = true
    Case "OR","|","或"
        resultStr=resultStr & " or "
        isOperator = true
    Case "NOT","!","非","！","！"
        resultStr=resultStr & " not "
        isOperator = true
    Case "(","（","（"
        resultStr=resultStr & " ( "
        isOperator = true
    Case ")","）","）"
        resultStr=resultStr & " ) "
        isOperator = true
    Case Else
        if sourceList(i)<>"" then
            if not isOperator then resultStr=resultStr & " and "
            if inStr(sourceList(i),"%") > 0 then
                resultStr=resultStr&" "&fieldStr& " like '" & replace(sourceList(i),"'","''") & "' "
            else
                resultStr=resultStr&" "&fieldStr& " like '%" & replace(sourceList(i),"'","''") & "%' "
            end if
                isOperator=false
        End if    
    End Select
        rem Response.write resultStr+"<br>"
     next 
     translate=resultStr
  else '单条件
     if inStr(sourcestr,"%") > 0 then
         translate=" " & fieldStr & " like '" & replace(sourceStr,"'","''") &"' "
     else
    translate=" " & fieldStr & " like '%" & replace(sourceStr,"'","''") &"%' "
     End if
     rem 前后各加一个空格，免得连sql时忘了加，而出错。
  end if  
end function

function IsValidEmail(email)

dim names, name, i, c

'Check for valid syntax in an email address.

IsValidEmail = true
names = Split(email, "@")
if UBound(names) <> 1 then
   IsValidEmail = false
   exit function
end if
for each name in names
   if Len(name) <= 0 then
     IsValidEmail = false
     exit function
   end if
   for i = 1 to Len(name)
     c = Lcase(Mid(name, i, 1))
     if InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not IsNumeric(c) then
       IsValidEmail = false
       exit function
     end if
   next
   if Left(name, 1) = "." or Right(name, 1) = "." then
      IsValidEmail = false
      exit function
   end if
next
if InStr(names(1), ".") <= 0 then
   IsValidEmail = false
   exit function
end if
i = Len(names(1)) - InStrRev(names(1), ".")
if i <> 2 and i <> 3 then
   IsValidEmail = false
   exit function
end if
if InStr(email, "..") > 0 then
   IsValidEmail = false
end if

end function
%>
