<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tdcy.aspx.cs" Inherits="tdcy" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>团队成员</title>
 <LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script type="text/javascript" src="js/lhgcore.js"></script>
<script type="text/javascript" src="js/lhgdialog.js"></script>
<script language="javascript" type="text/javascript" src="js/datetime.js"></script> 

</head>
<BODY style="overflow-x:hidden;overflow-y:hidden">
    <form id="form1" runat="server">
    <div style="height: 479px">
    <DIV style="TEXT-ALIGN: center">
<TABLE id=statistics class=border border=0 cellSpacing=1 cellPadding=2 
width="100%" >
  <TBODY>
  <TR class=title align =center>
    <TD colspan="9" style="text-align: left">
      >>> 团队成员
    </TD>
    </TR>
        <TR class=tdbg align =center>
    <TD colspan="9" style="text-align: left">
        <table>
        <tr>
       
        <td>姓名</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" Width="131px"></asp:TextBox></td>
          <td>部门</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" Width="277px"></asp:TextBox></td>
        <td><asp:ImageButton ID="cx" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/chazhao.jpg"  
        Width="88px" onclick="cx_Click"  />  </td>
        
        </tr>
        </table>
     </TD>
    </TR>    
  <TR class=title align =center>
  <TD style="width: 5%">序号</TD>
    <TD style="width: 10%">部门</TD>
    <TD style="width: 10%">姓名</TD>
    <TD style="width: 5%">性别</TD>
    <TD style="width: 13%">岗位</TD>
    <TD style="width: 10%">固定电话</TD>
    <TD style="width: 10%">移动电话</TD>
    <TD style="width: 10%">QQ</TD>
    <TD style="width: 27%">备注</TD>
    </TR>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'">
     <TD><%# Container.ItemIndex + (20 * (Convert.ToInt32(AspNetPager1.CurrentPageIndex) - 1)) + 1%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 部门")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " name")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 性别")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 岗位")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 固定电话")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 移动电话")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " qq")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 备注")%></TD>
   </ItemTemplate>
</asp:Repeater>
    
<TR class=title align =center style="font-weight: bold">
    <TD colspan="9">
 <webdiyer:aspnetpager style="FONT-SIZE: 14px" id="AspNetPager1" runat="server" horizontalalign="Center" onpagechanged="AspNetPager1_PageChanged" showcustominfosection="Left" width="400px" meta:resourceKey="AspNetPager1" InputBoxStyle="width:19px"  ShowNavigationToolTip="True" CustomInfoTextAlign="Center" ShowInputBox="Always" FirstPageText="【首页】" LastPageText="【尾页】" NextPageText="【下页】 " PageSize="20" PrevPageText="【前页】 "></webdiyer:aspnetpager> </TD>
    </TR>
  </TBODY></TABLE></DIV>
  <br />
        <br />
        <br />
  </div> 
    </form>
</body>
</html>

