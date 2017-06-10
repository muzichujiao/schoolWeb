using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_cooperateLearning : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int page = 0;        
        if (Request.QueryString["type"] != "合作办学")
            Response.Redirect("index.aspx");

        First.Enabled = true;
        Prev.Enabled = true;
        Next.Enabled = true;
        Last.Enabled = true;

        lbType.Text = "合作办学";

        lbEnglishType.Text = ArticleHelper.GetEnglishItems(lbType.Text);

        List<Introduce> ls = new List<Introduce>();
        oucITEntities db = new oucITEntities();
        ls = db.Introduce.Where(p => p.name.StartsWith("合作办学")).ToList();

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

        if (page > Math.Ceiling(ls.Count / 10.0) - 1 || page < 0)
            page = 0;

        rptList.DataSource = ls.Skip(10 * page).Take(10);
        rptList.DataBind();

        TotalPage.Text = Math.Ceiling(ls.Count / 10.0).ToString();
        currentPage.Text = (page + 1).ToString();
        turnTopage.Text = (page + 1).ToString();
        First.NavigateUrl = "cooperateLearning.aspx?type=合作办学" + "&page=0";
        Prev.NavigateUrl = "cooperateLearning.aspx?type=合作办学" + "&page=" + (page - 1).ToString();
        Next.NavigateUrl = "cooperateLearning.aspx?type=合作办学" + "&page=" + (page + 1).ToString();
        Last.NavigateUrl = "cooperateLearning.aspx?type=合作办学" + "&page=" + ls.Count / 10;
        if (page == 0)
        {
            First.Enabled = false;
            Prev.Enabled = false;
        }
        if (page == (int)Math.Ceiling(ls.Count / 10.0) - 1 || (page == 0 && Math.Ceiling(ls.Count / 10.0) == 0))
        {
            Next.Enabled = false;
            Last.Enabled = false;
        }
    }
}