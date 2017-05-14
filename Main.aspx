<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>华睿房产连锁房源信息内部管理系统</title>
<link rel="shortcut icon" href="favicon.ico" />
<script language="javascript" type="text/JavaScript">       
function switchSysBar()
{
    var obj = document.getElementById("switchPoint");
    if (obj.alt == "关闭左栏")
    {
        obj.alt = "打开左栏";
        obj.src = "images/main/butOpen.gif";
        document.getElementById("frmTitle").style.display="none";
        var width,height
        width=document.body.clientWidth-12;
        height=document.body.clientHeight-70;
        document.getElementById("main_right").style.height=height;
        document.getElementById("main_right").style.width=width;  
    }
    else 
    {
        obj.alt = "关闭左栏";
        obj.src = "images/main/butClose.gif";
        document.getElementById("frmTitle").style.display="";
        onload();
    }
}
</script>
    <style type="text/css">
        .style1
        {
            width: 205px;
        }
    </style>
</head>
<body onload="onload();" leftMargin=0 topMargin=0 style="overflow-x:hidden;overflow-y:hidden">
<table border="0" cellpadding="0" cellspacing="0" >
        <tr>
            <td colspan="3" style="height: 79px; background-image: url(images/main/logo.jpg);">
                <div id="Welcome" style="width:29%;margin:10 200;height:8px; color: #3333ff; font-family: 幼圆;">  <%=Session["depname"]%> 欢迎您！</div>         
            </td>
        </tr>
        <tr style="vertical-align: top;">
            <td id="frmTitle" class="style1">
                <iframe frameborder="0" id="left" name="left" scrolling="auto" src="<%=Session["userlevel"].ToString() %>"
                    style="width: 195px; height: 800px; visibility: inherit; z-index: 2;"></iframe>
            </td>
            <td onclick="switchSysBar()" class="but">
                <img id="switchPoint" src="images/main/butClose.gif" alt="关闭左栏" style="border: 0px;
                    width: 12px;" onMouseOver="switchPoint.style.cursor='js/Working.cur';"   
                onMouseOut="switchPoint.style.cursor='auto'"/>
            </td>
            <td>
                <iframe frameborder="0" id="main_right" name="main_right" scrolling="yes" src="Right.aspx"
                    style="width: 1280px; height: 800px; visibility: inherit; z-index: 2; overflow-x: hidden;">
                </iframe>
                
            </td>
        </tr>
</table>
<script language="javascript" type="text/javascript">
   
    function onload()
    {
        var width = document.body.clientWidth - 207;
        var height = document.body.clientHeight - 78;
        document.getElementById("main_right").style.width = width > 0 ? width : 0;
        document.getElementById("main_right").style.height = height> 0 ? height : 0;
        document.getElementById("left").style.height = height > 0 ? height : 0;
       
    }
    window.onresize = onload;
</script>
</body>
</html>