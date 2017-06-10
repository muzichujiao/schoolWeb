using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_courseList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            oucITEntities db = new oucITEntities();
            string temTitle = "物理系";
            if (Request.QueryString["type"] != "本科生教育")
                Response.Redirect("index.aspx");
            if (Request.QueryString["item"] != null)
                temTitle = Request.QueryString["item"];

            // 绑定院系名称
            lbdepartment.Text = temTitle.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
            lbenglishDepart.Text = ArticleHelper.GetEnglishItems(temTitle);

            // 绑定课程repeater
            switch (temTitle)
            {
                case "电子工程系":
                    lbtnMajor1.Text = "电子信息科学与技术";
                    lbtnMajor1.Visible = true;
                    lbtnMajor2.Text = "电子信息工程";
                    lbtnMajor2.Visible = true;
                    lbtnMajor3.Text = "通信工程";
                    lbtnMajor3.Visible = true;
                    Repeater1.DataSource = CourseHelper.GetCoursesOfTheMajor("电子信息科学与技术", db);
                    Repeater1.DataBind();
                    Repeater2.DataSource = CourseHelper.GetCoursesOfTheMajor("电子信息工程", db);
                    Repeater2.DataBind();
                    Repeater3.DataSource = CourseHelper.GetCoursesOfTheMajor("通信工程", db);
                    Repeater3.DataBind();
                    break;
                case "物理系":
                    lbtnMajor1.Text = "物理学";
                    lbtnMajor1.Visible = true;
                    lbtnMajor2.Text = "光信息科学与技术";
                    lbtnMajor2.Visible = true;
                    Repeater1.DataSource = CourseHelper.GetCoursesOfTheMajor("物理学", db);
                    Repeater1.DataBind();
                    Repeater2.DataSource = CourseHelper.GetCoursesOfTheMajor("光信息科学与技术", db);
                    Repeater2.DataBind();

                    break;
                case "计算机科学与技术系":
                    lbtnMajor1.Text = "计算机科学与技术";
                    lbtnMajor1.Visible = true;
                    Repeater1.DataSource = CourseHelper.GetCoursesOfTheMajor("计算机科学与技术", db);
                    Repeater1.DataBind();

                    break;
                case "海洋技术系":
                    lbtnMajor1.Text = "海洋技术";
                    lbtnMajor1.Visible = true;
                    Repeater1.DataSource = CourseHelper.GetCoursesOfTheMajor("海洋技术", db);
                    Repeater1.DataBind();

                    break;
                default:
                    Response.Redirect("index.aspx");
                    break;
            }
        }
    }

    // 控制显示不同专业的课程
    protected void lbtnMajor1_Click(object sender, EventArgs e)
    {
        Repeater1.Visible = true;
        Repeater2.Visible = false;
        Repeater3.Visible = false;
    }

    protected void lbtnMajor2_Click(object sender, EventArgs e)
    {
        Repeater1.Visible = false;
        Repeater2.Visible = true;
        Repeater3.Visible = false;
    }

    protected void lbtnMajor3_Click(object sender, EventArgs e)
    {
        Repeater1.Visible = false;
        Repeater2.Visible = false;
        Repeater3.Visible = true;
    }

}