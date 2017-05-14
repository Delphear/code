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

public partial class fycjlr : Sper.baseadmin
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
    protected void bc_Click(object sender, ImageClickEventArgs e)//提交
    {
        string strErr = "";
        if (TextBox1.Text == "")
        {
            strErr += "签约人姓名不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        strErr = "";
        if (TextBox2.Text == "")
        {
            strErr += "成交形式不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        strErr = "";
        if (Request["start_time"].ToString() == "")
        {
            strErr += "签约日期不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        strErr = "";
        if (IsDate(Request["start_time"].ToString()))
        {
            strErr += "签约日期格式不正确！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        string start_time;
        if (Request["start_time"].ToString() != "")
        {
            start_time = Request["start_time"].ToString();
        }
        else
        {
            start_time = "";
        }
        //String id=Request["id"].ToString();

        int ID = Convert.ToInt32(Request.QueryString["id"]);
        //int ID = Convert.ToInt32(Request["fid"].ToString());

       // System.Diagnostics.Debug.WriteLine(ID);
        System.Diagnostics.Debug.WriteLine("成交处理ID:" +"******"+ID+"(**)");
//TODO   ID 无法获取到
        //string sql = "update h_fangyuan set 签约人='" + TextBox1.Text.Trim() + "',成交形式='" + TextBox2.Text.Trim().Trim() + "',中介费='" + TextBox3.Text.Trim() + "',签约时间='" + DateTime.Parse(start_time) + "',说明='" + TextBox4.Text + "',qid='" + int.Parse(Session["adminid"].ToString()) + "',成交状况='已成交',成交时间='" + DateTime.Now + "' where id=" + ID;
        //System.Diagnostics.Debug.WriteLine(sql);
        //DbHelperSQL.Query(sql);
        MessageBox.Show(this.Page, "成交信息提交成功！");
        Response.Write(" <script language='javascript'>top.frames('main_right').location.href='wdcjfy.aspx';</script>");
    }
    void binddr()
    {
        //提交人信息
        string sql = "select * from h_userinf where id=" + int.Parse(Session["adminid"].ToString());
        DataTable dt = DbHelperSQL.Query(sql).Tables[0];
        this.TextBox1.Text = dt.Rows[0]["name"].ToString();
        this.Literal1.Text = dt.Rows[0]["部门"].ToString();
        this.TextBox3.Text = "";
        this.TextBox4.Text = "";

    }

    protected void gb_Click(object sender, ImageClickEventArgs e)//重置
    {
        Response.Redirect("fycjlr.aspx");
    }
    public static bool IsDate(string strDate)
    {
        DateTime dtDate;
        bool bValid = false;
        try
        {
            dtDate = DateTime.Parse(strDate);
        }
        catch (FormatException)
        {
            // 如果解析方法失败则表示不是日期性数据
            bValid = true;
        }
        return bValid;
    }
}
