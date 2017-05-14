<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordManage.aspx.cs" Inherits="PasswordManage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>修改密码</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
  <style type="text/css">
        .StyleTextBox1
        {
            background-color:lemonchiffon;
            color:red;
            font-family:Arial;
            font-size:x-small;
            padding:8px 3px 2px 3px;
        }
    </style>
</HEAD>

<BODY style="overflow-x:hidden;overflow-y:hidden" >

<FORM id="newPwd" runat="server" >
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
<TABLE class=border border=0 cellSpacing=1 cellPadding=2 width="100%">
  <TBODY>
  <TR align="center">
    <TD class=spacingtitle colSpan=2><STRONG>&nbsp; &nbsp; &nbsp;&nbsp; 修改密码</STRONG> </TD></TR>
  <TR class=tdbg>
    <TD style=" height: 24px;" class=tdbgleft align=right width="50%">原 密 码： 
    </TD>
    <TD style="height: 24px">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <SPAN style="COLOR: red">* 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                ErrorMessage="原密码不能为空！"></asp:RequiredFieldValidator></SPAN></TD></TR> 
  <TR class=tdbg>
    <TD class=tdbgleft align=right style="height: 24px;" width="50%">新 密 码： </TD>
    <TD>
         <asp:TextBox ID="TextBox2" runat="server" MaxLength="20"></asp:TextBox>
        <SPAN style="COLOR: red">* 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                ErrorMessage="新密码不能为空！"></asp:RequiredFieldValidator>
             <cc1:PasswordStrength ID="PasswordStrength1" runat="server" HelpStatusLabelID="Label1"
                PreferredPasswordLength="12" PrefixText="密码强度：" TargetControlID="TextBox2" TextCssClass="StyleTextBox1"
                TextStrengthDescriptions="弱;一般;中;强">
            </cc1:PasswordStrength></SPAN></TD></TR>
  <TR class=tdbg>
    <TD class=tdbgleft align=right style=" height: 22px" width="50%">确认密码：</TD>
    <TD style="height: 22px">
        <asp:TextBox ID="TextBox3" onpaste="return false;" runat="server" MaxLength="20"></asp:TextBox>
        <SPAN style="COLOR: red">* 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
            runat="server" ControlToValidate="TextBox3" ErrorMessage="不能为空！"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2"
                ControlToValidate="TextBox3" ErrorMessage="两次输入的密码不一致！"></asp:CompareValidator>
            </SPAN></TD></TR>
  <TR class=tdbgbottom>
    <TD colSpan=2>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
     <asp:ImageButton ID="btnChange" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/xiugai.jpg"  
        Width="88px" OnClick="btnChange_Click"  />
      
    </TD></TR>
    </TBODY>
    </TABLE>
    <BR>
</FORM>
</BODY>
</HTML>
