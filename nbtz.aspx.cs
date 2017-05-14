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

public partial class nbtz : Sper.baseadmin
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
        string sqlstr = "select * from h_tongzhi order by id desc";
        DataView dv = DbHelperSQL.Query(sqlstr).Tables[0].DefaultView;
        PagedDataSource pds = new PagedDataSource();
        AspNetPager1.RecordCount = dv.Count;
        pds.DataSource = dv;
        pds.AllowPaging = true;
        pds.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1;
        pds.PageSize = AspNetPager1.PageSize;
        this.Repeater1.DataSource = pds;
        this.Repeater1.DataBind();

    }
    protected void AspNetPager1_PageChanged(object src, EventArgs e)
    {
        binddr();
    }
    public string ck(object article)
    {
        int ID = int.Parse(article.ToString());
        string sql = "select * from h_j_tongzhi where fid=" + ID + " and uid=" + int.Parse(Session["adminid"].ToString()) + "";
        DataTable dtTable = DbHelperSQL.Query(sql).Tables[0];
        string ck;
        if (dtTable.Rows.Count == 0)
        {
            ck = "<font color=red>未查看</font>";
        }
        else
        {
            ck = "<font color=green>已查看</font>";

        }
        return ck;
    }
}
