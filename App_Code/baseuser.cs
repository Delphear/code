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
    /// baseuser 的摘要说明
    /// </summary>
    public class baseuser : System.Web.UI.Page
    {
        public string site_name="powered by sper002";
        public string url_name = "";
        public string user_id = "";
        public DataSet ds = new DataSet();

        public DataRow config; //全局变量的配置参数。
        public DataTable config_ad; //ad的配置参数。

        public baseuser()
        {


            this.Theme = "tour";
            
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }

        protected virtual void Page_LoadComplete(object sender, EventArgs e)
        {
          //((Label)Master.FindControl("Label1")).Text = url_name;
        }
        protected virtual void PreInit(object sender, EventArgs e)
        {
            
        }
        protected  virtual void Page_Load(object sender, System.EventArgs e)
        {
            siteconfig sc = new siteconfig();
            sc.sitechace();
            sc.getconfig();
            config = sc.config;
            config_ad = sc.config_ad;

            this.Title = config["site_name"].ToString();
            site_name = config["site_name"].ToString();
           

            Session["user_id"] = "1";
            if (Session["user_id"] != null)
            { user_id = Session["user_id"].ToString(); }

        }
      
    }
}