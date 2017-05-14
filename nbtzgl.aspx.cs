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

public partial class nbtzgl : Sper.baseadmin
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

    protected void Btnbj_Click(object sender, CommandEventArgs e) //修改
    {
        Literal1.Text = "修改通知";
        Panel1.Visible = true;
        string ID = (e.CommandName).ToString();
        Literal2.Text = ID;
        string sql = "select * from h_tongzhi where id=" + ID;
        DataTable dt = DbHelperSQL.Query(sql).Tables[0];
        this.TextBox1.Text = dt.Rows[0]["标题"].ToString();
        this.TextBox2.Text = dt.Rows[0]["内容"].ToString();
       
    }
    protected void BtnDel_Click(object sender, CommandEventArgs e) //删除
    {
        string ID = (e.CommandName).ToString();
        string sql = "delete from h_tongzhi where id=" + ID;
        DbHelperSQL.Query(sql);
        binddr();
        Panel1.Visible = false;
    }
    protected void bc_Click(object sender, ImageClickEventArgs e)//保存
    {
        string strErr = "";
        if (TextBox1.Text == "")
        {
            strErr += "标题不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        strErr = "";
        if (TextBox2.Text == "")
        {
            strErr += "内容不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        if (Literal2.Text != "")
        {
            int ID = int.Parse(Literal2.Text);
            string sql = "update h_tongzhi set 标题='" + TextBox1.Text + "',内容='" + TextBox2.Text + "' where id=" + ID;
            DbHelperSQL.Query(sql);           
        }
        else
        {
            string sql = "Insert into h_tongzhi(标题,内容,发布时间,发布人) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + DateTime.Now.ToString("D") + "','" + Session["depname"].ToString() + "')";
            DbHelperSQL.Query(sql);
        }
        binddr();
        Panel1.Visible = false;
    }
    protected void gb_Click(object sender, ImageClickEventArgs e)//关闭
    {
        Panel1.Visible = false;
    }
    protected void xj_Click(object sender, ImageClickEventArgs e)//新建
    {
        Literal1.Text = "新建通知";
        Panel1.Visible = true;
        TextBox1.Text = "";
        TextBox2.Text = "";
        Literal2.Text = "";
    }
}