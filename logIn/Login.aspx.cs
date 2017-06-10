using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Login : System.Web.UI.Page
{
    RsaHelper rsa = new RsaHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpCookie cookies = new HttpCookie("_RSA");
            cookies["Exponent"] = rsa.getRsaInfo().exponent;
            cookies["Modulus"] = rsa.getRsaInfo().modulus;
            cookies.Expires = DateTime.Now.AddSeconds(60);     //设置秘钥存活时间
            Response.Cookies.Add(cookies);
        }
        if (Session["User"] != null)
        {
            if (((User)Session["User"]).Number == "htoorticuoh")
                //Session.Clear();
                Response.Write("<script>alert('您的账号已登录');location.href='./root/adminList.aspx';</script>");
            else
                Response.Write("<script>alert('您的账号已登录');location.href='Index.aspx';</script>");

        }
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        string userip = IPHelper.GetIP();
        string trueVali = Session["Vnum"].ToString().ToUpper();
        string userid = username.Text;
        string userPwd = rsa.decryptPwd(password.Text);
        User u = new User();
        u = UserHelper.Login(username.Text, userPwd);
        if(IPHelper.CheckIsAble(userip,userid))
        {
            if (check.Text.Trim().ToUpper() == trueVali)
            {
                if (u != null)
                {
                    Session["User"] = u;
                    //判断是否是root用户
                    if (u.Number != "htoorticuoh")
                    {
                        LogHelper.addLog(u.UserID);
                        Response.Redirect("Index.aspx");
                    }
                    else
                        Response.Redirect("./root/adminList.aspx");
                }
                else
                {
                    IPHelper.AddTime(userip,userid);
                    Response.Write("<script>alert('用户名或密码错误（输入错误5次后需等待5分钟后才可重复尝试）');location.href='login.aspx';</script>");
                }
            }
            else
                Response.Write("<script>alert('验证码错误');location.href='login.aspx';</script>");
            Session["Vnum"] = null;
            Session.Remove("Vnum");
        }
        else
        {
            Response.Write("<script>alert('输错密码次数超过5次，请求失败');location.href='/Display/Index.aspx';</script>");
            //Response.End();
        }
    }
}