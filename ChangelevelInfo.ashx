<%@ WebHandler Language="C#" Class="ChangelevelInfo" %>
using System;
using System.Web;
using System.Xml;
using System.Data;
using System.Data.SqlClient;


public class ChangelevelInfo : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
       // context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        context.Response.ContentType = "text/xml";
        int pageindex = Convert.ToInt32(context.Request.QueryString["Page"]);
        context.Response.Write(TVArray("死熊猫", pageindex).OuterXml);
    }

    //获得数据
    public XmlDocument TVArray(string type, int pageindex)
    {
        string sqlstr = "";
        int index = 1;
        if (pageindex > 1)
        {
            index = (pageindex - 1) * 10;
        }
        if (pageindex == 1)
        {
          //sqlstr = "select top 10 a.Business_id,a.Business_name,a.Business_area,a.Business_sort,a.Business_company,a.Business_Wenhao,a.Business_Sxshijian,a.Business_liuyan,b.image_name from business a,member_up_image b where a.Business_Pdimage=b.id order by Business_id";
            sqlstr = "select top 10 id,code,name,cityid from h_area order by id";
        }
        else
        {
           // sqlstr = "select top 10 a.Business_id,a.Business_name,a.Business_area,a.Business_sort,a.Business_company,a.Business_Wenhao,a.Business_Sxshijian,a.Business_liuyan,b.image_name from business a,member_up_image b where a.Business_Pdimage=b.id and (Business_id>(select max(Business_id) from (select top " + index + " Business_id from business  order by Business_id) as t)) order by Business_id";
            sqlstr = "select top 10 id,code,name,cityid from h_area where (id>(select max(id) from (select top " + index + " id from h_area  order by id) as t)) order by id";
        }
        DataSet ds = SqlDataAccess.GetInfo(sqlstr);
        string xmlds = ds.GetXml();
        XmlDocument xml = new XmlDocument();
        xml.LoadXml(xmlds);
        return xml;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}