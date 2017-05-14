<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wdkh.aspx.cs" Inherits="wdkh" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>我的客户</title>
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
    <TD colspan="11" style="text-align: left">
      >>> 我的客户
    </TD>
    </TR>
      <TR class=tdbg align =center>
    <TD colspan="11" style="text-align: left">
        <table>
        <tr>
        <td>客户名称</td>
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
  <TD >序号</TD>
    <TD >客户编号</TD>
    <TD >客户名称</TD>
    <TD >联系电话</TD>
   <TD >期望区域</TD>
    <TD >期望户型</TD>
    <TD >期望面积</TD>
    <TD >期望楼层</TD>
    <TD >期望价格</TD>
    <TD >租售形式</TD>
    <TD >删除</TD>
    </TR>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" >
    <TD><%# Container.ItemIndex + (100 * (Convert.ToInt32(AspNetPager1.CurrentPageIndex) - 1)) + 1%></TD>
    <TD><a href ="#" onclick=" J.dialog.get({ id: 'sblb', title: '客户信息', page: 'Wkhxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 700, height: 245, nofoot: true, nohead: true,cover: true });"><%# DataBinder.Eval(Container.DataItem, " 客户编号")%></a></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 客户名称")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 联系电话")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 期望区域")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 期望户型")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 期望面积")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 期望楼层")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 期望价格")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 租售形式")%></TD>
    <TD><asp:LinkButton ID="BtnDel" runat="server" CommandName='<%# DataBinder.Eval(Container.DataItem," ID ") %>' OnCommand="BtnDel_Click" OnClientClick="return confirm('您确定要删除该客户吗?');" Font-Underline="False" ForeColor="red" >【删除】</asp:LinkButton></TD>
   </TR>
   </ItemTemplate>
</asp:Repeater>
    
<TR class=title align =center style="font-weight: bold">
    <TD colspan="11">
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
