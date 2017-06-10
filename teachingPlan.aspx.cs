using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_teachingPlan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string temTitle = "物理系";
        if (Request.QueryString["type"] != "本科生教育")
            Response.Redirect("index.aspx");
        if (Request.QueryString["item"] != null)
            temTitle = Request.QueryString["item"];

        // 绑定院系名称标签
        lbdepartment.Text = temTitle.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
        lbenglishDepart.Text = ArticleHelper.GetEnglishItems(temTitle);

        // 显示所选院系对应的Panel
        switch (temTitle)
        {
            case "物理系":
                Panel1.Visible = true;
                break;
            case "电子工程系":
                Panel2.Visible = true;
                break;
            case "计算机科学与技术系":
                Panel3.Visible = true;
                break;
            case "海洋技术系":
                Panel4.Visible = true;
                break;
            default:
                Response.Redirect("index.aspx");
                break;
        }
    }

    // 获取文件名(主要是获取扩展名,因为文件名是确定的,但扩展名不确定.
    public string GetFileName(string name)
    {
        string[] outlines = Directory.GetFiles(Server.MapPath("~/Uploads/outlines/"));
        foreach (string ou in outlines)
        {
            if (ou.Contains(name))
                return (new FileInfo(ou)).Name;
        }
        return "";
    }
}