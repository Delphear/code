<%
'=================================================
'函数名：ShowTip()
'作  用：显示提示
'参  数：无
'=================================================
function ShowTip()
	dim strTip
	strTip="<div id=toolTipLayer style='position: absolute; visibility: hidden'></div>" & vbcrlf
	strTip=strTip & "<SCRIPT language=JavaScript>" & vbcrlf
	strTip=strTip & "var ns4 = document.layers;" & vbcrlf
	strTip=strTip & "var ns6 = document.getElementById && !document.all;" & vbcrlf
	strTip=strTip & "var ie4 = document.all;" & vbcrlf
	strTip=strTip & "offsetX = 0;" & vbcrlf
	strTip=strTip & "offsetY = 20;" & vbcrlf
	strTip=strTip & "var toolTipSTYLE='';" & vbcrlf
	strTip=strTip & "function initToolTips()" & vbcrlf
	strTip=strTip & "{" & vbcrlf
	strTip=strTip & "  if(ns4||ns6||ie4)" & vbcrlf
	strTip=strTip & "  {" & vbcrlf
	strTip=strTip & "    if(ns4) toolTipSTYLE = document.toolTipLayer;" & vbcrlf
	strTip=strTip & "    else if(ns6) toolTipSTYLE = document.getElementById('toolTipLayer').style;" & vbcrlf
	strTip=strTip & "    else if(ie4) toolTipSTYLE = document.all.toolTipLayer.style;" & vbcrlf
	strTip=strTip & "    if(ns4) document.captureEvents(Event.MOUSEMOVE);" & vbcrlf
	strTip=strTip & "    else" & vbcrlf
	strTip=strTip & "    {" & vbcrlf
	strTip=strTip & "      toolTipSTYLE.visibility = 'visible';" & vbcrlf
	strTip=strTip & "      toolTipSTYLE.display = 'none';" & vbcrlf
	strTip=strTip & "    }" & vbcrlf
	strTip=strTip & "    document.onmousemove = moveToMouseLoc;" & vbcrlf
	strTip=strTip & "  }" & vbcrlf
	strTip=strTip & "}" & vbcrlf
	strTip=strTip & "function toolTip(msg, fg, bg)" & vbcrlf
	strTip=strTip & "{" & vbcrlf
	strTip=strTip & "  if(toolTip.arguments.length < 1)" & vbcrlf
	strTip=strTip & "  {" & vbcrlf
	strTip=strTip & "    if(ns4) toolTipSTYLE.visibility = 'hidden';" & vbcrlf
	strTip=strTip & "    else toolTipSTYLE.display = 'none';" & vbcrlf
	strTip=strTip & "  }" & vbcrlf
	strTip=strTip & "  else" & vbcrlf
	strTip=strTip & "  {" & vbcrlf
	strTip=strTip & "    if(!fg) fg = '#333333';" & vbcrlf
	strTip=strTip & "    if(!bg) bg = '#FFFFFF';" & vbcrlf
	strTip=strTip & "    var content = '<table border=""0"" cellspacing=""0"" cellpadding=""1"" bgcolor=""' + fg + '""><td>' + '<table border=""0"" cellspacing=""0"" cellpadding=""1"" bgcolor=""' + bg + '""><td align=""left"" nowrap style=""line-height: 120%""><font color=""' + fg + '"">' + msg + '&nbsp\;</font></td></table></td></table>';" & vbcrlf
	strTip=strTip & "    if(ns4)" & vbcrlf
	strTip=strTip & "    {" & vbcrlf
	strTip=strTip & "      toolTipSTYLE.document.write(content);" & vbcrlf
	strTip=strTip & "      toolTipSTYLE.document.close();" & vbcrlf
	strTip=strTip & "      toolTipSTYLE.visibility = 'visible';" & vbcrlf
	strTip=strTip & "    }" & vbcrlf
	strTip=strTip & "    if(ns6)" & vbcrlf
	strTip=strTip & "    {" & vbcrlf
	strTip=strTip & "      document.getElementById('toolTipLayer').innerHTML = content;" & vbcrlf
	strTip=strTip & "      toolTipSTYLE.display='block'" & vbcrlf
	strTip=strTip & "    }" & vbcrlf
	strTip=strTip & "    if(ie4)" & vbcrlf
	strTip=strTip & "    {" & vbcrlf
	strTip=strTip & "      document.all('toolTipLayer').innerHTML=content;" & vbcrlf
	strTip=strTip & "      toolTipSTYLE.display='block'" & vbcrlf
	strTip=strTip & "    }" & vbcrlf
	strTip=strTip & "  }" & vbcrlf
	strTip=strTip & "}" & vbcrlf
	strTip=strTip & "function moveToMouseLoc(e)" & vbcrlf
	strTip=strTip & "{" & vbcrlf
	strTip=strTip & "  if(ns4||ns6)" & vbcrlf
	strTip=strTip & "  {" & vbcrlf
	strTip=strTip & "    x = e.pageX;" & vbcrlf
	strTip=strTip & "    y = e.pageY;" & vbcrlf
	strTip=strTip & "  }" & vbcrlf
	strTip=strTip & "  else" & vbcrlf
	strTip=strTip & "  {" & vbcrlf
	strTip=strTip & "    x = event.x + document.body.scrollLeft;" & vbcrlf
	strTip=strTip & "    y = event.y + document.body.scrollTop;" & vbcrlf
	strTip=strTip & "  }" & vbcrlf
	strTip=strTip & "  toolTipSTYLE.left = x + offsetX;" & vbcrlf
	strTip=strTip & "  toolTipSTYLE.top = y + offsetY;" & vbcrlf
	strTip=strTip & "  return true;" & vbcrlf
	strTip=strTip & "}" & vbcrlf
	strTip=strTip & "initToolTips();" & vbcrlf
	strTip=strTip & "</SCRIPT>" & vbcrlf
	ShowTip=strTip
end function

'=================================================
'函数名：ShowUbb()
'作  用：显示Ubb标签
'参  数：info 提示信息内容
'=================================================
function ShowUbb()
	dim strUbb
	strUbb="<SCRIPT language=javascript>" & vbcrlf
	strUbb=strUbb & "helpstat = false;" & vbcrlf
	strUbb=strUbb & "stprompt = true;" & vbcrlf
	strUbb=strUbb & "basic = false;" & vbcrlf
	strUbb=strUbb & "function thelp(swtch){" & vbcrlf
	strUbb=strUbb & "	if (swtch == 1){" & vbcrlf
	strUbb=strUbb & "		basic = false;" & vbcrlf
	strUbb=strUbb & "		stprompt = false;" & vbcrlf
	strUbb=strUbb & "		helpstat = true;" & vbcrlf
	strUbb=strUbb & "	} else if (swtch == 0) {" & vbcrlf
	strUbb=strUbb & "		helpstat = false;" & vbcrlf
	strUbb=strUbb & "		stprompt = false;" & vbcrlf
	strUbb=strUbb & "		basic = true;" & vbcrlf
	strUbb=strUbb & "	} else if (swtch == 2) {" & vbcrlf
	strUbb=strUbb & "		helpstat = false;" & vbcrlf
	strUbb=strUbb & "		basic = false;" & vbcrlf
	strUbb=strUbb & "		stprompt = true;" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function AddText(NewCode) {" & vbcrlf
	strUbb=strUbb & "document.myform.GuestContent.value+=NewCode;" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function emails() {" & vbcrlf
	strUbb=strUbb & "	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""Email 标记\n插入 Email 超级链接\n用法1: [email]nobody@domain.com[/email]\n用法2: [email=nobody@domain.com]佚名[/email]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[email][/email]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt2=prompt(""链接显示的文字.\n如果为空，那么将只显示你的 Email 地址"","""");" & vbcrlf
	strUbb=strUbb & "		if (txt2!=null) {" & vbcrlf
	strUbb=strUbb & "			txt=prompt(""Email 地址."",""name@domain.com"");" & vbcrlf
	strUbb=strUbb & "			if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "				if (txt2=="""") {" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[email]""+txt+""[/email]"";" & vbcrlf
	strUbb=strUbb & "				} else {" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[email=""+txt+""]""+txt2;" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[/email]"";" & vbcrlf
	strUbb=strUbb & "				}" & vbcrlf
	strUbb=strUbb & "				AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			}" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function flash() {" & vbcrlf
	strUbb=strUbb & " 	if (helpstat){" & vbcrlf
	strUbb=strUbb & "		alert(""Flash 动画\n插入 Flash 动画.\n用法: [flash]Flash 文件的地址[/flash]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[flash][/flash]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""Flash 文件的地址"",""http://"");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[flash]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/flash]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function Cdir() {" & vbcrlf
	strUbb=strUbb & " 	if (helpstat){" & vbcrlf
	strUbb=strUbb & "		alert(""Shockwave 动画\n插入 Shockwave 动画.\n用法: [dir=500,350]Shockwave 文件的地址[/dir]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[dir][/dir]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""Shockwave 文件的地址"","""");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[dir=500,350]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/dir]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function Crm() {" & vbcrlf
	strUbb=strUbb & " 	if (helpstat){" & vbcrlf
	strUbb=strUbb & "		alert(""real player 文件\n插入 real player 文件.\n用法: [rm=500,350]real player 文件的地址[/rm]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[rm][/rm]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""real player 文件的地址"","""");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[rm=500,350]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/rm]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function Cwmv() {" & vbcrlf
	strUbb=strUbb & " 	if (helpstat){" & vbcrlf
	strUbb=strUbb & "		alert(""media player 文件\n插入 wmv 文件.\n用法: [mp=500,350]media player 文件的地址[/mp]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[mp][/mp]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""media player 文件的地址"","""");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[mp=500,350]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/mp]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function Cmov() {" & vbcrlf
	strUbb=strUbb & " 	if (helpstat){" & vbcrlf
	strUbb=strUbb & "		alert(""quick time 文件\n插入 quick time 文件.\n用法: [qt=500,350]quick time 文件的地址[/qt]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[qt][/qt]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""quick time 文件的地址"","""");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[qt=500,350]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/qt]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function showsize(size) {" & vbcrlf
	strUbb=strUbb & "	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""文字大小标记\n设置文字大小.\n可变范围 1 - 6.\n 1 为最小 6 为最大.\n用法: [size=""+size+""]这是 ""+size+"" 文字[/size]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[size=""+size+""][/size]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""大小 ""+size,""文字"");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[size=""+size+""]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/size]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function bold() {" & vbcrlf
	strUbb=strUbb & "	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""加粗标记\n使文本加粗.\n用法: [b]这是加粗的文字[/b]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[b][/b]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""文字将被变粗."",""文字"");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[b]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/b]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function italicize() {" & vbcrlf
	strUbb=strUbb & "	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""斜体标记\n使文本字体变为斜体.\n用法: [i]这是斜体字[/i]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[i][/i]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""文字将变斜体"",""文字"");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[i]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/i]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function quote() {" & vbcrlf
	strUbb=strUbb & "	if (helpstat){" & vbcrlf
	strUbb=strUbb & "		alert(""引用标记\n引用一些文字.\n用法: [quote]引用内容[/quote]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[quote][/quote]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""被引用的文字"",""文字"");" & vbcrlf
	strUbb=strUbb & "		if(txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[quote]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/quote]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function showcolor(color) {" & vbcrlf
	strUbb=strUbb & "	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""颜色标记\n设置文本颜色.  任何颜色名都可以被使用.\n用法: [color=""+color+""]颜色要改变为""+color+""的文字[/color]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[color=""+color+""][/color]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "     	txt=prompt(""选择的颜色是: ""+color,""文字"");" & vbcrlf
	strUbb=strUbb & "		if(txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[color=""+color+""]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/color]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function center() {" & vbcrlf
	strUbb=strUbb & " 	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""对齐标记\n使用这个标记, 可以使文本左对齐、居中、右对齐.\n用法: [align=center|left|right]要对齐的文本[/align]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[align=center|left|right][/align]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt2=prompt(""对齐样式\n输入 'center' 表示居中, 'left' 表示左对齐, 'right' 表示右对齐."",""center""); " & vbcrlf
	strUbb=strUbb & "		while ((txt2!="""") && (txt2!=""center"") && (txt2!=""left"") && (txt2!=""right"") && (txt2!=null)) {" & vbcrlf
	strUbb=strUbb & "			txt2=prompt(""错误!\n类型只能输入 'center' 、 'left' 或者 'right'."","""");" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""要对齐的文本"",""文本"");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""\r[align=""+txt2+""]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/align]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function hyperlink() {" & vbcrlf
	strUbb=strUbb & "	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""超级链接标记\n插入一个超级链接标记\n使用方法: [url]http://www.asp163.net[/url]\nUSE: [url=http://www.asp163.net]链接文字[/url]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[url][/url]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt2=prompt(""链接文本显示.\n如果不想使用, 可以为空, 将只显示超级链接地址. "","""");" & vbcrlf
	strUbb=strUbb & "		if (txt2!=null) {" & vbcrlf
	strUbb=strUbb & "			txt=prompt(""超级链接."",""http://"");" & vbcrlf
	strUbb=strUbb & "			if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "				if (txt2=="""") {" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[url]""+txt;" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[/url]"";" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "				} else {" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[url=""+txt+""]""+txt2;" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[/url]"";" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "				}" & vbcrlf
	strUbb=strUbb & "			}" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function image() {" & vbcrlf
	strUbb=strUbb & "	if (helpstat){" & vbcrlf
	strUbb=strUbb & "		alert(""图片标记\n插入图片\n用法： [img]http://www.asp163.net/logo.gif[/img]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[img][/img]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""图片的 URL"",""http://"");" & vbcrlf
	strUbb=strUbb & "		if(txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[img]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/img]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function showcode() {" & vbcrlf
	strUbb=strUbb & "	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""代码标记\n使用代码标记，可以使你的程序代码里面的 html 等标志不会被破坏.\n使用方法:\n [code]这里是代码文字[/code]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""\r[code]\r[/code]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""输入代码"","""");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[code]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/code]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function list() {" & vbcrlf
	strUbb=strUbb & "	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""列表标记\n建造一个文字或则数字列表.\n\nUSE: [list] [*]项目一[/*] [*]项目二[/*] [*]项目三[/*] [/list]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt="" [list][*]  [/*][*]  [/*][*]  [/*][/list]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""列表类型\n输入 'A' 表示有序列表, '1' 表示无序列表, 留空表示无序列表."","""");" & vbcrlf
	strUbb=strUbb & "		while ((txt!="""") && (txt!=""A"") && (txt!=""a"") && (txt!=""1"") && (txt!=null)) {" & vbcrlf
	strUbb=strUbb & "			txt=prompt(""错误!\n类型只能输入 'A' 、 '1' 或者留空."","""");" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			if (txt=="""") {" & vbcrlf
	strUbb=strUbb & "				AddTxt=""[list]"";" & vbcrlf
	strUbb=strUbb & "			} else {" & vbcrlf
	strUbb=strUbb & "				AddTxt=""[list=""+txt+""]"";" & vbcrlf
	strUbb=strUbb & "			}" & vbcrlf
	strUbb=strUbb & "			txt=""1"";" & vbcrlf
	strUbb=strUbb & "			while ((txt!="""") && (txt!=null)) {" & vbcrlf
	strUbb=strUbb & "				txt=prompt(""列表项\n空白表示结束列表"","""");" & vbcrlf
	strUbb=strUbb & "				if (txt!="""") {" & vbcrlf
	strUbb=strUbb & "					AddTxt+=""[*]""+txt+""[/*]"";" & vbcrlf
	strUbb=strUbb & "				}" & vbcrlf
	strUbb=strUbb & "			}" & vbcrlf
	strUbb=strUbb & "			AddTxt+=""[/list] "";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function showfont(font) {" & vbcrlf
	strUbb=strUbb & " 	if (helpstat){" & vbcrlf
	strUbb=strUbb & "		alert(""字体标记\n给文字设置字体.\n用法: [face=""+font+""]改变文字字体为""+font+""[/face]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[face=""+font+""][/face]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""要设置字体的文字""+font,""文字"");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[face=""+font+""]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/face]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "function underline() {" & vbcrlf
	strUbb=strUbb & "  	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""下划线标记\n给文字加下划线.\n用法: [u]要加下划线的文字[/u]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[u][/u]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""下划线文字."",""文字"");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[u]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/u]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "function setfly() {" & vbcrlf
	strUbb=strUbb & " 	if (helpstat){" & vbcrlf
	strUbb=strUbb & "		alert(""飞翔标记\n使文字飞行.\n用法: [fly]文字为这样文字[/fly]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[fly][/fly]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""飞翔文字"",""文字"");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[fly]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/fly]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function move() {" & vbcrlf
	strUbb=strUbb & "	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""移动标记\n使文字产生移动效果.\n用法: [move]要产生移动效果的文字[/move]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[move][/move]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt=prompt(""要产生移动效果的文字"",""文字"");" & vbcrlf
	strUbb=strUbb & "		if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[move]""+txt;" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "			AddTxt=""[/move]"";" & vbcrlf
	strUbb=strUbb & "			AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function shadow() {" & vbcrlf
	strUbb=strUbb & "	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "               alert(""阴影标记\n使文字产生阴影效果.\n用法: [SHADOW=宽度, 颜色, 边界]要产生阴影效果的文字[/SHADOW]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[SHADOW=255,blue,1][/SHADOW]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt2=prompt(""文字的长度、颜色和边界大小"",""255,blue,1"");" & vbcrlf
	strUbb=strUbb & "		if (txt2!=null) {" & vbcrlf
	strUbb=strUbb & "			txt=prompt(""要产生阴影效果的文字"",""文字"");" & vbcrlf
	strUbb=strUbb & "			if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "				if (txt2=="""") {" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[SHADOW=255, blue, 1]""+txt;" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[/SHADOW]"";" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "				} else {" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[SHADOW=""+txt2+""]""+txt;" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[/SHADOW]"";" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "				}" & vbcrlf
	strUbb=strUbb & "			}" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function glow() {" & vbcrlf
	strUbb=strUbb & "	if (helpstat) {" & vbcrlf
	strUbb=strUbb & "		alert(""光晕标记\n使文字产生光晕效果.\n用法: [GLOW=宽度, 颜色, 边界]要产生光晕效果的文字[/GLOW]"");" & vbcrlf
	strUbb=strUbb & "	} else if (basic) {" & vbcrlf
	strUbb=strUbb & "		AddTxt=""[glow=255,red,2][/glow]"";" & vbcrlf
	strUbb=strUbb & "		AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "	} else {" & vbcrlf
	strUbb=strUbb & "		txt2=prompt(""文字的长度、颜色和边界大小"",""255,red,2"");" & vbcrlf
	strUbb=strUbb & "		if (txt2!=null) {" & vbcrlf
	strUbb=strUbb & "			txt=prompt(""要产生光晕效果的文字."",""文字"");" & vbcrlf
	strUbb=strUbb & "			if (txt!=null) {" & vbcrlf
	strUbb=strUbb & "				if (txt2=="""") {" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[glow=255,red,2]""+txt;" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[/glow]"";" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "				} else {" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[glow=""+txt2+""]""+txt;" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "					AddTxt=""[/glow]"";" & vbcrlf
	strUbb=strUbb & "					AddText(AddTxt);" & vbcrlf
	strUbb=strUbb & "				}" & vbcrlf
	strUbb=strUbb & "			}" & vbcrlf
	strUbb=strUbb & "		}" & vbcrlf
	strUbb=strUbb & "	}" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "function openemot()" & vbcrlf
	strUbb=strUbb & "{" & vbcrlf
	strUbb=strUbb & "	var Win =window.open(""../guestbook/guestselect.asp?action=emot"",""face"",""width=380,height=300,resizable=1,scrollbars=1"");" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "function openhelp()" & vbcrlf
	strUbb=strUbb & "{" & vbcrlf
	strUbb=strUbb & "	var Win =window.open(""../Editor/editor_ubbhelp.asp"",""face"",""width=550,height=400,resizable=1,scrollbars=1"");" & vbcrlf
	strUbb=strUbb & "}" & vbcrlf
	strUbb=strUbb & "" & vbcrlf
	strUbb=strUbb & "</script>" & vbcrlf
	strUbb=strUbb & "" & vbcrlf

	strUbb=strUbb & "<img onclick=bold() align=absmiddle src=""../images/ubb/Ubb_bold.gif"" width=""22"" height=""22"" alt=""粗体"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=italicize() align=absmiddle src=""../images/ubb/Ubb_italicize.gif"" width=""23"" height=""22"" alt=""斜体"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=underline() align=absmiddle src=""../images/ubb/Ubb_underline.gif"" width=""23"" height=""22"" alt=""下划线"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=center() align=absmiddle src=""../images/ubb/Ubb_center.gif"" width=""22"" height=""22"" alt=""居中"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=hyperlink() align=absmiddle src=""../images/ubb/Ubb_url.gif"" width=""22"" height=""22"" alt=""超级连接"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=emails() align=absmiddle src=""../images/ubb/Ubb_email.gif"" width=""23"" height=""22"" alt=""Email连接"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=image() align=absmiddle src=""../images/ubb/Ubb_image.gif"" width=""23"" height=""22"" alt=""图片"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=flash() align=absmiddle src=""../images/ubb/Ubb_swf.gif"" width=""23"" height=""22"" alt=""Flash图片"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=Cdir() align=absmiddle src=""../images/ubb/Ubb_Shockwave.gif"" width=""23"" height=""22"" alt=""Shockwave文件"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=Crm() align=absmiddle src=""../images/ubb/Ubb_rm.gif"" width=""23"" height=""22"" alt=""realplay视频文件"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=Cwmv() align=absmiddle src=""../images/ubb/Ubb_mp.gif"" width=""23"" height=""22"" alt=""Media Player视频文件"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=Cmov() align=absmiddle src=""../images/ubb/Ubb_qt.gif"" width=""23"" height=""22"" alt=""QuickTime视频文件"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=showcode() align=absmiddle src=""../images/ubb/Ubb_code.gif"" width=""22"" height=""22"" alt=""代码"" border=""0""" & vbcrlf
	strUbb=strUbb & "><img onclick=quote() align=absmiddle src=""../images/ubb/Ubb_quote.gif"" width=""23"" height=""22"" alt=""引用"" border=""0""" & vbcrlf
	strUbb=strUbb & "><IMG onclick=setfly() align=absmiddle height=22 alt=飞行字 src=""../images/ubb/Ubb_fly.gif"" width=23 border=0" & vbcrlf
	strUbb=strUbb & "><IMG onclick=move() align=absmiddle height=22 alt=移动字 src=""../images/ubb/Ubb_move.gif"" width=23 border=0" & vbcrlf
	strUbb=strUbb & "><IMG onclick=glow() align=absmiddle height=22 alt=发光字 src=""../images/ubb/Ubb_glow.gif"" width=23 border=0" & vbcrlf
	strUbb=strUbb & "><IMG onclick=shadow() align=absmiddle height=22 alt=阴影字 src=""../images/ubb/Ubb_shadow.gif"" width=23 border=0" & vbcrlf
	strUbb=strUbb & "><img onclick=openhelp() align=absmiddle src='../images/ubb/Ubb_Help.gif' width='23' height='22' alt='帮助' border=0" & vbcrlf
	strUbb=strUbb & "><br>" & vbcrlf
	strUbb=strUbb & "字体：" & vbcrlf
	strUbb=strUbb & "<SELECT onchange=showfont(this.options[this.selectedIndex].value) name=font>" & vbcrlf
	strUbb=strUbb & "	<option value=""宋体"" selected>宋体</option>" & vbcrlf
	strUbb=strUbb & "	<option value=""楷体_GB2312"">楷体</option>" & vbcrlf
	strUbb=strUbb & "	<option value=""新宋体"">新宋体</option>" & vbcrlf
	strUbb=strUbb & "	<option value=""黑体"">黑体</option>" & vbcrlf
	strUbb=strUbb & "	<option value=""隶书"">隶书</option>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=""Andale Mono"">Andale Mono</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=Arial>Arial</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=""Arial Black"">Arial Black</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=""Book Antiqua"">Book Antiqua</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=""Century Gothic"">Century Gothic</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=""Comic Sans MS"">Comic Sans MS</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=""Courier New"">Courier New</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=Georgia>Georgia</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=Impact>Impact</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=Tahoma>Tahoma</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=""Times New Roman"" >Times New Roman</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=""Trebuchet MS"">Trebuchet MS</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=""Script MT Bold"">Script MT Bold</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=Stencil>Stencil</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=Verdana>Verdana</OPTION>" & vbcrlf
	strUbb=strUbb & "	<OPTION value=""Lucida Console"">Lucida Console</OPTION>" & vbcrlf
	strUbb=strUbb & "</SELECT>" & vbcrlf
	strUbb=strUbb & "字体大小" & vbcrlf
	strUbb=strUbb & "<select name=""size"" onChange=""showsize(this.options[this.selectedIndex].value)"">" & vbcrlf
	strUbb=strUbb & "	<option value=""1"">1</option>" & vbcrlf
	strUbb=strUbb & "	<option value=""2"">2</option>" & vbcrlf
	strUbb=strUbb & "	<option value=""3"" selected>3</option>" & vbcrlf
	strUbb=strUbb & "	<option value=""4"">4</option>" & vbcrlf
	strUbb=strUbb & "</select>" & vbcrlf
	strUbb=strUbb & "颜色：" & vbcrlf
	strUbb=strUbb & "<SELECT onchange=showcolor(this.options[this.selectedIndex].value) name=color>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#F0F8FF;color: #F0F8FF"" value=""#F0F8FF"">#F0F8FF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FAEBD7;color: #FAEBD7"" value=""#FAEBD7"">#FAEBD7</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#00FFFF;color: #00FFFF"" value=""#00FFFF"">#00FFFF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#7FFFD4;color: #7FFFD4"" value=""#7FFFD4"">#7FFFD4</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#F0FFFF;color: #F0FFFF"" value=""#F0FFFF"">#F0FFFF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#F5F5DC;color: #F5F5DC"" value=""#F5F5DC"">#F5F5DC</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFE4C4;color: #FFE4C4"" value=""#FFE4C4"">#FFE4C4</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#000000;color: #000000"" value=""#000000"">#000000</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFEBCD;color: #FFEBCD"" value=""#FFEBCD"">#FFEBCD</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#0000FF;color: #0000FF"" value=""#0000FF"">#0000FF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#8A2BE2;color: #8A2BE2"" value=""#8A2BE2"">#8A2BE2</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#A52A2A;color: #A52A2A"" value=""#A52A2A"">#A52A2A</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#DEB887;color: #DEB887"" value=""#DEB887"">#DEB887</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#5F9EA0;color: #5F9EA0"" value=""#5F9EA0"">#5F9EA0</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#7FFF00;color: #7FFF00"" value=""#7FFF00"">#7FFF00</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#D2691E;color: #D2691E"" value=""#D2691E"">#D2691E</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FF7F50;color: #FF7F50"" value=""#FF7F50"">#FF7F50</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#6495ED;color: #6495ED"" value=""#6495ED"" selected>#6495ED</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFF8DC;color: #FFF8DC"" value=""#FFF8DC"">#FFF8DC</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#DC143C;color: #DC143C"" value=""#DC143C"">#DC143C</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#00FFFF;color: #00FFFF"" value=""#00FFFF"">#00FFFF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#00008B;color: #00008B"" value=""#00008B"">#00008B</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#008B8B;color: #008B8B"" value=""#008B8B"">#008B8B</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#B8860B;color: #B8860B"" value=""#B8860B"">#B8860B</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#A9A9A9;color: #A9A9A9"" value=""#A9A9A9"">#A9A9A9</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#006400;color: #006400"" value=""#006400"">#006400</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#BDB76B;color: #BDB76B"" value=""#BDB76B"">#BDB76B</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#8B008B;color: #8B008B"" value=""#8B008B"">#8B008B</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#556B2F;color: #556B2F"" value=""#556B2F"">#556B2F</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FF8C00;color: #FF8C00"" value=""#FF8C00"">#FF8C00</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#9932CC;color: #9932CC"" value=""#9932CC"">#9932CC</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#8B0000;color: #8B0000"" value=""#8B0000"">#8B0000</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#E9967A;color: #E9967A"" value=""#E9967A"">#E9967A</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#8FBC8F;color: #8FBC8F"" value=""#8FBC8F"">#8FBC8F</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#483D8B;color: #483D8B"" value=""#483D8B"">#483D8B</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#2F4F4F;color: #2F4F4F"" value=""#2F4F4F"">#2F4F4F</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#00CED1;color: #00CED1"" value=""#00CED1"">#00CED1</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#9400D3;color: #9400D3"" value=""#9400D3"">#9400D3</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FF1493;color: #FF1493"" value=""#FF1493"">#FF1493</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#00BFFF;color: #00BFFF"" value=""#00BFFF"">#00BFFF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#696969;color: #696969"" value=""#696969"">#696969</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#1E90FF;color: #1E90FF"" value=""#1E90FF"">#1E90FF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#B22222;color: #B22222"" value=""#B22222"">#B22222</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFFAF0;color: #FFFAF0"" value=""#FFFAF0"">#FFFAF0</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#228B22;color: #228B22"" value=""#228B22"">#228B22</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FF00FF;color: #FF00FF"" value=""#FF00FF"">#FF00FF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#DCDCDC;color: #DCDCDC"" value=""#DCDCDC"">#DCDCDC</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#F8F8FF;color: #F8F8FF"" value=""#F8F8FF"">#F8F8FF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFD700;color: #FFD700"" value=""#FFD700"">#FFD700</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#DAA520;color: #DAA520"" value=""#DAA520"">#DAA520</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#808080;color: #808080"" value=""#808080"">#808080</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#008000;color: #008000"" value=""#008000"">#008000</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#ADFF2F;color: #ADFF2F"" value=""#ADFF2F"">#ADFF2F</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#F0FFF0;color: #F0FFF0"" value=""#F0FFF0"">#F0FFF0</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FF69B4;color: #FF69B4"" value=""#FF69B4"">#FF69B4</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#CD5C5C;color: #CD5C5C"" value=""#CD5C5C"">#CD5C5C</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#4B0082;color: #4B0082"" value=""#4B0082"">#4B0082</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFFFF0;color: #FFFFF0"" value=""#FFFFF0"">#FFFFF0</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#F0E68C;color: #F0E68C"" value=""#F0E68C"">#F0E68C</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#E6E6FA;color: #E6E6FA"" value=""#E6E6FA"">#E6E6FA</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFF0F5;color: #FFF0F5"" value=""#FFF0F5"">#FFF0F5</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#7CFC00;color: #7CFC00"" value=""#7CFC00"">#7CFC00</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFFACD;color: #FFFACD"" value=""#FFFACD"">#FFFACD</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#ADD8E6;color: #ADD8E6"" value=""#ADD8E6"">#ADD8E6</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#F08080;color: #F08080"" value=""#F08080"">#F08080</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#E0FFFF;color: #E0FFFF"" value=""#E0FFFF"">#E0FFFF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FAFAD2;color: #FAFAD2"" value=""#FAFAD2"">#FAFAD2</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#90EE90;color: #90EE90"" value=""#90EE90"">#90EE90</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#D3D3D3;color: #D3D3D3"" value=""#D3D3D3"">#D3D3D3</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFB6C1;color: #FFB6C1"" value=""#FFB6C1"">#FFB6C1</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFA07A;color: #FFA07A"" value=""#FFA07A"">#FFA07A</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#20B2AA;color: #20B2AA"" value=""#20B2AA"">#20B2AA</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#87CEFA;color: #87CEFA"" value=""#87CEFA"">#87CEFA</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#778899;color: #778899"" value=""#778899"">#778899</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#B0C4DE;color: #B0C4DE"" value=""#B0C4DE"">#B0C4DE</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFFFE0;color: #FFFFE0"" value=""#FFFFE0"">#FFFFE0</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#00FF00;color: #00FF00"" value=""#00FF00"">#00FF00</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#32CD32;color: #32CD32"" value=""#32CD32"">#32CD32</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FAF0E6;color: #FAF0E6"" value=""#FAF0E6"">#FAF0E6</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FF00FF;color: #FF00FF"" value=""#FF00FF"">#FF00FF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#800000;color: #800000"" value=""#800000"">#800000</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#66CDAA;color: #66CDAA"" value=""#66CDAA"">#66CDAA</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#0000CD;color: #0000CD"" value=""#0000CD"">#0000CD</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#BA55D3;color: #BA55D3"" value=""#BA55D3"">#BA55D3</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#9370DB;color: #9370DB"" value=""#9370DB"">#9370DB</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#3CB371;color: #3CB371"" value=""#3CB371"">#3CB371</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#7B68EE;color: #7B68EE"" value=""#7B68EE"">#7B68EE</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#00FA9A;color: #00FA9A"" value=""#00FA9A"">#00FA9A</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#48D1CC;color: #48D1CC"" value=""#48D1CC"">#48D1CC</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#C71585;color: #C71585"" value=""#C71585"">#C71585</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#191970;color: #191970"" value=""#191970"">#191970</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#F5FFFA;color: #F5FFFA"" value=""#F5FFFA"">#F5FFFA</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFE4E1;color: #FFE4E1"" value=""#FFE4E1"">#FFE4E1</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFE4B5;color: #FFE4B5"" value=""#FFE4B5"">#FFE4B5</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFDEAD;color: #FFDEAD"" value=""#FFDEAD"">#FFDEAD</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#000080;color: #000080"" value=""#000080"">#000080</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FDF5E6;color: #FDF5E6"" value=""#FDF5E6"">#FDF5E6</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#808000;color: #808000"" value=""#808000"">#808000</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#6B8E23;color: #6B8E23"" value=""#6B8E23"">#6B8E23</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFA500;color: #FFA500"" value=""#FFA500"">#FFA500</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FF4500;color: #FF4500"" value=""#FF4500"">#FF4500</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#DA70D6;color: #DA70D6"" value=""#DA70D6"">#DA70D6</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#EEE8AA;color: #EEE8AA"" value=""#EEE8AA"">#EEE8AA</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#98FB98;color: #98FB98"" value=""#98FB98"">#98FB98</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#AFEEEE;color: #AFEEEE"" value=""#AFEEEE"">#AFEEEE</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#DB7093;color: #DB7093"" value=""#DB7093"">#DB7093</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFEFD5;color: #FFEFD5"" value=""#FFEFD5"">#FFEFD5</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFDAB9;color: #FFDAB9"" value=""#FFDAB9"">#FFDAB9</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#CD853F;color: #CD853F"" value=""#CD853F"">#CD853F</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFC0CB;color: #FFC0CB"" value=""#FFC0CB"">#FFC0CB</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#DDA0DD;color: #DDA0DD"" value=""#DDA0DD"">#DDA0DD</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#B0E0E6;color: #B0E0E6"" value=""#B0E0E6"">#B0E0E6</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#800080;color: #800080"" value=""#800080"">#800080</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FF0000;color: #FF0000"" value=""#FF0000"">#FF0000</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#BC8F8F;color: #BC8F8F"" value=""#BC8F8F"">#BC8F8F</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#4169E1;color: #4169E1"" value=""#4169E1"">#4169E1</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#8B4513;color: #8B4513"" value=""#8B4513"">#8B4513</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FA8072;color: #FA8072"" value=""#FA8072"">#FA8072</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#F4A460;color: #F4A460"" value=""#F4A460"">#F4A460</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#2E8B57;color: #2E8B57"" value=""#2E8B57"">#2E8B57</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFF5EE;color: #FFF5EE"" value=""#FFF5EE"">#FFF5EE</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#A0522D;color: #A0522D"" value=""#A0522D"">#A0522D</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#C0C0C0;color: #C0C0C0"" value=""#C0C0C0"">#C0C0C0</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#87CEEB;color: #87CEEB"" value=""#87CEEB"">#87CEEB</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#6A5ACD;color: #6A5ACD"" value=""#6A5ACD"">#6A5ACD</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#708090;color: #708090"" value=""#708090"">#708090</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFFAFA;color: #FFFAFA"" value=""#FFFAFA"">#FFFAFA</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#00FF7F;color: #00FF7F"" value=""#00FF7F"">#00FF7F</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#4682B4;color: #4682B4"" value=""#4682B4"">#4682B4</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#D2B48C;color: #D2B48C"" value=""#D2B48C"">#D2B48C</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#008080;color: #008080"" value=""#008080"">#008080</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#D8BFD8;color: #D8BFD8"" value=""#D8BFD8"">#D8BFD8</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FF6347;color: #FF6347"" value=""#FF6347"">#FF6347</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#40E0D0;color: #40E0D0"" value=""#40E0D0"">#40E0D0</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#EE82EE;color: #EE82EE"" value=""#EE82EE"">#EE82EE</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#F5DEB3;color: #F5DEB3"" value=""#F5DEB3"">#F5DEB3</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFFFFF;color: #FFFFFF"" value=""#FFFFFF"">#FFFFFF</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#F5F5F5;color: #F5F5F5"" value=""#F5F5F5"">#F5F5F5</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#FFFF00;color: #FFFF00"" value=""#FFFF00"">#FFFF00</option>" & vbcrlf
	strUbb=strUbb & "	<option style=""background-color:#9ACD32;color: #9ACD32"" value=""#9ACD32"">#9ACD32</option>" & vbcrlf
	strUbb=strUbb & "</SELECT>" & vbcrlf
	strUbb=strUbb & "&nbsp;<img align=absmiddle onclick=openemot() src='../images/ubb/Ubb_emot.gif' border=0 alt=选择心情图标 style='cursor:hand'>" & vbcrlf
	ShowUbb=strUbb
end function
%>