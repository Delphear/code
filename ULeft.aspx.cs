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

public partial class ULeft : Sper.baseadmin
{
    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        if (Session["adminid"] != null)
        {

            string sql, sql1, sql2, sql3, sql4, sql5;
            DataTable dtTable, dtTable1, dtTable2, dtTable3, dtTable4, dtTable5;
            sql = "SELECT * FROM h_book where sid=0";
            dtTable = DbHelperSQL.Query(sql).Tables[0];
            sql1 = "SELECT * FROM h_j_book WHERE uid=" + int.Parse(Session["adminid"].ToString());
            dtTable1 = DbHelperSQL.Query(sql1).Tables[0];
            Literal3.Text = (dtTable.Rows.Count - dtTable1.Rows.Count).ToString();

            sql2 = "SELECT * FROM h_fangyuan where 成交状况='已成交'";
            dtTable2 = DbHelperSQL.Query(sql2).Tables[0];
            sql3 = "SELECT * FROM h_j_cjly WHERE uid=" + int.Parse(Session["adminid"].ToString());
            dtTable3 = DbHelperSQL.Query(sql3).Tables[0];
            Literal2.Text = (dtTable2.Rows.Count - dtTable3.Rows.Count).ToString();

            sql4 = "SELECT * FROM h_tongzhi";
            dtTable4 = DbHelperSQL.Query(sql4).Tables[0];
            sql5 = "SELECT * FROM h_j_tongzhi WHERE uid=" + int.Parse(Session["adminid"].ToString());
            dtTable5 = DbHelperSQL.Query(sql5).Tables[0];
            Literal1.Text = (dtTable4.Rows.Count - dtTable5.Rows.Count).ToString();
        }
        else
        {
            Response.Write("<script type='text/javascript'> top.location.href='logout.aspx';</script>");
        }
    }
}