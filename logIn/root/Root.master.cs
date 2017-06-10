using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_root_Root : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("../Login.aspx");
    }
}
