using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
namespace Sper.Data
{
    /// <summary>
    /// 类member_group。
    /// </summary>
    public class member_group
    {
        public member_group()
        { }
        #region Model
        private int _id;
        private string _name;
        private int _moneynum;
        private string _gremark;
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
        public string name
        {
            set { _name = value; }
            get { return _name; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int moneynum
        {
            set { _moneynum = value; }
            get { return _moneynum; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string gremark
        {
            set { _gremark = value; }
            get { return _gremark; }
        }
        #endregion Model


        #region  成员方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from member_group");
            strSql.Append("where id=@" + id + "");

            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)					};
            parameters[0].Value = id;
            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public void Add()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into member_group(");
            strSql.Append("name,moneynum,gremark)");
            strSql.Append(" values (");
            strSql.Append("@name,@moneynum,@gremark)");
            SqlParameter[] parameters = {
					new SqlParameter("@name", SqlDbType.NVarChar),
					new SqlParameter("@moneynum", SqlDbType.Int,4),
					new SqlParameter("@gremark", SqlDbType.VarChar,50)};
            parameters[0].Value = name;
            parameters[1].Value = moneynum;
            parameters[2].Value = gremark;

            DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        public void Update()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update member_group set ");
            strSql.Append("name=@name,");
            strSql.Append("moneynum=@moneynum,");
            strSql.Append("gremark=@gremark");
            strSql.Append("where id=@" + id + "");
            SqlParameter[] parameters = {
					new SqlParameter("@name", SqlDbType.NVarChar),
					new SqlParameter("@moneynum", SqlDbType.Int,4),
					new SqlParameter("@gremark", SqlDbType.VarChar,50)};
            parameters[0].Value = name;
            parameters[1].Value = moneynum;
            parameters[2].Value = gremark;

            DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from member_group ");
            strSql.Append("where id=@" + id + "");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)					};
            parameters[0].Value = id;

            DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select [id],[name],[moneynum],[gremark] ");
            strSql.Append(" FROM member_group ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        #endregion  成员方法
    }
}

