using System;
using System.IO;
namespace Sper
{
	/// <summary>
	/// Up_Loadcs ��ժҪ˵����
	/// </summary>
	public class Up_Loadcs
	{
		public string Up(System.Web.UI.HtmlControls.HtmlInputFile File2)
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
			//
		
			if (File2.PostedFile.ContentLength.ToString() == "0")
			{
				 return "�ϴ�ʧ�ܻ�ָ�����ļ�������";
			}
			else
			{
				//��ȡ�ļ�����
				string ss ;
				ss =System.DateTime.Now.ToString().Replace("-","").Replace(" ","").Replace(":","")+Path.GetExtension(File2.PostedFile.FileName);
				if (File2.PostedFile.ContentLength/1024>10240)
				{return "�����ļ����󣬲����ϴ���";}
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
					{return "�����ϴ���";}
				}
			}
		
		}
		
		
	}
}
