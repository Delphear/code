using System;
using System.Data;
//该源码下载自www.51aspx.com(５１ａｓｐｘ．ｃｏｍ)

namespace Sp
{
	/// <summary>
	/// login 的摘要说明。
	/// </summary>
	public class login
	{   public static string Biao="sp_user";
		public login()
		{
			//
			// TODO: 在此处添加构造函数逻辑
			//
		}
		public static void lo(string usn,string pwd)
		{
			string sql="SELECT id FROM "+Biao+" where UserName='"+usn+"' and UserPassword='"+pwd+"'";
			DataTable dt=Sp.Base.ExecuteSql4Ds(sql).Tables[0];
			if (dt.Rows.Count>0)
			{
				System.Web.HttpContext.Current.Session["Uid"]=dt.Rows[0]["ID"];
                System.Web.HttpContext.Current.Response.Write("<script>location.href='List.aspx';top.Left.location.href='Userinfo.aspx';</script>");
			}
			else
			{System.Web.HttpContext.Current.Response.Redirect("msg.aspx?msg=您的用户名或密码错误，请核对后再登陆！");}
			
		}
		public static void chlog()
		{
			if (System.Web.HttpContext.Current.Session["Uid"]==null)
			{Out();}
			
		}

		public static void adminlo(string usn,string pwd)
		{
			string sql="SELECT id FROM Bet_admincenter where adminName='"+usn+"' and adminPass='"+pwd+"'";
			DataTable dt=Sp.Base.ExecuteSql4Ds(sql).Tables[0];
			if (dt.Rows.Count>0)
			{
				System.Web.HttpContext.Current.Session["AdminUid"]=dt.Rows[0]["ID"];
                System.Web.HttpContext.Current.Response.Write("<script>top.location.href='index.htm';</script>");
			}
			else
			{
                //Sp.Functions.JsAlerT("您的用户或密码错误,请核对后再登陆!");;
            }
			
		}

		public static void adminch()
		{
			if (System.Web.HttpContext.Current.Session["AdminUid"]==null)
			{Out();}
			
		}
		public static void Out()
		{   
			System.Web.HttpContext.Current.Session.Clear();
            System.Web.HttpContext.Current.Response.Write("<script>top.location.href='Default.aspx';</script>");
			System.Web.HttpContext.Current.Response.End();
		}
	}
}
