<%

	set rs2=server.createobject("adodb.recordset")
	sql2 = "select top 1 * from mailconfig"
	rs2.open sql2,conn,1,1
        arrRow=rs2.getrows
      	MailServer=arrRow(1,0)
	ServerUserName=arrRow(2,0)
        ServerPassword=arrRow(3,0)
        MailFrom=arrRow(4,0)
        SendName=arrRow(5,0)
	rs2.close
	set rs2=nothing

%>