using System;
using System.Web;
using System.Data;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections;
using System.Collections.Generic;
using AjaxControlToolkit;
using DataSetManagerTableAdapters;
using System.Collections.Specialized;


/// <summary>
/// detailinfo 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class detailinfo : System.Web.Services.WebService {

    DepartmentTableAdapter departAdapter = new DepartmentTableAdapter();
    ClassTableAdapter classAdapter = new ClassTableAdapter();
    SpecialTableAdapter specAdapter = new SpecialTableAdapter();
    DataSetManager.DepartmentDataTable departTable = new DataSetManager.DepartmentDataTable();
    DataSetManager.ClassDataTable classTable = new DataSetManager.ClassDataTable();
    DataSetManager.SpecialDataTable speciTable = new DataSetManager.SpecialDataTable();

    UsersTableAdapter userAdapter = new UsersTableAdapter();
    DataSetManager.UsersDataTable userTable = new DataSetManager.UsersDataTable();

    AttendTypeTableAdapter attTypeApter = new AttendTypeTableAdapter();
    DataSetManager.AttendTypeDataTable attTypetable = new DataSetManager.AttendTypeDataTable();

    DataSetManager.RegionDataTable regtable = new DataSetManager.RegionDataTable();
    RegionTableAdapter regAdapter = new RegionTableAdapter();

    public detailinfo () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetDep(string knownCategoryValues, string category)
    {//获取系部列表
        List<CascadingDropDownNameValue> value = new List<CascadingDropDownNameValue>();
        departTable = departAdapter.GetDataByAll();
        foreach (DataRow row in departTable.Rows)
        {
            string depName = row[departTable.dept_nameColumn].ToString();
            int depid = Convert.ToInt32(row[departTable.dept_idColumn].ToString());
            value.Add(new CascadingDropDownNameValue(depName, depid.ToString()));
        }
        return value.ToArray();
    }
    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetSpec(string knownCategoryValues, string category)
    {//获取专业列表
        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        int depId;
        if (!kv.ContainsKey("dep") || !Int32.TryParse(kv["dep"], out depId))
        {
            return null;
        }
        speciTable = specAdapter.GetDataByDeptid(depId);
        List<CascadingDropDownNameValue> value = new List<CascadingDropDownNameValue>();
        foreach (DataRow row in speciTable.Rows)
        {
            string specName = row[speciTable.spc_nameColumn].ToString();
            string specId = row[speciTable.spc_idColumn].ToString();
            value.Add(new CascadingDropDownNameValue(specName,specId));
        }
        return value.ToArray();
    }
    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetClas(string knownCategoryValues, string category)
    {//获取班级列表
        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        int specId;
        if (!kv.ContainsKey("spec") || !Int32.TryParse(kv["spec"], out specId))
        {
            return null;
        }
        classTable = classAdapter.GetDataBySpecId(specId);
        List<CascadingDropDownNameValue> value = new List<CascadingDropDownNameValue>();
        foreach (DataRow row in classTable.Rows)
        {
            string clsName = row[classTable.class_nameColumn].ToString();
            string clsId = row[classTable.class_idColumn].ToString();
            value.Add(new CascadingDropDownNameValue(clsName,clsId));
        }
        return value.ToArray();
    }
    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetStu(string knownCategoryValues, string category)
    {//获取学生列表
        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        int clasId;
        if (!kv.ContainsKey("clas") || !Int32.TryParse(kv["clas"], out clasId))
        {
            return null;
        }
        //userTable = userAdapter.GetDataByClassId(clasId);
        userTable = userAdapter.GetDataBy2ClasId(clasId);
        List<CascadingDropDownNameValue> value = new List<CascadingDropDownNameValue>();
        foreach (DataRow row in userTable.Rows)
        {
            string uName = row[userTable.user_nameColumn].ToString();
            string uId = row[userTable.user_idColumn].ToString();
            value.Add(new CascadingDropDownNameValue(uName, uId));
        }
        return value.ToArray();
    }
    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetReg(string knownCategoryValues, string category)
    {//获取区门信息
        List<CascadingDropDownNameValue> value = new List<CascadingDropDownNameValue>();
        regtable = regAdapter.GetDataByAll();
        foreach (DataRow row in regtable.Rows)
        {
            string regId = row[regtable.region_idColumn].ToString();
            string regName = row[regtable.region_nameColumn].ToString();
            value.Add(new CascadingDropDownNameValue(regName, regId));
        }
        return value.ToArray();
    }
    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetAttType(string knownCategoryValues, string category)
    {//获取考勤类型
        List<CascadingDropDownNameValue> value = new List<CascadingDropDownNameValue>();
        attTypetable = attTypeApter.GetDataByAll();
        foreach (DataRow row in attTypetable.Rows)
        {
            string typeId = row[attTypetable.type_idColumn].ToString();
            string typeName = row[attTypetable.type_nameColumn].ToString();
            value.Add(new CascadingDropDownNameValue(typeName,typeId));
        }
        return value.ToArray();
    }
}

