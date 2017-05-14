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

public partial class Wkhxx : Sper.baseadmin
{

    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        if (Session["adminid"] != null)
        {
            if (!IsPostBack)
            {
                int ID = Convert.ToInt32(Request.QueryString["id"]);
                string sql = "select * from h_kehu where id=" + ID;
                DataTable dtTable = DbHelperSQL.Query(sql).Tables[0];
                Literal1.Text = dtTable.Rows[0]["客户编号"].ToString();
                Literal2.Text = dtTable.Rows[0]["期望区域"].ToString();
                Literal3.Text = dtTable.Rows[0]["期望户型"].ToString();
                Literal4.Text = dtTable.Rows[0]["期望面积"].ToString();
                Literal5.Text = dtTable.Rows[0]["期望楼层"].ToString();
                Literal6.Text = dtTable.Rows[0]["期望价格"].ToString();
                Literal7.Text = dtTable.Rows[0]["租售形式"].ToString();
                Literal8.Text = dtTable.Rows[0]["备注"].ToString();
                Literal12.Text = dtTable.Rows[0]["登记日期"].ToString();
                Literal13.Text = dtTable.Rows[0]["客户名称"].ToString();
                Literal14.Text = dtTable.Rows[0]["联系电话"].ToString();
            }
        }
        else
        {
            Response.Write("<script type='text/javascript'> top.location.href='logout.aspx';</script>");
        }  
        
    }
}