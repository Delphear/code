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

public partial class khdj : Sper.baseadmin
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
    protected void bc_Click(object sender, ImageClickEventArgs e)
    {
        string strErr = "";
        if (TextBox1.Text == "")
        {
            strErr += "客户姓名不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        string qwhx = "";
        if (CheckBox1.Checked == true)
        {
           qwhx = "不限";
        }
        else
        {
            qwhx = DropDownList1.SelectedValue + "间" + DropDownList2.SelectedValue + " 厅" + DropDownList3.SelectedValue + "厨" + DropDownList4.SelectedValue + "卫" + DropDownList5.SelectedValue + "阳台";
        }
        DateTime now = DateTime.Now;
        string khbh = now.Year.ToString() + now.ToString("MM") + now.ToString("dd") + now.ToString("HH") + now.ToString("mm");
        string sql = "Insert into h_kehu(客户编号,客户名称,联系电话,期望区域,期望户型,期望面积,期望楼层,期望价格,租售形式,备注,登记日期,uid,name,固定电话,移动电话,部门) values('" + khbh + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + qwhx + "','" + TextBox4.Text + "','" + TextBox7.Text + "','" + TextBox5.Text + "','" + DropDownList7.SelectedValue + "','" + TextBox6.Text + "','" + DateTime.Now.ToString("D") + "','" + Session["adminid"].ToString() + "','" + Literal1.Text + "','" + Literal4.Text + "','" + Literal2.Text + "','" + Literal3.Text + "')";
        DbHelperSQL.Query(sql);
        MessageBox.Show(this.Page, "客户登记成功！");
        binddr();
    }
    void binddr()
    {
        //登记人信息
        string sql = "select * from h_userinf where id=" + int.Parse(Session["adminid"].ToString());
        DataTable dt = DbHelperSQL.Query(sql).Tables[0];
        this.Literal1.Text = dt.Rows[0]["name"].ToString();
        this.Literal2.Text = dt.Rows[0]["移动电话"].ToString();
        this.Literal3.Text = dt.Rows[0]["部门"].ToString();
        this.Literal4.Text = dt.Rows[0]["固定电话"].ToString();
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        // 下载于www.51aspx.com
    }

    protected void gb_Click(object sender, ImageClickEventArgs e)//重置
    {
        Response.Redirect("khdj.aspx");
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            DropDownList1.Enabled = false;
            DropDownList2.Enabled = false;
            DropDownList3.Enabled = false;
            DropDownList4.Enabled = false;
            DropDownList5.Enabled = false;
        }
        else
        {
            DropDownList1.Enabled = true;
            DropDownList2.Enabled = true;
            DropDownList3.Enabled = true;
            DropDownList4.Enabled = true;
            DropDownList5.Enabled = true;
        }
    }
}
