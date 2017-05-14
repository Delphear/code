<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fycjlr.aspx.cs" Inherits="fycjlr" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>房源成交处理</title>
<LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script language="javascript" type="text/javascript" src="js/datetime.js"></script>
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 91px;
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
        
        .style6
        {
            width: 216px;
        }
        
    </style>
<script type="text/javascript">    
var P = window.parent, D = P.loadinndlg();   // 注意！这行代码是每个内容页必须加的内容，否则无法正确显示。
</script>
  
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
      >>> 成交信息录入
    </TD>
    </TR>

  <TR class=tdbg align =center> 
    <TD class="style4">签约人</TD>
    <TD align =left class="style5" colspan="3">
        <asp:TextBox ID="TextBox1" runat="server" Width="123px" MaxLength="10" 
            ></asp:TextBox><font color=red>*</font>部门：<asp:Literal
            ID="Literal1" runat="server"></asp:Literal> </TD>
   </TR>

  <TR class=tdbg align =center> 
    <TD class="style2">成交形式</TD>
    <TD align =left class="style6">
        <asp:TextBox ID="TextBox2" runat="server" Width="124px" MaxLength="24" 
            Text ="中间业务">中间业务</asp:TextBox><font color=red>*</font></TD>
    <TD align =left class="style1">
                签约日期</TD>
    <TD align =left class="style1">
        <input id="start_time"  runat="server" name="start" onchange="setDayID(this)" onfocus="setday(this)" type="text" /><font color=red>*</font></TD>
   </TR>

  <TR class=tdbg align =center> 
    <TD class="style2">中介费</TD>
    <TD align =left class="style1" colspan="3">
        <asp:TextBox ID="TextBox3" runat="server" Width="121px" MaxLength="18" ></asp:TextBox>
        元</TD>
   </TR>

  <TR class=tdbg align =center> 
    <TD class="style2" >说明</TD>
    <TD align =left class="style1" colspan="3">
        <asp:TextBox ID="TextBox4" runat="server" Height="70px" Rows="8" 
            TextMode="MultiLine" Width="462px"></asp:TextBox>
                        </TD>
   </TR>
   
<TR class=title align =center style="font-weight: bold">
    <TD colspan="4" > </TD>
    </TR>
  </TBODY></TABLE></DIV>
<br />
 <asp:ImageButton ID="bc" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/tijiao.jpg"  
        Width="88px" OnClientClick="return confirm('签约人:' + document.form1.TextBox1.value + '&nbsp;&nbsp;&nbsp;成交形式:' + document.form1.TextBox2.value + '&nbsp;&nbsp;&nbsp;签约日期:' + document.form1.start_time.value + '&nbsp;&nbsp;&nbsp;中介费:' + document.form1.TextBox3.value + '&nbsp;&nbsp;&nbsp;说明:' + document.form1.TextBox4.value + ';&nbsp;&nbsp;&nbsp;您确定要成交此房源吗?');" onclick="bc_Click" />&nbsp;&nbsp;
    <asp:ImageButton ID="gb" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/chongzhi.jpg" 
        Width="88px" onclick="gb_Click" />

</form>
</BODY>
</HTML>
