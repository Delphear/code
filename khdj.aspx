<%@ Page Language="C#" AutoEventWireup="true" CodeFile="khdj.aspx.cs" Inherits="khdj" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>客户登记</title>
<LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">

    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 91px;
        }
        .style3
        {
            width: 71px;
        }
        .style4
        {
            width: 91px;
            height: 34px;
        }
        .style5
        {
            height: 34px;
        }
        
    </style>
</head>
<BODY style="overflow-x:hidden;overflow-y:hidden">
<form id="form1" runat="server">
<DIV style="text-align: center"> 
<DIV style="TEXT-ALIGN: center">
<TABLE id=statistics class=border border=0 cellSpacing=1 cellPadding=2 
width="100%">
  <TBODY>
  <TR class=title align =center>
    <TD colspan="4" style="text-align: left">
      >>> 客户登记
    </TD>
    </TR>

  <TR class=tdbg align =center> 
    <TD class="style4">客户名称</TD>
    <TD align =left class="style5">
        <asp:TextBox ID="TextBox1" runat="server" Width="153px" MaxLength="10" ></asp:TextBox><font color=red>*</TD>
    <TD align =left class="style5">
        联系电话</TD>
    <TD align =left class="style5">
       <asp:TextBox ID="TextBox2" runat="server" Width="153px" MaxLength="24" ></asp:TextBox></TD>
   </TR>

  <TR class=tdbg align =center> 
    <TD class="style2">期望区域</TD>
    <TD align =left class="style1" colspan="3">
        <asp:TextBox ID="TextBox3" runat="server" Width="513px" MaxLength="98" ></asp:TextBox></TD>
   </TR>

  <TR class=tdbg align =center> 
    <TD class="style2">期望户型</TD>
    <TD align =left class="style1">
        <asp:CheckBox ID="CheckBox1" runat="server" Text="不限" AutoPostBack="True" 
            oncheckedchanged="CheckBox1_CheckedChanged" />     
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
             <asp:ListItem Selected="True">2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
        </asp:DropDownList>
        间
                        <asp:DropDownList ID="DropDownList2" runat="server">
                                    <asp:ListItem>0</asp:ListItem>
            <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
        </asp:DropDownList>
        厅
        <asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem>0</asp:ListItem>
              <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
        </asp:DropDownList>
        厨
        <asp:DropDownList ID="DropDownList4" runat="server">
                    <asp:ListItem>0</asp:ListItem>
              <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
        </asp:DropDownList>
        卫
        <asp:DropDownList ID="DropDownList5" runat="server">
                    <asp:ListItem>0</asp:ListItem>
             <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
        </asp:DropDownList>
        阳台
                        </TD>
    <TD class="style3">期望面积</TD>
    <TD align =left>
        <asp:TextBox ID="TextBox4" runat="server" Width="64px" MaxLength="18" ></asp:TextBox>
        平方米</TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >期望楼层</TD>
    <TD align =left class="style1">
        <asp:TextBox ID="TextBox7" runat="server" Width="66px" MaxLength="18" ></asp:TextBox>
                        层</TD>
    <TD class="style3">期望价格</TD>
    <TD align =left>
       <asp:TextBox ID="TextBox5" runat="server" Width="66px" MaxLength="18" ></asp:TextBox>元</TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >租售形式</TD>
    <TD align =left class="style1">
        <asp:DropDownList ID="DropDownList7" runat="server">
            <asp:ListItem>求租</asp:ListItem>
            <asp:ListItem>求购</asp:ListItem>
        </asp:DropDownList>
                        </TD>
    <TD class="style3">&nbsp;</TD>
    <TD align =left>
        &nbsp;</TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >备注</TD>
    <TD align =left colspan="3">
        <asp:TextBox ID="TextBox6" runat="server" Width="679px" MaxLength="500"></asp:TextBox>
                        </TD>
   </TR>
   
<TR class=title align =center style="font-weight: bold">
    <TD colspan="4" > 
        <asp:Literal ID="Literal1" runat="server" Visible="False"></asp:Literal>
        <asp:Literal ID="Literal2" runat="server" Visible="False"></asp:Literal>
        <asp:Literal ID="Literal3" runat="server" Visible="False"></asp:Literal>
        <asp:Literal ID="Literal4" runat="server" Visible="False"></asp:Literal>
    </TD>
    </TR>
  </TBODY></TABLE></DIV>
<br />
 <asp:ImageButton ID="bc" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/fabu.jpg"  
        Width="88px" onclick="bc_Click" />&nbsp;&nbsp;
    <asp:ImageButton ID="gb" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/chongzhi.jpg" 
        Width="88px" onclick="gb_Click" />

</form>
</BODY>
</HTML>
