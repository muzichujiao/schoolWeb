using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");
        int id = ((User)Session["User"]).UserID;
        string type = UserHelper.RtnType(id);
        if(type == "Teacher")
        {
            using (var db = new oucITEntities())
            {
                var teacher = (from it in db.Teacher where it.UserID == id select it).FirstOrDefault();
                lbWelcome.Text = "Welcome " + teacher.Name; 
            }
        }
        else
        {
            using (var db = new oucITEntities())
            {
                var student = (from it in db.Student where it.UserID == id select it).FirstOrDefault();
                lbWelcome.Text = "Welcome " + student.Name;
            }
        }

    }
}