using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_introduceList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["type"] != "学院概况")
                Response.Redirect("index.aspx");
            string name = "学院概况:学院介绍";
            if (Request.QueryString["item"] != null)
                name = "学院概况:" + Request.QueryString["item"];
            if (name != "学院概况:学院介绍" && name != "学院概况:物理系" && name != "学院概况:电子工程系" && name != "学院概况:计算机科学与技术系" && name != "学院概况:海洋技术系" && name != "学院概况:信息工程中心")
                Response.Redirect("index.aspx");
            if (name == "学院概况:计算机科学与技术系")
                Response.Redirect("http://cs.ouc.edu.cn/");
            else if (name == "学院概况:海洋技术系")
                Response.Redirect("http://it.ouc.edu.cn/SeaProject/View/Home.aspx");
            else
            {
                int id;
                try
                {
                    id = int.Parse(Request.QueryString["id"]);
                }
                catch { id = 1; }
                oucITEntities db = new oucITEntities();
                Introduce intr;
                try
                {
                    if (name != null)
                        intr = db.Introduce.First(p => p.name == name);
                    else
                        intr = db.Introduce.First(p => p.id == id);
                }
                catch { intr = db.Introduce.First(); };
                Label1.Text = intr.name.Substring(5);
                Label2.Text = ArticleHelper.GetEnglishItems(intr.name);
                Literal1.Text = intr.text;
            }
            
        }
    }
}
