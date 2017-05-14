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

public partial class tzck : Sper.baseadmin
{
    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        if (Session["adminid"] != null)
        {
            if (!IsPostBack)
            {
                int ID = Convert.ToInt32(Request.QueryString["id"]);
                string sql = "select * from h_tongzhi where id=" + ID;
                DataTable dtTable = DbHelperSQL.Query(sql).Tables[0];
                Literal1.Text = dtTable.Rows[0]["标题"].ToString();
                Literal2.Text = dtTable.Rows[0]["内容"].ToString();
                //查看录入
                sql = "SELECT * FROM h_j_tongzhi WHERE uid=" + int.Parse(Session["adminid"].ToString()) + " and fid=" + ID;
                dtTable = DbHelperSQL.Query(sql).Tables[0];
                if (dtTable.Rows.Count == 0)
                {
                    sql = "Insert into h_j_tongzhi(uid,fid) values(" + int.Parse(Session["adminid"].ToString()) + "," + ID + ")";
                    DbHelperSQL.Query(sql);
                }
            }
        }
        else
        {
            Response.Write("<script type='text/javascript'> top.location.href='logout.aspx';</script>");
        }  
       
    }
   
}
