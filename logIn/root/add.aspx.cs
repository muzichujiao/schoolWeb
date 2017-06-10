using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_root_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");
        #region 分发当前页面属于哪个模块
        string type = Request.QueryString["type"].ToString();
        switch (type)
            {
                //默认添加管理员
                default:
                addAdmin.Visible = true;
                addOrg.Visible = false;
                addOrgNumber.Visible = false;
                    break;
                case "org":
                addAdmin.Visible = false ;
                addOrg.Visible = true ;
                addOrgNumber.Visible = false;
                break;
                case "orgNumber":
                if (!IsPostBack)
                {
                    //添加所有组别到组别下拉框
                    using (var db=new oucITEntities())
                    {
                        ddlGroup.DataSource = (from it in db.ITGroup orderby it.groupType select it.GroupName).ToList();
                        ddlGroup.DataBind();
                    }
                }
                addAdmin.Visible = false;
                addOrg.Visible = false;
                addOrgNumber.Visible = true;
                break;
            }
        #endregion

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
            Response.Write(JSHelper.ShowAlert("信息不能为空！"));
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
            Response.Write(JSHelper.ShowAlert("不能重复注册！"));
        else
        {
            Response.Write(JSHelper.ShowAlert("添加成功！\\n学工号： " + number + "\\n密码: " + pwd + ""));
            Response.Write("adminList.aspx");
        }

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtNum.Text.Length == 0)
            Response.Write(JSHelper.ShowAlert("输入不能为空！"));
        else
        {
            var user = UserHelper.Select(txtNum.Text);
            if (user != null)
            {
                var teac = TeacherHelper.Select(user.UserID);
                var stu = StudentHelper.Select(user.UserID);
                if (teac != null || stu != null)
                {
                    var db = new oucITEntities();
                    var itgroup = (from a in db.ITGroup
                                   where a.GroupName == ddlGroup.Text
                                   select a).SingleOrDefault();
                    var conn = (from a in db.Connection
                                where a.UserID == user.UserID && a.GroupID == itgroup.GroupID
                                select a).FirstOrDefault();
                    if (conn == null)
                    {
                        int class1 = ddlClass.Text == "管理员" ? 2 : 1;
                        if (ConnHelp.Add(itgroup.GroupID, user.UserID, ddlClass.Text, class1, txtJob.Text, txtDuty.Text, txtPhone.Text, txtEmail.Text) == true)
                        {
                            Response.Write("<script>alert('添加成功!');window.location.href ='groupList.aspx'</script>");
                        }
                        else
                        {
                            Response.Write(JSHelper.ShowAlert("添加失败"));
                        }
                    }
                    else
                    {
                        Response.Write(JSHelper.ShowAlert("该老师或学生已存在于该组"));
                    }
                }
                else
                {
                    Response.Write(JSHelper.ShowAlert("该老师或学生不存在"));
                }
            }
            else
            {
                Response.Write(JSHelper.ShowAlert("该老师或学生不存在"));
            }
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string url =string.Empty;
        if (FileUpload1.HasFile)
        {
            var savePath = HttpContext.Current.Server.MapPath("~/Uploads/");
            var fileName = FileUpload1.FileName;
            var fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            string[] allowedExtension = { ".png", ".gif", ".jpg" };
            if (allowedExtension.Contains(fileExtension))
            {
                fileName = DateTime.Now.ToString("yyyyMMdd-HHmmssff_") + fileName;
                FileUpload1.SaveAs(System.IO.Path.Combine(savePath, fileName));
                url = "/Uploads/" + fileName;
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

    protected void editGroup_Click(object sender, EventArgs e)
    {
        Regex re = new Regex(@"(http|https)://[^\s]*");
        if (txtGpName.Text.Trim().Equals(string.Empty))
        {
            Response.Write(JSHelper.ShowAlert("组织名称不能为空！"));
            return;
        }
        
        if (!re.IsMatch(txtGpLink.Text))
        {
            Response.Write(JSHelper.ShowAlert("请输入正确网址！"));
            return;
        }

        if (GroupHelper.Select(txtGpName.Text) != null)
        {
            Response.Write(JSHelper.ShowAlert("该组织已存在！"));
            return;
        }
        if (GroupHelper.Add(txtGpName.Text.Trim(),dplAddTyped.SelectedValue,Image1.ImageUrl,txtGpLink.Text.Trim()))
        {
            Response.Write(JSHelper.ShowAlert("添加成功！"));
            Response.Redirect("groupList.aspx");
        }
        else
            Response.Write(JSHelper.ShowAlert("添加失败！请重试！"));
    }

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        if (txtNum.Text.Length == 0)
            Response.Write(JSHelper.ShowAlert("输入不能为空！"));
        else
        {
            var user = UserHelper.Select(txtNum.Text);
            if (user == null)
            {
                lblName.Text = "不存在该老师或学生<br/>";
            }
            else
            {
                var teac = TeacherHelper.Select(user.UserID);
                if (teac != null)
                {
                    lblName.Text = "姓名："+teac.Name;
                }
                else
                {
                    var stu = StudentHelper.Select(user.UserID);
                    if (stu != null)
                    {
                        lblName.Text = "姓名："+stu.Name;
                    }
                    else
                    {
                        lblName.Text = "不存在该老师或学生<br/>";
                    }
                }
            }
        }
    }
}