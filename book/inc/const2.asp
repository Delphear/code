<%
select case lunjilybstyle
case "1"                   rem 蓝
bordercolor="#3675C9"      rem 表格边框色
tablebgcolor="#D5E3FD"     rem 表格背景色
bodytableleft="#86BBF7"    
add_leftbg="#1C94DB"       rem add.asp左边的背景色
add_fontcolor="#ffffff"    rem add.asp左边字体的颜色

link="#333333"             rem 有链接的颜色
hover="#800000"            rem 移上链接的颜色
scrollbarshadow="#F3F3F4"  rem 滚动条阴影颜色
arrow="#000000"            rem 滚动条三角形箭头颜色
trackcolor="#E1EAF4"       rem 滚动条背景颜色
basecolor="#d1eaf1"        rem 滚动条颜色
case "2"                   rem 灰
bodybgcolor="#ffffff"
bordercolor="#000000"
bodytableleft="#DDDDDD"
tablebgcolor="#f7f7f7"
add_leftbg="#9d9d9d"
add_rightbg="#C8C9CA"
add_fontcolor="#ffffff"

link="#333333"
vlink="#333333"
alink="#ff0000"
scrollbarshadow="#F3F3F4"
arrow="#000000"
trackcolor="#c9c9c9"
basecolor="#E4E4E4"

case "3"                   rem 黄
bodybgcolor="#ffffff"
bordercolor="#F57C03"
tablebgcolor="#FAF8F1"
bodytableleft="#FFDD95"   
add_leftbg="#DDAE68"
add_rightbg="#FEDAB6"
add_fontcolor="#ffffff"

link="#333333"
vlink="#333333"
alink="#ff0000"
scrollbarshadow="#F3F3F4"
arrow="#000000"
trackcolor="#FAF8F1"
basecolor="#FF9966"

case "4"                   rem 绿
bodybgcolor="#ffffff"
bordercolor="#008000"
tablebgcolor="#EAF7EA"
bodytableleft="#94EB96"  
add_leftbg="#57C644"
add_rightbg="#d1cb78"
add_fontcolor="#ffffff"

link="#333333"
vlink="#333333"
alink="#ff0000"
scrollbarshadow="#009900"
arrow="#ffffff"
trackcolor="#C4DFB9"
basecolor="#A7DCA0"
end select
%>
