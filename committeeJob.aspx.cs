using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_committeeJob : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int page = 0;
        string typet = "党建工作";
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
            List<string> list = new List<string>();
            list = ArticleHelper.GetSubTypes(typet);
            if ((typet == "党建工作" || typet == "团建工作" || typet == "奖助工作" || typet == "就业工作" || typet == "科技创新") && list.Contains(itemt))
                flag = 1;
        }
        // 只包含二级菜单
        else if (Request.QueryString["type"] != null && Request.QueryString["item"] == null)
        {
            typet = Request.QueryString["type"];
            typet = typet.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
            List<string> list = new List<string>();
            list = ArticleHelper.GetSubTypes(typet);
            // 二级为学生风采或学生组织时
            if (typet == "学生风采")
                flag = 1;
            // 只输入二级三级为空时直接跳转至该二级分类下的第一个三级
            else if (typet == "党建工作" || typet == "团建工作" || typet == "奖助工作" || typet == "就业工作" || typet == "科技创新")
            {
                itemt = list[0];
                flag = 1;
            }
        }
        // 最初跳入时默认为二级“党建工作”三级“规章制度”
        else if (Request.QueryString["type"] == null && Request.QueryString["item"] == null)
        {
            typet = typet.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
            itemt = itemt.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
            flag = 1;
        }
        // 二级为“党建工作”三级为“党建管理”时跳转外链
        if (Request.QueryString["type"] == "党建工作" && Request.QueryString["item"] == "党建管理")
        {
            Response.Redirect("http://222.195.145.152:28080/oucdangjian/");
        }

        // 不符合以上情况即为地址栏有误，跳转至首页
        if (flag == 0)
        {
            Response.Write("<script>alert('地址栏有误');location.href='/Display/Index.aspx';</script>");
        }

        if (typet == "学生风采")
            lbType.Text = typet;
        else
            lbType.Text = itemt;
        lbEnglishType.Text = ArticleHelper.GetEnglishItems(lbType.Text);

        List<Article> articleList = new List<Article>();
        if (typet == "学生风采")
            articleList = ArticleHelper.GetArticlesByType("学生风采:学生风采");
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
        if(typet == "学生风采")
        {
            First.NavigateUrl = "committeeJob.aspx?type=学生风采" + "&page=0";
            Prev.NavigateUrl = "committeeJob.aspx?type=学生风采" + "&page=" + (page - 1).ToString();
            Next.NavigateUrl = "committeeJob.aspx?type=学生风采" + "&page=" + (page + 1).ToString();
            Last.NavigateUrl = "committeeJob.aspx?type=学生风采" + "&page=" + articleList.Count / 10;
        }
        else
        {
            First.NavigateUrl = "committeeJob.aspx?type=" + typet + "&item=" + itemt + "&page=0";
            Prev.NavigateUrl = "committeeJob.aspx?type=" + typet + "&item=" + itemt + "&page=" + (page - 1).ToString();
            Next.NavigateUrl = "committeeJob.aspx?type=" + typet + "&item=" + itemt + "&page=" + (page + 1).ToString();
            Last.NavigateUrl = "committeeJob.aspx?type=" + typet + "&item=" + itemt + "&page=" + articleList.Count / 10;
        }        
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