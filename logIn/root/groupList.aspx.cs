using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_root_groupList : System.Web.UI.Page
{
    List<ITGroup> bindData = new List<ITGroup>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");
        else if (!IsPostBack)
        {
            getDataSouce(GroupHelper.ChangeType(dpl.SelectedValue));
            gdvGroupLs.DataSource = bindData;
            gdvGroupLs.DataBind();
        }
    }

    protected void gdvGroupLs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName== "mydelete")
        {
            int gpID = Convert.ToInt32(e.CommandArgument.ToString());
            try
            {
                if (GroupHelper.Delete(gpID))
                {
                    Response.Write(JSHelper.ShowAlert("删除成功!"));
                    Response.Redirect("groupList.aspx");
                }
                else
                {
                    Response.Write(JSHelper.ShowAlert("删除失败请重试!"));
                    Response.Redirect("groupList.aspx");
                }
            }
            catch
            {
                Response.Write(JSHelper.ShowAlert("删除失败请重试！"));
            }
        }
    }

    protected void getDataSouce(int groupTyped)
    {
        try
        {
            using (var db = new oucITEntities())
            {
                bindData = (from gp in db.ITGroup
                            where gp.groupType== groupTyped
                            orderby gp.GroupID 
                            select  gp)
                            .ToList();
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("groupList.aspx");
        }
    }

    protected void gdvGroupLs_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        getDataSouce(GroupHelper.ChangeType(dpl.SelectedValue));
        gdvGroupLs.PageIndex = e.NewPageIndex;
        gdvGroupLs.DataSource = bindData;
        gdvGroupLs.DataBind();
    }


    protected void dpl_SelectedIndexChanged(object sender, EventArgs e)
    {
        getDataSouce(GroupHelper.ChangeType(dpl.SelectedValue));
        gdvGroupLs.DataSource = bindData;
        gdvGroupLs.DataBind();
    }
}