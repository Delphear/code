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
            來自：<%=rs("from")%></p> 
            <%end if%>
            <p align="center"> 编号：<%=j%>              
          </td>                     
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
guestcontent=ubbcode(rs("guestcontent"))
guestcontent=replace(guestcontent,chr(13),"<br>")
guestcontent=replace(guestcontent,""&keyword&"","<font color=red>"&keyword&"</font>")
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
        <td width="500" height="18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
rs.movenext 
i=i+1 
j=j-1
loop 
%>
  <table width="650" height="17" align=center cellpadding="0"  cellspacing="0" class="bodytablebottom"><tr>
<%
filename="index.asp"
response.write "<form method=post action="&filename&">" 
%>
    <td width="100%">&nbsp;总计留言<%=Rs.recordcount%>条&nbsp;共有<%=page%>/<%=Rs.pagecount%>页 
      <% if page=1 then %>
      <%else%>
      <a href=<%=filename%>?page=<%=page-1%>>上一页</a>&nbsp; 
      <%end if%>
      <% if Rs.pagecount-page <> 0 then %>
      <a href=<%=filename%>?page=<%=page+1%>>下一页</a>&nbsp; 
      <%else%>
      <%end if%>
    转到：<input class=smallInput type="text" name="page" size=4 maxlength=10 value="<%=page%>"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">              
<%
response.write "<input class=noborder type='submit' value='Go' name='cndok'>"
%>
    </td>
    <%end if%></tr></form> 
  </table> 
<table width="650" border="0" align="center">
  <tr> 
    <td height="2"><img src="csspic/blank.gif" width="1" height="1"></td>
  </tr>
</table>

<%
connclose()    
%>           

