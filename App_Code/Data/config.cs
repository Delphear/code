using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
namespace Sper.Data
{
    /// <summary>
    /// 类config。
    /// </summary>
    public class config
    {
        public config()
        { }
        #region Model
        private int _id;
        private string _site_url;
        private string _site_name;
        private string _site_logo;
        private string _page_meta;
        private string _page_top_info;
        private string _page_foot_info;
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
        public string site_url
        {
            set { _site_url = value; }
            get { return _site_url; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string site_name
        {
            set { _site_name = value; }
            get { return _site_name; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string site_logo
        {
            set { _site_logo = value; }
            get { return _site_logo; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string page_meta
        {
            set { _page_meta = value; }
            get { return _page_meta; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string page_top_info
        {
            set { _page_top_info = value; }
            get { return _page_top_info; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string page_foot_info
        {
            set { _page_foot_info = value; }
            get { return _page_foot_info; }
        }
        #endregion Model


        #region  成员方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from config");
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
            strSql.Append("insert into config(");
            strSql.Append("site_url,site_name,site_logo,page_meta,page_top_info,page_foot_info)");
            strSql.Append(" values (");
            strSql.Append("@site_url,@site_name,@site_logo,@page_meta,@page_top_info,@page_foot_info)");
            SqlParameter[] parameters = {
					new SqlParameter("@site_url", SqlDbType.VarChar,50),
					new SqlParameter("@site_name", SqlDbType.VarChar,50),
					new SqlParameter("@site_logo", SqlDbType.Text),
					new SqlParameter("@page_meta", SqlDbType.Text),
					new SqlParameter("@page_top_info", SqlDbType.Text),
					new SqlParameter("@page_foot_info", SqlDbType.Text)};
            parameters[0].Value = site_url;
            parameters[1].Value = site_name;
            parameters[2].Value = site_logo;
            parameters[3].Value = page_meta;
            parameters[4].Value = page_top_info;
            parameters[5].Value = page_foot_info;

            DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        public void Update()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update config set ");
            strSql.Append("site_url=@site_url,");
            strSql.Append("site_name=@site_name,");
            strSql.Append("site_logo=@site_logo,");
            strSql.Append("page_meta=@page_meta,");
            strSql.Append("page_top_info=@page_top_info,");
            strSql.Append("page_foot_info=@page_foot_info");
            //strSql.Append("where id=@" + id + "");
            SqlParameter[] parameters = {
					new SqlParameter("@site_url", SqlDbType.VarChar,50),
					new SqlParameter("@site_name", SqlDbType.VarChar,50),
					new SqlParameter("@site_logo", SqlDbType.Text),
					new SqlParameter("@page_meta", SqlDbType.Text),
					new SqlParameter("@page_top_info", SqlDbType.Text),
					new SqlParameter("@page_foot_info", SqlDbType.Text)};
            parameters[0].Value = site_url;
            parameters[1].Value = site_name;
            parameters[2].Value = site_logo;
            parameters[3].Value = page_meta;
            parameters[4].Value = page_top_info;
            parameters[5].Value = page_foot_info;

            DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from config ");
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
            strSql.Append("select [id],[site_url],[site_name],[site_logo],[page_meta],[page_top_info],[page_foot_info] ");
            strSql.Append(" FROM config ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        #endregion  成员方法
    }
}

