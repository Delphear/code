using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
namespace Sper.Data
{
    /// <summary>
    /// 类bmgl
    /// </summary>
    public class bmgl
    {

        public bmgl()
        { }
        #region Model
        private int _id;
        private string _dept;
        private int _num;

        /// <summary>
        /// 
        /// </summary>
        public int id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string dept
        {
            set { _dept = value; }
            get { return _dept; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int num
        {
            set { _num = value; }
            get { return _num; }
        }

        #endregion Model


        #region  成员方法
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public void Add()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into dept(");
            strSql.Append("dept,num)");
            strSql.Append(" values (");
            strSql.Append("@dept,@num)");
            SqlParameter[] parameters = {
                    new SqlParameter("@dept", SqlDbType.NVarChar),
					new SqlParameter("@num", SqlDbType.Int,4)};
            parameters[0].Value = dept;
            parameters[1].Value = num;
            DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        public void Update()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update dept set ");
            strSql.Append("dept=@dept,");
            strSql.Append("num=@num");
            strSql.Append(" where id=@" + id + "");
            SqlParameter[] parameters = {
					new SqlParameter("@dept", SqlDbType.NVarChar),
					new SqlParameter("@num", SqlDbType.Int,4)};
            parameters[0].Value = dept;
            parameters[1].Value = num;
            DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
        }
        #endregion  成员方法
    }
}