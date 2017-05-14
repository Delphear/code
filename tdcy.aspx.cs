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

public partial class tdcy : Sper.baseadmin
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
        string sqlstr = "select * from h_userinf where 2>1 ";

        if (TextBox1.Text != "")
        {
            sqlstr = sqlstr + " and name like '%" + TextBox1.Text + "%'";
        }

        if (TextBox2.Text != "")
        {
            sqlstr = sqlstr + " and 部门 like '%" + TextBox2.Text + "%'";
        }

        sqlstr = sqlstr + "order by ID desc ;";
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
    protected void cx_Click(object sender, ImageClickEventArgs e)
    {
        binddr();
    }
}

