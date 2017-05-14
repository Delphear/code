using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
/// <summary>
/// fun 的摘要说明
/// </summary>
public class fun
{
	public fun()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public static string Left(string sSource, int iLength)
    {
        return sSource.Substring(0, iLength > sSource.Length ? sSource.Length : iLength);
    }
    /// <summary>
    /// encrypting string
    /// </summary>
    /// <param name="Password">encrypting string</param>
    /// <param name="Format">format,0 is SHA1,1 is MD5</param>
    /// <returns></returns>
    public static string Encrypt(string Password, int Format)
    {
        string str = "";
        switch (Format)
        {
            case 0:
                str = FormsAuthentication.HashPasswordForStoringInConfigFile(Password, "SHA1");
                break;
            case 1:
                str = FormsAuthentication.HashPasswordForStoringInConfigFile(Password, "MD5");
                break;
        }
        return str;
    }
    public static string GenerateMix(int CodeLength)
    {
        int number;
        StringBuilder result = new StringBuilder();

        System.Random random = new Random();

        for (int i = 0; i < CodeLength; i++)
        {
            number = random.Next();

            if (number % 2 == 0)
                result.Append(((char)('0' + (char)(number % 10))).ToString());
            else
                result.Append(((char)('A' + (char)(number % 26))).ToString());

        }
        return result.ToString();
    }
    public string GenerateMixNo(int CodeLength)
    {
        int number;
        StringBuilder result = new StringBuilder();

        System.Random random = new Random();

        for (int i = 0; i < CodeLength; i++)
        {
            number = random.Next();
            if ((i+1) % 6 == 0 && i!=0 && i!=CodeLength)
                result.Append("-");
            else
            result.Append(((char)('0' + (char)(number % 10))).ToString());
        }
        return result.ToString();
    }

    public static string CreateValidateNumber(int length)
    {
        int[] randMembers = new int[length];
        int[] validateNums = new int[length];
        string validateNumberStr = "";
        //生成起始序列值
        int seekSeek = unchecked((int)DateTime.Now.Ticks);
        Random seekRand = new Random(seekSeek);
        int beginSeek = (int)seekRand.Next(0, Int32.MaxValue - length * 10000);
        int[] seeks = new int[length];
        for (int i = 0; i < length; i++)
        {
            beginSeek += 10000;
            seeks[i] = beginSeek;
        }
        //生成随机数字
        for (int i = 0; i < length; i++)
        {
            Random rand = new Random(seeks[i]);
            int pownum = 1 * (int)Math.Pow(10, length);
            randMembers[i] = rand.Next(pownum, Int32.MaxValue);
        }
        //抽取随机数字
        for (int i = 0; i < length; i++)
        {
            string numStr = randMembers[i].ToString();
            int numLength = numStr.Length;
            Random rand = new Random();
            int numPosition = rand.Next(0, numLength - 1);
            validateNums[i] = Int32.Parse(numStr.Substring(numPosition, 1));
        }
        //生成验证码
        for (int i = 0; i < length; i++)
        {
            validateNumberStr += validateNums[i].ToString();
        }
        return validateNumberStr;
    }

}
