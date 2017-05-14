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
using DataSetManagerTableAdapters;

public partial class jcsjgl : System.Web.UI.Page
{
    DepartmentTableAdapter departAdapter = new DepartmentTableAdapter();
    ClassTableAdapter classAdapter = new ClassTableAdapter();
    SpecialTableAdapter specAdapter = new SpecialTableAdapter();
    DataSetManager.DepartmentDataTable departTable = new DataSetManager.DepartmentDataTable();
    DataSetManager.ClassDataTable classTable = new DataSetManager.ClassDataTable();
    DataSetManager.SpecialDataTable speciTable = new DataSetManager.SpecialDataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminid"] != null)
        {
            if (!IsPostBack)
            {
                
            }
        }
        else
        {
            Response.Write("<script type='text/javascript'> top.location.href='logout.aspx';</script>");
        }  
    }
    protected void btnAddClass_Click(object sender, EventArgs e)
    {//ok
        try
        {
            if ((int)classAdapter.SQIfHasClass(txtClass.Text.Trim()) > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('同名小区/楼宇已经存在！')</script>");
                return;
            }
            int specId = Convert.ToInt32(ddlSpec.SelectedItem.Value.ToString());
            if (classAdapter.InsertCalss(specId, txtClass.Text.Trim()) == 1)
            {
                //TODO:提示操作成功
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作成功！')</script>");
            }
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作失败！请选择好辖区\\街道')</script>");
        }
    }
    protected void btnModiClass_Click(object sender, EventArgs e)
    {//ok
        try
        {
            if ((int)classAdapter.SQIfHasClass(txtClass.Text.Trim()) > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('同名小区/楼宇已经存在！')</script>");
                return;
            }
            int clasId = Convert.ToInt32(ddlClass.SelectedItem.Value);
            //if (classAdapter.UpdateClass(txtClass.Text.Trim(), ddlClass.Text) == 1)
            if (classAdapter.UpdateById(txtClass.Text.Trim(), clasId) == 1)
            {
                //TODO:提示操作成功
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作成功！')</script>");
            }
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作失败！')</script>");
        }
    }
    protected void btnDelClass_Click(object sender, EventArgs e)
    {
        try
        {
            int clasId = Convert.ToInt32(ddlClass.SelectedItem.Value);

            //if (classAdapter.DeleteClass(ddlClass.Text) == 1)
            if (classAdapter.DeleteById(clasId) == 1)
            {
                //TODO:提示操作成功
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作成功！')</script>");
            }
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作失败！')</script>");
        }
    }
    protected void btnAddSpec_Click(object sender, EventArgs e)
    {//ok
        try
        {
            if ((int)specAdapter.SQIfHasSpc(txtSpec.Text.Trim()) > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作失败，同名街道已经存在！')</script>");
                return;
            }
            int dep_id = Convert.ToInt32(ddlDepart.SelectedItem.Value);
            if (specAdapter.InsertSpecial(dep_id, txtSpec.Text.Trim()) == 1)
            {
                //TODO:提示操作成功
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作成功！')</script>");
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnModiSpec_Click(object sender, EventArgs e)
    {
        try
        {
            if ((int)specAdapter.SQIfHasSpc(txtSpec.Text.Trim()) > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作失败，同名街道已经存在！')</script>");
                return;
            }
            int spcId = Convert.ToInt32(ddlSpec.SelectedItem.Value);
            if (specAdapter.UpdateById(txtSpec.Text.Trim(), spcId) == 1)
            {
                //TODO:提示操作成功
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作成功！')</script>");
            }
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作失败！')</script>");
        }
    }
    protected void btnDelSpec_Click(object sender, EventArgs e)
    {//没做删除街道所下设的小区/楼宇的动作
        try
        {
            int spcId = Convert.ToInt32(ddlSpec.SelectedItem.Value);
            if (specAdapter.DeleteById(spcId) == 1)
            {
                //TODO:提示操作成功
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作成功！')</script>");
            }
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作失败！')</script>");
        }
    }
    protected void btnAddDepart_Click(object sender, EventArgs e)
    {
        if ((int)departAdapter.SQIfHasDep(txtDepart.Text.Trim()) > 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('同名辖区已经存在！')</script>");
            return;
        }
        if (departAdapter.InsertDepart(txtDepart.Text.Trim()) == 1)
        {
            //TODO:提示操作成功
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作成功！')</script>");
        }
    }
    protected void btnModiDepart_Click(object sender, EventArgs e)
    {
        try
        {
            if ((int)departAdapter.SQIfHasDep(txtDepart.Text.Trim()) > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('同名辖区已经存在！')</script>");
                return;
            }
            int departNum = Convert.ToInt32(ddlDepart.SelectedItem.Value);
            if ((int)departAdapter.UpdateDepart(txtDepart.Text.Trim(), departNum) == 1)
            {
                //TODO:提示操作成功
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作成功！')</script>");
            }
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作失败！')</script>");
        }
    }
    protected void btnDelDepart_Click(object sender, EventArgs e)
    {
        try
        {
            int departNum = Convert.ToInt32(ddlDepart.SelectedItem.Value);
            if (departAdapter.DeleteById(departNum) == 1)
            {
                //TODO:提示操作成功
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作成功！')</script>");
            }
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>window.alert('操作失败！')</script>");
        }
    }
}
