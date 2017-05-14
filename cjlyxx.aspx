<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cjlyxx.aspx.cs" Inherits="cjlyxx" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>成交留言详细信息</title>
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
         width: 92px;
     }
        .style3
        {
            height: 7px;
            color: #000099;
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
     房源编号<asp:Literal ID="Literal12" runat="server"></asp:Literal>成交信息</TD>
  </TR>

 
  <TR class=tdbg align =center> 
    <TD class="style2" >签约人：</TD>
    <TD align =left class="style4">
        <asp:Literal ID="Literal13" runat="server"></asp:Literal>        
                        </TD>
   </TR>

 
  <TR class=tdbg align =center> 
    <TD class="style2" >成交形式：</TD>
    <TD align =left class="style4">
        <asp:Literal ID="Literal14" runat="server"></asp:Literal>
                        </TD>
   </TR>

 
  <TR class=tdbg align =center> 
    <TD class="style2" >费用：</TD>
    <TD align =left class="style4">
        <asp:Literal ID="Literal15" runat="server"></asp:Literal>
                        </TD>
   </TR>

 
  <TR class=tdbg align =center> 
    <TD class="style2" >签约时间：</TD>
    <TD align =left class="style4">
        <asp:Literal ID="Literal16" runat="server"></asp:Literal>
                        </TD>
   </TR>

 
  <TR class=tdbg align =center> 
    <TD class="style2" >成交房屋地址：</TD>
    <TD align =left class="style4">
        <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                        </TD>
   </TR>

 
  <TR class=tdbg align =center> 
    <TD class="style2" >说明：</TD>
    <TD align =left class="style4">
        <asp:Literal ID="Literal17" runat="server"></asp:Literal>
                        </TD>
   </TR>

 
  <TR class=tdbg align =center> 
    <TD class="style2" >房源提供人：</TD>
    <TD align =left class="style4">
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        &nbsp;&nbsp;&nbsp;&nbsp;联系方式：<asp:Literal ID="Literal6" runat="server"></asp:Literal>
        &nbsp;&nbsp;&nbsp;&nbsp;部门：<asp:Literal ID="Literal3" runat="server"></asp:Literal>&nbsp;&nbsp;&nbsp;
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                        </TD>
   </TR>
     <TR class=tdbg align =center> 
    <TD class="style3" colspan="2" >
        &nbsp;</TD>
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
    <td style="width: 80%">评价内容</td>
    <td style="width: 8%">评价人</td>
    <td style="width: 12%">评价时间</td>
    </tr>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <tr align="center" class="tdbg">
    <td><%# DataBinder.Eval(Container.DataItem, "评价内容")%></td>
    <td><%# DataBinder.Eval(Container.DataItem, "评价人")%></td>
    <td><%# DataBinder.Eval(Container.DataItem, "评价时间")%></td>
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
    <TD>评价内容</TD>
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
                 ImageUrl="~/images/btn/fbpj.jpg"  
        Width="88px" onclick="bc_Click" />&nbsp;&nbsp;
  </div>
        <BR>
        </asp:Panel>
    </form>
</body>
</html>

