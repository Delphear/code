using System;
using System.Text;
using System.IO;
using System.Net;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

/// <summary>
/// robot_download 的摘要说明
/// 此类实现传递进入的html代码中的图片自动下载工作
/// </summary>
public class robot_download
{   
    public string HTML = string.Empty;

    public ArrayList oldpics = new ArrayList();
    public ArrayList pics = new ArrayList();

    public bool needlogo = true;
    public string logo = string.Empty;
	public robot_download()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 开始分析数据
    /// </summary>
    public void start()
    {
        int TopCount = 0;

        string Pattern = @"http:\/\/[^\'\""]*\.jpg|http:\/\/[^\'\""]*\.gif";
        System.Text.RegularExpressions.Regex Re = new System.Text.RegularExpressions.Regex(Pattern);

        TopCount = Re.Matches(HTML).Count;


        int count = 0;

        foreach (System.Text.RegularExpressions.Match m in Re.Matches(HTML))
        {

            //Response.Write(m.Value + "<br>");
            oldpics.Add(m.Value);
            download(m.Value, count.ToString());
            count++;
        }
        for (int i = 0; i < pics.Count; i++)
        {
            HTML = HTML.Replace(oldpics[i].ToString(), pics[i].ToString());

        }

        //Response.Write(pics.Count.ToString());
        //Response.Write(pics[0].ToString());
    }
    private void download(string url, string ii)
    {

        try
        {
            string extend = url.Substring(url.LastIndexOf("."));
            //string name = this.tbKey.Text + Guid.NewGuid().ToString();
            string fileName = DateTime.Now.ToString("yyyyMdHmss") + ii + extend;

            WebRequest myRequest = WebRequest.Create(url);
            Stream stream = myRequest.GetResponse().GetResponseStream();
            Byte[] buffer = new byte[256];

            string path = System.Web.HttpContext.Current.Server.MapPath("~/Uploads/" + DateTime.Now.ToString("yyyyM") + "/");

            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            string fullName;
            fullName = path + fileName;

            string webdownsrc = "Uploads/" + DateTime.Now.ToString("yyyyM") + "/" + fileName;
            //Response.Write(webdownsrc);

            FileStream filestream = new FileStream(fullName, FileMode.Create, FileAccess.Write);
            int sizeCount = stream.Read(buffer, 0, 256);
            try
            {

                while (sizeCount > 0)
                {
                    filestream.Write(buffer, 0, sizeCount);
                    sizeCount = stream.Read(buffer, 0, 256);
                }
                pics.Add(webdownsrc);
            }
            catch (Exception ex)
            {


            }
            filestream.Close();
            stream.Close();


        }
        catch (Exception ex)
        {


        }

    }
    /// <summary>
    /// 生成缩略图
    /// </summary>
    public bool Simages(string pathfrom, string pathto)
    {
        int x;
        int y;

        float x1 = Bitmap.FromFile(pathfrom).Width;
        float y1 = Bitmap.FromFile(pathfrom).Height;

        float z = x1 / y1;
        x = Convert.ToInt32(x1);
        y = Convert.ToInt32(y1);
        float u = 1 / z;
        if (z > 1)
        {
            x = 130;

            y = Convert.ToInt32(130 * u);
        }
        else if (z < 1)
        {
            y = 130;

            //Response.Write(z);

            x = Convert.ToInt32(130 * z);
        }
        else
        {
            x = 130;
            y = 130;
        }
        System.Drawing.Image img = System.Drawing.Image.FromFile(pathfrom);
        img = img.GetThumbnailImage(x, y, null, IntPtr.Zero);//width,height,是高,改变图片的大小
        img.Save(pathto);
        img.Dispose();
        return true;
    }
    /// <summary>
    ///  加图片水印
    /// </summary>
    /// <param name="path"></param>
    /// <param name="i"></param>
    /// <param name="extension"></param>
    /// <param name="filename"></param>
    /// <param name="folder"></param>
    /// <returns></returns>
    //public bool Addlogoimg(string path, int i, string extension, string filename, string folder)
    //{

    //    //加图片水印
    //    System.Drawing.Image image = System.Drawing.Image.FromFile(path);


    //    System.Drawing.Image copyImage = System.Drawing.Image.FromFile(Server.MapPath("../template") + "/水印logo.png");
    //    Graphics g = Graphics.FromImage(image);

    //    g.DrawImage(copyImage, new Rectangle(image.Width - copyImage.Width, image.Height - copyImage.Height, copyImage.Width, copyImage.Height), 0, 0, copyImage.Width, copyImage.Height, GraphicsUnit.Pixel);
    //    g.Dispose();

    //    string newPath = Server.MapPath("../") + "Shtml/" + folder + "/Images/" + filename + extension;

    //    image.Save(newPath);
    //    image.Dispose();
    //    //if(File.Exists(path))
    //    //{
    //    //File.Delete(path);
    //    //}

    //    Response.Write("搞定");
    //    return true;
    //}
}
