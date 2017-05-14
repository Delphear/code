using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Data;
using System.Data.Common;
using System.Web.Services.Protocols;
using System.Data.SqlClient;
using System.Configuration;

public class WebService : System.Web.Services.WebService {

    public WebService () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
   
    public void ExcuteSql(string strSql)
    {
        string strConn = ConfigurationManager.ConnectionStrings["SqlConn"].ToString();
        DbProviderFactory dbProviderFactory = DbProviderFactories.GetFactory("System.Data.SqlClient");
        DbConnection dbConn = dbProviderFactory.CreateConnection();
        dbConn.ConnectionString = strConn;
        dbConn.Open();
        DbCommand dbComm = dbProviderFactory.CreateCommand();
        dbComm.Connection = dbConn;
        dbComm.CommandText = strSql;
        dbComm.ExecuteNonQuery();
        dbConn.Close();
        dbConn.Dispose();
    }
    public DataTable ExcuteSelect(string strSql)
    {
        string strConn = ConfigurationManager.ConnectionStrings["SqlConn"].ToString();
        DbProviderFactory dbProviderFactory = DbProviderFactories.GetFactory("System.Data.SqlClient");
        DbConnection dbConn = dbProviderFactory.CreateConnection();
        dbConn.ConnectionString = strConn;
        dbConn.Open();
        DbCommand dbComm = dbProviderFactory.CreateCommand();
        dbComm.Connection = dbConn;
        dbComm.CommandText = strSql;
        DbDataAdapter adapter = dbProviderFactory.CreateDataAdapter();
        adapter.SelectCommand = dbComm;
        DataSet dsDataSet = new DataSet();
        adapter.Fill(dsDataSet, "table");
        return dsDataSet.Tables["table"];
    }
    
}

