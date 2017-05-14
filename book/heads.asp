<!--#include file="inc/const2.asp"-->
<!--#include file="css.asp"-->
<%
bodybgcolor=session("bgcolor")
%>
<body topmargin="2" bgcolor="<%=bodybgcolor%>" alink=<%=alink%> vlink=<%=vlink%> link=<%=link%> >
<DIV align="center"><B>『在签写留言页面上选择对应的个性头像序号』</B><br>
</DIV>
<div align="center">
<table>
<%for i=0 to 5%>
<tr>
<%for k=1 to 5%>
<td align=center><img src=images/image<%=i*5+k%>.gif><br>image<%=i*5+k%></td>
<%next%>
</tr>
<%next%>
</table>
</div>
