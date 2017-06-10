using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_root_groupNumEdit : System.Web.UI.Page
{
    int connID = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");
        //绑定所有组织
        try
        {
            connID = Convert.ToInt32(Request.QueryString["connID"].ToString());
            using (var db = new oucITEntities())
            {
                if (!IsPostBack)
                {
                    dplGp.DataSource = (from it in db.ITGroup orderby it.groupType select it.GroupName).ToList();
                    dplGp.DataBind();
                }
                Connection isExist = db.Connection.SingleOrDefault(a => a.ID == connID);
                if (isExist == null)
                {
                    Response.Redirect("groupList.aspx");
                    return;
                }
            }
        }
        catch
        {
            Response.Redirect("groupList.aspx");
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if (ConnHelp.Update(connID, GroupHelper.Select(dplGp.SelectedValue).GroupID, ddlClass.SelectedValue, ddlRight.SelectedValue))
        {
            string url = Request.RawUrl;
            Response.Write("<script>alert('修改成功！');location.href='" + url + "'</script>");
            //Response.Write("<script>alert('');location.href='groupList.aspx'</script>");
            //Response.Redirect(Request.RawUrl);
        }
        else
        {
            string url = Request.RawUrl;
            Response.Write("<script>alert('修改失败，请重试！');location.href='"+url+"'</script>");
        }

            
    }
}