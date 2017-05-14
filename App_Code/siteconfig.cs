using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// config 的摘要说明
/// </summary>
public class siteconfig
{
    public DataSet ds = new DataSet();
    public DataRow config; //全局变量的配置参数。
    public DataTable config_ad; //ad的配置参数。
    public siteconfig()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 得到配置参数!
    /// </summary>
    public void getconfig()
    {
        config = ds.Tables[0].Rows[0];
        config_ad = ds.Tables[2];

    }
    /// <summary>
    /// 配置全局缓存
    /// </summary>
    public void sitechace()
    {
        if (DataCache.GetCache("Crds") == null)
        {
            string sql = "select * from config;"
                        + "select * from news_class;"
                         +"select * from config_ad";

            DataSet dy = DbHelperSQL.Query(sql);
            ds = dy;
            DataCache.SetCache("Crds", dy) ;
        }
        else
        {
            ds = (DataSet)DataCache.GetCache("Crds");
        }
    }
    /// <summary>
    /// 配置全局缓存
    /// </summary>
    public void resitechace()
    {
        string sql = "select * from config;"
                       + "select * from news_class;"
                         + "select * from config_ad";

        DataSet dy = DbHelperSQL.Query(sql);
        ds = dy;
        DataCache.SetCache("Crds", dy);
    }
}
