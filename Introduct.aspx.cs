using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Introduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 1;
        try
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
        }
        catch (Exception ex)
        {
            id = 1;
        }
        Teacher teacher = TeacherHelper.Select(id);
        ltDepartment.Text = getInfor(teacher.Department);
        ltEducation.Text = getInfor(teacher.Education);
        ltPolitical.Text = getInfor(teacher.PoliticsStatus);
        ltEmail.Text = getInfor(teacher.Email);
        ltPhone.Text = getInfor(teacher.MobilePhone);
        ltOffice.Text = getInfor(teacher.Address);
        ltSpell.Text = EcanConvertToCh.getNameSpell(teacher.Name);
        ltName.Text = teacher.Name;
        if (imgPerson.ImageUrl == "" || imgPerson.ImageUrl == null) 
            imgPerson.ImageUrl = "images/morentouxiang.png";
        else
            imgPerson.ImageUrl = teacher.ImgUrl;

        if (teacher.Course == null || teacher.Course == "") 
            Course.Visible = false;
        else
            ltCourse.Text = teacher.Course;
        if (teacher.Experience == null || teacher.Experience == "")
            Experience.Visible = false;
        else
            ltExperience.Text = teacher.Experience;
        if (teacher.ResearchDirection == null || teacher.ResearchDirection == "")
            ResearchDirection.Visible = false;
        else
            ltResearchDirection.Text = teacher.ResearchDirection;
        if (teacher.ResearchProject == null || teacher.ResearchProject == "")
            ResearchProject.Visible = false;
        else
            ltResearchProject.Text = teacher.ResearchProject;
        if (teacher.Achievements == null || teacher.Achievements == "")
            Achievements.Visible = false;
        else
            ltAchievements.Text = teacher.Achievements;
        if (teacher.Paper == null || teacher.Paper == "")
            Paper.Visible = false;
        else
            ltPaper.Text = teacher.Paper;
        if (teacher.Enrolment == null || teacher.Enrolment == "")
            Enrolment.Visible = false;
        else
            ltEnrolment.Text = teacher.Enrolment;
        if (teacher.Remark == null || teacher.Remark == "")
            Remark.Visible = false;
        else
            ltRemark.Text = teacher.Remark;

    }

    string getInfor(string infor)
    {
        if (infor == null)
            return "暂无信息";
        else
            return infor;
    }
}