using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;


using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.QueryString["out"] != null)
        {
            Sp.login.Out();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string usn, pwd, vstr;
        usn = this.name.Text;
        pwd = this.ps.Text;
        vstr = vnumber.Text;
        // 下载于www.51aspx.com
        string strErr = "";
        if (usn == "")
        {
            strErr += "用户名不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        strErr = "";
        if (pwd == "")
        {
            strErr += "密码不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        strErr = "";
        if (vstr == "")
        {
            strErr += "验证码不能为空！\\n";
        }

        if (strErr != "")
        {
            MessageBox.Show(this, strErr);
            return;
        }
        if (vstr != Session["Vnumber"].ToString())
        {
            MessageBox.Show(this, "您输入的验证码不正确，请重新输入!"); 
        }
        else if (Exists(usn, pwd))
        {
            MessageBox.ResponseScript("top.location.href='Main.aspx'");
        }
        else
        {
            MessageBox.Show(this, "您输入用户名或密码有误请重新输入！"); 
        }
    }
    /// <summary>
    /// 是否存在该用户
    /// </summary>
    public bool Exists(string name, string pwd)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("select id,name,权限,部门 from h_userinf");
        strSql.Append(" where username= @username and password=@password");
        SqlParameter[] parameters = {
					new SqlParameter("@username", SqlDbType.NVarChar),
                    new SqlParameter("@password", SqlDbType.NVarChar)
				};
        parameters[0].Value = name;
        parameters[1].Value = pwd;
        DataTable dt = DbHelperSQL.Query(strSql.ToString(), parameters).Tables[0];
        if (dt.Rows.Count > 0)
        {
            // 下载于www.51aspx.com
            Session["adminid"] = dt.Rows[0]["id"];
            Session["depname"] = dt.Rows[0]["name"];
            System.Text.Encoding enc = System.Text.Encoding.GetEncoding("GB2312");
            HttpCookie cookie = new HttpCookie("userInfo");
            string ss = HttpUtility.UrlEncode(dt.Rows[0]["name"].ToString(), enc);
            cookie.Values.Add("username", ss);
            string bm = HttpUtility.UrlEncode(dt.Rows[0]["部门"].ToString(), enc);
            cookie.Values.Add("userbm", bm);
            System.Web.HttpContext.Current.Response.AppendCookie(cookie);

            if (dt.Rows[0]["权限"].ToString() == "部门管理员")
            {
                Session["userlevel"] = "ULeft.aspx";           
            }
            else
            {
                Session["userlevel"] = "Left.aspx";  
            }
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        this.vnumber.Text = "";
        this.name.Text = "" ;
        this.ps.Text = "";
    }
}
