<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Wfyxx.aspx.cs" Inherits="Wfyxx" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>我的房源详细信息</title>
<LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script type="text/javascript">
var P = window.parent, D = P.loadinndlg();   // 注意！这行代码是每个内容页必须加的内容，否则无法正确显示。
</script>
    <style type="text/css">
        .style1
        {
            height: 15px;
             color: #032749;
        }
        .style2
        {
            height: 14px;
            width: 94px;
        }
        .style3
        {
            height: 7px;
            color: #000099;
        }
        .style4
        {
            height: 15px;
            width: 85px;
        }
        .style5
        {
            height: 15px;
            width: 175px;
             color: #032749;
        }
        .style8
        {
            height: 15px;
            width: 61px;
             color: #032749;
        }
        .style9
        {
            height: 15px;
            width: 27px;
        }
        .style10
        {
            height: 15px;
            width: 43px;
             color: #032749;
        }
        .style11
        {
            height: 15px;
            width: 98px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <TABLE class=border border=0 cellSpacing=1 cellPadding=2 width="100%">
  <TBODY>
  <TR class=tdbg>
    <TD class=spacingtitle colSpan=8 align=center>
     房源编号<asp:Literal ID="Literal12" runat="server"></asp:Literal>详细信息</TD>
  </TR>
  <TR class=tdbg align =center> 
    <TD class="style2">辖区/街道/小区</TD>
    <TD align =left class="style1" colspan="7">
        
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </TD>
   </TR>

  <TR class=tdbg align =center> 
    <TD class="style2" >详细地址</TD>
    <TD align =left class="style1" colspan="5">
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style11">
        公交线路</TD>
    <TD align =left class="style1">
        <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >环境描述</TD>
    <TD align =left class="style1" colspan="7">
        <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >房屋户型</TD>
    <TD align =left class="style5">
        <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style4">
        建筑结构</TD>
    <TD align =left class="style1" colspan="3">
        <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style11">
        使用性质</TD>
    <TD align =left class="style1">
        <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >建筑年代</TD>
    <TD align =left class="style5">
        <asp:Literal ID="Literal8" runat="server"></asp:Literal>
        年</TD>
    <TD align =left class="style4">
        房屋现状</TD>
    <TD align =left class="style1" colspan="3">
        <asp:Literal ID="Literal9" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style11">
        房屋类型</TD>
    <TD align =left class="style1">
        <asp:Literal ID="Literal10" runat="server"></asp:Literal>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >楼层情况</TD>
    <TD align =left class="style5">
        <asp:Literal ID="Literal11" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style4">
        一梯几户</TD>
    <TD align =left class="style8">
        <asp:Literal ID="Literal13" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style9">
        朝向</TD>
    <TD align =left class="style10">
        <asp:Literal ID="Literal14" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style11">
        装修状况</TD>
    <TD align =left class="style1">
        <asp:Literal ID="Literal15" runat="server"></asp:Literal>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >建筑面积</TD>
    <TD align =left class="style5">
        <asp:Literal ID="Literal16" runat="server"></asp:Literal>
        平方米</TD>
    <TD align =left class="style4">
        房主</TD>
    <TD align =left class="style1" colspan="3">
        <asp:Literal ID="Literal33" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style11">
        联系方式</TD>
    <TD align =left class="style1">
        <asp:Literal ID="Literal34" runat="server"></asp:Literal>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >房主报价</TD>
    <TD align =left class="style5">
        <asp:Literal ID="Literal17" runat="server"></asp:Literal>
                        元</TD>
    <TD align =left class="style4">
        最低让价</TD>
    <TD align =left class="style1" colspan="3">
        <asp:Literal ID="Literal35" runat="server"></asp:Literal>
                        元</TD>
    <TD align =left class="style11">
        每平方</TD>
    <TD align =left class="style1">
        <asp:Literal ID="Literal18" runat="server"></asp:Literal>
                        元</TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >配套设施</TD>
    <TD align =left class="style1" colspan="7">
        <asp:Literal ID="Literal19" runat="server"></asp:Literal>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >产权证状况</TD>
    <TD align =left class="style5">
        <asp:Literal ID="Literal20" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style4">
        产权性质</TD>
        <TD align =left class="style1" colspan="3">
            <asp:Literal ID="Literal21" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style11">
                产权证是否在公司</TD>
    <TD align =left class="style1">
        <asp:Literal ID="Literal22" runat="server"></asp:Literal>
                        </TD>
    
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >产权证</TD>
    <TD align =left class="style5">
        <asp:Literal ID="Literal23" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style4">
        购房合同发票</TD>
        <TD align =left class="style1" colspan="3">
               <asp:Literal ID="Literal24" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style11">
                钥匙是否在公司</TD>
    <TD align =left class="style1">
        <asp:Literal ID="Literal25" runat="server"></asp:Literal>
                        </TD>
    
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >土地证状况</TD>
    <TD align =left class="style5">
                <asp:Literal ID="Literal26" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style4">
                本公司独家代理 </TD>
    <TD align =left class="style1" colspan="3">
        <asp:Literal ID="Literal27" runat="server"></asp:Literal>
                        </TD>
    <TD align =left class="style11">
        售租形式</TD>
    <TD align =left class="style1">
        <asp:Literal ID="Literal28" runat="server"></asp:Literal>
                        </TD>
   </TR>
  <TR class=tdbg align =center> 
    <TD class="style2" >房源备注</TD>
    <TD align =left class="style1" colspan="7">
        <asp:Literal ID="Literal32" runat="server"></asp:Literal>
                        </TD>
   </TR>
    
  <TR class=tdbg align =center> 
    <TD class="style3" colspan="8" >
        <asp:Literal ID="Literal36" runat="server"></asp:Literal>
      </TD>
   </TR>
    
  </TBODY></TABLE>
      <div align ="center">
  <asp:ImageButton ID="pj" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/pingjia.jpg"  
        Width="88px" onclick="pj_Click"  />
            <asp:Literal ID="Literal29" runat="server" Visible="False"></asp:Literal>
  <a href ="#" onclick=" D.J.dialog.get({ id: 'child', title: '成交处理', page: D.J.ie ? 'fycjlr.aspx?fid=<%= Literal29.Text %>' : 'fycjlr.aspx', width: 700, height: 350, nofoot: true , cover: true, nodrag:true });">
      
      <asp:Image ID="Image1" runat="server" ImageUrl="~/images/btn/chengjiao.jpg" 
                Visible="False" />
     </a>
     <asp:ImageButton ID="sx" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/shixiao.jpg"  
        Width="88px" OnClientClick="return confirm('您确定要此未成交房源置为失效房源吗?');" onclick="sx_Click" />
        <asp:ImageButton ID="yx" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/youxiao.jpg"  
        Width="88px" OnClientClick="return confirm('您确定要此失效房源置为有效房源吗?');" onclick="yx_Click" />
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