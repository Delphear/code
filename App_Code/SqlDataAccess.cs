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

/// <summary>
/// SqlDataAccess 的摘要说明
/// </summary>
public class SqlDataAccess
{
	public SqlDataAccess()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 获取省的信息
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static DataSet GetProvinceInfo()
    {

        string sql = "select * from h_province";
        SqlCommand cmd = new SqlCommand();
        //定义对象资源保存的范围，一旦using范围结束，将释放对方所占的资源
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //调用执行方法，因为没有参数，所以最后一项直接设置为null
            //注意返回结果是dataset类型
            DataSet myds = SqlHelper.ExecuteDataSet(CommandType.Text, sql);
            return myds;
        }
    }
/// <summary>
/// 获得市的信息
/// </summary>
/// <returns></returns>
    public static DataSet GetCityInfo(string  sheng)
    {

        string sql = "select * from h_city where provinceId=" + sheng + "";
        SqlCommand cmd = new SqlCommand();
        //定义对象资源保存的范围，一旦using范围结束，将释放对方所占的资源
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //调用执行方法，因为没有参数，所以最后一项直接设置为null
            //注意返回结果是dataset类型
            DataSet myds = SqlHelper.ExecuteDataSet(CommandType.Text, sql);
            return myds;
        }
    }
    /// <summary>
    /// 获得区的信息
    /// </summary>
    /// <returns></returns>
    public static DataSet GetAreaInfo(string shi)
    {

        string sql = "select * from h_area where cityId=" + shi + "";
        SqlCommand cmd = new SqlCommand();
        //定义对象资源保存的范围，一旦using范围结束，将释放对方所占的资源
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //调用执行方法，因为没有参数，所以最后一项直接设置为null
            //注意返回结果是dataset类型
            DataSet myds = SqlHelper.ExecuteDataSet(CommandType.Text, sql);
            return myds;
        }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="sql"></param>
    /// <returns></returns>
    public static DataSet GetInfo(string sql)
    {
        SqlCommand cmd = new SqlCommand();
        //定义对象资源保存的范围，一旦using范围结束，将释放对方所占的资源
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //调用执行方法，因为没有参数，所以最后一项直接设置为null
            //注意返回结果是dataset类型
            DataSet myds = SqlHelper.ExecuteDataSet(CommandType.Text, sql);
            return myds;
        }
    }
}
