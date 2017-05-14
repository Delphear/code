using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class wdfyxg : Sper.baseadmin
{
    protected override void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);

        if (Session["adminid"] != null)
        {
            try
            {
                Convert.ToDouble(TextBox5.Text.Trim());
            }
            catch
            {
                Response.Write(" ");
                TextBox5.Text = "0";
                Page.RegisterStartupScript("focus", " ");
            }
            try
            {
                Convert.ToDouble(TextBox6.Text.Trim());
            }
            catch
            {
                Response.Write(" ");
                TextBox6.Text = "0";
                Page.RegisterStartupScript("focus", " ");
            }
            try
            {
                Convert.ToDouble(TextBox10.Text.Trim());
            }
            catch
            {
                Response.Write(" ");
                TextBox10.Text = "";
                Page.RegisterStartupScript("focus", " ");
            }
            try
            {
                Convert.ToDouble(TextBox8.Text.Trim());
            }
            catch
            {
                Response.Write(" ");
                TextBox8.Text = "";
                Page.RegisterStartupScript("focus", " ");
            }

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

    protected void bc_Click(object sender, ImageClickEventArgs e)
    {
        string strErr = "";
        if (TextBox8.Text == "")
        {
            strErr += "建筑面积不能为空且只能输入数值！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        strErr = "";
        if (TextBox10.Text == "")
        {
            strErr += "房主报价不能为空且只能输入数值！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }

        //DateTime now = DateTime.Now;
        //string fybh = now.Year.ToString() + now.ToString("MM") + now.ToString("dd") + now.ToString("HH") + now.ToString("mm");
        string fwhx = DropDownList1.SelectedValue + "间" + DropDownList2.SelectedValue + " 厅" + DropDownList3.SelectedValue + "厨" + DropDownList4.SelectedValue + "卫" + DropDownList5.SelectedValue + "阳台";
        string lcqk = "第" + TextBox5.Text + "层/共" + TextBox6.Text + "层";
        string yz = "";// 房价
        if (RadioButtonList8.SelectedValue == "售")
        {
            yz = (float.Parse(TextBox10.Text.Trim()) / float.Parse(TextBox8.Text.Trim())).ToString("#");
        }
        int ID = Convert.ToInt32(Request.QueryString["id"]);
        string sql;
        if (ddlDepart.SelectedItem.Text != "")
        {
            sql = "update h_fangyuan set 辖区='" + ddlDepart.SelectedItem.Text + "',街道='" + ddlSpec.SelectedItem.Text + "',小区='" + ddlClass.SelectedItem.Text + "',详细地址='" + TextBox1.Text + "',公交线路='" + TextBox2.Text + "',环境描述='" + TextBox3.Text + "',房屋户型='" + fwhx + "',建筑结构='" + DropDownList9.SelectedValue + "',使用性质='" + DropDownList10.SelectedValue + "',建筑年代='" + TextBox4.Text + "',房屋现状='" + DropDownList13.SelectedValue + "',房屋类型='" + RadioButtonList7.SelectedValue + "',楼层情况='" + lcqk + "',一梯几户='" + TextBox7.Text + "',朝向='" + DropDownList11.SelectedValue + "',装修状况='" + DropDownList12.SelectedValue + "',建筑面积=" + TextBox8.Text + ",月租='" + yz + "',房主报价=" + TextBox10.Text + ",最低让价='" + TextBox11.Text + "',配套设施='" + TextBox12.Text + "',房主='" + TextBox13.Text + "',联系方式='" + TextBox14.Text + "',其他联系方式='" + TextBox15.Text + "',产权证状况='" + RadioButtonList1.SelectedValue + "',产权性质='" + DropDownList14.SelectedValue + "',产权证是否在公司='" + RadioButtonList5.SelectedValue + "',产权证='" + DropDownList15.SelectedValue + "',购房合同发票='" + RadioButtonList6.SelectedValue + "',钥匙是否在公司='" + RadioButtonList4.SelectedValue + "',土地证状况='" + RadioButtonList2.SelectedValue + "',本公司独家代理='" + RadioButtonList3.SelectedValue + "',售租形式='" + RadioButtonList8.SelectedValue + "',房源备注='" + TextBox19.Text + "',录入时间='" + DateTime.Now.ToString("D") + "',室='" + DropDownList1.SelectedValue + "',厅='" + DropDownList2.SelectedValue + "',厨='" + DropDownList3.SelectedValue + "',卫='" + DropDownList4.SelectedValue + "',阳台='" + DropDownList5.SelectedValue + "',第层=" + TextBox5.Text + ",共层=" + TextBox6.Text + " where id=" + ID;        
        }
        else 
        {
            sql = "update h_fangyuan set 详细地址='" + TextBox1.Text + "',公交线路='" + TextBox2.Text + "',环境描述='" + TextBox3.Text + "',房屋户型='" + fwhx + "',建筑结构='" + DropDownList9.SelectedValue + "',使用性质='" + DropDownList10.SelectedValue + "',建筑年代='" + TextBox4.Text + "',房屋现状='" + DropDownList13.SelectedValue + "',房屋类型='" + RadioButtonList7.SelectedValue + "',楼层情况='" + lcqk + "',一梯几户='" + TextBox7.Text + "',朝向='" + DropDownList11.SelectedValue + "',装修状况='" + DropDownList12.SelectedValue + "',建筑面积=" + TextBox8.Text + ",月租='" + yz + "',房主报价=" + TextBox10.Text + ",最低让价='" + TextBox11.Text + "',配套设施='" + TextBox12.Text + "',房主='" + TextBox13.Text + "',联系方式='" + TextBox14.Text + "',其他联系方式='" + TextBox15.Text + "',产权证状况='" + RadioButtonList1.SelectedValue + "',产权性质='" + DropDownList14.SelectedValue + "',产权证是否在公司='" + RadioButtonList5.SelectedValue + "',产权证='" + DropDownList15.SelectedValue + "',购房合同发票='" + RadioButtonList6.SelectedValue + "',钥匙是否在公司='" + RadioButtonList4.SelectedValue + "',土地证状况='" + RadioButtonList2.SelectedValue + "',本公司独家代理='" + RadioButtonList3.SelectedValue + "',售租形式='" + RadioButtonList8.SelectedValue + "',房源备注='" + TextBox19.Text + "',录入时间='" + DateTime.Now.ToString("D") + "',室='" + DropDownList1.SelectedValue + "',厅='" + DropDownList2.SelectedValue + "',厨='" + DropDownList3.SelectedValue + "',卫='" + DropDownList4.SelectedValue + "',阳台='" + DropDownList5.SelectedValue + "',第层=" + TextBox5.Text + ",共层=" + TextBox6.Text + " where id=" + ID;        
        }
        DbHelperSQL.Query(sql);
        MessageBox.Show(this.Page, "房源修改成功！");
        Response.Write(" <script language='javascript'>var P = window.parent, D = P.loadinndlg(); P.reload();</script>");
    }

    void binddr()
    {
        int ID = Convert.ToInt32(Request.QueryString["id"]);
        string sql = "select * from h_fangyuan where id=" + ID;
        DataTable dtTable = DbHelperSQL.Query(sql).Tables[0];
        Literal13.Text = dtTable.Rows[0]["辖区"].ToString() + "/" + dtTable.Rows[0]["街道"].ToString() + "/" + dtTable.Rows[0]["小区"].ToString();
        TextBox1.Text = dtTable.Rows[0]["详细地址"].ToString().Trim();
        TextBox2.Text = dtTable.Rows[0]["公交线路"].ToString().Trim();
        TextBox3.Text = dtTable.Rows[0]["环境描述"].ToString().Trim();
        DropDownList9.SelectedValue = dtTable.Rows[0]["建筑结构"].ToString().Trim();
        DropDownList10.SelectedValue = dtTable.Rows[0]["使用性质"].ToString().Trim();
        TextBox4.Text = dtTable.Rows[0]["建筑年代"].ToString();
        DropDownList13.SelectedValue = dtTable.Rows[0]["房屋现状"].ToString().Trim();
        RadioButtonList7.SelectedValue = dtTable.Rows[0]["房屋类型"].ToString().Trim();
        Literal12.Text = dtTable.Rows[0]["编号"].ToString();
        TextBox7.Text = dtTable.Rows[0]["一梯几户"].ToString();
        DropDownList11.SelectedValue = dtTable.Rows[0]["朝向"].ToString().Trim ();
        DropDownList12.SelectedValue = dtTable.Rows[0]["装修状况"].ToString().Trim();
        TextBox8.Text = dtTable.Rows[0]["建筑面积"].ToString().Trim();
        TextBox10.Text = dtTable.Rows[0]["房主报价"].ToString().Trim();
        TextBox12.Text = dtTable.Rows[0]["配套设施"].ToString().Trim();
        RadioButtonList1.SelectedValue = dtTable.Rows[0]["产权证状况"].ToString().Trim();
        DropDownList14.SelectedValue = dtTable.Rows[0]["产权性质"].ToString().Trim();
        RadioButtonList5.SelectedValue = dtTable.Rows[0]["产权证是否在公司"].ToString().Trim();
        DropDownList15.SelectedValue = dtTable.Rows[0]["产权证"].ToString().Trim();
        RadioButtonList6.SelectedValue = dtTable.Rows[0]["购房合同发票"].ToString().Trim();
        RadioButtonList4.SelectedValue = dtTable.Rows[0]["钥匙是否在公司"].ToString().Trim();
        RadioButtonList2.SelectedValue = dtTable.Rows[0]["土地证状况"].ToString().Trim();
        RadioButtonList3.SelectedValue = dtTable.Rows[0]["本公司独家代理"].ToString().Trim();
        RadioButtonList8.SelectedValue = dtTable.Rows[0]["售租形式"].ToString().Trim();
        TextBox19.Text = dtTable.Rows[0]["房源备注"].ToString().Trim();
        TextBox13.Text = dtTable.Rows[0]["房主"].ToString().Trim();
        TextBox14.Text = dtTable.Rows[0]["联系方式"].ToString().Trim();
        TextBox15.Text = dtTable.Rows[0]["其他联系方式"].ToString().Trim();
        TextBox11.Text = dtTable.Rows[0]["最低让价"].ToString().Trim();
        DropDownList1.SelectedValue = dtTable.Rows[0]["室"].ToString().Trim();
        DropDownList2.SelectedValue = dtTable.Rows[0]["厅"].ToString().Trim();
        DropDownList3.SelectedValue = dtTable.Rows[0]["厨"].ToString().Trim();
        DropDownList4.SelectedValue = dtTable.Rows[0]["卫"].ToString().Trim();
        DropDownList5.SelectedValue = dtTable.Rows[0]["阳台"].ToString().Trim();
        TextBox5.Text = dtTable.Rows[0]["第层"].ToString().Trim();
        TextBox6.Text = dtTable.Rows[0]["共层"].ToString().Trim();
    }
}
