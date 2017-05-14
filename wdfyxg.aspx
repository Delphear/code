<%@ Page Language="C#"  validateRequest="false"  EnableEventValidation="false" AutoEventWireup="true"  CodeFile="wdfyxg.aspx.cs" Inherits="wdfyxg" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
			<meta name="CODE_LANGUAGE" Content="C#">
			<meta name="vs_defaultClientScript" content="JavaScript">
			<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
<head id="Head1" runat="server">
    <title>房源登记</title>    
<LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script type="text/javascript">
var P = window.parent, D = P.loadinndlg();   // 注意！这行代码是每个内容页必须加的内容，否则无法正确显示。
</script>
<script  type="text/javascript">
function isnum()
{
if(event.keyCode<45||event.keyCode>57)
{
event.keyCode=0;
}
}
function isnum1()
{
if(event.keyCode<48||event.keyCode>57)
{
event.keyCode=0;
}
}
</script>
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 91px;
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
    <TD colspan="6" align=center>
     房源编号<asp:Literal ID="Literal12" runat="server"></asp:Literal>详细信息</TD>
    </TR>

  <TR class=tdbg align =center> 
    <TD class="style2">城市区划</TD>
    <TD align =left class="style1" colspan="5">
        <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="Server">
                    </ajaxToolkit:ToolkitScriptManager>
      <asp:DropDownList ID="ddlDepart" runat="server">
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlSpec" runat="server">
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlClass" runat="server">
                                            </asp:DropDownList>
                                            
                                            <asp:Literal ID="Literal13" runat="server"></asp:Literal>
                                            
                                            </td>
                        </TD>
   </TR>

  <TR class=tdbg align =center> 
    <TD class="style2" >详细地址</TD>
    <TD align =left class="style1" colspan="3">
        <asp:TextBox ID="TextBox1" runat="server" Width="417px" MaxLength="450"></asp:TextBox>
                        </TD>
    <TD align =left class="style1">
        公交线路</TD>
    <TD align =left class="style1">
        <asp:TextBox ID="TextBox2" runat="server" Width="163px" MaxLength="400"></asp:TextBox>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >环境描述</TD>
    <TD align =left class="style1" colspan="5">
        <asp:TextBox ID="TextBox3" runat="server" Width="565px" MaxLength="480"></asp:TextBox>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >房屋户型</TD>
    <TD align =left class="style1">
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
    <TD align =left class="style1">
        建筑结构</TD>
    <TD align =left class="style1">
        <asp:DropDownList ID="DropDownList9" runat="server">
            <asp:ListItem>框架</asp:ListItem>
            <asp:ListItem>砖混</asp:ListItem>
            <asp:ListItem>钢混</asp:ListItem>
            <asp:ListItem>平房</asp:ListItem>
        </asp:DropDownList>
                        </TD>
    <TD align =left class="style1">
        使用性质</TD>
    <TD align =left class="style1">
        <asp:DropDownList ID="DropDownList10" runat="server">
            <asp:ListItem>住宅</asp:ListItem>
            <asp:ListItem>门面</asp:ListItem>
            <asp:ListItem>厂房</asp:ListItem>
            <asp:ListItem>公寓</asp:ListItem>
        </asp:DropDownList>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >建筑年代</TD>
    <TD align =left class="style1">
        <asp:TextBox ID="TextBox4" runat="server" Width="50px" 
            MaxLength="40"></asp:TextBox>
        年</TD>
    <TD align =left class="style1">
        房屋现状</TD>
    <TD align =left class="style1">
        <asp:DropDownList ID="DropDownList13" runat="server">
            <asp:ListItem>闲置</asp:ListItem>
            <asp:ListItem>出租</asp:ListItem>
            <asp:ListItem>自住</asp:ListItem>
        </asp:DropDownList>
                        </TD>
    <TD align =left class="style1">
        房屋类型</TD>
    <TD align =left class="style1">
        <asp:RadioButtonList ID="RadioButtonList7" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Selected>现房</asp:ListItem>
                            <asp:ListItem >期房</asp:ListItem>
                        </asp:RadioButtonList>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >楼层情况</TD>
    <TD align =left class="style1">
        第<asp:TextBox ID="TextBox5" runat="server" Width="24px" MaxLength="3" onpaste="return false" onkeypress="isnum1()" ></asp:TextBox>
        层/共<asp:TextBox ID="TextBox6" runat="server" Width="28px" MaxLength="3" onpaste="return false" onkeypress="isnum1()" ></asp:TextBox>
        层</TD>
    <TD align =left class="style1">
        一梯几户</TD>
    <TD align =left class="style1">
        <asp:TextBox ID="TextBox7" runat="server" Width="49px" MaxLength="10"></asp:TextBox>
        朝向<asp:DropDownList ID="DropDownList11" runat="server">
            <asp:ListItem>东</asp:ListItem>
            <asp:ListItem>南</asp:ListItem>
            <asp:ListItem>西</asp:ListItem>
            <asp:ListItem>北</asp:ListItem>
        </asp:DropDownList>
                        </TD>
    <TD align =left class="style1">
        装修状况</TD>
    <TD align =left class="style1">
        <asp:DropDownList ID="DropDownList12" runat="server">
            <asp:ListItem>豪华</asp:ListItem>
            <asp:ListItem>精致</asp:ListItem>
            <asp:ListItem>简单</asp:ListItem>
            <asp:ListItem>毛坯</asp:ListItem>
        </asp:DropDownList>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >建筑面积</TD>
    <TD align =left class="style1">
        <asp:TextBox ID="TextBox8" runat="server" Width="89px" MaxLength="10" 
            onpaste="return false" onkeypress="isnum()" ></asp:TextBox>
        平方米</TD>
    <TD align =left class="style1">
        房主报价</TD>
    <TD align =left class="style1">
        <asp:TextBox ID="TextBox10" runat="server" Width="86px" MaxLength="10" onpaste="return false" onkeypress="isnum1()"></asp:TextBox>
                        元</TD>
    <TD align =left class="style1">
        最低让价</TD>
    <TD align =left class="style1">
        <asp:TextBox ID="TextBox11" runat="server" Width="87px" MaxLength="10" ></asp:TextBox>
                        元</TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >配套设施</TD>
    <TD align =left class="style1" colspan="5">
        <asp:TextBox ID="TextBox12" runat="server" Width="568px" MaxLength="480"></asp:TextBox>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >房主</TD>
    <TD align =left class="style1">
        <asp:TextBox ID="TextBox13" runat="server" Width="127px" MaxLength="10"></asp:TextBox>
                        </TD>
    <TD align =left class="style1">
        联系方式</TD>
    <TD align =left class="style1">
        <asp:TextBox ID="TextBox14" runat="server" MaxLength="45"></asp:TextBox>
                        </TD>
    <TD align =left class="style1">
        房主其他联系方式</TD>
    <TD align =left class="style1">
        <asp:TextBox ID="TextBox15" runat="server" Width="115px" MaxLength="45"></asp:TextBox>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >产权证状况</TD>
    <TD align =left class="style1">
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem >无</asp:ListItem>
                            <asp:ListItem Selected>有</asp:ListItem>
                        </asp:RadioButtonList></TD>
    <TD align =left class="style1">
        产权性质</TD>
        <TD align =left class="style1">
        <asp:DropDownList ID="DropDownList14" runat="server">
            <asp:ListItem>商品房</asp:ListItem>
            <asp:ListItem>经济房</asp:ListItem>
            <asp:ListItem>集资房</asp:ListItem>
            <asp:ListItem>房改房</asp:ListItem>
            <asp:ListItem>还原房</asp:ListItem>
        </asp:DropDownList>
                        </TD>
    <TD align =left class="style1">
                产权证是否在公司</TD>
    <TD align =left class="style1">
        <asp:RadioButtonList ID="RadioButtonList5" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Selected>不在</asp:ListItem>
                            <asp:ListItem>在</asp:ListItem>
                        </asp:RadioButtonList></TD>
    
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >产权证</TD>
    <TD align =left class="style1">
        <asp:DropDownList ID="DropDownList15" runat="server">
            <asp:ListItem>已满一年</asp:ListItem>
            <asp:ListItem>已满二年</asp:ListItem>
            <asp:ListItem>已满三年</asp:ListItem>
            <asp:ListItem>已满四年</asp:ListItem>
            <asp:ListItem>已满五年</asp:ListItem>
        </asp:DropDownList></TD>
    <TD align =left class="style1">
        购房合同发票</TD>
        <TD align =left class="style1">
               <asp:RadioButtonList ID="RadioButtonList6" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem >无</asp:ListItem>
                            <asp:ListItem Selected>有</asp:ListItem>
                        </asp:RadioButtonList>
                        </TD>
    <TD align =left class="style1">
                钥匙是否在公司</TD>
    <TD align =left class="style1">
        <asp:RadioButtonList ID="RadioButtonList4" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Selected>不在</asp:ListItem>
                            <asp:ListItem>在</asp:ListItem>
                        </asp:RadioButtonList></TD>
    
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >土地证状况</TD>
    <TD align =left class="style1">
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem >无</asp:ListItem>
                            <asp:ListItem Selected>有</asp:ListItem>
                        </asp:RadioButtonList></TD>
    <TD align =left class="style1">
                本公司独家代理 </TD>
    <TD align =left class="style1">
        <asp:RadioButtonList ID="RadioButtonList3" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Selected>否</asp:ListItem>
                            <asp:ListItem>是</asp:ListItem>
                        </asp:RadioButtonList></TD>
    <TD align =left class="style1">
        售租形式</TD>
    <TD align =left class="style1">
<asp:RadioButtonList ID="RadioButtonList8" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem >售</asp:ListItem>
                            <asp:ListItem Selected>租</asp:ListItem>
                        </asp:RadioButtonList>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >房源备注</TD>
    <TD align =left class="style1" colspan="5">
        <asp:TextBox ID="TextBox19" runat="server" Width="621px" MaxLength="790"></asp:TextBox>
                        </TD>
   </TR>
<TR class=title align =center style="font-weight: bold">
    <TD colspan="6"> 
        <asp:Literal ID="Literal4" runat="server" Visible="False"></asp:Literal>
    </TD>
    </TR>
  </TBODY></TABLE></DIV>
<br />
 <asp:ImageButton ID="bc" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/xiugai.jpg"  
        Width="88px" OnClientClick="return confirm('您确定要修改此未成交房源吗?');" onclick="bc_Click" />&nbsp;&nbsp;
            <ajaxToolkit:CascadingDropDown ID="cddlDepart" runat="server" Category="dep" LoadingText="Loading..."
                                    PromptText="--请选择辖区--" ServiceMethod="GetDep" ServicePath="detailinfo.asmx" TargetControlID="ddlDepart">
                                </ajaxToolkit:CascadingDropDown>
                                <ajaxToolkit:CascadingDropDown ID="cddlSpec" runat="server" Category="spec" LoadingText="Loading..."
                                    ParentControlID="ddlDepart" PromptText="--请选择街道--" ServiceMethod="GetSpec" ServicePath="detailinfo.asmx"
                                    TargetControlID="ddlSpec">
                                </ajaxToolkit:CascadingDropDown>
                                <ajaxToolkit:CascadingDropDown ID="cddlClass" runat="server" Category="clas" LoadingText="Loading..."
                                    ParentControlID="ddlSpec" PromptText="--请选择小区、楼宇--" ServiceMethod="GetClas" ServicePath="detailinfo.asmx"
                                    TargetControlID="ddlClass">
                                </ajaxToolkit:CascadingDropDown>
</form>
</BODY>
</HTML>
