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

public partial class yhgl : Sper.baseadmin
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
    void binddr()
    {
        string sql = "select * from h_userinf order by id desc";
        DataView dv = DbHelperSQL.Query(sql).Tables[0].DefaultView;
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

        Literal1.Text = "修改用户";
        Panel1.Visible = true;
        string ID = (e.CommandName).ToString();
        Literal2.Text = ID;
        string sql = "select * from h_userinf where id=" + ID;
        DataTable dt = DbHelperSQL.Query(sql).Tables[0];
        this.TextBox1.Text = dt.Rows[0]["name"].ToString();
        this.TextBox2.Text = dt.Rows[0]["username"].ToString();
        this.TextBox3.Text = dt.Rows[0]["password"].ToString();
        this.TextBox4.Text = dt.Rows[0]["部门"].ToString();
        this.TextBox5.Text = dt.Rows[0]["岗位"].ToString();
        this.TextBox6.Text = dt.Rows[0]["固定电话"].ToString();
        this.TextBox7.Text = dt.Rows[0]["移动电话"].ToString();
        this.TextBox8.Text = dt.Rows[0]["备注"].ToString();
        this.TextBox9.Text = dt.Rows[0]["qq"].ToString();
        this.RadioButtonList1.SelectedValue = dt.Rows[0]["性别"].ToString().Trim();
        this.DropDownList1.SelectedValue = dt.Rows[0]["权限"].ToString().Trim ();
        if (TextBox2.Text == "admin")
        {
            TextBox2.Enabled = false;
            DropDownList1.Enabled = false;
        }
        else
        {
            TextBox2.Enabled = true;
            DropDownList1.Enabled = true;
        }

    }
    protected void BtnDel_Click(object sender, CommandEventArgs e) //删除
    {
        string ID = (e.CommandName).ToString();
        string sql = "delete from h_userinf where id=" + ID;
        DbHelperSQL.Query(sql);
        binddr();
        Panel1.Visible = false;
    }
    protected void bc_Click(object sender, ImageClickEventArgs e)//保存
    {
        string strErr = "";
        if (TextBox1.Text == "")
        {
            strErr += "用户姓名不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
  
        if (TextBox2.Text == "")
        {
            strErr += "登陆名不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
       
        
        strErr = "";
        if (TextBox3.Text == "")
        {
            strErr += "登陆密码不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        strErr = "";
        if (TextBox4.Text == "")
        {
            strErr += "部门不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        strErr = "";
        if (TextBox5.Text == "")
        {
            strErr += "岗位不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        if (Literal2.Text != "")
        {
            int ID = int.Parse(Literal2.Text);
            string sql = "update h_userinf set name='" + TextBox1.Text + "',username='" + TextBox2.Text.Trim() + "',password='" + TextBox3.Text.Trim() + "',部门='" + TextBox4.Text + "',岗位='" + TextBox5.Text + "',固定电话='" + TextBox6.Text + "',移动电话='" + TextBox7.Text + "',备注='" + TextBox8.Text + "',权限='" + DropDownList1.SelectedValue + "',性别='" + RadioButtonList1.SelectedValue + "',qq='" + TextBox9.Text + "' where id=" + ID;
            DbHelperSQL.Query(sql);
        }
        else
        {
            string sql1 = "select * from h_userinf";
            DataTable dtTable1 = DbHelperSQL.Query(sql1).Tables[0];
            for (int i = 0; i < dtTable1.Rows.Count; i++)
            {
                strErr = "";
                if (TextBox2.Text == dtTable1.Rows[i]["username"].ToString().Trim())
                {
                    strErr += "登录名已存在，不允许增加！\\n";
                }

                if (strErr != "")
                {
                    MessageBox.Show(this, strErr);
                    return;
                }
            }
            string sql = "Insert into h_userinf(name,username,password,部门,岗位,固定电话,移动电话,备注,性别,权限,qq) values('" + TextBox1.Text + "','" + TextBox2.Text.Trim() + "','" + TextBox3.Text.Trim() + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + RadioButtonList1.SelectedValue + "','" + DropDownList1.SelectedValue + "','" + TextBox9.Text + "')";
            DbHelperSQL.Query(sql);
        }

        binddr();
        Panel1.Visible = false;
    }
    protected void gb_Click(object sender, ImageClickEventArgs e)//关闭
    {
        Panel1.Visible = false;
    }

    public string delShow(object article)
    {

        string fsShow = (string)article;

        if (fsShow.ToString().Trim() == "admin")
        {
            fsShow = "";
        }

        else
        {
            fsShow = "【删除】";
        }

        return fsShow;

    }
    protected void xj_Click(object sender, ImageClickEventArgs e)//新建用户
    {

        Literal1.Text = "新建用户";
        Panel1.Visible = true;
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
        TextBox8.Text = "";
        TextBox9.Text = "";
        Literal2.Text = "";
    }
}
