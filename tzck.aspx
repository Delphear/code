<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tzck.aspx.cs" Inherits="tzck" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>通知查看</title>
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
    <TD class=spacingtitle colSpan=2 align=center>
      内部通知</TD>
  </TR>
<TR class=tdbg align =center> 
    <TD class="style1">标题</TD>
    <TD align =left>
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style1" >内容</TD>
    <TD align =left class="style2">
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
      </TD>
   </TR>
       <tr align="center" class="tdbg"> 
    <td class="style1" colspan="2"> 
    </td>
   </tr>   
  </TBODY></TABLE>
    </div>
    </form>
</body>
</html>

