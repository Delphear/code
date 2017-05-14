<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yhgl.aspx.cs" Inherits="yhgl" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>用户管理</title>
<LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script  type="text/javascript">

function isnum1()
{
if(event.keyCode<48||event.keyCode>57)
{
event.keyCode=0;
}
}
</script>
</head>
<BODY style="overflow-x:hidden;overflow-y:hidden">
<form id="form1" runat="server">
<DIV> 
<DIV style="TEXT-ALIGN: center">
<TABLE id=statistics class=border border=0 cellSpacing=1 cellPadding=2 
width="100%">
  <TBODY>
  <TR class=title align =center>
    <TD colspan="12" style="text-align: left">
      >>> 用户管理
    </TD>
    </TR>
  <TR class=title align =center>
    <TD style="width: 5%">序号</TD>
    <TD style="width: 8%">用户姓名</TD>
    <TD style="width: 5%">性别</TD>
    <TD style="width: 8%">登陆名</TD>
    <TD style="width: 10%">登陆密码</TD>
    <TD style="width: 10%">部门</TD>
    <TD style="width: 10%">岗位</TD>
    <TD style="width: 8%">固定电话</TD>
    <TD style="width: 8%">移动电话</TD>
    <TD style="width: 8%">QQ</TD>
    <TD style="width: 7%">修改</TD>
    <TD style="width: 7%">删除</TD>
    </TR>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'">
   <TD align=middle><%# Container.ItemIndex + (8 * (Convert.ToInt32(AspNetPager1.CurrentPageIndex) - 1)) + 1%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " name")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 性别")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " username")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " password")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 部门")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 岗位")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 固定电话")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 移动电话")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " qq")%></TD>
    <TD><asp:LinkButton ID="Btnbj" runat="server" CommandName='<%# DataBinder.Eval(Container.DataItem," ID ") %>' OnCommand="Btnbj_Click" Font-Underline="False" ForeColor="green" >【修改】</asp:LinkButton></TD>
    <TD><asp:LinkButton ID="BtnDel" runat="server" CommandName='<%# DataBinder.Eval(Container.DataItem," ID ") %>' OnCommand="BtnDel_Click" OnClientClick="return confirm('您确定要删除该用户吗?');" Font-Underline="False" ForeColor="red" ><%# delShow(DataBinder.Eval(Container.DataItem, "username"))%></asp:LinkButton></TD>

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
    <TD>用户姓名</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox1" runat="server" Width="153px"></asp:TextBox>
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
    <TD >登陆名</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox2" runat="server" Width="153px"></asp:TextBox>
        <font color=red>*</font></TD>
    <TD>登陆密码</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox3" runat="server" Width="153px"></asp:TextBox>
        <font color=red>*</font></TD>
   </TR>
      <TR class=tdbg align =center> 
    <TD>部门</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox4" runat="server" Width="153px"></asp:TextBox>
        <font color=red>*</font>
    </TD>
    <TD>岗位</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox5" runat="server" Width="153px"></asp:TextBox>
        <font color="red">*</font>
    </TD>
   </TR>
      <TR class=tdbg align =center> 
    <TD>固定电话</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox6" runat="server" Width="153px"></asp:TextBox>
    </TD>
    <td>移动电话</td>
    <td align="left">
        <asp:TextBox ID="TextBox7" runat="server" Width="153px"></asp:TextBox>
    </td>
   </TR>
      <tr align="center" class="tdbg"> 
    <td>权限</td>
    <td align="left">
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>部门管理员</asp:ListItem>
            <asp:ListItem>总管理员</asp:ListItem>
        </asp:DropDownList>
    </td>
    <td>QQ</td>
    <td align="left">
        <asp:TextBox ID="TextBox9" runat="server" Width="151px" MaxLength="16" onpaste="return false" onkeypress="isnum1()"></asp:TextBox>
          </td>
   </tr>
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
<div align ="center">
 <asp:ImageButton ID="ImageButton1" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/baocun.jpg"  
        Width="88px" onclick="bc_Click" />&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton2" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/guanbi.jpg" 
        Width="88px" onclick="gb_Click" /></div>
        <BR>
        <BR>
        
        </asp:Panel>
<BR>
</form>
</BODY>
</HTML>
