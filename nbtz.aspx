<%@ Page Language="C#" AutoEventWireup="true" CodeFile="nbtz.aspx.cs" Inherits="nbtz" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>内部通知</title>
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
      >>> 内部通知
    </TD>
    </TR>
      
  <TR class=title align =center>
  <TD style="width: 5%">序号</TD>
    <TD style="width: 65%">标题</TD>
    <TD style="width: 10%">发布人</TD>
    <TD style="width: 10%">发布时间</TD>
    <TD style="width: 10%">是否查看</TD>

    </TR>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '内部通知', page: 'tzck.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 700, height: 245, nofoot: true, nohead: true,cover: true });">
     <TD><%# Container.ItemIndex + (15 * (Convert.ToInt32(AspNetPager1.CurrentPageIndex) - 1)) + 1%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 标题")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 发布人")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 发布时间")%></TD>
    <TD><%# ck(DataBinder.Eval(Container.DataItem, "id"))%></TD>
   </ItemTemplate>
</asp:Repeater>
    
<TR class=title align =center style="font-weight: bold">
    <TD colspan="5">
 <webdiyer:aspnetpager style="FONT-SIZE: 14px" id="AspNetPager1" runat="server" horizontalalign="Center" onpagechanged="AspNetPager1_PageChanged" showcustominfosection="Left" width="400px" meta:resourceKey="AspNetPager1" InputBoxStyle="width:19px"  ShowNavigationToolTip="True" CustomInfoTextAlign="Center" ShowInputBox="Always" FirstPageText="【首页】" LastPageText="【尾页】" NextPageText="【下页】 " PageSize="15" PrevPageText="【前页】 "></webdiyer:aspnetpager> </TD>
    </TR>
  </TBODY></TABLE></DIV>
  <br />
        <br />
        <br />
  </div> 
    </form>
</body>
</html>

