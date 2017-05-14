<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Right.aspx.cs" Inherits="Right" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>欢迎界面</TITLE>
 <LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<script type="text/javascript" src="js/lhgcore.js"></script>
<script type="text/javascript" src="js/lhgdialog.js"></script>
<script  type="text/javascript">
function isnum()
{
if((event.keyCode<45 || event.keyCode>57) && event.keyCode!=189)
{
event.keyCode=0;
}
}
function isnum1()
{
if((event.keyCode<45 || event.keyCode>57) && event.keyCode!=189)
{
event.keyCode=0;
}
}
</script>
<style type="text/css">

.body_gundong{background-repeat:no-repeat; height:187px; width:410px; margin-left:1px;}
.body_gundong .body_gundong_div{overflow: hidden;  height: 187px;width:410px; margin-left:0px;margin-top:0px}
.body_gundong .body_gundong_table td{height:22px;}



</style>
</HEAD>
<BODY style="overflow-x:hidden;overflow-y:hidden">
<form id="form1" runat="server">
<DIV > 
<TABLE width="100%" >
  <TBODY>
  <TR class=tdbg>
    <TD colspan="3">
        <table>
        <tr>
        <td>编号</td>
        <td>
            <asp:TextBox ID="fybh" runat="server" Width="52px"></asp:TextBox></td>
        <td>区域</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" Width="51px"></asp:TextBox></td>
        <td>街道</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" Width="48px"></asp:TextBox></td>
            <td>小区</td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" Width="57px"></asp:TextBox></td>
            <td>户型</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server" Width="53px"></asp:TextBox></td>
            <td>面积</td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" Width="43px" onpaste="return false" onkeypress="isnum()"></asp:TextBox></td>
            <td>楼层</td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server" Width="33px" onpaste="return false" onkeypress="isnum1()"></asp:TextBox></td>
            <td>价格</td>
        <td>
            <asp:TextBox ID="TextBox7" runat="server" Width="67px" onpaste="return false" onkeypress="isnum1()"></asp:TextBox></td>
            
         <td>租售形式</td>
        <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>不限</asp:ListItem>
            <asp:ListItem>租</asp:ListItem>
            <asp:ListItem>售</asp:ListItem>
        </asp:DropDownList></td>
            <td>附加</td>
        <td>
            <asp:TextBox ID="fujia" runat="server" Width="81px"></asp:TextBox></td>
        <td><asp:ImageButton ID="cx" runat="server" Height="33px" 
                 ImageUrl="~/images/btn/chazhao.jpg"  
        Width="88px" onclick="cx_Click"  />  </td>
        
        </tr>
        </table></TD>
    </TR> 

 <asp:Panel ID="Panel1" runat="server">        
  <TR >
    <TD width="65%" colspan="2">
   <TABLE id=statistics class=border border=0 cellSpacing=1 cellPadding=2 
width="100%" >
  <TBODY>
  
  <TR class=title align =center>
    <TD colspan="7" style="text-align: left">
      >>> 最新未成交房源
    </TD>
    </TR>
      
  <TR class=title align =center>
    <TD style="width: 10%">编号</TD>
    <TD style="width: 35%">区域/街道/小区</TD>
    <TD style="width: 10%">面积</TD>
    <TD style="width: 10%">楼层</TD>
     <TD style="width: 15%">价格</TD>
    <TD style="width: 10%">单价</TD>
    <TD style="width: 10%">售租</TD>
     
    </TR>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '房源详细信息', page: 'fyxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 900, height: 545, nofoot: true, nohead: true,cover: true });">
  <TD><%# DataBinder.Eval(Container.DataItem, " 编号")%></TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " 辖区")%>/<%# DataBinder.Eval(Container.DataItem, " 街道")%>/<%# DataBinder.Eval(Container.DataItem, " 小区")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 建筑面积")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 第层")%>/<%# DataBinder.Eval(Container.DataItem, " 共层")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 房主报价")%>元</TD>
        <TD><%# DataBinder.Eval(Container.DataItem, " 月租")%></TD>
          <TD><%# DataBinder.Eval(Container.DataItem, " 售租形式")%></TD></TR>
  
   </ItemTemplate>
</asp:Repeater>

  </TBODY></TABLE> 
</TD>
 <TD width="35%" >
 <TABLE id=TABLE1 class=border border=0 cellSpacing=1 cellPadding=2 
width="100%" >
  <TBODY>
  <TR class=title align =center>
    <TD colspan="4" style="text-align: left">
      >>> 最新客户
    </TD>
    </TR>
      
  <TR class=title align =center>
    <TD style="width: 10%">编号</TD>
    <TD style="width: 45%">期望区域</TD>
    <TD style="width: 20%">售租</TD>
      <TD style="width: 25%">期望价格</TD>
    </TR>
<asp:Repeater ID="Repeater2" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '客户信息', page: 'khxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 700, height: 245, nofoot: true, nohead: true,cover: true });">
  <TD><%# DataBinder.Eval(Container.DataItem, " 客户编号")%></TD>
  <TD><%# PageValidate.SqlText(DataBinder.Eval(Container.DataItem, "期望区域").ToString(),10)%> </TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " 租售形式")%></TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " 期望价格")%>元</TD></TR>
   </ItemTemplate>
</asp:Repeater>


  </TBODY></TABLE>
</TD>
    </TR> 
   <TR >
    <TD width="25%">
   <TABLE id=TABLE2 class=border border=0 cellSpacing=1 cellPadding=2 
width="100%" >
  <TBODY>
  <TR class=title align =center>
    <TD colspan="2" style="text-align: left">
      >>> 最新成交留言
    </TD>
    </TR>
  <TR class=title align =center>
    <TD style="width: 55%">成交记录</TD>
    <TD style="width: 15%">签约人</TD>
    
    </TR>
<asp:Repeater ID="Repeater3" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '成交详细信息', page: 'cjlyxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 900, height: 545, nofoot: true, nohead: true,cover: true });">
  <TD><%# cjjl(DataBinder.Eval(Container.DataItem, "id"))%></TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " 签约人")%></TD>
   </ItemTemplate>
</asp:Repeater>
  </TBODY></TABLE> 
</TD>

   <TD width="40%" >

   <TABLE id=TABLE5 class=border border=0 cellSpacing=1 cellPadding=2 
width="100%" >
  <TBODY>
  <TR class=title align =center>
    <TD colspan="3" style="text-align: left">
      >>> 今天房源跟进留言
    </TD>
    </TR>
  <TR class=title align =center>
    <TD style="width: 60%">评价内容</TD>
    <TD style="width: 20%">评价人</TD>
    <TD style="width: 20%">评价时间</TD>
    </TR>
    <tr><td colspan="3">
   <div class="body_gundong">
	<div id=hangye class="body_gundong_div">
		<table class="body_gundong_table" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td id="demo21">
					<table cellpadding="0" cellspacing="0" border="0" > 
<asp:Repeater ID="Repeater6" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '成交详细信息', page: 'fyxx1.aspx?id=<%# DataBinder.Eval(Container.DataItem," fid ") %>' ,width: 900, height: 545, nofoot: true, nohead: true,cover: true });">
     <TD style="width: 245px"><%# PageValidate.SqlText(DataBinder.Eval(Container.DataItem, "评价内容").ToString(), 17)%> </TD>
  <TD style="width: 82px"><%# DataBinder.Eval(Container.DataItem, " 评价人")%></TD>
  <TD style="width: 83px"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem, " 评价时间").ToString()).ToString("HH：mm")%></TD></TR>
   </ItemTemplate>
</asp:Repeater>
</table>
				</td>
			</tr>
			<tr>
				<td id="demo22"></td>
			</tr>
		</table>
	</div>
</div>
     <SCRIPT>
  var speed2=100//速度数值越大速度越慢
  demo22.innerHTML=demo21.innerHTML
  function Marquee2(){
  if(demo22.offsetHeight-hangye.scrollTop<=0)
  hangye.scrollTop-=demo21.offsetHeight
  else{
  hangye.scrollTop++
  }
  }
  var MyMar2=setInterval(Marquee2,speed2)
  hangye.onmouseover=function() {clearInterval(MyMar2)}
  hangye.onmouseout=function() {MyMar2=setInterval(Marquee2,speed2)}
                  </SCRIPT>
</td></tr>
  </TBODY></TABLE> 
  
</TD>

 <TD width="35%">
 <TABLE id=TABLE3 class=border border=0 cellSpacing=1 cellPadding=2 
width="100%" >
  <TBODY>
  <TR class=title align =center>
    <TD colspan="3" style="text-align: left">
      >>> 最新内部通知
    </TD>
    </TR>     
  <TR class=title align =center> 
    <TD style="width: 50%">标题</TD>
    <TD style="width: 20%">发布人</TD>
      <TD style="width: 30%">发布时间</TD>
    </TR>
<asp:Repeater ID="Repeater4" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '内部通知', page: 'tzck.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 700, height: 245, nofoot: true, nohead: true,cover: true });">
    <TD><%# PageValidate.SqlText(DataBinder.Eval(Container.DataItem, "标题").ToString(), 10)%> </TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " 发布人")%></TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " 发布时间")%></TD></TR>
   </ItemTemplate>
</asp:Repeater>


  </TBODY></TABLE>
</TD>
    </TR>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Visible ="false">
  <TR >
    <TD colspan="2">
    <TABLE id=TABLE4 class=border border=0 cellSpacing=1 cellPadding=2 
width="100%" >
  <TBODY>
   <TR class=title align =center>
  <TD>序号</TD>
  <TD>房源编号</TD>
    <TD>区域/街道</TD>
    <TD>小区</TD>
    <TD>户型</TD>
    <TD>建筑面积</TD>
    
    <TD>楼层情况</TD>
   <TD>价格</TD>
    <TD>单价</TD>
    <TD>登记日期</TD>
    <TD>售租形式</TD>    
    </TR>
<asp:Repeater ID="Repeater5" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '房源详细信息', page: 'fyxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 900, height: 545, nofoot: true, nohead: true,cover: true });">
        <TD><%# Container.ItemIndex + (100 * (Convert.ToInt32(AspNetPager1.CurrentPageIndex) - 1)) + 1%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 编号")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 辖区")%>/<%# DataBinder.Eval(Container.DataItem, " 街道")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 小区")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 房屋户型")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 建筑面积")%></TD>
   
    <TD><%# DataBinder.Eval(Container.DataItem, " 楼层情况")%></TD>
    
    <TD><%# DataBinder.Eval(Container.DataItem, " 房主报价")%></TD>
     <TD><%# DataBinder.Eval(Container.DataItem, " 月租")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 录入时间")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " 售租形式")%></TD>
    
   </TR>
   </ItemTemplate>
</asp:Repeater>
    
<TR class=title align =center style="font-weight: bold">
    <TD colspan="10">
 <webdiyer:aspnetpager style="FONT-SIZE: 14px" id="AspNetPager1" runat="server" horizontalalign="Center" onpagechanged="AspNetPager1_PageChanged" showcustominfosection="Left" width="400px" meta:resourceKey="AspNetPager1" InputBoxStyle="width:19px"  ShowNavigationToolTip="True" CustomInfoTextAlign="Center" ShowInputBox="Always" FirstPageText="【首页】" LastPageText="【尾页】" NextPageText="【下页】 " PageSize="100" PrevPageText="【前页】 "></webdiyer:aspnetpager> </TD>
    </TR>
  </TBODY></TABLE>
    
    </TD>
    </TR>     
</asp:Panel>
    </TBODY>
    </TABLE> 
    </DIV>
 <br />
</FORM>
</BODY>
</HTML>