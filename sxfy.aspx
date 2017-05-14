<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sxfy.aspx.cs" Inherits="sxfy" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>失效房源</title>
 <LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script type="text/javascript" src="js/lhgcore.js"></script>
<script type="text/javascript" src="js/lhgdialog.js"></script>
<script language="javascript" type="text/javascript" src="js/datetime.js"></script> 
<script  type="text/javascript">
function isnum()
{
if((event.keyCode<45 || event.keyCode>57) && event.keyCode!=189)
{
event.keyCode=0;
}
}
function isnum1()
{
if((event.keyCode<45 || event.keyCode>57) && event.keyCode!=189)
{
event.keyCode=0;
}
}
</script>
</head>
<BODY>
    <form id="form1" runat="server">
    <div style="height: 479px">
    <DIV style="TEXT-ALIGN: center">
<TABLE id=statistics class=border border=0 cellSpacing=1 cellPadding=2 
width="100%" >
  <TBODY>
  <TR class=title align =center>
    <TD colspan="10"style="text-align: left">
      >>> 失效房源
    </TD>
    </TR>
      <TR class=tdbg align =center>
    <TD colspan="10"style="text-align: left">
        <table>
        <tr>
        <td>编号</td>
        <td>
            <asp:TextBox ID="fybh" runat="server" Width="52px"></asp:TextBox></td>
        <td>区域</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" Width="51px"></asp:TextBox></td>
        <td>街道</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" Width="48px"></asp:TextBox></td>
            <td>小区</td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" Width="57px"></asp:TextBox></td>
            <td>户型</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server" Width="53px"></asp:TextBox></td>
            <td>面积</td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" Width="43px" onpaste="return false" onkeypress="isnum()"></asp:TextBox></td>
            <td>楼层</td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server" Width="33px" onpaste="return false" onkeypress="isnum1()"></asp:TextBox></td>
            <td>价格</td>
        <td>
            <asp:TextBox ID="TextBox7" runat="server" Width="67px" onpaste="return false" onkeypress="isnum1()"></asp:TextBox></td>
            
         <td>租售形式</td>
        <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>不限</asp:ListItem>
            <asp:ListItem>租</asp:ListItem>
            <asp:ListItem>售</asp:ListItem>
        </asp:DropDownList></td>
            <td>附加</td>
        <td>
            <asp:TextBox ID="fujia" runat="server" Width="81px"></asp:TextBox></td>
        <td><asp:ImageButton ID="cx" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/chazhao.jpg"  
        Width="88px" onclick="cx_Click"  />  </td>
        
        </tr>
        </table>
     </TD>
    </TR>
   <TR class=title align =center>
    <TD>序号</TD>
 <TD>房源编号</TD>
    <TD>区域/街道</TD>
    <TD>小区</TD>
    <TD>户型</TD>
   <TD>建筑面积</TD>
   <TD>楼层情况</TD>
    <TD>价格</TD>
    <TD>失效时间</TD>
    <TD>售租形式</TD>    
    </TR>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '房源详细信息', page: 'fyxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 900, height: 545, nofoot: true, nohead: true,cover: true });">
       <TD><%# Container.ItemIndex + (100 * (Convert.ToInt32(AspNetPager1.CurrentPageIndex) - 1)) + 1%></TD>

    <TD><%# DataBinder.Eval(Container.DataItem, " 编号")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 辖区")%>/<%# DataBinder.Eval(Container.DataItem, " 街道")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 小区")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 房屋户型")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 建筑面积")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 楼层情况")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 房主报价")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 失效时间")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 售租形式")%></TD>
    
   </TR>
   </ItemTemplate>
</asp:Repeater>
    
<TR class=title align =center style="font-weight: bold">
    <TD colspan="9">
 <webdiyer:aspnetpager style="FONT-SIZE: 14px" id="AspNetPager1" runat="server" horizontalalign="Center" onpagechanged="AspNetPager1_PageChanged" showcustominfosection="Left" width="400px" meta:resourceKey="AspNetPager1" InputBoxStyle="width:19px"  ShowNavigationToolTip="True" CustomInfoTextAlign="Center" ShowInputBox="Always" FirstPageText="【首页】" LastPageText="【尾页】" NextPageText="【下页】 " PageSize="100" PrevPageText="【前页】 "></webdiyer:aspnetpager> </TD>
    </TR>
  </TBODY></TABLE></DIV>
  <br />
        <br />
        <br />
  </div> 
    </form>
</body>
</html>

