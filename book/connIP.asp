<%
dim connIP,connIPstr

Set ConnIP=Server.CreateObject("ADODB.Connection")   

connIPstr ="Provider = Microsoft.Jet.OLEDB.4.0; Data Source ="&_
	Server.MapPath("address.mdb")
ConnIP.Open connIPstr

sub connIPclose
	connIP.close
	set conn=nothing
end sub

function getFrom(ip)
	dim arr,num, sql, rs
	arr=split(ip,".")
	if ip="" or ubound(arr)<>3 then
		getFrom=""
		exit function
	end if
	num=int(arr(0))*16777216+int(arr(1))*65536+int(arr(2))*256+int(arr(3))-1
	sql="select top 1 country,city from address where ip1<="&num&" and ip2>="&num
	set rs=connip.execute(sql)
	if not rs.eof then
		getFrom=rs(0)&rs(1)
	end if
	rs.close
	set rs=nothing
end function
%>
