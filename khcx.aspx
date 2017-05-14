<%@ Page Language="C#" AutoEventWireup="true" CodeFile="khcx.aspx.cs" Inherits="khcx" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>客户查询</title>
    <LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script type="text/javascript" src="js/lhgcore.js"></script>
<script type="text/javascript" src="js/lhgdialog.js"></script>
</head>
<BODY>
    <form id="form1" runat="server">
    <div style="height: 479px">
    <DIV style="TEXT-ALIGN: center">
<TABLE id=statistics class=border border=0 cellSpacing=1 cellPadding=2 
width="100%" >
  <TBODY>
  <TR class=title align =center>
    <TD colspan="10" style="text-align: left">
      >>> 客户查询
    </TD>
    </TR>
      <TR class=tdbg align =center>
    <TD colspan="10" style="text-align: left">
        <table>
        <tr>
        <td>客户编号</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" Width="95px"></asp:TextBox></td>
            <td>期望区域</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" Width="182px"></asp:TextBox></td>
            <td>期望面积</td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" Width="45px"></asp:TextBox></td>
             <td>期望楼层</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server" Width="43px"></asp:TextBox></td>
         <td>期望价格</td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" Width="47px"></asp:TextBox></td>
        <td>租售形式</td>
        <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>不限</asp:ListItem>
            <asp:ListItem>求租</asp:ListItem>
            <asp:ListItem>求购</asp:ListItem>
        </asp:DropDownList></td>
        <td><asp:ImageButton ID="cx" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/chazhao.jpg"  
        Width="88px" onclick="cx_Click"  />  </td>
        
        </tr>
        </table>
     </TD>
    </TR>
  <TR class=title align =center>
    <TD style="width: 5%">序号</TD>
  <TD style="width: 5%">客户编号</TD>
    <TD style="width: 16%">期望区域</TD>
    <TD style="width: 13%">期望户型</TD>
    <TD style="width: 8%">期望面积</TD>
    <TD style="width: 8%">期望楼层</TD>
    <TD style="width: 8%">期望价格</TD>
    <TD style="width: 8%">租售形式</TD>
    <TD style="width: 14%">登记日期</TD>
    </TR>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '客户信息', page: 'khxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 700, height: 245, nofoot: true, nohead: true,cover: true });">
    <TD><%# Container.ItemIndex + (100 * (Convert.ToInt32(AspNetPager1.CurrentPageIndex) - 1)) + 1%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 客户编号")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 期望区域")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 期望户型")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 期望面积")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 期望楼层")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 期望价格")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 租售形式")%></TD>
     <TD><%# DataBinder.Eval(Container.DataItem, " 登记日期")%></TD>
   </TR>
   </ItemTemplate>
</asp:Repeater>
    
<TR class=title align =center style="font-weight: bold">
    <TD colspan="10">
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
