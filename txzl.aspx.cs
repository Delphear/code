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

public partial class txzl : Sper.baseadmin
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
        string sqlstr = "select * from h_tongxunlu where 2>1 ";

        if (TextBox1.Text != "")
        {
            sqlstr = sqlstr + " and 姓名 like '%" + TextBox1.Text + "%'";
        }

        if (TextBox2.Text != "")
        {
            sqlstr = sqlstr + " and 工作单位 like '%" + TextBox2.Text + "%'";
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
    protected void AspNetPager1_PageChanged(object src, EventArgs e)
    {
        binddr();
    }
    protected void cx_Click(object sender, ImageClickEventArgs e)
    {
        binddr();
    }
     protected void Btnbj_Click(object sender, CommandEventArgs e) //修改
    {

        Literal1.Text = "修改通讯录";
        Panel1.Visible = true;
        string ID = (e.CommandName).ToString();
        Literal2.Text = ID;
        string sql = "select * from h_tongxunlu where id=" + ID;
        DataTable dt = DbHelperSQL.Query(sql).Tables[0];

        this.TextBox3.Text = dt.Rows[0]["姓名"].ToString();
        this.TextBox4.Text = dt.Rows[0]["办公电话"].ToString();
        this.TextBox5.Text = dt.Rows[0]["移动电话"].ToString();
        this.TextBox6.Text = dt.Rows[0]["电子邮件"].ToString();
        this.TextBox7.Text = dt.Rows[0]["工作单位"].ToString();
        this.TextBox8.Text = dt.Rows[0]["备注"].ToString();
        this.RadioButtonList1.SelectedValue = dt.Rows[0]["性别"].ToString().Trim();
    }
    protected void BtnDel_Click(object sender, CommandEventArgs e) //删除
    {
        string ID = (e.CommandName).ToString();
        string sql = "delete from h_tongxunlu where id=" + ID;
        DbHelperSQL.Query(sql);
        binddr();
        Panel1.Visible = false;
    }
    protected void bc_Click(object sender, ImageClickEventArgs e)//保存
    {
        string strErr = "";
        if (TextBox3.Text == "")
        {
            strErr += "姓名不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
  

        if (Literal2.Text != "")
        {
            int ID = int.Parse(Literal2.Text);
            string sql = "update h_tongxunlu set 姓名='" + TextBox3.Text + "',办公电话='" + TextBox4.Text.Trim() + "',移动电话='" + TextBox5.Text.Trim() + "',电子邮件='" + TextBox6.Text + "',工作单位='" + TextBox7.Text + "',备注='" + TextBox8.Text + "',性别='" + RadioButtonList1.SelectedValue + "' where id=" + ID;
            DbHelperSQL.Query(sql);
        }
        else
        {
            string sql = "Insert into h_tongxunlu(姓名,办公电话,移动电话,电子邮件,工作单位,备注,性别,uid) values('" + TextBox3.Text + "','" + TextBox4.Text.Trim() + "','" + TextBox5.Text.Trim() + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + RadioButtonList1.SelectedValue + "'," + int.Parse(Session["adminid"].ToString()) + ")";
            DbHelperSQL.Query(sql);
        }

        binddr();
        Panel1.Visible = false;
    }
    protected void gb_Click(object sender, ImageClickEventArgs e)//关闭
    {
        Panel1.Visible = false;
    }

  
    protected void xj_Click(object sender, ImageClickEventArgs e)//新建用户
    {

        Literal1.Text = "新建通讯录";
        Panel1.Visible = true;
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
        TextBox8.Text = "";
        Literal2.Text = "";
    }
}

