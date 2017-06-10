using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_root_adminList : System.Web.UI.Page
{
    List<myData> teacherLs = new List<myData>();
    List<myData> studentLs = new List<myData>();
    public class myData
    {
        public int userId { get; set; }
        public string name { get; set; }
        public string number { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");
        if (!IsPostBack)
        {
            getDataSouce();
            gdvTeacherLs.DataSource = teacherLs;
            gdvStudentLs.DataSource = studentLs;
            gdvTeacherLs.DataBind();
            gdvStudentLs.DataBind();
        }
    }

    protected void getDataSouce()
    {
        try
        {
            using (var db=new oucITEntities())
            {
                teacherLs = (from teac in db.Teacher
                            join userid in db.User
                            on teac.UserID equals userid.UserID
                            orderby userid.Number
                            select new myData { userId=userid.UserID,name=teac.Name,number=userid.Number })
                            .ToList();
                studentLs= (from stu in db.Student
                            join userid in db.User
                            on stu.UserID equals userid.UserID
                            orderby userid.Number
                            select new myData { userId = userid.UserID, name = stu.Name, number = userid.Number })
                            .ToList();
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("adminList.aspx");
        }
    }

    


    protected void gdvTeacherLs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Reset")
        {
            string userNum = e.CommandArgument.ToString().Trim();
            if (UserHelper.UpdatePwd(userNum, "OUCIT"))
            {
                Response.Write(JSHelper.ShowAlert("密码重置成功，密码为：OUCIT"));
            }
            else
            {
                Response.Write(JSHelper.ShowAlert("密码重置失败，请重试！"));
            }
        }
        else if(e.CommandName == "mydelete")
        {
            int userId = Convert.ToInt32(e.CommandArgument.ToString().Trim());
            if(UserHelper.Delete(userId))
            {
                Response.Write(JSHelper.ShowAlert("用户删除成功"));
                Response.Redirect("adminList.aspx");
            }
            else
            {
                Response.Write(JSHelper.ShowAlert("用户删除成功，请重试！"));
                Response.Redirect("adminList.aspx");

            }
        }
    }


    protected void gdvTeacherLs_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        getDataSouce();
        gdvTeacherLs.PageIndex = e.NewPageIndex;
        gdvTeacherLs.DataSource = teacherLs;
        gdvTeacherLs.DataBind();
    }

    protected void gdvStudentLs_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
       
        getDataSouce();
        gdvStudentLs.PageIndex = e.NewPageIndex;
        gdvStudentLs.DataSource = studentLs;
        gdvStudentLs.DataBind();
    }

    protected void gdvStudentLs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Reset")
        {
            string userNum = e.CommandArgument.ToString().Trim();
            if (UserHelper.UpdatePwd(userNum, "OUCIT"))
            {
                Response.Write(JSHelper.ShowAlert("密码重置成功，密码为：OUCIT"));
            }
            else
            {
                Response.Write(JSHelper.ShowAlert("密码重置失败，请重试！"));
            }
        }
        else if (e.CommandName == "mydelete")
        {
            int userId = Convert.ToInt32(e.CommandArgument.ToString().Trim());
            if (UserHelper.Delete(userId))
            {
                Response.Write(JSHelper.ShowAlert("用户删除成功"));
                Response.Redirect("adminList.aspx");
            }
            else
            {
                Response.Write(JSHelper.ShowAlert("用户删除成功，请重试！"));
                Response.Redirect("adminList.aspx");

            }
        }
    }

    protected void dpl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dpl.SelectedValue == "老师")
        {
            gdvTeacherLs.Visible = true;
            gdvStudentLs.Visible = false;
        }
        else
        {

            gdvTeacherLs.Visible = false;
            gdvStudentLs.Visible = true;
        }

    }
}