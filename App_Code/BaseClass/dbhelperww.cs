
using System;
using System.Collections;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;


	/// <summary>
	/// 数据访问抽象基础类
    /// Copyright (C) 2004-2008 By LiTianPing 
	/// </summary>
	public abstract class dbhelperww
	{
        //数据库连接字符串(web.config来配置)，可以动态更改connectionString支持多数据库.		
        public static string connectionString = ConfigurationManager.ConnectionStrings["WWConnectionString"].ToString();//PubConstant.ConnectionString; //如果要换数据库，你可以参考SysManage       		
		public dbhelperww()
		{              
        }

        #region  执行简单SQL语句

        /// <summary>
		/// 执行SQL语句，返回影响的记录数
		/// </summary>
		/// <param name="SQLString">SQL语句</param>
		/// <returns>影响的记录数</returns>
		public static int ExecuteSql(string SQLString)
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{				
				using (SqlCommand cmd = new SqlCommand(SQLString,connection))
				{
					try
					{		
						connection.Open();
						int rows=cmd.ExecuteNonQuery();
						return rows;
					}
					catch(System.Data.SqlClient.SqlException E)
					{					
						connection.Close();
						throw new Exception(E.Message);
					}
				}				
			}
		}

		public static int ExecuteSqlByTime(string SQLString,int Times)
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{				
				using (SqlCommand cmd = new SqlCommand(SQLString,connection))
				{
					try
					{		
						connection.Open();
						cmd.CommandTimeout=Times;
						int rows=cmd.ExecuteNonQuery();
						return rows;
					}
					catch(System.Data.SqlClient.SqlException E)
					{					
						connection.Close();
						throw new Exception(E.Message);
					}
				}				
			}
		}
		
		/// <summary>
		/// 执行多条SQL语句，实现数据库事务。
		/// </summary>
		/// <param name="SQLStringList">多条SQL语句</param>		
		public static void ExecuteSqlTran(ArrayList SQLStringList)
		{
			using (SqlConnection conn = new SqlConnection(connectionString))
			{
				conn.Open();
				SqlCommand cmd = new SqlCommand();
				cmd.Connection=conn;				
				SqlTransaction tx=conn.BeginTransaction();			
				cmd.Transaction=tx;				
				try
				{   		
					for(int n=0;n<SQLStringList.Count;n++)
					{
						string strsql=SQLStringList[n].ToString();
						if (strsql.Trim().Length>1)
						{
							cmd.CommandText=strsql;
							cmd.ExecuteNonQuery();
						}
					}										
					tx.Commit();					
				}
				catch(System.Data.SqlClient.SqlException E)
				{		
					tx.Rollback();
					throw new Exception(E.Message);
				}
			}
		}
        /// <summary>
        /// 执行多条SQL语句，实现数据库事务。
        /// </summary>
        /// <param name="SQLStringList">多条SQL语句</param>		
        public static int ExecuteSqlTran(List<String> SQLStringList)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                SqlTransaction tx = conn.BeginTransaction();
                cmd.Transaction = tx;
                try
                {
                    int count = 0;
                    for (int n = 0; n < SQLStringList.Count; n++)
                    {
                        string strsql = SQLStringList[n];
                        if (strsql.Trim().Length > 1)
                        {
                            cmd.CommandText = strsql;
                            count+=cmd.ExecuteNonQuery();
                        }
                    }
                    tx.Commit();
                    return count;
                }
                catch (System.Data.SqlClient.SqlException E)
                {
                    tx.Rollback();
                    throw new Exception(E.Message);
                }
            }
        }       
		/// <summary>
		/// 执行带一个存储过程参数的的SQL语句。
		/// </summary>
		/// <param name="SQLString">SQL语句</param>
		/// <param name="content">参数内容,比如一个字段是格式复杂的文章，有特殊符号，可以通过这个方式添加</param>
		/// <returns>影响的记录数</returns>
		public static int ExecuteSql(string SQLString,string content)
		{				
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand cmd = new SqlCommand(SQLString,connection);		
				System.Data.SqlClient.SqlParameter  myParameter = new System.Data.SqlClient.SqlParameter ( "@content", SqlDbType.NText);
				myParameter.Value = content ;
				cmd.Parameters.Add(myParameter);
				try
				{
					connection.Open();
					int rows=cmd.ExecuteNonQuery();
					return rows;
				}
				catch(System.Data.SqlClient.SqlException E)
				{				
					throw new Exception(E.Message);
				}
				finally
				{
					cmd.Dispose();
					connection.Close();
				}	
			}
		}		
		/// <summary>
		/// 执行带一个存储过程参数的的SQL语句。
		/// </summary>
		/// <param name="SQLString">SQL语句</param>
		/// <param name="content">参数内容,比如一个字段是格式复杂的文章，有特殊符号，可以通过这个方式添加</param>
		/// <returns>影响的记录数</returns>
		public static object ExecuteSqlGet(string SQLString,string content)
		{				
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand cmd = new SqlCommand(SQLString,connection);		
				System.Data.SqlClient.SqlParameter  myParameter = new System.Data.SqlClient.SqlParameter ( "@content", SqlDbType.NText);
				myParameter.Value = content ;
				cmd.Parameters.Add(myParameter);
				try
				{
					connection.Open();
					object obj = cmd.ExecuteScalar();
					if((Object.Equals(obj,null))||(Object.Equals(obj,System.DBNull.Value)))
					{					
						return null;
					}
					else
					{
						return obj;
					}		
				}
				catch(System.Data.SqlClient.SqlException E)
				{				
					throw new Exception(E.Message);
				}
				finally
				{
					cmd.Dispose();
					connection.Close();
				}	
			}
		}		
		/// <summary>
		/// 向数据库里插入图像格式的字段(和上面情况类似的另一种实例)
		/// </summary>
		/// <param name="strSQL">SQL语句</param>
		/// <param name="fs">图像字节,数据库的字段类型为image的情况</param>
		/// <returns>影响的记录数</returns>
		public static int ExecuteSqlInsertImg(string strSQL,byte[] fs)
		{		
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand cmd = new SqlCommand(strSQL,connection);	
				System.Data.SqlClient.SqlParameter  myParameter = new System.Data.SqlClient.SqlParameter ( "@fs", SqlDbType.Image);
				myParameter.Value = fs ;
				cmd.Parameters.Add(myParameter);
				try
				{
					connection.Open();
					int rows=cmd.ExecuteNonQuery();
					return rows;
				}
				catch(System.Data.SqlClient.SqlException E)
				{				
					throw new Exception(E.Message);
				}
				finally
				{
					cmd.Dispose();
					connection.Close();
				}				
			}
		}
		
		/// <summary>
		/// 执行一条计算查询结果语句，返回查询结果（object）。
		/// </summary>
		/// <param name="SQLString">计算查询结果语句</param>
		/// <returns>查询结果（object）</returns>
		public static object GetSingle(string SQLString)
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				using(SqlCommand cmd = new SqlCommand(SQLString,connection))
				{
					try
					{
						connection.Open();
						object obj = cmd.ExecuteScalar();
						if((Object.Equals(obj,null))||(Object.Equals(obj,System.DBNull.Value)))
						{					
							return null;
						}
						else
						{
							return obj;
						}				
					}
					catch(System.Data.SqlClient.SqlException e)
					{						
						connection.Close();
						throw new Exception(e.Message);
					}	
				}
			}
		}
		public static object GetSingle(string SQLString,int Times)
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				using(SqlCommand cmd = new SqlCommand(SQLString,connection))
				{
					try
					{
						connection.Open();
						cmd.CommandTimeout=Times;
						object obj = cmd.ExecuteScalar();
						if((Object.Equals(obj,null))||(Object.Equals(obj,System.DBNull.Value)))
						{					
							return null;
						}
						else
						{
							return obj;
						}				
					}
					catch(System.Data.SqlClient.SqlException e)
					{						
						connection.Close();
						throw new Exception(e.Message);
					}	
				}
			}
		}
		/// <summary>
        /// 执行查询语句，返回SqlDataReader ( 注意：使用后一定要对SqlDataReader进行Close )
		/// </summary>
		/// <param name="strSQL">查询语句</param>
		/// <returns>SqlDataReader</returns>
		public static SqlDataReader ExecuteReader(string strSQL)
		{
			SqlConnection connection = new SqlConnection(connectionString);			
			SqlCommand cmd = new SqlCommand(strSQL,connection);				
			try
			{
				connection.Open();	
				SqlDataReader myReader = cmd.ExecuteReader();
				return myReader;
			}
			catch(System.Data.SqlClient.SqlException e)
			{								
				throw new Exception(e.Message);
			}		
//			finally
//			{
//				cmd.Dispose();
//				connection.Close();
//			}	
			
		}		
		/// <summary>
		/// 执行查询语句，返回DataSet
		/// </summary>
		/// <param name="SQLString">查询语句</param>
		/// <returns>DataSet</returns>
		public static DataSet Query(string SQLString)
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				DataSet ds = new DataSet();
				try
				{
					connection.Open();					
					SqlDataAdapter command = new SqlDataAdapter(SQLString,connection);						
					command.Fill(ds,"ds");
				}
				catch(System.Data.SqlClient.SqlException ex)
				{				
					throw new Exception(ex.Message);
				}			
				return ds;
			}			
		}
		public static DataSet Query(string SQLString,int Times)
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				DataSet ds = new DataSet();
				try
				{
					connection.Open();					
					SqlDataAdapter command = new SqlDataAdapter(SQLString,connection);		
					command.SelectCommand.CommandTimeout=Times;
					command.Fill(ds,"ds");
				}
				catch(System.Data.SqlClient.SqlException ex)
				{				
					throw new Exception(ex.Message);
				}			
				return ds;
			}			
		}
		


		#endregion


	}

