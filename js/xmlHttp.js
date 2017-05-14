// JScript 文件
var request;
function createRequest() {
  try {
    request = new XMLHttpRequest();
  } catch (trymicrosoft) {
    try {
      request = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (othermicrosoft) {
      try {
        request = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (failed) {
        request = false;
      }
    }
  }
  if (!request)
    alert("Error initializing XMLHttpRequest!");
}
//*******
//第一个请求
//*******
function getCustomerInfo(page) {
  createRequest();
  var url='ChangelevelInfo.ashx?Page='+page;
  request.open("GET",url,true);
  request.onreadystatechange=updatepage;
  request.send(null);
}
function updatepage(){
    if(request.readyState==4){
        if(request.status==200){
           printmsg();//处理服务器端返回的信息.
           
        }
    }
    else{
        //alert("信息下载中");
    }
}

function printmsg(){
    var xml=request.responseXML;   
    var date=new Date();                             //获得数据
if(xml==null)return;

var root=xml.documentElement;
if(root)                                                //如果存在

{
     //遍历每条数据，添加到频道数组中
     var list=document.getElementById("mydiv");
     var s="<table border='1' cellpadding='0' cellspacing='0' bordercolor='#F7CEFF' style='border-collapse:collapse align=center>";
     for(var i=0;i<root.childNodes.length;i++)//遍历行
     {
        var rootlist=root.childNodes[i];
        for(var j=0;j<rootlist.childNodes.length;j++)//遍历列
        {
            var s1="<tr>";


            s1+="<TD bgColor='#FAF0FF' height='25'>ID号:"+rootlist.childNodes[0].text+"</TD>"
            s1+="<TD bgColor='#FAF0FF' height='25'>区级编号:"+rootlist.childNodes[1].text+"</TD>"
            s1+="<TD bgColor='#FAF0FF' height='25'>市区名称:"+rootlist.childNodes[2].text+"</TD>"
            s1+="<TD bgColor='#FAF0FF' height='25'>市级编号:"+rootlist.childNodes[3].text+"</TD>"

    
        }
        s1+="</tr>";

        s+=s1
        list.innerHTML=s+"</table>"; 
     }
    
}


}





