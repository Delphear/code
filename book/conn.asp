<%@language=vbscript codepage=936 %>
<%
        startime=timer()
	dim conn
	dim connstr
	dim db
   	'更改数据库名字
	db=")#book20040323.mdb"
	Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")
'如果你的服务器采用较老版本Access驱动，请用下面连接方法
  ' connstr="driver={Microsoft Access Driver (*.mdb)};dbq=" & Server.MapPath(""&db&"")
	conn.Open connstr
sub connclose
	conn.close
	set conn=nothing
end sub
sub rsclose
	rs.close
	set rs=nothing
end sub
%>
