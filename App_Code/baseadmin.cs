using System;

using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


namespace Sper
{
    /// <summary>
    /// baseadmin 的摘要说明
    /// </summary>
    public class baseadmin : System.Web.UI.Page
    {
        public string site_name = "佰度房产内部办公系统";
        public string url_name = "";
        public string admin_id ;
        public baseadmin()
        {
            this.Title = site_name;
            
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }

        protected virtual void Page_LoadComplete(object sender, EventArgs e)
        {
            //((Label)Master.FindControl("Label_thisname")).Text = url_name;
        }
        protected  virtual void Page_Load(object sender, System.EventArgs e)
        {
            if (Session["adminid"] != null)
            { admin_id = Session["adminid"].ToString();
              System.Diagnostics.Debug.WriteLine(admin_id);
            }
            else
            {
                MessageBox.ResponseScript("top.location.href='Default.aspx'");
            }
        }
    }
}