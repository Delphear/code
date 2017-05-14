using System;
using System.Collections;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
namespace Sp
{
    public class Dbbase
    {
        public Dbbase()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        /// <summary> 
        /// 查询一级栏目 
        /// </summary> 
        /// <returns></returns> 
        public DataSet SelectSubjct1()
        {
            string con = ConfigurationManager.ConnectionStrings["SperConnectionString1"].ToString();
            SqlConnection conn = new SqlConnection(con);
            string sqlstr = "SELECT * FROM h_nodes WHERE pid = 1";
            DataSet dst = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(sqlstr, conn);
            try
            {
                sda.Fill(dst);
                return dst;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        /// <summary> 
        /// 查询二级栏目内容 
        /// </summary> 
        /// <param name="ccode"></param> 
        /// <returns></returns> 
        public DataSet Selectsubjct2(int ccode)
        {
            string conn1 = ConfigurationManager.ConnectionStrings["SperConnectionString1"].ToString();
            SqlConnection conn = new SqlConnection(conn1);
            string sqqq = "select * from h_nodes where pid = " + ccode + "";
            DataSet dss = new DataSet();
            SqlDataAdapter sdd = new SqlDataAdapter(sqqq, conn);
            try
            {
                sdd.Fill(dss);
                return dss;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        /// <summary> 
        /// 查询三级栏目内容 
        /// </summary> 
        /// <param name="cde"></param> 
        /// <returns></returns> 
        public DataSet selectsubject3(int cde)
        {
            string conn2 = ConfigurationManager.ConnectionStrings["SperConnectionString1"].ToString();
            SqlConnection conn = new SqlConnection(conn2);
            string sqq = "select * from h_nodes where pid = " + cde + "";
            DataSet dst = new DataSet();
            SqlDataAdapter sdaa = new SqlDataAdapter(sqq, conn);
            try
            {
                sdaa.Fill(dst);
                return dst;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
