using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Sp
{
	/// <summary>
	/// base.
	/// </summary>
	public class Base
	{

		#region "Fields of base BetC"

		/// <summary>
		/// connecting to Database
		/// </summary>
        public static string strConn = ConfigurationManager.ConnectionStrings["SperConnectionString1"].ToString();
        protected static string strConn2 = ConfigurationManager.AppSettings["sqlstring"];

		/// <summary>
		/// SQL command
		/// </summary>
		protected static string strSQL;

		#endregion
		

		#region "Properties of base class"
		private int m_ID;
		private string m_Name;

		/// <summary>
		/// Property：ID
		/// </summary>
		public int ID
		{
			get
			{
				return m_ID;
			}
			set
			{
				m_ID = value;
			}
		}


		/// <summary>
		/// name
		/// </summary>
		public string Name
		{
			get
			{
				return m_Name;
			}
			set
			{
				m_Name = value;
			}
		}

		#endregion


		#region "Functions of base class"
		public Base()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		/// <summary>
		/// executing SQL commands
		/// </summary>
		/// <param name="strSQL">string</param>
		/// <returns>return int</returns>
		public static int ExecuteSql(string strSQL)
		{
			SqlConnection myCn = new SqlConnection(strConn);			
			SqlCommand myCmd = new SqlCommand(strSQL,myCn);
			try
			{
				myCn.Open();
				myCmd.ExecuteNonQuery();
				return 0;
			}
			catch(System.Data.SqlClient.SqlException e)
			{				
				throw new Exception(e.Message);
			}
			finally
			{
				myCmd.Dispose();
				myCn.Close();
			}
		}

	
		/// <summary>
		///executing SQL commands
		/// </summary>
		/// <param name="strSQL">要执行的SQL语句,为字符串类型string</param>
		/// <returns>返回执行情况,整形int</returns>
		protected static int ExecuteSqlEx(string strSQL)
		{
			SqlConnection myCn = new SqlConnection(strConn);			
			SqlCommand myCmd = new SqlCommand(strSQL,myCn);
			
			try
			{
				myCn.Open();				
				SqlDataReader myReader = myCmd.ExecuteReader();
				if(myReader.Read())
				{
					return 0;
				}	
				else
				{
					throw new Exception("Value Unavailable!");
				}
			}
			catch(System.Data.SqlClient.SqlException e)
			{								
				throw new Exception(e.Message);
			}
			finally
			{
				myCmd.Dispose();
				myCn.Close();
			}
		}

		/// <summary>
		/// 执行只读数据查询
		/// </summary>
		/// <param name="sql"></param>
		/// <returns></returns>
		public static SqlDataReader DataReader(int C,string sqlstr)
		{
			SqlConnection myCn = new SqlConnection();
			myCn.ConnectionString=C==0?strConn:strConn2;
			SqlCommand myCommand = new SqlCommand(sqlstr, myCn);

			try
			{
				myCn.Open();
				SqlDataReader dr = myCommand.ExecuteReader();
				return dr;
			}
			catch(System.Data.SqlClient.SqlException e)
			{				
				throw new Exception(e.Message);
			}
			finally
			{
				myCn.Close();
			}

		}
		/// <summary>
		/// get dataset
		/// </summary>
		/// <param name="strSQL">(string)</param>
		/// <returns>(DataSet)</returns>
		public static DataSet ExecuteSql4Ds(string strSQL)
		{
			SqlConnection myCn = new SqlConnection(strConn);	
			
			try
			{
				myCn.Open();
				SqlDataAdapter sda = new SqlDataAdapter(strSQL,myCn);
				DataSet ds = new DataSet("ds");
				sda.Fill(ds);
							return ds;
			}
			catch(System.Data.SqlClient.SqlException e)
			{				
				throw new Exception(e.Message);
			}
			finally
			{  
				myCn.Close();
			}
		}
		public static DataSet Sql4DsJW(string strSQL)
		{
			SqlConnection myCn = new SqlConnection(strConn2);			
			try
			{
				myCn.Open();
				SqlDataAdapter sda = new SqlDataAdapter(strSQL,myCn);
				DataSet ds = new DataSet("ds");
				sda.Fill(ds);
				return ds;
			}
			catch(System.Data.SqlClient.SqlException e)
			{				
				throw new Exception(e.Message);
			}
			finally
			{
				myCn.Close();
			}
		}

		/// <summary>
		/// get single value
		/// </summary>
		/// <param name="strSQL">(string)</param>
		/// <returns>(int)</returns>
		protected static int ExecuteSql4Value(string strSQL)
		{
			SqlConnection myCn = new SqlConnection(strConn);			
			SqlCommand myCmd = new SqlCommand(strSQL,myCn);
			try
			{
				myCn.Open();
				object r = myCmd.ExecuteScalar();
				if(Object.Equals(r,null))
				{
					throw new Exception("value unavailable！");
				}
				else
				{
					return (int)r;
				}				
			}
			catch(System.Data.SqlClient.SqlException e)
			{				
				throw new Exception(e.Message);
			}
			finally
			{
				myCmd.Dispose();
				myCn.Close();
			}
		}		


		/// <summary>
		/// get object
		/// </summary>
		/// <param name="strSQL">(string)</param>
		/// <returns>(object)</returns>
		protected static object ExecuteSql4ValueEx(string strSQL)
		{
			SqlConnection myCn = new SqlConnection(strConn);			
			SqlCommand myCmd = new SqlCommand(strSQL,myCn);
			try
			{
				myCn.Open();
				object r = myCmd.ExecuteScalar();
				if(Object.Equals(r,null))
				{
					throw new Exception("object unavailable!");
				}
				else
				{
					return r;
				}				
			}
			catch(System.Data.SqlClient.SqlException e)
			{				
				throw new Exception(e.Message);
			}
			finally
			{
				myCmd.Dispose();
				myCn.Close();
			}
		}
		/// <summary>
		/// 执行存储过程
		/// </summary>
		/// <param name="strSQL"></param>
		/// <returns></returns>
		public static DataSet ExecuteSqlCC(string str)
		{
			SqlConnection myCn = new SqlConnection(strConn);			
			SqlCommand myCmd = new SqlCommand(str,myCn);
			
			SqlDataReader adr;
			try
			{
				myCn.Open();
				myCmd.CommandType =CommandType.StoredProcedure;
				adr=myCmd.ExecuteReader();
				SqlDataAdapter sda = new SqlDataAdapter(myCmd);
				myCmd.Dispose();
				myCn.Close();
				DataSet ds = new DataSet();
				sda.Fill(ds);
				if(Object.Equals(adr,null))
				{
					throw new Exception("object unavailable!");
				}
				else
				{
					return ds;
				}				
			}
			catch(System.Data.SqlClient.SqlException e)
			{				
				throw new Exception(e.Message);
			}
			finally
			{
				myCmd.Dispose();
				myCn.Close();
			}
		}

		/// <summary>
		/// execute multipul SQL commands 
		/// </summary>
		/// <param name="strSQLs">string</param>
		/// <returns>int</returns>
		protected static int ExecuteSqls(string[] strSQLs)
		{
			SqlConnection myCn = new SqlConnection(strConn);			
			SqlCommand myCmd = new SqlCommand();			
			int j=strSQLs.Length;

			try
			{
				myCn.Open();				
			}
			catch(System.Data.SqlClient.SqlException e)
			{
				throw new Exception(e.Message);
			}
			SqlTransaction myTrans = myCn.BeginTransaction();

			try
			{											
				myCmd.Connection = myCn;				
				myCmd.Transaction = myTrans;

				foreach(string str in strSQLs)
				{
					myCmd.CommandText = str;
					myCmd.ExecuteNonQuery();
				}
				myTrans.Commit();
				return 0;
			}
			catch(System.Data.SqlClient.SqlException e)
			{			
				myTrans.Rollback();
				throw new Exception(e.Message);
			}
			finally
			{
				myCmd.Dispose();
				myCn.Close();
			}
		}
		

		#endregion
	}
}
