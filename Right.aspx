<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Right.aspx.cs" Inherits="Right" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>��ӭ����</TITLE>
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
        <td>���</td>
        <td>
            <asp:TextBox ID="fybh" runat="server" Width="52px"></asp:TextBox></td>
        <td>����</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" Width="51px"></asp:TextBox></td>
        <td>�ֵ�</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" Width="48px"></asp:TextBox></td>
            <td>С��</td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" Width="57px"></asp:TextBox></td>
            <td>����</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server" Width="53px"></asp:TextBox></td>
            <td>���</td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" Width="43px" onpaste="return false" onkeypress="isnum()"></asp:TextBox></td>
            <td>¥��</td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server" Width="33px" onpaste="return false" onkeypress="isnum1()"></asp:TextBox></td>
            <td>�۸�</td>
        <td>
            <asp:TextBox ID="TextBox7" runat="server" Width="67px" onpaste="return false" onkeypress="isnum1()"></asp:TextBox></td>
            
         <td>������ʽ</td>
        <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>����</asp:ListItem>
            <asp:ListItem>��</asp:ListItem>
            <asp:ListItem>��</asp:ListItem>
        </asp:DropDownList></td>
            <td>����</td>
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
      >>> ����δ�ɽ���Դ
    </TD>
    </TR>
      
  <TR class=title align =center>
    <TD style="width: 10%">���</TD>
    <TD style="width: 35%">����/�ֵ�/С��</TD>
    <TD style="width: 10%">���</TD>
    <TD style="width: 10%">¥��</TD>
     <TD style="width: 15%">�۸�</TD>
    <TD style="width: 10%">����</TD>
    <TD style="width: 10%">����</TD>
     
    </TR>
<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '��Դ��ϸ��Ϣ', page: 'fyxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 900, height: 545, nofoot: true, nohead: true,cover: true });">
  <TD><%# DataBinder.Eval(Container.DataItem, " ���")%></TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " Ͻ��")%>/<%# DataBinder.Eval(Container.DataItem, " �ֵ�")%>/<%# DataBinder.Eval(Container.DataItem, " С��")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " �������")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " �ڲ�")%>/<%# DataBinder.Eval(Container.DataItem, " ����")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " ��������")%>Ԫ</TD>
        <TD><%# DataBinder.Eval(Container.DataItem, " ����")%></TD>
          <TD><%# DataBinder.Eval(Container.DataItem, " ������ʽ")%></TD></TR>
  
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
      >>> ���¿ͻ�
    </TD>
    </TR>
      
  <TR class=title align =center>
    <TD style="width: 10%">���</TD>
    <TD style="width: 45%">��������</TD>
    <TD style="width: 20%">����</TD>
      <TD style="width: 25%">�����۸�</TD>
    </TR>
<asp:Repeater ID="Repeater2" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '�ͻ���Ϣ', page: 'khxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 700, height: 245, nofoot: true, nohead: true,cover: true });">
  <TD><%# DataBinder.Eval(Container.DataItem, " �ͻ����")%></TD>
  <TD><%# PageValidate.SqlText(DataBinder.Eval(Container.DataItem, "��������").ToString(),10)%> </TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " ������ʽ")%></TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " �����۸�")%>Ԫ</TD></TR>
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
      >>> ���³ɽ�����
    </TD>
    </TR>
  <TR class=title align =center>
    <TD style="width: 55%">�ɽ���¼</TD>
    <TD style="width: 15%">ǩԼ��</TD>
    
    </TR>
<asp:Repeater ID="Repeater3" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '�ɽ���ϸ��Ϣ', page: 'cjlyxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 900, height: 545, nofoot: true, nohead: true,cover: true });">
  <TD><%# cjjl(DataBinder.Eval(Container.DataItem, "id"))%></TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " ǩԼ��")%></TD>
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
      >>> ���췿Դ��������
    </TD>
    </TR>
  <TR class=title align =center>
    <TD style="width: 60%">��������</TD>
    <TD style="width: 20%">������</TD>
    <TD style="width: 20%">����ʱ��</TD>
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
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '�ɽ���ϸ��Ϣ', page: 'fyxx1.aspx?id=<%# DataBinder.Eval(Container.DataItem," fid ") %>' ,width: 900, height: 545, nofoot: true, nohead: true,cover: true });">
     <TD style="width: 245px"><%# PageValidate.SqlText(DataBinder.Eval(Container.DataItem, "��������").ToString(), 17)%> </TD>
  <TD style="width: 82px"><%# DataBinder.Eval(Container.DataItem, " ������")%></TD>
  <TD style="width: 83px"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem, " ����ʱ��").ToString()).ToString("HH��mm")%></TD></TR>
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
  var speed2=100//�ٶ���ֵԽ���ٶ�Խ��
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
      >>> �����ڲ�֪ͨ
    </TD>
    </TR>     
  <TR class=title align =center> 
    <TD style="width: 50%">����</TD>
    <TD style="width: 20%">������</TD>
      <TD style="width: 30%">����ʱ��</TD>
    </TR>
<asp:Repeater ID="Repeater4" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '�ڲ�֪ͨ', page: 'tzck.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 700, height: 245, nofoot: true, nohead: true,cover: true });">
    <TD><%# PageValidate.SqlText(DataBinder.Eval(Container.DataItem, "����").ToString(), 10)%> </TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " ������")%></TD>
  <TD><%# DataBinder.Eval(Container.DataItem, " ����ʱ��")%></TD></TR>
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
  <TD>���</TD>
  <TD>��Դ���</TD>
    <TD>����/�ֵ�</TD>
    <TD>С��</TD>
    <TD>����</TD>
    <TD>�������</TD>
    
    <TD>¥�����</TD>
   <TD>�۸�</TD>
    <TD>����</TD>
    <TD>�Ǽ�����</TD>
    <TD>������ʽ</TD>    
    </TR>
<asp:Repeater ID="Repeater5" runat="server">
  <ItemTemplate>
  <TR class=tdbg align =center onmouseover="this.style.backgroundColor='#b0d0f3'" onmouseout="this.style.backgroundColor='#e6eff8'" onclick=" J.dialog.get({ id: 'sblb', title: '��Դ��ϸ��Ϣ', page: 'fyxx.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>' ,width: 900, height: 545, nofoot: true, nohead: true,cover: true });">
        <TD><%# Container.ItemIndex + (100 * (Convert.ToInt32(AspNetPager1.CurrentPageIndex) - 1)) + 1%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " ���")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " Ͻ��")%>/<%# DataBinder.Eval(Container.DataItem, " �ֵ�")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " С��")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " ���ݻ���")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " �������")%></TD>
   
    <TD><%# DataBinder.Eval(Container.DataItem, " ¥�����")%></TD>
    
    <TD><%# DataBinder.Eval(Container.DataItem, " ��������")%></TD>
     <TD><%# DataBinder.Eval(Container.DataItem, " ����")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " ¼��ʱ��")%></TD>
    <TD><%# DataBinder.Eval(Container.DataItem, " ������ʽ")%></TD>
    
   </TR>
   </ItemTemplate>
</asp:Repeater>
    
<TR class=title align =center style="font-weight: bold">
    <TD colspan="10">
 <webdiyer:aspnetpager style="FONT-SIZE: 14px" id="AspNetPager1" runat="server" horizontalalign="Center" onpagechanged="AspNetPager1_PageChanged" showcustominfosection="Left" width="400px" meta:resourceKey="AspNetPager1" InputBoxStyle="width:19px"  ShowNavigationToolTip="True" CustomInfoTextAlign="Center" ShowInputBox="Always" FirstPageText="����ҳ��" LastPageText="��βҳ��" NextPageText="����ҳ�� " PageSize="100" PrevPageText="��ǰҳ�� "></webdiyer:aspnetpager> </TD>
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