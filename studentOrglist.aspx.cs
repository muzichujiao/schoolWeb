using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_studentOrglist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int page = 0;
        string namet = "学生会";
        if (Request.QueryString["type"] != "学生组织")
            Response.Redirect("index.aspx");

        First.Enabled = true;
        Prev.Enabled = true;
        Next.Enabled = true;
        Last.Enabled = true;

        if (Request.QueryString["item"] != null)
        {
            namet = Request.QueryString["item"];
            namet = namet.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
        }

        // 判断地址栏输入是否合法
        if (namet != "学生会" && namet != "研究生会" && namet != "研究会" && namet != "东乡行西部志愿者协会" && namet != "自强社" && namet != "信印象" && namet != "信息之光志愿者服务协会" && namet != "心晴协会")
            Response.Write("<script>alert('地址栏有误');location.href='/Display/Index.aspx';</script>");

        lbType.Text = namet;
        lbEnglishType.Text = ArticleHelper.GetEnglishItems(namet);

        List<Article> articleList = ArticleHelper.GetArticlesByType("学生组织:" + namet);

        if (!IsPostBack)
        {
            int i = 0;
            if (Request.QueryString["page"] != null)
                page = int.TryParse(Request.QueryString["page"], out i) ? Convert.ToInt32(Request.QueryString["page"]) : 0;
        }

        // 如为页面刷新则获取跳页输入框的值
        else
        {
            if (turnTopage.Text.Length != 0)
                page = Convert.ToInt32(turnTopage.Text) - 1;
        }

        if (page > (int)Math.Ceiling(articleList.Count / 10.0) - 1 || page < 0)
        {
            page = 0;
        }

        rptList.DataSource = articleList.Skip(10 * page).Take(10);
        rptList.DataBind();


        TotalPage.Text = Math.Ceiling(articleList.Count / 10.0).ToString();
        currentPage.Text = (page + 1).ToString();
        First.NavigateUrl = "studentOrglist.aspx?type=学生组织&name=" + namet + "&page=0";
        Prev.NavigateUrl = "studentOrglist.aspx?type=学生组织&name=" + namet + "&page=" + (page - 1).ToString();
        Next.NavigateUrl = "studentOrglist.aspx?type=学生组织&name=" + namet + "&page=" + (page + 1).ToString();
        Last.NavigateUrl = "studentOrglist.aspx?type=学生组织&name=" + namet + "&page=" + articleList.Count / 10;
        if (page == 0)
        {
            First.Enabled = false;
            Prev.Enabled = false;
        }
        if (page == (int)Math.Ceiling(articleList.Count / 10.0) - 1 || (page == 0 && Math.Ceiling(articleList.Count / 10.0) == 0))
        {
            Next.Enabled = false;
            Last.Enabled = false;
        }
    }
}