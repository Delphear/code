<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left.aspx.cs" Inherits="Left" %>
<HTML xmlns="http://www.w3.org/1999/xhtml" >
<HEAD id=ctl00_Head1>
<TITLE>Ŀ¼��</TITLE>
<LINK rel=stylesheet type=text/css href="App_Themes/left/Guide.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/index.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/MasterPage.css">

<LINK rel=stylesheet type=text/css href="App_Themes/left/xtree.css">
<SCRIPT type=text/javascript>
var old_menu = '';
function c( submenu )
{
var targetid,targetelement;
targetid=submenu.id+"d";
targetelement=document.getElementById(targetid);
targetelement.className = (targetelement.className == "guideexpand") ? "guidecollapse" : "guideexpand";
if( old_menu != submenu ){
if( old_menu !='' ){
old_menu.style.display = 'none';
}
submenu.style.display = 'block';
old_menu = submenu;
}else{
submenu.style.display = 'none';
old_menu = '';
}
}
</SCRIPT>
</HEAD>
<BODY onkeydown=keylock(event) id=Guidebody  style="overflow-x:hidden;overflow-y:hidden">
<FORM id=aspnetForm method=post name=aspnetForm >
<DIV id=Guide_back>
<UL>
  <LI id=Guide_top style="width: 194px">
  
  <DIV id=Guide_toptext onclick="location.href='Left.aspx'" onMouseOver="Guide_toptext.style.cursor='js/Working.cur';"   
                onMouseOut="Guide_toptext.style.cursor='auto'" >&nbsp;&nbsp;&nbsp;&nbsp;��Ŀ���� </DIV>
  <LI id=Guide_main>
  <DIV id=Guide_box>
  <DIV class=guideexpand onclick="top.frames('main_right').location.href='Right.aspx'">ϵͳ��ҳ</DIV>
  <DIV class=guidecollapse id=m01d onclick=c(m01)>������Ϣ</DIV>
  <DIV class=guide id=m01 style="display: none">
  <UL>
<li><A href="nbtz.aspx" target="main_right">�ڲ�֪ͨ</A></li>
<li><A href="tdcy.aspx" target="main_right">�Ŷӳ�Ա</A></li>
    </UL></DIV>
  <DIV class=guidecollapse id=m02d onclick=c(m02)>��Ϣ¼��</DIV>
  <DIV class=guide  id=m02 style="display: none">
  <UL>
<li><A href="khdj.aspx" target="main_right">�ͻ��Ǽ�</A></li>
<li><A href="fydj.aspx" target="main_right">��Դ�Ǽ�</A></li> 
  </UL></DIV>
    <DIV class=guidecollapse id=m03d onclick=c(m03)>�ۺϲ�ѯ</DIV>
  <DIV class=guide  id=m03 style="display: none">
  <UL>
<li><A href="khcx.aspx" target="main_right">�ͻ���ѯ</A></li>
<li><A href="wcjfy.aspx" target="main_right">δ�ɽ���Դ</A></li> 
<li><A href="ycjfy.aspx" target="main_right">�ѳɽ���Դ</A></li>
<li><A href="sxfy.aspx" target="main_right">ʧЧ��Դ</A></li>
<li><A href="cjly.aspx" target="main_right">�ɽ�����</A></li> 
  </UL></DIV>
 <DIV class=guidecollapse id=m06d onclick=c(m06)>����ѡ��</DIV>
  <DIV class=guide  id=m06 style="display: none">
  <UL>
<li><A href="wdkh.aspx" target="main_right">�ҵĿͻ�</A></li>
<li><A href="wdfy.aspx" target="main_right">�ҵ�δ�ɽ���Դ</A></li> 
<li><A href="wdcjfy.aspx" target="main_right">�ҵĳɽ���Դ</A></li>
<li><A href="wdsxfy.aspx" target="main_right">�ҵ�ʧЧ��Դ</A></li>
<li><A href="txzl.aspx" target="main_right">�ҵ�ͨѶ¼</A></li>
<li><A href="PasswordManage.aspx" target="main_right">�޸�����</A></li>
  </UL></DIV>
    <DIV class=guidecollapse id=m07d onclick=c(m07)>�ڲ�����</DIV>
  <DIV class=guide  id=m07 style="display: none">
  <UL>
<li><A href="book.aspx" target="main_right">���Ա�</A></li>
  </UL></DIV>
    <DIV class=guidecollapse id=m08d onclick=c(m08)>ϵͳ����</DIV>
  <DIV class=guide id=m08 style="display: none">
  <UL>
<li><A href="yhgl.aspx" target="main_right">�û�����</A></li>
<li><A href="nbtzgl.aspx" target="main_right">�ڲ�֪ͨ����</A></li>
<li><A href="jcsjgl.aspx" target="main_right">�������ݹ���</A></li>
  </UL></DIV>
   <!--DIV class=guideexpand onclick="window.open('http://bb.o.cn')">�鿴��ͼ</!--DIV-->
   <DIV class=guideexpand onclick="top.location.href='logout.aspx'">��ȫ�˳�</DIV>
  </DIV>
  <LI id=Guide_bottom style="width: 189px">
  </LI>
  </UL>
  </DIV>
    <DIV   id=eMeng   style="BORDER-RIGHT:   #455690   1px   solid;   BORDER-TOP:   #a6b4cf   1px   solid;   Z-INDEX:   99999;   LEFT:   64px;     
  VISIBILITY:   hidden;   BORDER-LEFT:   #a6b4cf   1px   solid;   WIDTH:   200px;     
  BORDER-BOTTOM:   #455690   1px   solid;   POSITION:   absolute;   TOP:   374px;     
  HEIGHT:   115px;   BACKGROUND-COLOR:   #c9d3f3">   
  <TABLE   style="BORDER-TOP:   #ffffff   1px   solid;   BORDER-LEFT:   #ffffff   1px   solid"   cellSpacing=0   cellPadding=0   width="100%"   bgColor=#cfdef4   border=0>   
      <TBODY>   
      <TR>   
          <TD   style="FONT-SIZE:   12px;   BACKGROUND-IMAGE:   none;   COLOR:   #0f2c8c"   width=30     
          height=24>��</TD>   
          <TD   style="PADDING-LEFT:   4px;   FONT-WEIGHT:   normal;   FONT-SIZE:   12px;   BACKGROUND-IMAGE:   none;   COLOR:   #1f336b;   PADDING-TOP:   4px"     
          vAlign=center   width="100%"  ><STRONG>��Ϣ��ʾ</STRONG>&nbsp;&nbsp;&nbsp;&nbsp;<SPAN style="FONT-WEIGHT:   bold;   FONT-SIZE:   12px;   CURSOR:   hand;   COLOR:   green;   MARGIN-RIGHT:   4px" onclick="location.href='Left.aspx'" onMouseOver="Guide_toptext.style.cursor='js/Working.cur';"   
                onMouseOut="Guide_toptext.style.cursor='auto'">ˢ����ʾ</SPAN></TD>   
          <TD   vAlign=center   align=right   width=19   padding-right:   2px;   padding-top:     
              2px><SPAN        
              style="FONT-WEIGHT:   bold;   FONT-SIZE:   12px;   CURSOR:   hand;   COLOR:   red;   MARGIN-RIGHT:   4px"     
              onclick="closeDiv()">��</SPAN></TD></TR>   
      <TR>   
          <TD   style="PADDING-RIGHT:   1px;   BACKGROUND-IMAGE:   none;   PADDING-BOTTOM:   1px"     
          colSpan=3   height=90>   
              <DIV   style="BORDER-RIGHT:   #b9c9ef   1px   solid;   PADDING-RIGHT:   13px;     
        BORDER-TOP:   #728eb8   1px   solid;   PADDING-LEFT:   13px;   FONT-SIZE:   12px;   PADDING-BOTTOM:   13px;     
        BORDER-LEFT:   #728eb8   1px   solid;   WIDTH:   100%;   COLOR:   #1f336b;   PADDING-TOP:   18px;     
        BORDER-BOTTOM:   #b9c9ef   1px   solid;   HEIGHT:   100%">   
                <P> 
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>��<A href="nbtz.aspx" target="main_right">�ڲ�֪ͨ</A>û�в鿴 </P> 
                  <P>
                      <asp:Literal ID="Literal2" runat="server"></asp:Literal> ��<A href="cjly.aspx" target="main_right">�ɽ�����</A>û�в鿴 </P> 
                    <P> 
                        <asp:Literal ID="Literal3" runat="server"></asp:Literal>��<A href="book.aspx" target="main_right">���Բ�</A>û�в鿴 </P>     
             </DIV>   
    </TD>       
      </TR>   
  </TABLE>       
  </DIV>   
  <SCRIPT   language=JavaScript>     
  window.onload   =   getMsg;     
  window.onresize   =   resizeDiv;     
  window.onerror   =   function(){}     
  //������ʾʹ��(asilas���)     
  var   divTop,divLeft,divWidth,divHeight,docHeight,docWidth,objTimer,i   =   0;     
  function   getMsg()     
  {     
    try   
    {     
      divTop   =   parseInt(document.getElementById("eMeng").style.top,10)     
      divLeft   =   parseInt(document.getElementById("eMeng").style.left,10)     
      divHeight   =   parseInt(document.getElementById("eMeng").offsetHeight,10)     
      divWidth   =   parseInt(document.getElementById("eMeng").offsetWidth,10)     
      docWidth   =   document.body.clientWidth;     
      docHeight   =   document.body.clientHeight;     
      document.getElementById("eMeng").style.top   =   parseInt(document.body.scrollTop,10)     +   docHeight   +     10;//   divHeight     
      document.getElementById("eMeng").style.left   =   parseInt(document.body.scrollLeft,10)     +   docWidth   -   divWidth   ;   
      document.getElementById("eMeng").style.visibility="visible"     
      objTimer   =   window.setInterval("moveDiv()",10)     
    }     
    catch(e){}     
  }     
  function   resizeDiv()     
  {     
    try   
    {     
      divHeight   =   parseInt(document.getElementById("eMeng").offsetHeight,10)     
      divWidth   =   parseInt(document.getElementById("eMeng").offsetWidth,10)     
      docWidth   =   document.body.clientWidth;     
      docHeight   =   document.body.clientHeight;     
      document.getElementById("eMeng").style.top   =   docHeight   -   divHeight     +   parseInt(document.body.scrollTop,10)     
      document.getElementById("eMeng").style.left   =   docWidth   -   divWidth   +     parseInt(document.body.scrollLeft,10)     
    }     
    catch(e){}     
  }     
  function   moveDiv()     
  {     
    try     
    {     
      if(parseInt(document.getElementById("eMeng").style.top,10)   <=   (docHeight   -   divHeight     +   parseInt(document.body.scrollTop,10)))     
      {     
        window.clearInterval(objTimer)     
        objTimer   =   window.setInterval("resizeDiv()",1)     
      }     
      divTop   =   parseInt(document.getElementById("eMeng").style.top,10)     
      document.getElementById("eMeng").style.top   =   divTop   -   1     
    }     
    catch(e){}     
  }     
  function   closeDiv()     
  {     
    document.getElementById('eMeng').style.visibility='hidden';     
    if(objTimer)   window.clearInterval(objTimer)     
  }     
  </SCRIPT> 
  </FORM>
  </BODY>
  </HTML>
