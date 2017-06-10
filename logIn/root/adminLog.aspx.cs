using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_root_adminLog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");
        else if (!IsPostBack)
        {
            gdvLog.DataSource = LogHelper.getLogLs();
            gdvLog.DataBind();
        }
    }

    protected void delete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= gdvLog.Rows.Count - 1; i++)
        {
            CheckBox cb = (CheckBox)gdvLog.Rows[i].FindControl("CheckBox1");
            if (cb.Checked)
            {
                LogHelper.delete(int.Parse(gdvLog.Rows[i].Cells[1].Text));
                JSHelper.Redirect("adminLog.aspx", true);
            }
            //ArticleHelper.RealDelete(int.Parse(GridView1.Rows[i].Cells[0].Text));
        }
    }

    protected void clearAll_Click(object sender, EventArgs e)
    {
        LogHelper.deleteAll();
        JSHelper.Redirect("admin    Log.aspx", true);

    }

    protected void gdvLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvLog.PageIndex = e.NewPageIndex;
        gdvLog.DataSource = LogHelper.getLogLs();
        gdvLog.DataBind();
    }
}