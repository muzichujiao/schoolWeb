using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_root_addAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        string number = userNum.Text.Trim();
        Regex reNUm = new Regex(@"[0-9a-zA-Z]{1,11}");
        string name = userName.Text.Trim();
        string pwd = userPwd.Text.Trim();
        string rptPwd = userPwdRpt.Text.Trim();
        Regex rePwd = new Regex(@"^[a-zA-Z]\w{6,18}$");
        if (string.IsNullOrEmpty(pwd) || string.IsNullOrEmpty(number) || string.IsNullOrEmpty(name))
        {
            Response.Write( JSHelper.ShowAlert("信息不能为空！"));
            return;
        }
        else
        {
            if (!reNUm.IsMatch(number) || !rePwd.IsMatch(pwd) || !pwd.Equals(rptPwd))
            {
                //Response.Write(JSHelper.ShowAlert("请输入合法学工号或密码"));
                return;
            }
        }
            if (!AdminHelper.Add(number, name, pwd, dpl.SelectedValue))
               Response.Write( JSHelper.ShowAlert("不能重复注册！"));
        else
        {
                Response.Write( JSHelper.ShowAlert("添加成功！\\n学工号： "+number+ "\\n密码: " + pwd+""));
            Response.Write("<script>location.href='adminList.aspx';</script>");
        }
       
    }
}