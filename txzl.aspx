<%@ Page Language="C#" AutoEventWireup="true" CodeFile="txzl.aspx.cs" Inherits="txzl" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>通讯录</title>
 <LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script type="text/javascript" src="js/lhgcore.js"></script>
<script type="text/javascript" src="js/lhgdialog.js"></script>
<script language="javascript" type="text/javascript" src="js/datetime.js"></script> 

</head>
<BODY>
    <form id="form1" runat="server">
    <div style="height: 479px">
    <DIV style="TEXT-ALIGN: center">
<TABLE id=statistics class=border border=0 cellSpacing=1 cellPadding=2 
width="100%" >
  <TBODY>
  <TR class=title align =center>
    <TD colspan="12" style="text-align: left">
      >>> 个人通讯录
    </TD>
    </TR>
     <TR class=tdbg align =center>
    <TD colspan="9" style="text-align: left">
        <table>
        <tr>
       
        <td>姓名</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" Width="131px"></asp:TextBox></td>
          <td>工作单位</td>
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
    <TD style="width: 10%">姓名</TD>
    <TD style="width: 6%">性别</TD>
    <TD style="width: 12%">办公电话</TD>
    <TD style="width: 15%">移动电话</TD>
    <TD style="width: 15%">电子邮件</TD>
    <TD style="width: 19%">工作单位</TD>
     <TD style="width: 8%">修改</TD>
    <TD style="width: 8%">删除</TD>
    </TR>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'">
     <TD><%# Container.ItemIndex + (8 * (Convert.ToInt32(AspNetPager1.CurrentPageIndex) - 1)) + 1%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 姓名")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 性别")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 办公电话")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 移动电话")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 电子邮件")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 工作单位")%></TD>
     <TD><asp:LinkButton ID="Btnbj" runat="server" CommandName='<%# DataBinder.Eval(Container.DataItem," ID ") %>' OnCommand="Btnbj_Click" Font-Underline="False" ForeColor="green" >【修改】</asp:LinkButton></TD>
    <TD><asp:LinkButton ID="BtnDel" runat="server" CommandName='<%# DataBinder.Eval(Container.DataItem," ID ") %>' OnCommand="BtnDel_Click" OnClientClick="return confirm('您确定要删除该条记录吗?');" Font-Underline="False" ForeColor="red" >【删除】</asp:LinkButton></TD>

 </TR>
   </ItemTemplate>
</asp:Repeater>
    
<TR class=title align =center style="font-weight: bold">
    <TD colspan="12">
 <webdiyer:aspnetpager style="FONT-SIZE: 14px" id="AspNetPager1" runat="server" horizontalalign="Center" onpagechanged="AspNetPager1_PageChanged" showcustominfosection="Left" width="400px" meta:resourceKey="AspNetPager1" InputBoxStyle="width:19px"  ShowNavigationToolTip="True" CustomInfoTextAlign="Center" ShowInputBox="Always" FirstPageText="【首页】" LastPageText="【尾页】" NextPageText="【下页】 " PageSize="8" PrevPageText="【前页】 "></webdiyer:aspnetpager> </TD>
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
    <TD class=spacingtitle colSpan=4 align=center>
        <asp:Literal ID="Literal1" runat="server"></asp:Literal></TD>
  </TR>
<TR class=tdbg align =center> 
    <TD>姓名</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox3" runat="server" Width="153px"></asp:TextBox>
        <font color=red>*</font></TD>
    <TD>性别</TD>
    <TD align =left>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Selected>男</asp:ListItem>
                            <asp:ListItem >女</asp:ListItem>
                        </asp:RadioButtonList></TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD >办公电话</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox4" runat="server" Width="153px"></asp:TextBox>
        <font color=red>*</font></TD>
    <TD>移动电话</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox5" runat="server" Width="153px"></asp:TextBox>
        <font color=red>*</font></TD>
   </TR>
      <TR class=tdbg align =center> 
    <TD>电子邮件</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox6" runat="server" Width="153px"></asp:TextBox>
        <font color=red>*</font>
    </TD>
    <TD>工作单位</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox7" runat="server" Width="153px"></asp:TextBox>
        <font color="red">*</font>
    </TD>
   </TR>
     <TR class=tdbg align =center> 
    <TD>备注</TD>
    <td align="left" colspan="3">
        <asp:TextBox ID="TextBox8" runat="server" Height="105px" Rows="8" 
         TextMode="MultiLine" Width="564px"></asp:TextBox></td>
   </TR>
 <tr align="center" class="title" style="font-weight: bold">
    <td colspan="4"> </td>
    </tr>
  </TBODY></TABLE><BR>
</DIV>
 <asp:ImageButton ID="ImageButton1" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/baocun.jpg"  
        Width="88px" onclick="bc_Click" />&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton2" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/guanbi.jpg" 
        Width="88px" onclick="gb_Click" />
        <BR>
        <BR>
        <BR>
        <BR>
            </asp:Panel>
<BR>
</form>
</BODY>
</HTML>

