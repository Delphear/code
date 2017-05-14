<%@ Page Language="C#" validateRequest="false"  EnableEventValidation="false" AutoEventWireup="true" CodeFile="jcsjgl.aspx.cs" Inherits="jcsjgl" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>基础数据管理</title>
    <LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
 
</head>
<BODY style="overflow-x:hidden;overflow-y:hidden">
    <form id="form1" runat="server">
    <div>

        <TABLE id=statistics class=border border=0 cellSpacing=1 cellPadding=2 
width="100%">
  <TBODY>
  <TR class=title align =center>
    <TD colspan="2" style="text-align: left">
      >>> 城市区划管理<ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="Server">
                </ajaxToolkit:ToolkitScriptManager>
    </TD>
    </TR>
        
        
        <tr class=tdbg>
            <td align="center">
                <table border="0" cellpadding="1" cellspacing="0">
                    <tr>
                        <td style="width: 100px; height: 21px">
                            辖区:</td>
                        <td style="width: 100px; height: 21px">
                            <asp:DropDownList ID="ddlDepart" runat="server">
                            </asp:DropDownList></td>
                        <td style="width: 100px; height: 21px">
                            名称:</td>
                        <td style="width: 100px; height: 21px">
                            <asp:TextBox ID="txtDepart" runat="server" Width="288px" Height="20px"></asp:TextBox></td>
                        <td style="width: 459px; height: 21px; text-align: left;">
                            <asp:Button ID="btnAddDepart" runat="server" OnClick="btnAddDepart_Click" 
                                Text="添加" Width="53px" />
                            <asp:Button ID="btnModiDepart" runat="server" OnClick="btnModiDepart_Click" 
                                Text="修改" Width="51px" />
                            <asp:Button ID="btnDelDepart" runat="server" OnClick="btnDelDepart_Click" 
                                Text="删除" Width="51px" /></td>
                    </tr>
                    <tr class=tdbg>
                        <td style="width: 100px; height: 26px">
                            街道:</td>
                        <td style="width: 100px; height: 26px">
                            <asp:DropDownList ID="ddlSpec" runat="server">
                            </asp:DropDownList></td>
                        <td style="width: 100px; height: 26px">
                            名称:</td>
                        <td style="width: 100px; height: 26px">
                            <asp:TextBox ID="txtSpec" runat="server" Width="287px" Height="20px"></asp:TextBox></td>
                        <td style="width: 459px; height: 26px; text-align: left;">
                            <asp:Button ID="btnAddSpec" runat="server" OnClick="btnAddSpec_Click" Text="添加" 
                                Width="53px" />
                            <asp:Button ID="btnModiSpec" runat="server" OnClick="btnModiSpec_Click" 
                                Text="修改" Width="53px" />
                            <asp:Button ID="btnDelSpec" runat="server" OnClick="btnDelSpec_Click" Text="删除" 
                                Width="52px" /></td>
                    </tr>
                    <tr class=tdbg>
                        <td style="width: 100px; height: 26px">
                            小区、楼宇:</td>
                        <td style="width: 100px; height: 26px">
                            <asp:DropDownList ID="ddlClass" runat="server">
                            </asp:DropDownList></td>
                        <td style="width: 100px; height: 26px">
                            名称:</td>
                        <td style="width: 100px; height: 26px">
                            <asp:TextBox ID="txtClass" runat="server" Width="287px" Height="20px"></asp:TextBox></td>
                        <td style="width: 459px; height: 26px; text-align: left;">
                            <asp:Button ID="btnAddClass" runat="server" OnClick="btnAddClass_Click" 
                                Text="添加" Width="54px" />
                            <asp:Button ID="btnModiClass" runat="server" OnClick="btnModiClass_Click" 
                                Text="修改" Width="51px" />
                            <asp:Button ID="btnDelClass" runat="server" OnClick="btnDelClass_Click" 
                                Text="删除" Width="53px" /></td>
                    </tr>
                </table>
                <ajaxToolkit:CascadingDropDown ID="cddlDepart" runat="server" Category="dep" LoadingText="Loading..."
                    PromptText="=请选择=" ServiceMethod="GetDep" ServicePath="detailinfo.asmx" TargetControlID="ddlDepart">
                </ajaxToolkit:CascadingDropDown>
                <ajaxToolkit:CascadingDropDown ID="cddlSpec" runat="server" Category="spec" LoadingText="Loading..."
                    ParentControlID="ddlDepart" PromptText="=请选择=" ServiceMethod="GetSpec" ServicePath="detailinfo.asmx"
                    TargetControlID="ddlSpec">
                </ajaxToolkit:CascadingDropDown>
                <ajaxToolkit:CascadingDropDown ID="cddlClass" runat="server" Category="clas" LoadingText="Loading..."
                    ParentControlID="ddlSpec" PromptText="=请选择=" ServiceMethod="GetClas" ServicePath="detailinfo.asmx"
                    TargetControlID="ddlClass">
                </ajaxToolkit:CascadingDropDown>
            </td>
            
        </tr>
        </table>
    </div>
    </form>
</body>
</html>
