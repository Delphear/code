<%@language=vbscript codepage=936 %>
<%
        startime=timer()
	dim conn
	dim connstr
	dim db
   	'�������ݿ�����
	db=")#book20040323.mdb"
	Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")
'�����ķ��������ý��ϰ汾Access�����������������ӷ���
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
