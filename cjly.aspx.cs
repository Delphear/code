using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class cjly : Sper.baseadmin
{
    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        if (Session["adminid"] != null)
        {
            if (!IsPostBack)
            {
                binddr();
            }
        }
        else
        {
            Response.Write("<script type='text/javascript'> top.location.href='logout.aspx';</script>");
        }
    }
    public void binddr()
    {
        string sqlstr = "select * from h_fangyuan where 成交状况='已成交' order by 成交时间 desc";
        DataView dv = DbHelperSQL.Query(sqlstr).Tables[0].DefaultView;
        PagedDataSource pds = new PagedDataSource();
        AspNetPager1.RecordCount = dv.Count;
        pds.DataSource = dv;
        pds.AllowPaging = true;
        pds.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1;
        pds.PageSize = AspNetPager1.PageSize;
        this.Repeater1.DataSource = pds;
        this.Repeater1.DataBind();
        // 下载于www.51aspx.com
    }
    protected void AspNetPager1_PageChanged(object src, EventArgs e)
    {
        binddr();
    }
    public string cjjl(object article)
    {
        int ID = int.Parse(article.ToString());
        string sql = "select * from h_fangyuan where id=" + ID + "";
        DataTable dtTable = DbHelperSQL.Query(sql).Tables[0];
        //string sql1 = "select * from h_fangyuan where 签约人='" + dtTable.Rows[0]["签约人"].ToString() + "' and 签约时间 between  '" + DateTime.Parse(start_time) + "' and '" + DateTime.Parse(stop_time) + "'";
        //DataTable dtTable1 = DbHelperSQL.Query(sql1).Tables[0];
        string cjjl;
        cjjl = "<font color=#2F41C7>" + DateTime.Parse(dtTable.Rows[0]["签约时间"].ToString()).ToString("D") + "成交" + dtTable.Rows[0]["成交形式"].ToString() + "</font>";
        return cjjl;
    }
    public string ck(object article)
    {
        int ID = int.Parse(article.ToString());
        string sql = "select * from h_j_cjly where fid=" + ID + " and uid=" + int.Parse(Session["adminid"].ToString()) + "";
        DataTable dtTable = DbHelperSQL.Query(sql).Tables[0];
        string ck;
        if (dtTable.Rows.Count == 0)
        {
            ck = "<font color=red>未查看</font>";
        }
        else
        {
            ck = "<font color=green>已查看</font>";
            // 下载于www.51aspx.com
        }
        return ck;
    }
}
