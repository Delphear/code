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

public partial class wdkh : Sper.baseadmin
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
        if (Session["adminid"] != null)
        {
            string sqlstr = "select * from h_kehu where 2>1 ";

            if (TextBox1.Text != "")
            {
                sqlstr = sqlstr + " and 客户名称 like '%" + TextBox1.Text + "%'";
            }
            if (TextBox2.Text != "")
            {
                sqlstr = sqlstr + " and 期望区域 like '%" + TextBox2.Text + "%'";
            }
            if (TextBox3.Text != "")
            {
                sqlstr = sqlstr + " and 期望面积 like '%" + TextBox3.Text + "%'";
            }
            if (TextBox4.Text != "")
            {
                sqlstr = sqlstr + " and 期望楼层 like '%" + TextBox4.Text + "%'";
            }
            if (TextBox5.Text != "")
            {
                sqlstr = sqlstr + " and 期望价格 like '%" + TextBox5.Text + "%'";
            }
            if (DropDownList1.SelectedValue != "不限")
            {
                sqlstr = sqlstr + " and 租售形式 = '" + DropDownList1.SelectedValue + "'";
            }

            sqlstr = sqlstr + "and uid =" + int.Parse(Session["adminid"].ToString()) + "order by ID desc ;";
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
        else
        {
            Response.Write("Default.aspx");
        }

    }
    protected void cx_Click(object sender, ImageClickEventArgs e)
    {
        binddr();
    }
    protected void AspNetPager1_PageChanged(object src, EventArgs e)
    {
        binddr();
    }
    protected void BtnDel_Click(object sender, CommandEventArgs e) //删除
    {
        string ID = (e.CommandName).ToString();
        string sql = "delete from h_kehu where id=" + ID;
        DbHelperSQL.Query(sql);
        binddr();
    }
}
