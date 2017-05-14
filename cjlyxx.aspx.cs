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

public partial class cjlyxx : Sper.baseadmin
{

    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        if (Session["adminid"] != null)
        {
            if (!IsPostBack)
            {
                int ID = Convert.ToInt32(Request.QueryString["id"]);
                string sql2 = "SELECT uid FROM h_fangyuan WHERE id=" + ID;
                DataTable dtTable2 = DbHelperSQL.Query(sql2).Tables[0];
                string sql1 = "SELECT id FROM h_userinf WHERE id=" + int.Parse(dtTable2.Rows[0]["uid"].ToString());
                DataTable dtTable1 = DbHelperSQL.Query(sql1).Tables[0];
                string sql;
                DataTable dtTable;
                if (dtTable1.Rows.Count > 0)//判断是否有此用户
                {
                    sql = "SELECT B.辖区,B.街道,B.小区,B.编号,B.签约人,B.成交形式,B.中介费,B.签约时间,B.说明,B.成交状况,R.name,R.部门,R.固定电话,R.移动电话 FROM h_fangyuan AS B,h_userinf AS R WHERE B.uid=R.id and B.id=" + ID;
                    dtTable = DbHelperSQL.Query(sql).Tables[0];

                }
                else
                {
                    sql = "SELECT * FROM h_fangyuan WHERE id=" + ID;
                    dtTable = DbHelperSQL.Query(sql).Tables[0];
                }

                Literal12.Text = dtTable.Rows[0]["编号"].ToString();    
                Literal1.Text = dtTable.Rows[0]["name"].ToString();
                Literal2.Text = dtTable.Rows[0]["固定电话"].ToString();
                Literal6.Text = dtTable.Rows[0]["移动电话"].ToString();
                Literal3.Text = dtTable.Rows[0]["部门"].ToString();
                Literal5.Text = dtTable.Rows[0]["辖区"].ToString() + "/" + dtTable.Rows[0]["街道"].ToString() + "/" + dtTable.Rows[0]["小区"].ToString();

                if (dtTable.Rows[0]["成交状况"].ToString() == "已成交")
                {
                    Literal13.Text = dtTable.Rows[0]["签约人"].ToString();
                    Literal14.Text = dtTable.Rows[0]["成交形式"].ToString();
                    Literal15.Text = dtTable.Rows[0]["中介费"].ToString();
                    Literal16.Text = DateTime.Parse(dtTable.Rows[0]["签约时间"].ToString()).ToString("D");
                    Literal17.Text = dtTable.Rows[0]["说明"].ToString();
                }
                binddr();
                //查看录入
                sql = "SELECT * FROM h_j_cjly WHERE uid=" + int.Parse(Session["adminid"].ToString()) + " and fid=" + ID;
                dtTable = DbHelperSQL.Query(sql).Tables[0];
                if (dtTable.Rows.Count ==0)
                {
                sql = "Insert into h_j_cjly(uid,fid) values(" + int.Parse(Session["adminid"].ToString()) + "," + ID + ")";
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
        string sql = "SELECT * FROM h_cjly WHERE fid=" + ID + " ORDER BY id desc";
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
            strErr += "评论内容不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        int ID = Convert.ToInt32(Request.QueryString["id"]);
        string sql = "Insert into h_cjly(fid,评价内容,评价时间,评价人) values('" + ID + "','" + TextBox1.Text + "','" + System.DateTime.Now.ToString("yyyy-MM-dd  HH:mm") + "','" + Session["depname"].ToString() + "')";
        DbHelperSQL.Query(sql);
        binddr();

    }

}