using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_stuEducate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int page = 0;
        string typet = "本科生教育";
        string itemt = "规章制度";
        int flag = 0; // 判断地址栏输入是否合法

        First.Enabled = true;
        Prev.Enabled = true;
        Next.Enabled = true;
        Last.Enabled = true;

        // 包括二级与三级菜单且二级与三级相匹配
        if (Request.QueryString["type"] != null && Request.QueryString["item"] != null)
        {
            typet = Request.QueryString["type"];
            itemt = Request.QueryString["item"];
            typet = typet.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
            itemt = itemt.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
            if ((typet == "本科生教育" && itemt == "规章制度") || (typet == "研究生教育" && itemt == "奖励实施细则"))
                flag = 1;
        }

        // 最初跳入时默认为二级“本科生教育”三级“规章制度”
        else if (Request.QueryString["type"] == null && Request.QueryString["item"] == null)
        {
            typet = typet.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
            itemt = itemt.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
            flag = 1;
        }


        // 不符合以上情况即为地址栏有误，跳转至首页
        if (flag == 0)
        {
            Response.Write("<script>alert('地址栏有误');location.href='/Display/Index.aspx';</script>");
        }

        lbType.Text = itemt;

        lbEnglishType.Text = ArticleHelper.GetEnglishItems(lbType.Text);

        List<Article> articleList = new List<Article>();
        //研究生奖励实施细则:研究生奖励实施细则
        if (typet== "研究生教育" && itemt == "奖励实施细则")
            articleList = ArticleHelper.GetArticlesByType("研究生奖励实施细则:研究生奖励实施细则");
        //本科生教育&item=规章制度
        else if (typet == "本科生教育" && itemt == "规章制度")
            articleList = ArticleHelper.GetArticlesByType("规章制度:规章制度");
        else
            articleList = ArticleHelper.GetArticlesByType(typet + ":" + itemt);

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

        if (page > Math.Ceiling(articleList.Count / 10.0) - 1 || page < 0)
            page = 0;

        rptList.DataSource = articleList.Skip(10 * page).Take(10);
        rptList.DataBind();

        TotalPage.Text = Math.Ceiling(articleList.Count / 10.0).ToString();
        currentPage.Text = (page + 1).ToString();
        turnTopage.Text = (page + 1).ToString();
        First.NavigateUrl = "stuEducate.aspx?type=" + typet + "&item=" + itemt + "&page=0";
        Prev.NavigateUrl = "stuEducate.aspx?type=" + typet + "&item=" + itemt + "&page=" + (page - 1).ToString();
        Next.NavigateUrl = "stuEducate.aspx?type=" + typet + "&item=" + itemt + "&page=" + (page + 1).ToString();
        Last.NavigateUrl = "stuEducate.aspx?type=" + typet + "&item=" + itemt + "&page=" + articleList.Count / 10;
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