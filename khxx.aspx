﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="khxx.aspx.cs" Inherits="khxx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>客户信息</title>
<LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script type="text/javascript">
var P = window.parent, D = P.loadinndlg();   // 注意！这行代码是每个内容页必须加的内容，否则无法正确显示。
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <TABLE class=border border=0 cellSpacing=1 cellPadding=2 width="100%">
  <TBODY>
  <TR class=tdbg>
    <TD class=spacingtitle colSpan=6 align=center>
     客户信息查看</TD>
  </TR>
  <TR class=tdbg align =center> 
    <TD  align =left class="style1" >客户编号</TD>
    <TD align =left class="style2" colspan="2">
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
      </TD>
    <TD  align =left class="style1" >
        登记日期</TD>
    <TD align =left class="style2" colspan="2">
        <asp:Literal ID="Literal12" runat="server"></asp:Literal>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD  align =left class="style1" >期望区域</TD>
    <TD align =left class="style2" colspan="2">
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
      </TD>
    <TD  align =left class="style1" >
        期望户型</TD>
    <TD align =left class="style2" colspan="2">
        <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD  align =left class="style1" >期望面积</TD>
    <TD align =left class="style2" colspan="2">
        <asp:Literal ID="Literal4" runat="server"></asp:Literal>
        平方米</TD>
    <TD  align =left class="style1" >
        期望楼层</TD>
    <TD align =left class="style2" colspan="2">
        <asp:Literal ID="Literal5" runat="server"></asp:Literal>层
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD  align =left class="style1" >期望价格</TD>
    <TD align =left class="style2" colspan="2">
        <asp:Literal ID="Literal6" runat="server"></asp:Literal>
        元</TD>
    <TD  align =left class="style1">
        租售形式</TD>
    <TD align =left class="style2" colspan="2">
        <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                        </TD>
   </TR>
    
      
    
      <TR class=tdbg align =center> 
    <TD  align =left class="style1">备注</TD>
    <td align="left" class="style2" colspan="5">
        <asp:Literal ID="Literal8" runat="server"></asp:Literal>
                        </td>
   </TR>
    
<%--       <tr align="center" class="tdbg"> 
    <td  align =left class="style1" colspan="6"> 
    <asp:ImageButton ID="gb" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/guanbi.jpg" 
        Width="88px" onclick="gb_Click" /></td>
   </tr>--%>   
      
      
    
      <TR class=tdbg align =center> 
    <TD  align =left class="style1">提供人</TD>
    <td align="left" class="style2">
        <asp:Literal ID="Literal9" runat="server"></asp:Literal>
          </td>
    <td align="left" class="style2">
        提供人联系方式</td>
    <td align="left" class="style2">
        <asp:Literal ID="Literal13" runat="server"></asp:Literal>
          </td>
    <td align="left" class="style2">
        提供人部门</td>
    <td align="left" class="style2">
        <asp:Literal ID="Literal11" runat="server"></asp:Literal>
        <asp:Literal ID="Literal10" runat="server"></asp:Literal>
          </td>
   </TR>
    
  </TBODY></TABLE>
    </div>
    </form>
</body>
</html>
