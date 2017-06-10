using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_officeDirection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int page = 0;
        string typet = "学业学籍";

        First.Enabled = true;
        Prev.Enabled = true;
        Next.Enabled = true;
        Last.Enabled = true;

        if (Request.QueryString["type"] != null)
        {
            typet = Request.QueryString["type"];
            typet = typet.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
        }

        // 判断地址栏输入是否合法
        if (typet != "学业学籍" && typet != "场地申请" && typet != "请假相关" && typet != "出国相关" && typet != "宿舍相关" && typet != "处分相关" && typet != "资助相关" && typet != "就业相关" && typet != "创新创业" && typet != "其他")
            Response.Write("<script>alert('地址栏有误');location.href='/Display/Index.aspx';</script>");

        lbType.Text = typet;
        lbEnglishType.Text = ArticleHelper.GetEnglishItems(typet);

        List<Article> articleList = new List<Article>();

        articleList = ArticleHelper.GetArticlesByType("办事指南:" + typet);
        //if (typet == "资助相关")
        //    articleList = ArticleHelper.GetArticlesByType("办事指南:家庭经济困难相关");
        //else
        //    articleList = ArticleHelper.GetArticlesByType("办事指南:" + typet);

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
        First.NavigateUrl = "officeDirection.aspx?type=" + typet + "&page=0";
        Prev.NavigateUrl = "officeDirection.aspx?type=" + typet + "&page=" + (page - 1).ToString();
        Next.NavigateUrl = "officeDirection.aspx?type=" + typet + "&page=" + (page + 1).ToString();
        Last.NavigateUrl = "officeDirection.aspx?type=" + typet + "&page=" + articleList.Count / 10;
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