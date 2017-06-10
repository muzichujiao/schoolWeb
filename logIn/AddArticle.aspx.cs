using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Default : System.Web.UI.Page
{
    protected string h1_type = string.Empty;
    // Server.HtmlDecode( myEditor11.InnerHtml)
    private int courseID = 0;
    private DateTime? GetTime(string y, string m, string d)
    {
        try
        {
            int year = int.Parse(y);
            int month = int.Parse(m);
            int day = int.Parse(d);
            DateTime t = new DateTime(year, month, day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
            return t;
        }
        catch { return null; }

    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");

        try
        {
            courseID = int.Parse(Request.QueryString["id"]);
        }
        catch { courseID = 0; };
        //if(courseID==0)
        //    h1_type = Request.QueryString["type"].ToString().Trim();

        if (!IsPostBack)
        {

            /*
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = ResolveUrl("~/ckfinder/");
            _FileBrowser.SetupCKEditor(CKEditor1);
            */
            #region 控件绑定
            if (courseID != 0)//判断是添加还是修改
            {
                
                Article ar = ArticleHelper.GetArticleByID(courseID);
                if(ar.Type=="学术报告:学术报告")
                {
                    panelAcademic.Visible = true;
                    initAcademinTime();
                    //复赋值数据库内容
                    string tmpConent = ar.Content;
                    //赋值地点
                    txtPlace.Text = tmpConent.Split('!')[2].Split('#')[0];
                    //赋值时间
                    dplHour.Text = tmpConent.Split('!')[1].Split(':')[0];
                    dplMinute.Text = tmpConent.Split('!')[1].Split(':')[1];
                    //赋值日期      2017-04-27
                    dplYear.Text = tmpConent.Split('!')[0].Split('-')[0];
                    dplMonth.SelectedIndex = Convert.ToInt32(tmpConent.Split('!')[0].Split('-')[1]) - 1;
                    dplDay.SelectedIndex = Convert.ToInt32(tmpConent.Split('!')[0].Split('-')[2]) - 1;
                }
                // 为控件赋值
                tbTitle.Text = ar.Title;
                tbSubTitle.Text = ar.SubTitle;
                subTypes.Visible = false;
                dplNewsSource.Visible = false;
                Label11.Visible = true;
                Label11.Text = ar.Type;
                h1_type = ar.Type.Split(':')[0];
                if (ar.Type.Contains("学院新闻") && (ar.isOfficial == true || ar.isOfficial == null))
                    Label11.Text += "\t学院官方";
                else if(ar.Type.Contains("学院新闻"))
                    Label11.Text += "\t学生组织";
                DropDownList3.SelectedValue = ar.Author;
                DropDownList4.SelectedValue = ar.Source;
                if (!string.IsNullOrEmpty(ar.Link))
                {
                    CheckBox1.Checked = true;
                    tbLink.Text = ar.Link;
                    content.Visible = false;
                }
                else
                {
                    if(ar.Type == "学术报告:学术报告")
                    {
                    //myEditor11.InnerHtml = ar.Content.Split('#')[1];
                        myEditor11.InnerHtml = ar.Content.Substring(ar.Content.IndexOf('#')+1); 
                    }
                    else
                        myEditor11.InnerHtml = ar.Content;

                }
                CheckBox2.Checked = string.IsNullOrEmpty(ar.ImgUrl) ? false : true;
                cbAttach.Checked = ar.Attachment;
                cbHot.Checked = ar.Hot;
                cbTop.Checked = ar.OnTop;
                tyear.Text = ar.UpdateTime.Year.ToString();
                tmonth.Text = ar.UpdateTime.Month.ToString();
                tday.Text = ar.UpdateTime.Day.ToString();
            }
            else// Label11.Text = Request.QueryString["type"];//文章类型
            {
                h1_type = Request.QueryString["type"].ToString().Trim();
                if(h1_type.Equals("学术报告"))
                {
                    panelAcademic.Visible = true;
                    initAcademinTime();
                }
                tyear.Text = DateTime.Now.Year.ToString();
                tmonth.Text = DateTime.Now.Month.ToString();
                tday.Text = DateTime.Now.Day.ToString();
                Label11.Visible = false;
                List<string> ls = ArticleHelper.GetSubTypes(Request.QueryString["type"], ((User)Session["User"]).UserID);

                if (ls.Contains("学院新闻"))
                    dplNewsSource.Visible = true;

                subTypes.DataSource = ArticleHelper.GetSubTypes(Request.QueryString["type"], ((User)Session["User"]).UserID);
                subTypes.DataBind();
                if (h1_type == "学术报告")
                {
                    List<string> timeList = new List<string>();
                    for (int i = 0; i < 24; i++)
                        timeList.Add(i.ToString("D2"));
                    dplHour.DataSource = timeList;
                    dplHour.DataBind();
                    timeList.Clear();
                    for (int i = 0; i < 60; i++)
                        timeList.Add(i.ToString("D2"));
                    dplMinute.DataSource = timeList;
                    dplMinute.DataBind();
                }
            }

            #endregion
        }


    }
    private string GetImgUrl(string html)
    {
        //Regex re = new Regex(@"<img ");
        int index = html.IndexOf("<img");
        if (index == -1) return "";//TODO: 现在返回的是整个img标签，要从img标签中取出src的值
        html = html.Substring(index, html.Substring(index).IndexOf(@"/>") + 2);
        Regex re = new Regex("src=\"[^\"]+\"");
        Match ma = re.Match(html);
        return ma.Value.Remove(ma.Value.Length - 1).Remove(0, 5);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //以用户输入构建Article对象        
        Article ar;
        if (CheckBox1.Checked)
            ar = new Article
            {
                Title = tbTitle.Text,
                SubTitle = tbSubTitle.Text,
                AuthorID = ((User)Session["User"]).UserID,
                Author = DropDownList3.SelectedValue == "我自己" ? UserHelper.RtnName(((User)Session["User"]).UserID) : DropDownList3.SelectedValue,
                Source = DropDownList4.SelectedValue == "我自己" ? UserHelper.RtnName(((User)Session["User"]).UserID) : DropDownList4.SelectedValue,
                Link = tbLink.Text,
                Type = Label11.Visible ? Label11.Text : Request.QueryString["type"] + ":" + subTypes.SelectedValue,//例如:党建工作:党员发展
                OnTop = cbTop.Checked,
                Hot = cbHot.Checked,
                Attachment = cbAttach.Checked,
                UpdateTime = GetTime(tyear.Text, tmonth.Text, tday.Text) ?? DateTime.Now,
                Deleted = false,
                Content = "&nbsp;",
                ImgUrl = null // HiddenField1.Value == "" ? null : HiddenField1.Value,CheckBox2.Checked?GetImgUrl(CKEditor1.Text):
            };

        else
        {
            string saveContent = Server.HtmlDecode(myEditor11.InnerHtml);
            if (Label11.Text.Equals("学术报告:学术报告") || subTypes.SelectedValue.Equals("学术报告"))
                saveContent = dplYear.SelectedValue + "-" + Convert.ToInt32(dplMonth.SelectedValue).ToString("D2") + "-" + Convert.ToInt32(dplDay.SelectedValue).ToString("D2") + "!" + dplHour.SelectedValue + ":" + dplMinute.SelectedValue + "!" + txtPlace.Text.Trim() + "#" + Server.HtmlDecode(myEditor11.InnerHtml);
            ar = new Article
            {
                Title = tbTitle.Text,
                SubTitle = tbSubTitle.Text,
                AuthorID = ((User)Session["User"]).UserID,
                Author = DropDownList3.SelectedValue == "我自己" ? UserHelper.RtnName(((User)Session["User"]).UserID) : DropDownList3.SelectedValue,
                Source = DropDownList4.SelectedValue == "我自己" ? UserHelper.RtnName(((User)Session["User"]).UserID) : DropDownList4.SelectedValue,

                Link = null,
                Type = Label11.Visible ? Label11.Text : Request.QueryString["type"] + ":" + subTypes.SelectedValue,//例如:党建工作:党员发展
                OnTop = cbTop.Checked,
                Hot = cbHot.Checked,
                Attachment = cbAttach.Checked,
                UpdateTime = GetTime(tyear.Text, tmonth.Text, tday.Text) ?? DateTime.Now,
                Deleted = false,
                //Content = dplYear.SelectedValue + "-" + Convert.ToInt32(dplMonth.SelectedValue).ToString("D2") + "-" + Convert.ToInt32(dplDay.SelectedValue).ToString("D2") + "!" + dplHour.SelectedValue + ":" + dplMinute.SelectedValue + "!" + txtPlace.Text.Trim() + "#" + Server.HtmlDecode(myEditor11.InnerHtml),
                Content =saveContent,

                ImgUrl = CheckBox2.Checked ? GetImgUrl(Server.HtmlDecode(myEditor11.InnerHtml)) : null
            };
        }
         
        //增加是否官方的新闻
        if (dplNewsSource.Visible == true)
        {
            if (dplNewsSource.Text.Contains("学院官方"))
                ar.isOfficial = true;
            else
                ar.isOfficial = false;
        }

        // 判断是添加还是修改，修改数据库
        string Pattern = @"(http|https)://[^\s]*";
        Regex r = new Regex(Pattern);
        if (courseID == 0)
        {
            if (panelAcademic.Visible==true && string.Equals(string.Empty, txtPlace.Text.Trim()))
                Response.Write(JSHelper.ShowAlert("请检查举办地点！"));
              else  if (tbTitle.Text.Trim() == "")
                Response.Write(JSHelper.ShowAlert("标题不能为空！"));
            else if (CheckBox1.Checked == true && tbLink.Text.Trim() == "")
                Response.Write(JSHelper.ShowAlert("转向链接不能为空！"));
            else if (CheckBox1.Checked == true && r.IsMatch(tbLink.Text.Trim()) == false)
                Response.Write(JSHelper.ShowAlert("转向链接格式有误！"));
            else if (CheckBox1.Checked == false && Server.HtmlDecode(myEditor11.InnerHtml).Length == 0)
                Response.Write(JSHelper.ShowAlert("正文不能为空！"));
            else if (ArticleHelper.AddArticle(ar))
            {
                if (ar.Type.Equals("就业工作:招聘信息"))
                {
                    CHelper.Cread(ar.ArticleID, ar.Title, ar.Type);
                }
                else
                    Response.Write(JSHelper.ShowAlert("添加成功"));
                JSHelper.Redirect("MyArticles.aspx", true);
            }
            else
                Response.Write(JSHelper.ShowAlert("添加失败"));
        }
        else
        {
            Article tem = ArticleHelper.GetArticleByID(courseID);
            ar.Hit = tem.Hit;
            ar.ArticleID = courseID;
            //处理修改的时候type叠加
            ar.Type = ArticleHelper.GetArticleByID(courseID).Type;
            if (panelAcademic.Visible = true && string.Equals(string.Empty, txtPlace.Text.Trim()))
                Response.Write(JSHelper.ShowAlert("请检举办地点！"));
            else if (tbTitle.Text.Trim() == "")
                Response.Write(JSHelper.ShowAlert("标题不能为空！"));
            else if (CheckBox1.Checked == true && tbLink.Text.Trim() == "")
                Response.Write(JSHelper.ShowAlert("转向链接不能为空！"));
            else if (CheckBox1.Checked == true && r.IsMatch(tbLink.Text.Trim()) == false)
                Response.Write(JSHelper.ShowAlert("转向链接格式有误！"));
            else if (CheckBox1.Checked == false && Server.HtmlDecode(myEditor11.InnerHtml).Length == 0)
                Response.Write(JSHelper.ShowAlert("正文不能为空！"));
            else if (ArticleHelper.UpdateArticle(ar))
            {
                Response.Write(JSHelper.ShowAlert("修改成功"));
                JSHelper.Redirect("MyArticles.aspx", true);
            }
            else Response.Write(JSHelper.ShowAlert("修改失败"));
        }
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        PreText.Text = Server.HtmlDecode(myEditor11.InnerHtml);
        PreTitle.Text = tbTitle.Text;
        Panel1.Visible = true;// TODO:预览功能.打开新的页面
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
            content.Visible = false;
        else
            content.Visible = true;
    }

    protected void subTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
        h1_type = Request.QueryString["type"].ToString().Trim();
        string[] subType = { "学院新闻","物理系", "电子工程系", "计算机科学与技术系", "海洋技术系" };
        if (subType.Contains(subTypes.Text))
            relationItemOfSubType.Visible = true;
        else
            relationItemOfSubType.Visible = false;
        if (subTypes.Text == "学院新闻")
            dplNewsSource.Visible = true;
        else
            dplNewsSource.Visible = false;
    }



    private void initAcademinTime()
    {
        List<string> timeList = new List<string>();
        //时间
        for (int i = 0; i < 24; i++)
            timeList.Add(i.ToString("D2"));
        dplHour.DataSource = timeList;
        dplHour.DataBind();
        timeList.Clear();
        for (int i = 0; i < 60; i++)
            timeList.Add(i.ToString("D2"));
        dplMinute.DataSource = timeList;
        dplMinute.DataBind();
        //日期
        timeList.Clear();
        for (int i = 2017; i < 2050; i++)
            timeList.Add(i.ToString());
        dplYear.DataSource = timeList;
        dplYear.DataBind();
        timeList.Clear();
        for (int i = 0; i < 12; i++)
            timeList.Add((i + 1).ToString());
        dplMonth.DataSource = timeList;
        dplMonth.DataBind();
        timeList.Clear();
        dplDay.DataSource = getDays(Convert.ToInt32(dplYear.SelectedValue), Convert.ToInt32(dplMonth.SelectedValue));
        dplDay.DataBind();

    }

    /// <summary>
    /// 获取每个月的天数
    /// </summary>
    /// <param name="year">年</param>
    /// <param name="mon">月</param>
    /// <returns>返回本年所有月的天数</returns>
    private List<int> getDays(int year, int mon)
    {
        List<int> ans = new List<int>();
        int[] daysTable = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
        int daysCnt = daysTable[mon - 1];
        if ((year % 100 != 0 && year % 4 == 0) || (year % 400 == 0) && mon == 2)
            daysCnt++;
        for (int i = 0; i < daysCnt; i++)
            ans.Add(i + 1);
        return ans;
    }

    protected void dplYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        dplDay.DataSource = getDays(Convert.ToInt32( dplYear.SelectedValue),Convert.ToInt32( dplMonth.SelectedValue));
        dplDay.DataBind();
    }

    protected void dplMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        dplDay.DataSource = getDays(Convert.ToInt32(dplYear.SelectedValue), Convert.ToInt32(dplMonth.SelectedValue));
        dplDay.DataBind();
    }
}