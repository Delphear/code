var imgWidth=64;   //The images width in the imgBox;
var imgHeight=64;  //The images height in the imgBox;
var selectedNo=1;  //The image's No which is eslected;
var selecteSize=2; //the count of items which be show in the list;
var imgSrc="head/Êý×ÖÐòºÅ.gif";  //Don't Replace "Êý×ÖÐòºÅ" to figure;
var isnum="Êý×ÖÐòºÅ";
var init=0;

/*************  Write images   *************/
var myHTML='<SPAN onmouseover="isin=true" onmouseout="isin=false">';
myHTML+='<table width="1" onclick="showlist(this)" title="Ñ¡ÔñÌáÊ¾¿ò" border="0" cellspacing="0" cellpadding="0"><tr><td><img name="imgselected" border=0 src="'+imgSrc.replace("Êý×ÖÐòºÅ",selectedNo)+'" WIDTH='+(imgWidth)+' HEIGHT='+imgHeight+'></td><td valign=top><img src="images/menu.gif"></td></tr></table>';
myHTML+='<DIV onscroll="scrollud()" id="imgBox" \n';
myHTML+='style="position:absolute;left=-800;top=0;background-color:#FFFFFF;border: 1px solid #000000;overflow-x:hidden;overflow-y:scroll; width:'+(imgWidth+20)+'px; height: '+imgHeight*selecteSize+'px">';
for(i=1;i<31;i++){
  myHTML+="<img listID="+i+" src='"+imgSrc.replace("Êý×ÖÐòºÅ",i)+"' alt='"+imgSrc.replace("Êý×ÖÐòºÅ",i)+"' width="+imgWidth+" height="+imgHeight+" onclick='selectme(this)' onload='if(init)init()'><BR>";
}
myHTML+= "</DIV></SPAN>";
imgBox.outerHTML=myHTML;

/****** show or hide list *****/
function showlist(obj){
  if(imgBox.style.pixelLeft!=-800){imgBox.style.pixelLeft=-800; return;}
  
  var mytop=obj.offsetTop; 
  var myleft=obj.offsetLeft; 
  while(obj=obj.offsetParent){ 
    myleft+=obj.offsetLeft; 
    mytop+=obj.offsetTop; 
  }
  imgBox.style.left=myleft;
  imgBox.style.top=mytop+imgHeight+2;

}

var isin=false;
function selectme(obj){
  if(!isin||obj){imgBox.style.pixelLeft=-800;}
  if(obj){
    lunjily.myhead.value=isnum.replace("Êý×ÖÐòºÅ",obj.listID);
    document.images["imgselected"].src=imgSrc.replace("Êý×ÖÐòºÅ",obj.listID);
  }
}

/***** Scroll to appropriate position *****/
var mytime=setTimeout("",0);
var pre_X=0;
function scrollud(){
  var current_X=imgBox.scrollTop;
  if(current_X>pre_X && imgBox.scrollTop< Math.ceil(imgBox.scrollTop/imgHeight)*imgHeight){
    clearTimeout(mytime);
    mytime=setTimeout("imgBox.scrollTop=Math.round(imgBox.scrollTop+1);",1);
  }
  else if(current_X<pre_X && imgBox.scrollTop> Math.floor(imgBox.scrollTop/imgHeight)*imgHeight){
    clearTimeout(mytime);
    mytime=setTimeout("imgBox.scrollTop=Math.round(imgBox.scrollTop-1);",1);
  }
  pre_X=current_X;
}

function init(){
init=1;
  imgBox.scrollTop=selectedNo*imgHeight;
  lunjily.myhead.value=isnum.replace("Êý×ÖÐòºÅ",selectedNo);
}

myActivation="selectme(null)";
if(document.body.onclick)
{
eval(document.body.onclick.toString().replace('anonymous()','bodyclick()'));
document.body.onclick=new Function("bodyclick();"+myActivation);
}
else document.body.onclick=new Function(myActivation);