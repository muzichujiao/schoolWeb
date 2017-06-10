using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_MessEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");
        else if (!IsPostBack)
        {

            User u = (User)Session["User"];
            if (u != null)
            {
                Teacher teac = TeacherHelper.Select(u.UserID);
                if (teac != null)
                {
                    
                    Image1.ImageUrl = teac.ImgUrl;
                    txtName.Text = teac.Name;
                    txtYear.Text = Convert.ToString(Convert.ToDateTime( teac.Birthday).Year);
                    txtMonth.Text = Convert.ToString(Convert.ToDateTime(teac.Birthday).Month);
                    txtDay.Text = Convert.ToString(Convert.ToDateTime(teac.Birthday).Day);
                    txtStatus.Text = teac.PoliticsStatus;
                    txtEducation.Text = teac.Education;
                    txtMobile.Text = teac.MobilePhone;
                    txtOffice.Text = teac.OfficePhone;
                    txtEmail.Text = teac.Email;
                    txtWork.Text = teac.WorkPlace;
                    txtAddress.Text = teac.Address;
                    int NotNull = 0;
                    if(teac.JobTitle != null)
                        NotNull = int.Parse(teac.JobTitle.ToString());
                    ddlJobTitle.Text = TeacherHelper.ChangeJobTitle(NotNull);
                    NotNull = 0;
                    if (teac.Job != null)
                        NotNull = int.Parse(teac.Job.ToString());
                    ddlJob.Text = TeacherHelper.ChangeJob(NotNull);
                    NotNull = 0;
                    if (teac.Tutor != null)
                        NotNull = int.Parse(teac.Tutor.ToString());
                    ddlTutor.Text = TeacherHelper.ChangeTutor(NotNull);
                    ddlDepartment.Text = teac.Department;
                    txtCourse.Text = teac.Course;
                    txtExperience.Text = teac.Experience == null ? "" : teac.Experience.Replace("<br>", "\r\n");
                    txtResearchDirection.Text = teac.ResearchDirection == null ? "" : teac.ResearchDirection.Replace("<br>", "\r\n");
                    txtResearchProject.Text = teac.ResearchProject == null ? "" : teac.ResearchProject.Replace("<br>", "\r\n");
                    txtAchievements.Text = teac.Achievements == null ? "" : teac.Achievements.Replace("<br>", "\r\n");
                    txtPaper.Text = teac.Paper == null ? "" : teac.Paper.Replace("<br>", "\r\n");
                    txtEnrolment.Text = teac.Enrolment == null ? "" : teac.Enrolment.Replace("<br>", "\r\n");
                    txtRemark.Text = teac.Remark == null ? "" : teac.Remark.Replace("<br>", "\r\n");
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //传到哪？
        string url = "";

        /// <summary>
        if (FileUpload1.HasFile)
        {
            var savePath = HttpContext.Current.Server.MapPath("~/Uploads/");
            var fileName = FileUpload1.FileName;
            var fileExtension = Path.GetExtension(FileUpload1.FileName).ToLower();
            string[] allowedExtension = { ".png", ".gif", ".jpg" };
            if (allowedExtension.Contains(fileExtension))
            {
                fileName = DateTime.Now.ToString("yyyyMMdd-HHmmssff_") + fileName;
                FileUpload1.SaveAs(Path.Combine(savePath, fileName));
                url = "../Uploads/" + fileName;
            }
            else
            {
                url = "";
            }
        }
        if (url != "")
        {
            Image1.ImageUrl = url;
        }
        else
        {
            JSHelper.ShowAlert("您上传的文件格式不正确，允许的格式为 png, gif, jpg");
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Length == 0)
            Response.Write(JSHelper.ShowAlert("姓名不能为空！"));
        else if (txtYear.Text.Length == 0 || txtMonth.Text.Length == 0 || txtDay.Text.Length == 0)
            Response.Write(JSHelper.ShowAlert("生日不能为空!"));
        else if(ddlJobTitle.Text.Length == 0)
            Response.Write(JSHelper.ShowAlert("请选择职称!"));
        else if (ddlJob.Text.Length == 0)
            Response.Write(JSHelper.ShowAlert("请选择职务!"));
        else if (ddlTutor.Text.Length == 0)
            Response.Write(JSHelper.ShowAlert("请选择导师!"));
        else
        {
            User u = (User)Session["User"];
            string birth = txtYear.Text + "/" + txtMonth.Text + "/" + txtDay.Text;
            DateTime dt = DateTime.Parse(birth);
            //dt.Year = Convert.ToInt32(txtYear.Text);
            txtExperience.Text = txtExperience.Text.Replace("\r\n", "<br>");

            if (TeacherHelper.Update(u.UserID, Image1.ImageUrl, txtName.Text, dt, txtStatus.Text, txtEducation.Text,
                txtMobile.Text, txtOffice.Text, txtEmail.Text, txtWork.Text, txtAddress.Text,
                TeacherHelper.ChangeJobTitle(ddlJobTitle.Text), TeacherHelper.ChangeJob(ddlJob.Text),
                TeacherHelper.ChangeTutor(ddlTutor.Text), ddlDepartment.Text, txtCourse.Text,
                txtExperience.Text.Replace("\r\n", "<br>"), txtResearchDirection.Text.Replace("\r\n", "<br>"),
                txtResearchProject.Text.Replace("\r\n", "<br>"), txtAchievements.Text.Replace("\r\n", "<br>"),
                txtPaper.Text.Replace("\r\n", "<br>"), txtEnrolment.Text.Replace("\r\n", "<br>"),
                txtRemark.Text.Replace("\r\n", "<br>")) == true)
            {
                Response.Write("<script>alert('修改成功!');window.location.href ='Index.aspx'</script>");
            }
            else
            {
                Response.Write("修改失败");
            }
        }        
    }
}