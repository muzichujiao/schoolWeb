using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_majorIntroduction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string temTitle = "物理系";
        if (Request.QueryString["type"] != "本科生教育")
            Response.Redirect("index.aspx");

        if (Request.QueryString["item"] != null)
            temTitle = Request.QueryString["item"];
        lbdepartment.Text = temTitle.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
        lbenglishDepart.Text = ArticleHelper.GetEnglishItems(temTitle);
        List<Introduce> ls = new List<Introduce>();
        oucITEntities db = new oucITEntities();
        ls = db.Introduce.Where(p => p.name.StartsWith("合作办学")).ToList();

        switch (temTitle)
        {
            case "物理系":
                Panel1.Visible = true;
                Literal1.Text = db.Introduce.Where(p => p.name == "专业介绍：物理学").SingleOrDefault().text == null ? "" : db.Introduce.Where(p => p.name == "专业介绍：物理学").SingleOrDefault().text;
                Literal2.Text = db.Introduce.Where(p => p.name == "专业介绍：光电信息科学与技术").SingleOrDefault().text == null ? "" : db.Introduce.Where(p => p.name == "专业介绍：光电信息科学与技术").SingleOrDefault().text;
                break;
            case "电子工程系":
                Panel2.Visible = true;
                Literal3.Text = db.Introduce.Where(p => p.name == "专业介绍：电子信息科学与技术").SingleOrDefault().text == null ? "" : db.Introduce.Where(p => p.name == "专业介绍：电子信息科学与技术").SingleOrDefault().text;
                Literal4.Text = db.Introduce.Where(p => p.name == "专业介绍：通信工程").SingleOrDefault().text == null ? "" : db.Introduce.Where(p => p.name == "专业介绍：通信工程").SingleOrDefault().text;
                Literal5.Text = db.Introduce.Where(p => p.name == "专业介绍：电子信息工程").SingleOrDefault().text == null ? "" : db.Introduce.Where(p => p.name == "专业介绍：电子信息工程").SingleOrDefault().text;
                break;
            case "计算机科学与技术系":
                Panel3.Visible = true;
                Literal6.Text = db.Introduce.Where(p => p.name == "专业介绍：计算机科学与技术").SingleOrDefault().text == null ? "" : db.Introduce.Where(p => p.name == "专业介绍：计算机科学与技术").SingleOrDefault().text;
                break;
            case "海洋技术系":
                Panel4.Visible = true;
                Literal7.Text = db.Introduce.Where(p => p.name == "专业介绍：海洋技术").SingleOrDefault().text == null ? "" : db.Introduce.Where(p => p.name == "专业介绍：海洋技术").SingleOrDefault().text;
                break;
            default:
                Response.Redirect("index.aspx");
                break;
        }
    }
}