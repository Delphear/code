<%@ Page Language="C#" AutoEventWireup="true" CodeFile="nbtzgl.aspx.cs" Inherits="nbtzgl" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>内部通知管理</title>
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
    <TD colspan="9" style="text-align: left">
      >>> 内部通知管理
    </TD>
    </TR>
      
  <TR class=title align =center>
  <TD style="width: 5%">序号</TD>
    <TD style="width: 50%">标题</TD>
    <TD style="width: 9%">发布人</TD>
    <TD style="width: 14%">发布时间</TD>
    <TD style="width: 6%">修改</TD>
    <TD style="width: 6%">删除</TD>
    </TR>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'">
     <TD><%# Container.ItemIndex + (5 * (Convert.ToInt32(AspNetPager1.CurrentPageIndex) - 1)) + 1%></TD>
    <TD><a href ="#" onclick=" J.dialog.get({ id: 'sblb', title: '内部通知', page: 'tzck.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 700, height: 245, nofoot: true, nohead: true,cover: true });"><%# DataBinder.Eval(Container.DataItem, " 标题")%></a></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 发布人")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 发布时间")%></TD>
    <TD><asp:LinkButton ID="Btnbj" runat="server" CommandName='<%# DataBinder.Eval(Container.DataItem," ID ") %>' OnCommand="Btnbj_Click" Font-Underline="False" ForeColor="green" >【修改】</asp:LinkButton></TD>
    <TD><asp:LinkButton ID="BtnDel" runat="server" CommandName='<%# DataBinder.Eval(Container.DataItem," ID ") %>' OnCommand="BtnDel_Click" OnClientClick="return confirm('您确定要删除该用户吗?');" Font-Underline="False" ForeColor="red" >【删除】</asp:LinkButton></TD>
  </ItemTemplate>
</asp:Repeater>
    
<TR class=title align =center style="font-weight: bold">
    <TD colspan="6">
 <webdiyer:aspnetpager style="FONT-SIZE: 14px" id="AspNetPager1" runat="server" horizontalalign="Center" onpagechanged="AspNetPager1_PageChanged" showcustominfosection="Left" width="400px" meta:resourceKey="AspNetPager1" InputBoxStyle="width:19px"  ShowNavigationToolTip="True" CustomInfoTextAlign="Center" ShowInputBox="Always" FirstPageText="【首页】" LastPageText="【尾页】" NextPageText="【下页】 " PageSize="5" PrevPageText="【前页】 "></webdiyer:aspnetpager> </TD>
    </TR>
  </TBODY></TABLE></DIV>
  <asp:ImageButton ID="xj" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/xinjian.jpg"  
        Width="88px" onclick="xj_Click"  />
  <asp:Literal ID="Literal2" runat="server" 
            Visible="False"></asp:Literal>
 &nbsp;
 <asp:Panel ID="Panel1" runat="server" Visible="False">
 <TABLE class=border border=0 cellSpacing=1 cellPadding=2 width="100%">
  <TBODY>
  <TR class=tdbg>
    <TD class=spacingtitle colSpan=2 align=center>
        <asp:Literal ID="Literal1" runat="server"></asp:Literal></TD>
  </TR>
<TR class=tdbg align =center> 
    <TD>标题</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox1" runat="server" Width="560px"></asp:TextBox>
        <font color=red>*</font></TD>
   </TR>
     <TR class=tdbg align =center> 
    <TD>内容</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox2" runat="server" Width="564px" Height="105px" 
         Rows="8" TextMode="MultiLine"></asp:TextBox>
        <font color="red">*</font></TD>
   </TR>
 <TR class=title align =center style="font-weight: bold">
    <TD colspan="2"> </TD>
    </TR>
  </TBODY></TABLE><BR>
</DIV>
<div align ="center">
 <asp:ImageButton ID="ImageButton1" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/baocun.jpg"  
        Width="88px" onclick="bc_Click" />&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton2" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/guanbi.jpg" 
        Width="88px" onclick="gb_Click" />
        </div>
        <BR>
        <BR>
     
            </asp:Panel>
<BR>
</form>
</body>
</html>
