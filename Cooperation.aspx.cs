using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Cooperation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 1;
        try
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
        }
        catch
        {

        }
        using (var db = new oucITEntities())
        {
            Introduce ar =  db.Introduce.SingleOrDefault(a => a.id.Equals(id));
            if (ar.name != "合作办学")
                id = 11;
            ar = db.Introduce.SingleOrDefault(a => a.id.Equals(id));
            ltTitle.Text = ar.name.Substring(ar.name.IndexOf(':')+1);
            ltContent.Text = ar.text;
        }
            
    }
}