<!--#include file="conn.asp"-->
<!--#include file="inc/const1.asp"-->
<!--#include file="inc/const2.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="close.asp"-->
<!--#include file="inc/sqlfilter.asp"-->
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
<html>
<head> 
<meta name="Author" content="BlueSailor">
<title>搜索结果--<%=lybtitle%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!--#include file="style.asp"-->
</head>
<body>
<!--#include file="top.asp"-->
<table width="650" border="0" align="center">
  <tr> 
    <td height="2"><img src="csspic/blank.gif" width="1" height="1"></td>
  </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="650" align="center">
  <tr>
    <td width="100%"><font color="#800000">查询结果：</font>
　</td>
  </tr>
</table>
<%
dim keyword
keyword=trim(request("keyword"))
classid=request("classid")
set rs=server.createobject("adodb.recordset")
if classid="留言内容" then
sql="select * from guest where guestcontent like '%"&keyword&"%'"
elseif classid="回复内容" then
sql="select * from guest where guestreply like '%"&keyword&"%'"
else
sql="select * from guest where guestname like '%"&keyword&"%'"
end if
rs.open sql,conn,3,1
Rs.pagesize=listnum
	page=SafeRequest("page",1)
if page = "" Then 
	page=1
End If 
If page<1 Then
	page=1
End If
if (page-Rs.pagecount) > 0 then
	page=Rs.pagecount
End If
%>
<%
if rs.eof or rs.bof then
%>
<script language="javascript">
alert ("没有符合条件的记录")
history.go(-1)
</script>
<%else%>
<%
	Rs.absolutepage=page
i=0
do while not rs.eof and i<listnum
ips=split(rs("ip"),".")
ip=""&ips(0)&"."&ips(1)&".*.*"
%>
<table width="650" height="165" align="center" cellpadding="0" cellspacing="0" class="lybtable">
  <tr> 
    <td width="143" height="165" rowspan="3" valign="top" class="bodytableleft"> <p align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0" height="164"  align=center>                     
        <tr >
          <td height="164" align="center" valign="top"> 
            <%if  rs("guestname")=admin_name then%>
            <img src="pic/teammo.gif"> 
            <%end if%>   
            <span STYLE="position:relative; width:105; height:25; filter:glow(Color=<%=bordercolor%>,Strength=4); margin-left:2px">    
            <font color="#FFFFFF"><%=rs("guestname")%></font> </span> <img src="head/<%=rs("face")%>.gif"> 
            <% if rs("from")<>"" then %>   
            <br>
            來自：<%=rs("from")%>  
            <%end if%>  
            <p align="center">&nbsp; </td>                     
        </tr>                     
      </table></td>
    <td width="505" height="24" class="bodytabletop"><img src="pic/posttime.gif"> 
      发表于：<%=rs("guestdate")%>&nbsp;&nbsp;&nbsp; <%if rs("email")<>"" then %> 
      <a href="mailto:<%=rs("email")%>"> <img src="pic/email.gif"  border="0" title="E-MAIL:<%=rs("email")%>"></a> 
      <%else%> 
      <img src="pic/email1.gif"  border="0">  
      <%end if%>
      &nbsp;  
      <%if rs("homepage")<>"" then%>
      <a href="<%=rs("homepage")%>" target="blank"> <img src="pic/home.gif" border="0" title="主页:<%=rs("homepage")%>"></a>  
      <%else%> 
      <img src="pic/home1.gif" border="0">  
      <%end if%>
      &nbsp;
      <% if rs("oicq")<>"" then%>
      <a href="http://search.tencent.com/cgi-bin/friend/user_show_info?ln=<%=rs("oicq")%>" target="blank" title="Q Q:<%=rs("oicq")%>"><img src="pic/qq.gif"  border="0"></a> 
      <%else%>
      <img src="pic/qq1.gif"  border="0">
      <%end if%> &nbsp;
 <%if rs("msn")<>"" then %>  
     <img src="pic/msn.gif"  border="0" title="MSN:<%=rs("msn")%>"></a>  
      <%else%>  
      <img src="pic/msn1.gif"  border="0">   
 <%end if%>&nbsp;
       <%if session.sessionid=rs("sessionid") then%> 
      <a href="edit.asp?id=<%=rs("id")%>"><img src="pic/edit.gif" border="0" title="编辑"></a>  
      <%else%><img src="pic/edit1.gif" border="0">  
      <%end if%> &nbsp; &nbsp;<img src="images/ip.GIF" width="14" height="15" title="<%=ip%>">
    </td>
  </tr>
  <tr> 
    <td width="508" height="117" style="word-break: break-all;padding:4px"  > 
<%
if rs("sh")=True then
response.write("<div align='center'>[待申核的留言]</div>")
else
%>
<%
secretly=rs("secretly")
if secretly=True then
%>      <img src="images/hidden.gif"><font color="#800000">此留言为悄悄话，版主请进入管理后查看</font> 
      <%else%> 
<%
guestcontent=rs("guestcontent")
guestcontent=ubbcode(guestcontent)
'guestcontent=replace(guestcontent,""&keyword&"","<font color=red>"&keyword&"</font>")
guestcontent=replace(guestcontent,chr(13),"<br>")

%>
<p style="padding:4px;word-wrap: break-word">  
<%=guestcontent%></p>
<%end if%><%if rs("guestreply")<>"" then %>
    <div align="center">
      <fieldset style="padding: 2; width:98%;filter: alpha(opacity=120)"><legend><img src="images/reply_new.gif"></legend><p align="left"><%=ubbcode(rs("guestreply"))%><p><font color="#666666">&nbsp; 回复时间：<%=rs("redate")%></font></p></fieldset>  </div>         
      <%end if%>
      <%end if%></td>
  </tr>
  <tr>
    <td height="24"  class="bodytablebottom"><table border="0" cellpadding="0" cellspacing="0"  width="537" >
      <tr>
        <td width="500" height="18"><img src="images/ip.GIF" width="15" height="13">IP:<%=ip%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td width="15">
        <p align="right"><a title="返回网页顶部" href="#top"><img src="images/gotop.gif" border="0" ></a></td>
      </tr>
    </table></td>
  </tr>
</table>        
<table width="650" border="0" align="center">
  <tr> 
    <td height="2"><img src="csspic/blank.gif" width="1" height="1"></td>
  </tr>
</table>
<%
Rs.movenext
i=i+1
loop
%>
<%
filename="searchresult.asp"
%>
  <table width="650" height="17" align=center cellpadding="0"  cellspacing="0" class="bodytablebottom"><tr>
    <td width="100%">&nbsp;总计留言<%=Rs.recordcount%>条&nbsp;共有<%=page%>/<%=Rs.pagecount%>页    
      <% if page=1 then %>
      <%else%>   
      <a href=<%=filename%>?page=<%=page-1%>&keyword=<%=keyword%>&classid=<%=classid%>>上一页</a>&nbsp;    
      <%end if%>
      <% if Rs.pagecount-page <> 0 then %>   
      <a href=<%=filename%>?page=<%=page+1%>&keyword=<%=keyword%>&classid=<%=classid%>>下一页</a>&nbsp;    
      <%else%>
      <%end if%>   
    </td>
    <%end if%></tr> 
  </table> 
<table width="650" border="0" align="center">
  <tr> 
    <td height="2"><img src="csspic/blank.gif" width="1" height="1"></td>
  </tr>
</table>
<!--#include file="bottom.asp"-->
<%
rsclose()
connclose()    
%>  
</body>
</html>



