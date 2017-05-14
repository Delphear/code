function checkAll()
{
	var objdel;
	objdel=document.forms[0].elements;
	for (var i=0 ;i<objdel.length-2;i++)
	{
		objdel[i].checked=true;
	}
}

function checkNone()
{
	var objdel;
	objdel=document.forms[0].elements;
	for (var i=0 ;i<objdel.length-2;i++)
	{
		objdel[i].checked=false;
	}
}

function checkRev()
{
	var objdel;
	objdel=document.forms[0].elements;
	for (var i=0 ;i<objdel.length-2;i++)
	{
		if (objdel[i].checked==true)
			objdel[i].checked=false;
		else
			objdel[i].checked=true;
	}
}
