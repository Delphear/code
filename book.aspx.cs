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

public partial class book : Sper.baseadmin
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
        string sqlstr = "select * from h_book where sid=0 order by id desc";
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
    protected void bc_Click(object sender, ImageClickEventArgs e)//保存
    {
        string strErr = "";

        if (TextBox2.Text == "")
        {
            strErr += "内容不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        string sql = "Insert into h_book(内容,发布日期,发布人,sid) values('" + TextBox2.Text + "','" + DateTime.Now + "','" + Session["depname"].ToString() + "',0)";
        DbHelperSQL.Query(sql); 
        binddr();
        Panel1.Visible = false;
    }
    protected void gb_Click(object sender, ImageClickEventArgs e)//关闭
    {
        Panel1.Visible = false;
    }
    protected void xj_Click(object sender, ImageClickEventArgs e)//新建
    {
        Panel1.Visible = true;
        TextBox2.Text = "";
    }
    public string ck(object article)
    {
        int ID = int.Parse(article.ToString());
        string sql = "select * from h_j_book where fid=" + ID + " and uid=" + int.Parse(Session["adminid"].ToString()) + "";
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
