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

public partial class fydj : Sper.baseadmin
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
     
    DateTime now = DateTime.Now;
    string fybh = now.Year.ToString() + now.ToString("MM") + now.ToString("dd") + now.ToString("HH") + now.ToString("mm");
    string fwhx = DropDownList1.SelectedValue + "间" + DropDownList2.SelectedValue + "厅" + DropDownList3.SelectedValue + "厨" + DropDownList4.SelectedValue + "卫" + DropDownList5.SelectedValue + "阳台";
    string lcqk = "第" + TextBox5.Text + "层/共" + TextBox6.Text + "层";
    string yz = "";// 房价
    if(RadioButtonList8.SelectedValue=="售")
    {
        yz = (float.Parse(TextBox10.Text.Trim ()) / float.Parse(TextBox8.Text.Trim ())).ToString ("#");
    }
    string jiedao = "";
    string xiaoqu = "";
    if( ddlSpec.SelectedItem.Text == "")
    {
        jiedao = txtJieDao.Text;
    }
    else
    {
        jiedao = ddlSpec.SelectedItem.Text;
    }

    if(ddlClass.SelectedItem.Text == "")
    {
        xiaoqu = txtXiaoQu.Text;
    }
    else
    {
        xiaoqu = ddlClass.SelectedItem.Text;
    }

    string sql = "Insert into h_fangyuan(编号,辖区,街道,小区,详细地址,公交线路,环境描述,房屋户型,建筑结构,使用性质,建筑年代,房屋现状,房屋类型,楼层情况,一梯几户,朝向,装修状况,建筑面积,月租,房主报价,最低让价,配套设施,房主,联系方式,其他联系方式,产权证状况,产权性质,产权证是否在公司,产权证,购房合同发票,钥匙是否在公司,土地证状况,本公司独家代理,售租形式,uid,房源备注,录入时间,成交状况,name,固定电话,移动电话,部门,第层,共层,室,厅,厨,卫,阳台) values('" + fybh + "','" + ddlDepart.SelectedItem.Text + "','" + jiedao + "','" + xiaoqu + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + fwhx + "','" + DropDownList9.SelectedValue + "','" + DropDownList10.SelectedValue + "','" + TextBox4.Text + "','" + DropDownList13.SelectedValue + "','" + RadioButtonList7.SelectedValue + "','" + lcqk + "','" + TextBox7.Text + "','" + DropDownList11.SelectedValue + "','" + DropDownList12.SelectedValue + "','" + TextBox8.Text + "','" + yz + "'," + TextBox10.Text + ",'" + TextBox11.Text + "','" + TextBox12.Text + "','" + TextBox13.Text + "','" + TextBox14.Text + "','" + TextBox15.Text + "','" + RadioButtonList1.SelectedValue + "','" + DropDownList14.SelectedValue + "','" + RadioButtonList5.SelectedValue + "','" + DropDownList15.SelectedValue + "','" + RadioButtonList6.SelectedValue + "','" + RadioButtonList4.SelectedValue + "','" + RadioButtonList2.SelectedValue + "','" + RadioButtonList3.SelectedValue + "','" + RadioButtonList8.SelectedValue + "','" + Session["adminid"].ToString() + "','" + TextBox19.Text + "','" + DateTime.Now.ToString("D") + "','未成交','" + Literal1.Text + "','" + Literal5.Text + "','" + Literal2.Text + "','" + Literal3.Text + "'," + TextBox5.Text + "," + TextBox6.Text + ",'" + DropDownList1.SelectedValue + "','" + DropDownList2.SelectedValue + "','" + DropDownList3.SelectedValue + "','" + DropDownList4.SelectedValue + "','" + DropDownList5.SelectedValue + "')";
    DbHelperSQL.Query(sql);
    MessageBox.Show(this.Page, "房源登记成功！");
    binddr();
}
protected void gb_Click(object sender, ImageClickEventArgs e)
{
    Response.Redirect("fydj.aspx");
}
void binddr()//清理数据
{
    TextBox1.Text = "";
    TextBox2.Text = "";
    TextBox3.Text = "";
    TextBox4.Text = "";
    TextBox5.Text = "";
    TextBox6.Text = "";
    TextBox7.Text = "";
    TextBox8.Text = "";
    TextBox10.Text = "";
    TextBox11.Text = "";
    TextBox12.Text = "";
    TextBox13.Text = "";
    TextBox14.Text = "";
    TextBox15.Text = "";
    TextBox19.Text = "";
    txtJieDao.Text = "";
    txtXiaoQu.Text = "";
    //登记人信息
    string sql = "select * from h_userinf where id=" + int.Parse(Session["adminid"].ToString());
    DataTable dt = DbHelperSQL.Query(sql).Tables[0];
    this.Literal1.Text = dt.Rows[0]["name"].ToString();
    this.Literal2.Text = dt.Rows[0]["移动电话"].ToString();
    this.Literal3.Text = dt.Rows[0]["部门"].ToString();
    this.Literal5.Text = dt.Rows[0]["固定电话"].ToString();
}
}
