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

public partial class fyxx1 : Sper.baseadmin
{

    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        if (Session["adminid"] != null)
        {
            if (!IsPostBack)
            {
                int ID = Convert.ToInt32(Request.QueryString["id"]);
                Literal33.Text = Request.QueryString["id"].ToString();
                string sql2 = "SELECT uid FROM h_fangyuan WHERE id=" + ID;
                DataTable dtTable2 = DbHelperSQL.Query(sql2).Tables[0];
                string sql1 = "SELECT id FROM h_userinf WHERE id=" + int.Parse(dtTable2.Rows[0]["uid"].ToString());
                DataTable dtTable1 = DbHelperSQL.Query(sql1).Tables[0];
                string sql;
                DataTable dtTable;
                if (dtTable1.Rows.Count > 0)//判断是否有此用户
                {
                    sql = "SELECT B.签约人,B.成交形式,B.中介费,B.签约时间,B.说明,B.辖区,B.街道,B.小区,B.详细地址,B.公交线路,B.环境描述,B.房屋户型,B.建筑结构,B.使用性质,B.建筑年代,B.房屋现状,B.房屋类型,B.楼层情况,B.编号,B.一梯几户,B.朝向,B.装修状况,B.建筑面积,B.房主报价,B.月租,B.配套设施,B.产权证状况,B.产权性质,B.产权证是否在公司,B.产权证,B.购房合同发票,B.钥匙是否在公司,B.土地证状况,B.本公司独家代理,B.售租形式,B.房源备注,B.成交状况,R.name,R.部门,R.固定电话,R.移动电话 FROM h_fangyuan AS B,h_userinf AS R WHERE B.uid=R.id and B.id=" + ID;
                    dtTable = DbHelperSQL.Query(sql).Tables[0];

                }
                else
                {
                    sql = "SELECT * FROM h_fangyuan WHERE id=" + ID;
                    dtTable = DbHelperSQL.Query(sql).Tables[0];
                }

                Literal1.Text = dtTable.Rows[0]["辖区"].ToString() + "/" + dtTable.Rows[0]["街道"].ToString() + "/" + dtTable.Rows[0]["小区"].ToString();
                Literal2.Text = dtTable.Rows[0]["详细地址"].ToString();
                Literal3.Text = dtTable.Rows[0]["公交线路"].ToString();
                Literal4.Text = dtTable.Rows[0]["环境描述"].ToString();
                Literal5.Text = dtTable.Rows[0]["房屋户型"].ToString();
                Literal6.Text = dtTable.Rows[0]["建筑结构"].ToString();
                Literal7.Text = dtTable.Rows[0]["使用性质"].ToString();
                Literal8.Text = dtTable.Rows[0]["建筑年代"].ToString();
                Literal9.Text = dtTable.Rows[0]["房屋现状"].ToString();
                Literal10.Text = dtTable.Rows[0]["房屋类型"].ToString();
                Literal11.Text = dtTable.Rows[0]["楼层情况"].ToString();
                Literal12.Text = dtTable.Rows[0]["编号"].ToString();
                Literal13.Text = dtTable.Rows[0]["一梯几户"].ToString();
                Literal14.Text = dtTable.Rows[0]["朝向"].ToString();
                Literal15.Text = dtTable.Rows[0]["装修状况"].ToString();
                Literal16.Text = dtTable.Rows[0]["建筑面积"].ToString();
                Literal17.Text = dtTable.Rows[0]["房主报价"].ToString();
                Literal18.Text = dtTable.Rows[0]["月租"].ToString();
                Literal19.Text = dtTable.Rows[0]["配套设施"].ToString();
                Literal20.Text = dtTable.Rows[0]["产权证状况"].ToString();
                Literal21.Text = dtTable.Rows[0]["产权性质"].ToString();
                Literal22.Text = dtTable.Rows[0]["产权证是否在公司"].ToString();
                Literal23.Text = dtTable.Rows[0]["产权证"].ToString();
                Literal24.Text = dtTable.Rows[0]["购房合同发票"].ToString();
                Literal25.Text = dtTable.Rows[0]["钥匙是否在公司"].ToString();
                Literal26.Text = dtTable.Rows[0]["土地证状况"].ToString();
                Literal27.Text = dtTable.Rows[0]["本公司独家代理"].ToString();
                Literal28.Text = dtTable.Rows[0]["售租形式"].ToString();
                Literal29.Text = dtTable.Rows[0]["name"].ToString();
                Literal30.Text = dtTable.Rows[0]["固定电话"].ToString();
                Literal37.Text = dtTable.Rows[0]["移动电话"].ToString();
                Literal31.Text = dtTable.Rows[0]["部门"].ToString();
                Literal32.Text = dtTable.Rows[0]["房源备注"].ToString();
                if (dtTable.Rows[0]["成交状况"].ToString() == "未成交")
                {
                    Image1.Visible = true;
                }
                else if (dtTable.Rows[0]["成交状况"].ToString() == "已成交")
                {
                    Literal36.Text = "签约人:" + dtTable.Rows[0]["签约人"].ToString() + "   成交形式:" + dtTable.Rows[0]["成交形式"].ToString() + "   中介费:" + dtTable.Rows[0]["中介费"].ToString() + "元" + "   签约时间:" + DateTime.Parse(dtTable.Rows[0]["签约时间"].ToString()).ToString("D") + "   说明:" + dtTable.Rows[0]["说明"].ToString();
                }
                binddr();
            }
        }
        else
        {
            Response.Write("<script type='text/javascript'> top.location.href='logout.aspx';</script>");
        }


    }

    protected void pj_Click(object sender, ImageClickEventArgs e)//跟进信息
    {
        if (Panel1.Visible == true)
        {
            Panel1.Visible = false;
        }
        else
        {
            binddr();
        }
    }
    public void binddr()
    {
        Panel1.Visible = true;
        int ID = Convert.ToInt32(Request.QueryString["id"]);
        string sql = "SELECT * FROM h_fypj WHERE fid=" + ID + " ORDER BY id desc";
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
        string sql = "Insert into h_fypj(fid,评价内容,评价时间,评价人) values('" + ID + "','" + TextBox1.Text + "','" + System.DateTime.Now.ToString("yyyy-MM-dd  HH:mm") + "','" + Session["depname"].ToString() + "')";
        DbHelperSQL.Query(sql);
        binddr();

    }

}