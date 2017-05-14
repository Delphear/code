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

public partial class khxx : Sper.baseadmin
{

    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);

        if (Session["adminid"] != null)
        {
            if (!IsPostBack)
            {
                int ID = Convert.ToInt32(Request.QueryString["id"]);
                string sql2 = "SELECT uid FROM h_kehu WHERE id=" + ID;
                DataTable dtTable2 = DbHelperSQL.Query(sql2).Tables[0];
                string sql1 = "SELECT id FROM h_userinf WHERE id=" + int.Parse(dtTable2.Rows[0]["uid"].ToString());
                DataTable dtTable1 = DbHelperSQL.Query(sql1).Tables[0];
                string sql;
                DataTable dtTable;
                if (dtTable1.Rows.Count > 0)//判断是否有此用户
                {
                    sql = "SELECT B.客户编号,B.期望区域,B.期望户型,B.期望面积,B.期望楼层,B.期望价格,B.租售形式,B.备注,B.登记日期,R.name,R.部门,R.固定电话,R.移动电话 FROM h_kehu AS B,h_userinf AS R WHERE B.uid=R.id and B.id=" + ID;
                    dtTable = DbHelperSQL.Query(sql).Tables[0];

                }
                else
                {
                    sql = "SELECT * FROM h_kehu WHERE id=" + ID;
                    dtTable = DbHelperSQL.Query(sql).Tables[0];
                }
                Literal1.Text = dtTable.Rows[0]["客户编号"].ToString();
                Literal2.Text = dtTable.Rows[0]["期望区域"].ToString();
                Literal3.Text = dtTable.Rows[0]["期望户型"].ToString();
                Literal4.Text = dtTable.Rows[0]["期望面积"].ToString();
                Literal5.Text = dtTable.Rows[0]["期望楼层"].ToString();
                Literal6.Text = dtTable.Rows[0]["期望价格"].ToString();
                Literal7.Text = dtTable.Rows[0]["租售形式"].ToString();
                Literal8.Text = dtTable.Rows[0]["备注"].ToString();
                Literal9.Text = dtTable.Rows[0]["name"].ToString();
                Literal10.Text = dtTable.Rows[0]["固定电话"].ToString();
                Literal11.Text = dtTable.Rows[0]["部门"].ToString();
                Literal12.Text = dtTable.Rows[0]["登记日期"].ToString();
                Literal13.Text = dtTable.Rows[0]["移动电话"].ToString();
            }

        }
        else
        {
            Response.Write("<script type='text/javascript'> top.location.href='logout.aspx';</script>");
        }  
       
        }
    }
