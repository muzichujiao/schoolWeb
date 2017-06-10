using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_teacherTeam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string major = "physics";
            if (Request.QueryString["type"] != "师资队伍")
                Response.Redirect("index.aspx");
            if (Request.QueryString["item"] != null)
                major = Request.QueryString["item"];
            panel1.Visible = true;
            panel2.Visible = false;
            panel3.Visible = false;
            panel4.Visible = false;
            //panel5.Visible = false;
            if (major == "physics")
            {
                lblMajor.Text = "物理系";
                lblEnglishMajor.Text = "physics";
                var db = new oucITEntities();
                // 绑定教授
                var list = (from a in db.Teacher
                            where a.Department == "物理系" && a.JobTitle == 1
                            orderby a.Birthday
                            select a).ToList();
                Repeater1.DataSource = list;
                Repeater1.DataBind();
                if (list.Count == 0)
                    Panel6.Visible = false;
                // 绑定博士生导师
                var list2 = (from a in db.Teacher
                             where a.Department == "物理系" && a.Tutor == 1
                             orderby a.Job, a.Birthday
                             select a).ToList();
                Repeater3.DataSource = list2;
                Repeater3.DataBind();
                if (list2.Count == 0)
                    Panel7.Visible = false;
                // 绑定硕士生导师
                var list3 = (from a in db.Teacher
                             where a.Department == "物理系" && (a.Tutor == 1 || a.Tutor == 2)
                             orderby a.Job, a.Tutor, a.Birthday
                             select a).ToList();
                Repeater4.DataSource = list3;
                Repeater4.DataBind();
                // 绑定信息工程中心
                var list4 = (from a in db.Teacher
                             where a.Department == "物理系" && a.JobTitle == 2
                             orderby a.Birthday
                             select a).ToList();
                Repeater2.DataSource = list4;
                Repeater2.DataBind();
                // 绑定高级工程师
                var list5 = (from a in db.Teacher
                             where a.Department == "物理系" && a.JobTitle == 3
                             orderby a.Birthday
                             select a).ToList();
                Repeater5.DataSource = list5;
                Repeater5.DataBind();
                if (list5.Count == 0)
                    Panel5.Visible = false;
                // 绑定高级实验师
                var list6 = (from a in db.Teacher
                             where a.Department == "物理系" && a.JobTitle == 4
                             orderby a.Birthday
                             select a).ToList();
                Repeater6.DataSource = list6;
                Repeater6.DataBind();
                if (list6.Count == 0)
                    Panel8.Visible = false;
                // 绑定讲师
                var list7 = (from a in db.Teacher
                             where a.Department == "物理系" && a.JobTitle == 5
                             orderby a.Birthday
                             select a).ToList();
                Repeater7.DataSource = list7;
                Repeater7.DataBind();
                if (list7.Count == 0)
                    Panel9.Visible = false;
                // 绑定助理工程师
                var list8 = (from a in db.Teacher
                             where a.Department == "物理系" && a.JobTitle == 6
                             orderby a.Birthday
                             select a).ToList();
                Repeater8.DataSource = list8;
                Repeater8.DataBind();
                if (list8.Count == 0)
                    Panel10.Visible = false;
                // 绑定助理实验师
                var list9 = (from a in db.Teacher
                             where a.Department == "物理系" && a.JobTitle == 7
                             orderby a.Birthday
                             select a).ToList();
                Repeater9.DataSource = list9;
                Repeater9.DataBind();
                if (list9.Count == 0)
                    Panel11.Visible = false;
            }
            else if (major == "electron")
            {
                panel1.Visible = true;
                panel4.Visible = false;
                lblMajor.Text = "电子工程系";
                lblEnglishMajor.Text = "electronic engineering";
                var db = new oucITEntities();
                var list = (from a in db.Teacher
                            where a.Department == "电子工程系" && a.JobTitle == 1
                            orderby a.Birthday
                            select a).ToList();
                Repeater1.DataSource = list;
                Repeater1.DataBind();
                if (list.Count == 0)
                    Panel6.Visible = false;
                var list2 = (from a in db.Teacher
                             where a.Department == "电子工程系" && a.Tutor == 1
                             orderby a.Job, a.Birthday
                             select a).ToList();
                Repeater3.DataSource = list2;
                Repeater3.DataBind();
                if (list2.Count == 0)
                    Panel7.Visible = false;
                var list3 = (from a in db.Teacher
                             where a.Department == "电子工程系" && (a.Tutor == 1 || a.Tutor == 2)
                             orderby a.Job, a.Tutor, a.Birthday
                             select a).ToList();
                Repeater4.DataSource = list3;
                Repeater4.DataBind();
                var list4 = (from a in db.Teacher
                             where a.Department == "电子工程系" && a.JobTitle == 2
                             orderby a.UserID
                             select a).ToList();
                Repeater2.DataSource = list4;
                Repeater2.DataBind();
                var list5 = (from a in db.Teacher
                             where a.Department == "电子工程系" && a.JobTitle == 3
                             orderby a.Birthday
                             select a).ToList();
                Repeater5.DataSource = list5;
                Repeater5.DataBind();
                if (list5.Count == 0)
                    Panel5.Visible = false;
                var list6 = (from a in db.Teacher
                             where a.Department == "电子工程系" && a.JobTitle == 4
                             orderby a.Birthday
                             select a).ToList();
                Repeater6.DataSource = list6;
                Repeater6.DataBind();
                if (list6.Count == 0)
                    Panel8.Visible = false;
                var list7 = (from a in db.Teacher
                             where a.Department == "电子工程系" && a.JobTitle == 5
                             orderby a.Birthday
                             select a).ToList();
                Repeater7.DataSource = list7;
                Repeater7.DataBind();
                if (list7.Count == 0)
                    Panel9.Visible = false;
                var list8 = (from a in db.Teacher
                             where a.Department == "电子工程系" && a.JobTitle == 6
                             orderby a.Birthday
                             select a).ToList();
                Repeater8.DataSource = list8;
                Repeater8.DataBind();
                if (list8.Count == 0)
                    Panel10.Visible = false;
                var list9 = (from a in db.Teacher
                             where a.Department == "电子工程系" && a.JobTitle == 7
                             orderby a.Birthday
                             select a).ToList();
                Repeater9.DataSource = list9;
                Repeater9.DataBind();
                if (list9.Count == 0)
                    Panel11.Visible = false;
            }
            else if (major == "computer")
            {
                lblMajor.Text = "计算机科学与技术系";
                lblEnglishMajor.Text = "computer science and technology";
                var db = new oucITEntities();
                var list = (from a in db.Teacher
                            where a.Department == "计算机科学与技术系" && a.JobTitle == 1
                            orderby a.Birthday
                            select a).ToList();
                Repeater1.DataSource = list;
                Repeater1.DataBind();
                if (list.Count == 0)
                    Panel6.Visible = false;
                var list2 = (from a in db.Teacher
                             where a.Department == "计算机科学与技术系" && a.Tutor == 1
                             orderby a.Job, a.Birthday
                             select a).ToList();
                Repeater3.DataSource = list2;
                Repeater3.DataBind();
                if (list2.Count == 0)
                    Panel7.Visible = false;
                var list3 = (from a in db.Teacher
                             where a.Department == "计算机科学与技术系" && (a.Tutor == 1 || a.Tutor == 2)
                             orderby a.Job, a.Tutor, a.Birthday
                             select a).ToList();
                Repeater4.DataSource = list3;
                Repeater4.DataBind();
                var list4 = (from a in db.Teacher
                             where a.Department == "计算机科学与技术系" && a.JobTitle == 2
                             orderby a.UserID
                             select a).ToList();
                Repeater2.DataSource = list4;
                Repeater2.DataBind();
                var list5 = (from a in db.Teacher
                             where a.Department == "计算机科学与技术系" && a.JobTitle == 3
                             orderby a.Birthday
                             select a).ToList();
                Repeater5.DataSource = list5;
                Repeater5.DataBind();
                if (list5.Count == 0)
                    Panel5.Visible = false;
                var list6 = (from a in db.Teacher
                             where a.Department == "计算机科学与技术系" && a.JobTitle == 4
                             orderby a.Birthday
                             select a).ToList();
                Repeater6.DataSource = list6;
                Repeater6.DataBind();
                if (list6.Count == 0)
                    Panel8.Visible = false;
                var list7 = (from a in db.Teacher
                             where a.Department == "计算机科学与技术系" && a.JobTitle == 5
                             orderby a.Birthday
                             select a).ToList();
                Repeater7.DataSource = list7;
                Repeater7.DataBind();
                if (list7.Count == 0)
                    Panel9.Visible = false;
                var list8 = (from a in db.Teacher
                             where a.Department == "计算机科学与技术系" && a.JobTitle == 6
                             orderby a.Birthday
                             select a).ToList();
                Repeater8.DataSource = list8;
                Repeater8.DataBind();
                if (list8.Count == 0)
                    Panel10.Visible = false;
                var list9 = (from a in db.Teacher
                             where a.Department == "计算机科学与技术系" && a.JobTitle == 7
                             orderby a.Birthday
                             select a).ToList();
                Repeater9.DataSource = list9;
                Repeater9.DataBind();
                if (list9.Count == 0)
                    Panel11.Visible = false;
            }
            else if (major == "ocean")
            {
                lblMajor.Text = "海洋技术系";
                lblEnglishMajor.Text = "marine technology";
                var db = new oucITEntities();
                var list = (from a in db.Teacher
                            where a.Department == "海洋技术系" && a.JobTitle == 1
                            orderby a.Birthday
                            select a).ToList();
                Repeater1.DataSource = list;
                Repeater1.DataBind();
                if (list.Count == 0)
                    Panel6.Visible = false;
                var list2 = (from a in db.Teacher
                             where a.Department == "海洋技术系" && a.Tutor == 1
                             orderby a.Job, a.Birthday
                             select a).ToList();
                Repeater3.DataSource = list2;
                Repeater3.DataBind();
                if (list2.Count == 0)
                    Panel7.Visible = false;
                var list3 = (from a in db.Teacher
                             where a.Department == "海洋技术系" && (a.Tutor == 1 || a.Tutor == 2)
                             orderby a.Job, a.Tutor, a.Birthday
                             select a).ToList();
                Repeater4.DataSource = list3;
                Repeater4.DataBind();
                var list4 = (from a in db.Teacher
                             where a.Department == "海洋技术系" && a.JobTitle == 2
                             orderby a.UserID
                             select a).ToList();
                Repeater2.DataSource = list4;
                Repeater2.DataBind();
                var list5 = (from a in db.Teacher
                             where a.Department == "海洋技术系" && a.JobTitle == 3
                             orderby a.Birthday
                             select a).ToList();
                Repeater5.DataSource = list5;
                Repeater5.DataBind();
                if (list5.Count == 0)
                    Panel5.Visible = false;
                var list6 = (from a in db.Teacher
                             where a.Department == "海洋技术系" && a.JobTitle == 4
                             orderby a.Birthday
                             select a).ToList();
                Repeater6.DataSource = list6;
                Repeater6.DataBind();
                if (list6.Count == 0)
                    Panel8.Visible = false;
                var list7 = (from a in db.Teacher
                             where a.Department == "海洋技术系" && a.JobTitle == 5
                             orderby a.Birthday
                             select a).ToList();
                Repeater7.DataSource = list7;
                Repeater7.DataBind();
                if (list7.Count == 0)
                    Panel9.Visible = false;
                var list8 = (from a in db.Teacher
                             where a.Department == "海洋技术系" && a.JobTitle == 6
                             orderby a.Birthday
                             select a).ToList();
                Repeater8.DataSource = list8;
                Repeater8.DataBind();
                if (list8.Count == 0)
                    Panel10.Visible = false;
                var list9 = (from a in db.Teacher
                             where a.Department == "海洋技术系" && a.JobTitle == 7
                             orderby a.Birthday
                             select a).ToList();
                Repeater9.DataSource = list9;
                Repeater9.DataBind();
                if (list9.Count == 0)
                    Panel11.Visible = false;
            }
            //else if (major == "it")
            //{

            //    lblMajor.Text = "行政人员";
            //    lblEnglishMajor.Text = "administrative staff";
            //    var db = new oucITEntities();
            //    var list10 = (from a in db.Teacher
            //                  where a.Department == "行政人员"
            //                  orderby a.JobTitle, a.UserID
            //                  select a).ToList();
            //    Repeater10.DataSource = list10;
            //    Repeater10.DataBind();
            //    panel1.Visible = false;
            //    panel4.Visible = true;
            //    panelChoose.Visible = false;
            //}
            else if (major == "it")
            {

                lblMajor.Text = "信息工程中心";
                lblEnglishMajor.Text = "information engineering center";
                var db = new oucITEntities();
                var list10 = (from a in db.Teacher
                              where a.Department == "信息工程中心"
                              orderby a.JobTitle, a.UserID
                              select a).ToList();
                Repeater10.DataSource = list10;
                Repeater10.DataBind();
                panel1.Visible = false;
                panel4.Visible = true;
                panelChoose.Visible = false;
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
        }
    }


    protected void lnkJob_Click(object sender, EventArgs e)
    {
        panel1.Visible = true;
        panel2.Visible = false;
        panel3.Visible = false;
    }
    protected void lnkBshTutor_Click(object sender, EventArgs e)
    {
        panel1.Visible = false;
        panel2.Visible = true;
        panel3.Visible = false;
    }

    protected void lnkYjsTutor_Click(object sender, EventArgs e)
    {
        panel1.Visible = false;
        panel2.Visible = false;
        panel3.Visible = true;
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblName = (Label)e.Item.FindControl("lblName");
            var t = TeacherHelper.Select(Convert.ToInt32(lblName.Text));
            if (t != null)
            {
                lblName.Text = t.Name;
            }
        }
    }

    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblName = (Label)e.Item.FindControl("lblName4");
            var t = TeacherHelper.Select(Convert.ToInt32(lblName.Text));
            if (t != null)
            {
                lblName.Text = t.Name;
            }
        }
    }

    protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblName = (Label)e.Item.FindControl("lblName2");
            var t = TeacherHelper.Select(Convert.ToInt32(lblName.Text));
            if (t != null)
            {
                lblName.Text = t.Name;
            }
        }
    }

    protected void Repeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblName = (Label)e.Item.FindControl("lblName3");
            var t = TeacherHelper.Select(Convert.ToInt32(lblName.Text));
            if (t != null)
            {
                lblName.Text = t.Name;
            }
        }
    }

    protected void Repeater5_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblName = (Label)e.Item.FindControl("lblName5");
            var t = TeacherHelper.Select(Convert.ToInt32(lblName.Text));
            if (t != null)
            {
                lblName.Text = t.Name;
            }
        }
    }

    protected void Repeater6_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblName = (Label)e.Item.FindControl("lblName6");
            var t = TeacherHelper.Select(Convert.ToInt32(lblName.Text));
            if (t != null)
            {
                lblName.Text = t.Name;
            }
        }
    }

    protected void Repeater7_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblName = (Label)e.Item.FindControl("lblName7");
            var t = TeacherHelper.Select(Convert.ToInt32(lblName.Text));
            if (t != null)
            {
                lblName.Text = t.Name;
            }
        }
    }

    protected void Repeater8_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblName = (Label)e.Item.FindControl("lblName8");
            var t = TeacherHelper.Select(Convert.ToInt32(lblName.Text));
            if (t != null)
            {
                lblName.Text = t.Name;
            }
        }
    }

    protected void Repeater9_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblName = (Label)e.Item.FindControl("lblName9");
            var t = TeacherHelper.Select(Convert.ToInt32(lblName.Text));
            if (t != null)
            {
                lblName.Text = t.Name;
            }
        }
    }

    protected void Repeater10_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblName = (Label)e.Item.FindControl("lblName10");
            var t = TeacherHelper.Select(Convert.ToInt32(lblName.Text));
            if (t != null)
            {
                lblName.Text = t.Name;
            }
        }
    }
}