<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<TITLE>华睿房产连锁房源信息内部管理系统</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="shortcut icon" href="favicon.ico" />
<link href="images/admin/newhead.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.input {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #000000;
	height:21px;
	text-decoration: none;
	font-size: 12px;
	border: 1px solid #80CCFF;
	background-color: #FFFFFF;
}


td img {display: block;}body {
	margin-top: 0px;
	background-image: url(images/bj.jpg);
	background-repeat: repeat-x;
}
    .style2
    {
        width: 6px;
    }
    .style3
    {
        width: 114px;
    }
</style>
</head>
<BODY bgColor=#eef8e0 leftMargin=0 topMargin=0 style="overflow-x:hidden;overflow-y:hidden;text-align: center" >
<form id="Form1" method="post"  runat=server>
<table border="0" cellpadding="0" cellspacing="0" width="974">
  <tr>
   <td><img src="images/spacer.gif" width="529" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="101" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="31" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="53" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="83" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="177" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td colspan="6"><img name="admin_r1_c1" src="images/admin_r1_c1.jpg" width="974" height="252" border="0" id="admin_r1_c1" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="252" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="5"><img name="admin_r2_c1" src="images/admin_r2_c1.jpg" width="529" height="436" border="0" id="admin_r2_c1" alt="" /></td>
   <td rowspan="3"><img name="admin_r2_c2" src="images/admin_r2_c2.jpg" width="101" height="116" border="0" id="admin_r2_c2" alt="" /></td>
   <td colspan="3" background="images/admin_r2_c3.jpg"><asp:TextBox ID="name" runat="server" class="input" ForeColor="#FF8000" Width="140px" Font-Size="Medium" Height="18px"></asp:TextBox></td>
   <td rowspan="4"><img name="admin_r2_c6" src="images/admin_r2_c6.jpg" width="177" height="160" border="0" id="admin_r2_c6" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="39" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="3" background="images/admin_r3_c3.jpg"><asp:TextBox ID="ps" runat="server" class="input" TextMode="Password" ForeColor="#FF8000" Font-Size="Medium" Height="18px" Width="140px"></asp:TextBox></td>
   <td><img src="images/spacer.gif" width="1" height="40" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="2" background="images/admin_r4_c3.jpg"><asp:TextBox ID="vnumber" runat="server" class="input"  ForeColor="#FF8000" 
                        Font-Size="Medium" Height="18px" Width="56px"></asp:TextBox></td>
   <td background="images/admin_r4_c5.jpg"><img src="images.aspx" id="checkcode" name="checkcode" onclick="window.location.reload()"  alt="看不清楚,点击验证码换一个" /></td>
   <td><img src="images/spacer.gif" width="1" height="37" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="2"><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/admin_r5_c2.jpg" OnClick="ImageButton1_Click" /></td>
   <td colspan="2"><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/admin_r5_c4.jpg" OnClick="ImageButton2_Click" /></td>
   <td><img src="images/spacer.gif" width="1" height="44" border="0" alt="" /></td>
  </tr>
    <tr>
   <td colspan="5"><img name="admin_r6_c2" src="images/admin_r6_c2.jpg" width="445" height="276" border="0" id="admin_r6_c2" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="276" border="0" alt="" /></td>
  </tr>   
</table>
</body>
</FORM>
</BODY>
</html>