using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 1;
        
        try
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());

        }
        catch
        {

        }
        ArticleHelper.AddHitCount(id);
        Article ar = ArticleHelper.GetArticleByID(id);
        ltTitle.Text = ar.Title;
        ltSource.Text = ar.Source;
        ltAuthor.Text = ar.Author;
        ltHit.Text = ar.Hit.ToString();
        DateTime time = ar.UpdateTime;
        ltTime.Text = time.Year.ToString() + "年" + time.Month.ToString() + "月" + time.Day.ToString() + "日";
        if(ArticleHelper.getType(id)!= "学术报告:学术报告")
            ltContent.Text = ar.Content;
        else
        {
            plAcademic.Visible = true;
            string[] all = ar.Content.Split(new char[] { '!', '#' });
            //ltContent.Text = all[3];
            ltContent.Text=ar.Content.Substring(ar.Content.IndexOf('#')+1);
            DateTime date = Convert.ToDateTime(all[0]);
            ltHoldTime.Text = "举办时间:" + date.Month + "." + date.Day + " " + all[1];
            ltHoldPlace.Text ="举办地点:" + all[2];
        }
        //Response.Cookies["myCookies"].Expires = DateTime.Now.AddDays(30);
        //Cookie.Expires = DateTime.Now.AddDays(1);
        if (Request.Cookies["myCookies"] == null|| Request.Cookies["myCookies"].Value=="|")
        {
            //Response.Cookies["myCookies"].Value = "|";
            //Response.Cookies["myCookies"].Expires = DateTime.Now.AddDays(30);
            HttpCookie MyCookie1 = new HttpCookie("myCookies", "|");
            //MyCookie.Value = Server.HtmlEncode("|");//设置Cookie的值

            //MyCookie.Expires = DateTime.Now.AddDays(1);
            DateTime date = DateTime.Now.AddDays(30);
            MyCookie1.Expires = DateTime.Now.Add(new TimeSpan(0, 2, 0));
            MyCookie1.Expires = date;//设置Cookie过期时间
            Response.Cookies.Add(MyCookie1);//新增Cookie
        }
        if (CHelper.IsExit(id))
            if (!(Server.HtmlEncode(Request.Cookies["myCookies"].Value).Contains("|" + id.ToString() + "|"))) 
            {
                    LinkAdd.Visible = true;
                    addID.Value = id.ToString();
            }
    }


protected void Add_Click(object sender, EventArgs e)
    {
        try
        {
            if (CHelper.Add(Convert.ToInt32(addID.Value)))
            {
                string cookies = Server.HtmlEncode(Request.Cookies["myCookies"].Value);
                Response.Cookies["myCookies"].Value = cookies + "|" + addID.Value.ToString() + "|";
                Response.Write(JSHelper.ShowAlertAndBack("你所处的IP记录成功"));
            }
        }
        catch
        {
        }
    }
}