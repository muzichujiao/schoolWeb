using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_ClickMore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        First.Enabled = true;
        Prev.Enabled = true;
        Next.Enabled = true;
        Last.Enabled = true;

        int type;
        try
        {
            type = Convert.ToInt32(Request.QueryString["more"].ToString());
        }
        catch
        {
            type = 1;
        }
        int page = 0;
        if (Request.QueryString["page"] != null)
        {
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch { page = 0; }
        }
        switch (type)
        {
            case 1: CollegeBind(); break;
            case 2: StudentBind(); break;
            case 3: NoticeBind(); break;
            case 4: EmployBind(); break;
            case 5: AcademicBind();break;
            default: CollegeBind(); break;
        }
        if (page < 0)
            page = 0;
        if (!IsPostBack)
        {
            int i = 0;
            if (Request.QueryString["page"] != null)
                page = int.TryParse(Request.QueryString["page"], out i) ? Convert.ToInt32(Request.QueryString["page"]) : 0;
            if (page < 0)
                page = 0;
        }

        // 如为页面刷新则获取跳页输入框的值
        else
        {
            if (txtPage.Text.Length != 0 && Convert.ToInt32(txtPage.Text) != 0)
                page = Convert.ToInt32(txtPage.Text) - 1;
        }
        First.NavigateUrl = "ClickMore.aspx?more=" + type.ToString() + "&&page=0";
        Prev.NavigateUrl = "ClickMore.aspx?more=" + type.ToString() + "&&page=" + (page - 1).ToString();
        Next.NavigateUrl = "ClickMore.aspx?more=" + type.ToString() + "&&page=" + (page + 1).ToString();
        if (page == 0)
        {
            First.Enabled = false;
            Prev.Enabled = false;
        }
    }

    void CollegeBind()
    {
        ltTitleC.Text = "新闻动态";
        ltTitleE.Text = "news";
        ltSubC.Text = "学院";
        ltSubE.Text = "college";

        int page = 0;
        if (Request.QueryString["page"] != null)
        {
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch { page = 0; }
        }
        if (!IsPostBack)
        {
            int i = 0;
            if (Request.QueryString["page"] != null)
                page = int.TryParse(Request.QueryString["page"], out i) ? Convert.ToInt32(Request.QueryString["page"]) : 0;
            if (page < 0)
                page = 0;
        }

        // 如为页面刷新则获取跳页输入框的值
        else
        {
            if (txtPage.Text.Length != 0&&Convert.ToInt32(txtPage.Text)!=0)
                page = Convert.ToInt32(txtPage.Text) - 1;
        }
        List<IndexCard> ls = ArticleHelper.GetArticlesByType("学院新闻:学院新闻", 1);
        if (page > ls.Count / 10)
            page = ls.Count / 10;
        if (page < 0)
            page = 0;
        Last.NavigateUrl = "ClickMore.aspx?more=1&&page=" + (ls.Count / 10 );
        TotalPage.Text = Math.Ceiling(ls.Count / 10.0).ToString();
        txtPage.Text = (page + 1).ToString();

        if (page == (int)Math.Ceiling(ls.Count / 10.0) - 1)
        {
            Next.Enabled = false;
            Last.Enabled = false;
        }
        rptData.DataSource = ls.Skip(10 * page).Take(10);
        rptData.DataBind();
    }

    void StudentBind()
    {
        ltTitleC.Text = "新闻动态";
        ltTitleE.Text = "news";
        ltSubC.Text = "学生";
        ltSubE.Text = "student";

        int page = 0;
        if (Request.QueryString["page"] != null)
        {
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch { page = 0; }
        }
        if (page < 0)
            page = 0;
        if (!IsPostBack)
        {
            int i = 0;
            if (Request.QueryString["page"] != null)
                page = int.TryParse(Request.QueryString["page"], out i) ? Convert.ToInt32(Request.QueryString["page"]) : 0;
            if (page < 0)
                page = 0;
        }

        // 如为页面刷新则获取跳页输入框的值
        else
        {
            if (txtPage.Text.Length != 0 && Convert.ToInt32(txtPage.Text) != 0)
                page = Convert.ToInt32(txtPage.Text) - 1;
        }
        List<IndexCard> ls = ArticleHelper.GetArticlesByType("学院新闻:学院新闻", 2);
        if (page > ls.Count / 10)
            page = ls.Count / 10;

        txtPage.Text = (page + 1).ToString();
        Last.NavigateUrl = "ClickMore.aspx?more=2&&page=" + (ls.Count / 10 );
        TotalPage.Text = Math.Ceiling(ls.Count / 10.0).ToString();

        if (page == (int)Math.Ceiling(ls.Count / 10.0) - 1)
        {
            Next.Enabled = false;
            Last.Enabled = false;
        }
        rptData.DataSource = ls.Skip(10 * page).Take(10);
        rptData.DataBind();
    }

    void NoticeBind()
    {
        ltTitleC.Text = "通知公告";
        ltTitleE.Text = "notice";
        pnSubTitle.Visible = false;

        int page = 0;
        if (Request.QueryString["page"] != null)
        {
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch { page = 0; }
        }
        if (page < 0)
            page = 0;
        if (!IsPostBack)
        {
            int i = 0;
            if (Request.QueryString["page"] != null)
                page = int.TryParse(Request.QueryString["page"], out i) ? Convert.ToInt32(Request.QueryString["page"]) : 0;
            if (page < 0)
                page = 0;
        }

        // 如为页面刷新则获取跳页输入框的值
        else
        {
            if (txtPage.Text.Length != 0 && Convert.ToInt32(txtPage.Text) != 0)
                page = Convert.ToInt32(txtPage.Text) - 1;
        }
        List<IndexCard> ls;

        ls = ArticleHelper.GetArticlesByType("奖助工作:通知公告", 0);
        ls.AddRange(ArticleHelper.GetArticlesByType("就业工作:通知公告", 0));
        ls.AddRange(ArticleHelper.GetArticlesByType("学院新闻:通知公告", 0));
        ls = ls.OrderByDescending(e => e.time).ToList();
        if (page > ls.Count / 10)
            page = ls.Count / 10;
        txtPage.Text = (page + 1).ToString();
        Last.NavigateUrl = "ClickMore.aspx?more=3&&page=" + (ls.Count / 10 );
        TotalPage.Text = Math.Ceiling(ls.Count / 10.0).ToString();

        if (page == (int)Math.Ceiling(ls.Count / 10.0) - 1)
        {
            Next.Enabled = false;
            Last.Enabled = false;
        }
        rptData.DataSource = ls.Skip(10 * page).Take(10);
        rptData.DataBind();

    }

    void EmployBind()
    {
        ltTitleC.Text = "就业信息";
        ltTitleE.Text = "employ";
        pnSubTitle.Visible = false;


        int page = 0;
        if (Request.QueryString["page"] != null)
        {
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch { page = 0; }
        }
        if (!IsPostBack)
        {
            int i = 0;
            if (Request.QueryString["page"] != null)
                page = int.TryParse(Request.QueryString["page"], out i) ? Convert.ToInt32(Request.QueryString["page"]) : 0;
            if (page < 0)
                page = 0;
        }

        // 如为页面刷新则获取跳页输入框的值
        else
        {
            if (txtPage.Text.Length != 0 && Convert.ToInt32(txtPage.Text) != 0)
                page = Convert.ToInt32(txtPage.Text) - 1;
        }
        //List<IndexCard> ls = ArticleHelper.GetArticlesByType("学院新闻:学院新闻", 1);
        List<IndexCard> ls = ArticleHelper.GetArticlesByType("就业工作:招聘信息", 0);
        if (page > ls.Count / 10)
            page = ls.Count / 10 - 1 ;
        if (page < 0)
            page = 0;
        Last.NavigateUrl = "ClickMore.aspx?more=4&&page=" + (ls.Count / 10);
        TotalPage.Text = Math.Ceiling(ls.Count / 10.0).ToString();
        txtPage.Text = (page + 1).ToString();

        if (page == (int)Math.Ceiling(ls.Count / 10.0) - 1)
        {
            Next.Enabled = false;
            Last.Enabled = false;
        }
        rptData.DataSource = ls.Skip(10 * page).Take(10);
        rptData.DataBind();
    }

    void AcademicBind()
    {
        ltTitleC.Text = "学术报告";
        ltTitleE.Text = "academic report";
        pnSubTitle.Visible = false;



        int page = 0;
        if (Request.QueryString["page"] != null)
        {
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch { page = 0; }
        }
        if (!IsPostBack)
        {
            int i = 0;
            if (Request.QueryString["page"] != null)
                page = int.TryParse(Request.QueryString["page"], out i) ? Convert.ToInt32(Request.QueryString["page"]) : 0;
            if (page < 0)
                page = 0;
        }

        // 如为页面刷新则获取跳页输入框的值
        else
        {
            if (txtPage.Text.Length != 0 && Convert.ToInt32(txtPage.Text) != 0)
                page = Convert.ToInt32(txtPage.Text) - 1;
        }
        //List<IndexCard> ls = ArticleHelper.GetArticlesByType("学院新闻:学院新闻", 1);
        List<IndexCard> ls = ArticleHelper.GetArticlesByType("学术报告:学术报告", 3);
        if (page > ls.Count / 10)
            page = ls.Count / 10;
        if (page < 0)
            page = 0;
        Last.NavigateUrl = "ClickMore.aspx?more=5&&page=" + (ls.Count / 10);
        TotalPage.Text = Math.Ceiling(ls.Count / 10.0).ToString();
        txtPage.Text = (page + 1).ToString();

        if (page == (int)Math.Ceiling(ls.Count / 10.0) - 1)
        {
            Next.Enabled = false;
            Last.Enabled = false;
        }
        rptData.DataSource = ls.Skip(10 * page).Take(10);
        rptData.DataBind();
    }

}