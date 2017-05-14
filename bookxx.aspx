<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookxx.aspx.cs" Inherits="bookxx" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>留言详细信息</title>
<LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script type="text/javascript">
var P = window.parent, D = P.loadinndlg();   // 注意！这行代码是每个内容页必须加的内容，否则无法正确显示。
</script>
 <style type="text/css">
        .style2
        {
         height: 14px;
         width: 50px;
          background-color
     }
        .style3
        {
            height: 7px;
            color: #000099;
         text-align: right;
     }
     .style4
     {
         height: 15px;
         }
     </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: right">
    <TABLE class=border border=0 cellSpacing=1 cellPadding=2 width="100%">
  <TBODY>
  <TR class=tdbg>
    <TD class=spacingtitle colSpan=2 align=center>
     留言详细信息</TD>
  </TR>
 
  <TR class=tdbg align =center> 
    <TD style="width: 10%">主题内容</TD>
    <TD align =left style="width: 90%;  background-color:#b0d0f3;">
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </TD>
   </TR>
     <TR class=tdbg align =center> 
    <TD class="style3" colspan="2" >
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
         </TD>
   </TR>
  </TBODY></TABLE>
  <div align ="center">
</div>
    </div>
    <asp:Panel ID="Panel1" runat="server" style="text-align: center" Visible="False">
     <table id="TABLE1" border="0" cellpadding="2" cellspacing="1" 
         class="border" width="100%" style=" table-layout:fixed; word-break:break-all">
  <tbody>
  <tr align="center" class="title">
    <td style="width: 80%">跟帖内容</td>
    <td style="width: 8%">跟帖人</td>
    <td style="width: 12%">跟帖时间</td>
    </tr>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <tr align="center" class="tdbg">
    <td><%# DataBinder.Eval(Container.DataItem, "内容")%></td>
    <td><%# DataBinder.Eval(Container.DataItem, "发布人")%></td>
    <td><%# DataBinder.Eval(Container.DataItem, "发布日期")%></td>
   </tr>
    </ItemTemplate>
    
      </asp:Repeater>
    
<tr align="center" class="title" style="font-weight: bold">
    <td colspan="3">
 <webdiyer:AspNetPager ID="AspNetPager1" runat="server" CustomInfoTextAlign="Center" 
         FirstPageText="【首页】" horizontalalign="Center" InputBoxStyle="width:19px" 
         LastPageText="【尾页】" meta:resourceKey="AspNetPager1" NextPageText="【下页】 " 
         onpagechanged="AspNetPager1_PageChanged" PageSize="5" PrevPageText="【前页】 " 
         showcustominfosection="Left" ShowInputBox="Always" ShowNavigationToolTip="True" 
         style="FONT-SIZE: 14px" width="400px"></webdiyer:AspNetPager> </td>
    </tr>
  </tbody></table>
   <TABLE class=border border=0 cellSpacing=1 cellPadding=2 width="100%">
  <TBODY>
  <TR class=tdbg>
    <TD class=spacingtitle colSpan=2 align=center>
        &#160;</TD>
  </TR>
     <TR class=tdbg align =center> 
    <TD>内容</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox1" runat="server" Width="564px" Height="74px" 
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
                 ImageUrl="~/images/btn/tijiao.jpg"  
        Width="88px" onclick="bc_Click" />&nbsp;&nbsp;
  </div>
        <BR>
        </asp:Panel>
    </form>
</body>
</html>

