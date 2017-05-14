<%@ Page Language="C#" AutoEventWireup="true" CodeFile="book.aspx.cs" Inherits="book" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>留言列表</title>
<LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script type="text/javascript" src="js/lhgcore.js"></script>
<script type="text/javascript" src="js/lhgdialog.js"></script>
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
      >>> 留言簿
    </TD>
    </TR>
      
  <TR class=title align =center>
  <TD style="width: 5%">序号</TD>
    <TD style="width: 65%">主题</TD>
    <TD style="width: 10%">发帖人</TD>
    <TD style="width: 10%">发帖日期</TD>
    <TD style="width: 10%">是否查看</TD>
    </TR>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '详细信息', page: 'bookxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 900, height: 545, nofoot: true, nohead: true,cover: true });">
     <TD><%# Container.ItemIndex + (15 * (Convert.ToInt32(AspNetPager1.CurrentPageIndex) - 1)) + 1%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, "内容")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 发布人")%></TD>
    <TD><%# DateTime.Parse(DataBinder.Eval(Container.DataItem, " 发布日期").ToString()).ToString("D")%></TD>
   <TD><%# ck(DataBinder.Eval(Container.DataItem, "id"))%></TD>
   </ItemTemplate>
</asp:Repeater>
    
<TR class=title align =center style="font-weight: bold">
    <TD colspan="4">
 <webdiyer:aspnetpager style="FONT-SIZE: 14px" id="AspNetPager1" runat="server" horizontalalign="Center" onpagechanged="AspNetPager1_PageChanged" showcustominfosection="Left" width="400px" meta:resourceKey="AspNetPager1" InputBoxStyle="width:19px"  ShowNavigationToolTip="True" CustomInfoTextAlign="Center" ShowInputBox="Always" FirstPageText="【首页】" LastPageText="【尾页】" NextPageText="【下页】 " PageSize="15" PrevPageText="【前页】 "></webdiyer:aspnetpager> </TD>
    </TR>
  </TBODY></TABLE></DIV>
  <asp:ImageButton ID="xj" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/fbxt.jpg"  
        Width="88px" onclick="xj_Click"  />
  <asp:Panel ID="Panel1" runat="server" Visible="False">
 <TABLE class=border border=0 cellSpacing=1 cellPadding=2 width="100%">
  <TBODY>
  <TR class=tdbg>
    <TD class=spacingtitle colSpan=2 align=center>
        发表新帖</TD>
  </TR>
     <TR class=tdbg align =center> 
    <TD>主题内容</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox2" runat="server" Width="564px" Height="105px" 
         Rows="8" TextMode="MultiLine"></asp:TextBox>
        <font color=red>*</font></TD>
   </TR>
 <TR class=title align =center style="font-weight: bold">
    <TD colspan="2"> </TD>
    </TR>
  </TBODY></TABLE><BR>
</DIV>
<div align ="center">
 <asp:ImageButton ID="ImageButton1" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/fabiao.jpg"  
        Width="88px" onclick="bc_Click" />&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton2" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/guanbi.jpg" 
        Width="88px" onclick="gb_Click" />
        </div>
        <BR>
        <BR>
     
            </asp:Panel>
  </div> 
    </form>
</body>
</html>


