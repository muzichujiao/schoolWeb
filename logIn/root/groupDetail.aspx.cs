using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_root_groupDetail : System.Web.UI.Page
{
    protected ITGroup pageGp;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");
        int gpID = 1;
            try
            {
                gpID = Convert.ToInt32(Request.QueryString["groupId"].ToString());
            }
            catch
            {
                gpID = 1;
            }
            pageGp = GroupHelper.Select(gpID);

        if (!IsPostBack)
        {

            #region 绑定数据
            txtGpName.Text = pageGp.GroupName;
            dpl.Text = GroupHelper.getTypeOfString(pageGp.groupType);
            txtGpLink.Text = pageGp.Link;
            Image1.ImageUrl = pageGp.Img;
            #endregion
            gdvGpLs.DataSource = GroupHelper.getAllNumberOfGroup(pageGp.GroupID);
            gdvGpLs.DataBind();
            if (gdvGpLs.Rows.Count == 0)
                lbtnJumpAddOrgNum.Visible = true;

        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string url = "";

        /// <summary>
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
        string link = txtGpLink.Text;
        string imgUrl = Image1.ImageUrl;
        if (GroupHelper.Update(pageGp.GroupID, txtGpName.Text, dpl.SelectedValue, Image1.ImageUrl, txtGpLink.Text))
        {
            //Response.Write(JSHelper.ShowAlert("更改成功！"));
            Response.Redirect(Request.RawUrl);
        }
        else
            Response.Write(JSHelper.ShowAlert("更改失败！（名字不能重复）"));

        // Response.Redirect("groupEdit.aspx");
    }

    protected void gdvGpLs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "mydelete")
        {
            int connID = Convert.ToInt32(e.CommandArgument.ToString());
            if (ConnHelp.Delete(connID))
            {
                Response.Write(JSHelper.ShowAlert("删除成功"));
                Response.Redirect(Request.RawUrl);
            }
            else
                Response.Write(JSHelper.ShowAlert("删除失败，请重试"));


        }
    }

    protected void gdvGpLs_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvGpLs.PageIndex = e.NewPageIndex;
        gdvGpLs.DataSource = GroupHelper.getAllNumberOfGroup(pageGp.GroupID);
        gdvGpLs.DataBind();
    }
}