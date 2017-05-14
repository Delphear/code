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

public partial class Right : Sper.baseadmin
{
    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        if (Session["adminid"] != null)
        {
            if (!IsPostBack)
            {
                binddr1();
                binddr2();
                binddr3();
                binddr4();
                binddr5();
                binddr();
            }
        }
        else
        {
            Response.Write("<script type='text/javascript'> top.location.href='logout.aspx';</script>");
        }
    }
    public void binddr1()
    {
        string sqlstr = "select top 8 * from h_fangyuan where 成交状况='未成交' order by ID desc";
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = DbHelperSQL.Query(sqlstr).Tables[0].DefaultView;
        this.Repeater1.DataSource = pds;
        this.Repeater1.DataBind();
    }
    public void binddr2()
    {
        string sqlstr = "select top 8 * from h_kehu  order by ID desc";
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = DbHelperSQL.Query(sqlstr).Tables[0].DefaultView;
        this.Repeater2.DataSource = pds;
        this.Repeater2.DataBind();
    }
    public void binddr3()
    {
        string sqlstr = "select top 8 * from h_fangyuan where 成交状况='已成交' order by 成交时间 desc";
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = DbHelperSQL.Query(sqlstr).Tables[0].DefaultView;
        this.Repeater3.DataSource = pds;
        this.Repeater3.DataBind();
    }
    public void binddr4()
    {
        string sqlstr = "select top 8 * from h_tongzhi  order by ID desc";
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = DbHelperSQL.Query(sqlstr).Tables[0].DefaultView;
        this.Repeater4.DataSource = pds;
        this.Repeater4.DataBind();
    }
    public void binddr5()
    {
        string start_time = System.DateTime.Now.ToString("yyyy-MM-dd");
        string sqlstr = "select * from h_fypj where 评价时间  like '" + start_time + "%' order by id desc";
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = DbHelperSQL.Query(sqlstr).Tables[0].DefaultView;
        this.Repeater6.DataSource = pds;
        this.Repeater6.DataBind();
    }
    public string cjjl(object article)
    {
        int ID = int.Parse(article.ToString());
        string sql = "select * from h_fangyuan where id=" + ID + "";
        DataTable dtTable = DbHelperSQL.Query(sql).Tables[0];
        string cjjl;
        cjjl = "<font color=#2F41C7>" + DateTime.Parse(dtTable.Rows[0]["签约时间"].ToString()).ToString("D") + "成交" + dtTable.Rows[0]["成交形式"].ToString() + "</font>";
        return cjjl;
    }
    public void binddr()
    {

        try
        {
            string[] ArrX;

            string sqlstr = "select * from h_fangyuan where 2>1 ";
            if (fujia.Text == "")
            {
                if (fybh.Text != "")
                {
                    sqlstr = sqlstr + " and 编号 like '%" + PageValidate.ToLikeSql(fybh.Text.ToString().Trim()) + "%'";
                }
                if (TextBox1.Text != "")
                {
                    sqlstr = sqlstr + " and 辖区 like '%" + PageValidate.ToLikeSql(TextBox1.Text.ToString().Trim()) + "%'";
                }
                if (TextBox2.Text != "")
                {
                    sqlstr = sqlstr + " and 街道 like '%" + PageValidate.ToLikeSql(TextBox2.Text.ToString().Trim()) + "%'";
                }
                if (TextBox3.Text != "")
                {
                    sqlstr = sqlstr + " and 小区 like '%" + PageValidate.ToLikeSql(TextBox3.Text.ToString().Trim()) + "%'";
                }
                if (TextBox4.Text != "")
                {
                    sqlstr = sqlstr + " and 房屋户型 like '%" + PageValidate.ToLikeSql(TextBox4.Text.ToString().Trim()) + "%'";
                }
                if (TextBox5.Text != "")
                {
                    ArrX = TextBox5.Text.ToString().Trim().Split('-');
                    if (ArrX.Length == 1)
                    {
                        sqlstr = sqlstr + " and 建筑面积 = '" + ArrX[0] + "'";
                    }
                    else if (ArrX.Length == 2)
                    {
                        sqlstr = sqlstr + " and (建筑面积 >= '" + isnull(ArrX[0], "0") + "' and 建筑面积 <= '" + isnull(ArrX[1], "10000000000000") + "')";
                    }
                }
                if (TextBox6.Text != "")
                {
                    ArrX = TextBox6.Text.ToString().Trim().Split('-');
                    if (ArrX.Length == 1)
                    {
                        sqlstr = sqlstr + " and 第层 = '" + ArrX[0] + "'";
                    }
                    else if (ArrX.Length == 2)
                    {
                        sqlstr = sqlstr + " and (第层 >= '" + isnull(ArrX[0], "0") + "' and 第层 <= '" + isnull(ArrX[1], "1000") + "')";
                    }
                }
                if (TextBox7.Text != "")
                {
                    ArrX = TextBox7.Text.ToString().Trim().Split('-');
                    if (ArrX.Length == 1)
                    {
                        sqlstr = sqlstr + " and 房主报价 = '" + ArrX[0] + "'";
                    }
                    else if (ArrX.Length == 2)
                    {
                        sqlstr = sqlstr + " and (房主报价 >= '" + isnull(ArrX[0], "0") + "' and 房主报价 <= '" + isnull(ArrX[1], "1000000000") + "')";
                    }
                }

            }
            else
            {

                ArrX = fujia.Text.ToString().Trim().Split('-');
                if (ArrX.Length == 1)
                {
                    sqlstr = sqlstr + " and (编号 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 辖区 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 街道 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 小区 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 房屋户型 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 产权性质 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 产权证 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or name like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 部门 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 详细地址 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 公交线路 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 环境描述 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 建筑结构 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 使用性质 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 建筑年代 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 房屋现状 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 房屋类型 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 装修状况 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 配套设施 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%' or 房源备注 like '%" + PageValidate.ToLikeSql(fujia.Text.ToString().Trim()) + "%')";
                }
                else if (ArrX.Length == 2)
                {
                    sqlstr = sqlstr + " and ((建筑面积 >= '" + isnull(ArrX[0], "0") + "' and 建筑面积 <= '" + isnull(ArrX[1], "10000000000000") + "') or (第层 >= '" + isnull(ArrX[0], "0") + "' and 第层 <= '" + isnull(ArrX[1], "1000") + "') or (房主报价 >= '" + isnull(ArrX[0], "0") + "' and 房主报价 <= '" + isnull(ArrX[1], "1000000000") + "'))";
                }
            }
            if (DropDownList1.SelectedValue != "不限")
            {
                sqlstr = sqlstr + " and 售租形式 = '" + DropDownList1.SelectedValue + "'";
            }
            sqlstr = sqlstr + "and 成交状况='未成交' order by ID desc ;";
            DataView dv = DbHelperSQL.Query(sqlstr).Tables[0].DefaultView;
            PagedDataSource pds = new PagedDataSource();
            AspNetPager1.RecordCount = dv.Count;
            pds.DataSource = dv;
            pds.AllowPaging = true;
            pds.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1;
            pds.PageSize = AspNetPager1.PageSize;
            this.Repeater5.DataSource = pds;
            this.Repeater5.DataBind();

        }
        catch (Exception ex)
        {
            if (ex != null)
            {
                MessageBox.Show(this, "查询条件输入不符合规则，请重新输入！");
                return;
            }
        }




    }
    protected void cx_Click(object sender, ImageClickEventArgs e)
    {
        binddr();
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    protected void AspNetPager1_PageChanged(object src, EventArgs e)
    {
        binddr();
    }

    public string isnull(string a, string b)
    {
        if (a.Length == 0)
        {
            return b;
        }
        else
        {
            return a;
        }
    }
}
