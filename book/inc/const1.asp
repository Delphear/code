<%
set rs=server.createobject("adodb.recordset")
	sql = "select top 1 * from lybconfig"
	rs.open sql,conn,1,1
	arrRow=rs.getrows
      	lybtitle=arrRow(1,0)
	weburl=arrRow(2,0)
	listnum=arrRow(3,0)
	rightre=arrRow(4,0)
	rightnum=arrRow(5,0)
        notetitle=arrRow(6,0)
        notebbs=arrRow(7,0)
        notedate=arrRow(8,0)
      	admin_name=arrRow(9,0)
	admin_id=arrRow(10,0)
	admin_qq=arrRow(11,0)
	admin_email=arrRow(12,0)
	admin_msn=arrRow(13,0)
        admin_icq=arrRow(14,0)
        admin_homepage=arrRow(15,0)
        admin_note=arrRow(16,0)
        smile=arrRow(17,0)
        ubb=arrRow(18,0)
        secret=arrRow(19,0)
        maxlen=arrRow(20,0)
        killWord=arrRow(21,0)
        lunjilybstyle=arrRow(22,0)
        sh=arrRow(23,0)
        close=arrRow(24,0)
        close_content=arrRow(25,0)
        killWords=split(killWord,",") 
	downurl="http://www.lunji.com/download/index.asp"
rs.close
set rs=nothing
%>