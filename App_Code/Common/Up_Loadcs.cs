using System;
using System.IO;
namespace Sper
{
	/// <summary>
	/// Up_Loadcs 的摘要说明。
	/// </summary>
	public class Up_Loadcs
	{
		public string Up(System.Web.UI.HtmlControls.HtmlInputFile File2)
		{
			//
			// TODO: 在此处添加构造函数逻辑
			//
		
			if (File2.PostedFile.ContentLength.ToString() == "0")
			{
				 return "上传失败或指定的文件不存在";
			}
			else
			{
				//获取文件名称
				string ss ;
				ss =System.DateTime.Now.ToString().Replace("-","").Replace(" ","").Replace(":","")+Path.GetExtension(File2.PostedFile.FileName);
				if (File2.PostedFile.ContentLength/1024>10240)
				{return "您的文件过大，不能上传！";}
				else
				{
					string ty=File2.PostedFile.ContentType;
					if (ty=="image/gif"||ty=="image/pjpeg")
					{
                        File2.PostedFile.SaveAs(System.Web.HttpContext.Current.Server.MapPath("~/Uploads/") + ss);
						return ss;
						//Up= ss;
					}
					else
					{return "限制上传！";}
				}
			}
		
		}
		
		
	}
}
