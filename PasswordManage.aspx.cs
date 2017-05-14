using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class PasswordManage : Sper.baseadmin 
{

    protected override void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminid"] != null)
        {
            if (!IsPostBack)
            {
          
            }
        }
        else
        {
            Response.Write("<script type='text/javascript'> top.location.href='logout.aspx';</script>");
        }  
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {

            string depid = Session["adminid"].ToString().Trim();
            string OldPwd = this.TextBox1.Text;
            string NewPwd = this.TextBox2.Text;
            string sql = "Select password from h_userinf where  id='" + depid + "';";
            DataTable dtTable = DbHelperSQL.Query(sql).Tables[0];
            if (OldPwd == dtTable.Rows[0]["password"].ToString())
            {
                sql = "Update h_userinf set password='" + NewPwd + "' where id='" + depid + "';";
                DbHelperSQL.Query(sql);
                MessageBox.Show(this.Page, "密码修改成功，下次请用新密码登陆！");
            }
            else
            {
                MessageBox.Show(this.Page, "原密码输入不正确,请重新输入！");

            }
        

    }

  
}
