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

public partial class bookxx : Sper.baseadmin
{

    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        if (Session["adminid"] != null)
        {
            if (!IsPostBack)
            {
                string sql;
                DataTable dtTable;
                int ID = Convert.ToInt32(Request.QueryString["id"]);
                sql = "SELECT * FROM h_book WHERE id=" + ID;
                dtTable = DbHelperSQL.Query(sql).Tables[0];
                Literal1.Text = dtTable.Rows[0]["内容"].ToString();
                Literal2.Text = "发帖人：" + dtTable.Rows[0]["发布人"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发帖日期：" + dtTable.Rows[0]["发布日期"].ToString();
                binddr();
                //查看录入
                sql = "SELECT * FROM h_j_book WHERE uid=" + int.Parse(Session["adminid"].ToString()) + " and fid=" + ID;
                dtTable = DbHelperSQL.Query(sql).Tables[0];
                if (dtTable.Rows.Count == 0)
                {
                    sql = "Insert into h_j_book (uid,fid) values(" + int.Parse(Session["adminid"].ToString()) + "," + ID + ")";
                    DbHelperSQL.Query(sql);
                }
            }
        }
        else
        {
            Response.Write("<script type='text/javascript'> top.location.href='logout.aspx';</script>");
        }


    }


    public void binddr()
    {
        Panel1.Visible = true;
        int ID = Convert.ToInt32(Request.QueryString["id"]);
        string sql = "SELECT * FROM h_book WHERE sid=" + ID + " ORDER BY id desc";
        DataView dv = DbHelperSQL.Query(sql).Tables[0].DefaultView;
        PagedDataSource pds = new PagedDataSource();
        AspNetPager1.RecordCount = dv.Count;
        pds.DataSource = dv;
        pds.AllowPaging = true;
        pds.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1;
        pds.PageSize = AspNetPager1.PageSize;
        this.Repeater1.DataSource = pds;
        this.Repeater1.DataBind();
        TextBox1.Text = "";

    }
    protected void AspNetPager1_PageChanged(object src, EventArgs e)
    {
        binddr();
    }
    protected void bc_Click(object sender, ImageClickEventArgs e)//发表评价
    {
        string strErr = "";
        if (TextBox1.Text == "")
        {
            strErr += "跟帖内容不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        int ID = Convert.ToInt32(Request.QueryString["id"]);
        string sql = "Insert into h_book(sid,内容,发布日期,发布人) values('" + ID + "','" + TextBox1.Text + "','" + System.DateTime.Now.ToString("yyyy-MM-dd  HH:mm") + "','" + Session["depname"].ToString() + "')";
        DbHelperSQL.Query(sql);
        binddr();

    }

}