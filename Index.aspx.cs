using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<IndexCard>[] ls = ArticleHelper.IndexCards("");
        //绑定学院新闻
        rptCollege.DataSource = ls[0];
        rptCollege.DataBind();
        //绑定学生新闻
        rptStudent.DataSource = ls[1];
        rptStudent.DataBind();
        //绑定通知公告
        rptNotice1.DataSource =ArticleHelper.getList(0,ls[2]);
        rptNotice1.DataBind();
        rptNotice2.DataSource = ArticleHelper.getList(1, ls[2]);
        rptNotice2.DataBind();
        //绑定招聘资讯
        rptJob1.DataSource = ArticleHelper.getList(0, ls[3]);
        rptJob1.DataBind();
        rptJob2.DataSource = ArticleHelper.getList(1, ls[3]);
        rptJob2.DataBind();
        //绑定学术报告部分
        //string content = ArticleHelper.getReporter().Content;
        int id = ArticleHelper.getReporterID();
        if (id == 0)
            pnAcademic.Visible = false;
        else
        {
            Article ar = ArticleHelper.GetArticleByID(id);
            string[] all = ar.Content.Split(new char[] { '!', '#' });
            ltTitle.Text = ar.Title;
            string lt = MyHtmlHelper.RemoveTags(ar.Content.Substring(ar.Content.IndexOf('#')));
            ltContent.Text = lt.Length > 40 ? lt.Substring(1, 39) : lt.Substring(1,lt.Length-1);
            if (ar.Link == null)
                lbtReporter.PostBackUrl = "Content.aspx?id=" + ar.ArticleID;
            else
                lbtReporter.PostBackUrl = ar.Link;
            //时间---
            string month = all[0].Substring(5, 2);
            if (month[0] == '0')
                month = month.Substring(1, 1);
            string day = all[0].Substring(8, 2);
            if (day[0] == '0')
                day = day.Substring(1, 1);
            ltTime.Text = month + "." + day + " " + all[1];
            ltPlace.Text = all[2];
        }

    }

   
}
