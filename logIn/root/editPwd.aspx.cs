﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_root_editPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Regex rePwd = new Regex(@"^[a-zA-Z]\w{6,18}$");
        if (txtNewPsw.Text.Trim() == "" || txtAgainPsw.Text.Trim() == "")
        {
            Response.Write(JSHelper.ShowAlert("请输入密码"));
        }
        else
        {
            if (!rePwd.IsMatch(txtNewPsw.Text))
            {
                Response.Write(JSHelper.ShowAlert("请输入合法密码"));
                return;
            }
            else if (txtNewPsw.Text != txtAgainPsw.Text)
            {
                Response.Write(JSHelper.ShowAlert("新密码和确认密码不同"));
            }
            else
            {
                User user = (User)Session["User"];
                bool result = UserHelper.UpdatePwd(user.Number, txtAgainPsw.Text);
                if (result == true)
                {
                    Session.Clear();
                    Response.Write("<script>alert('修改成功,请重新登录!');window.location.href ='../Login.aspx'</script>");
                }
                else
                {
                    Response.Write(JSHelper.ShowAlert("修改失败"));
                }
            }
        }
    }
}