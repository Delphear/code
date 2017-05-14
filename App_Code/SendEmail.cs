using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Net.Mail;
using System.Web.Mail;
using System.Net;

/// <summary>
/// SendEmail 的摘要说明
/// </summary>
public class SendEmail
{
	public SendEmail()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    private void sendMail(string title, string body, string toAdress, string fromAdress, string userName, string userPwd, string smtpHost)
    {
        try
        {
            MailAddress to = new MailAddress(toAdress);
            MailAddress from = new MailAddress(fromAdress);
            System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
            message.Subject = title;
            message.Body = body;
            SmtpClient smtp = new SmtpClient();
            smtp.Port = 25;
            smtp.Credentials = new NetworkCredential(userName, userPwd);
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Host = smtpHost;
            message.To.Add(toAdress);
            smtp.Send(message);
        }
        catch (Exception ex)
        {
            ////////
        }
    }
}
