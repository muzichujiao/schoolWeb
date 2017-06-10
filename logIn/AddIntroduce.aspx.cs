using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Default : System.Web.UI.Page
{
   protected string QueryType = string.Empty;
    private oucITEntities db = new oucITEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
            Response.Write("<script>alert('账户过期请重新登录！');window.parent.location.href='Login.aspx';</script>");
        try
        {
            QueryType = Request.QueryString["type"].ToString().Trim();
        }
        catch
        {
            QueryType = "学院概况";
        }
        if (!IsPostBack)
        {
            User u = (User)Session["User"];
            if (TeacherHelper.Select(u.UserID) == null)
                Response.Redirect("Index.aspx");
            try
            {
                //绑定子分类
                dplType.DataSource = IntroduceHelper.getSubType(QueryType);
                dplType.DataBind();
                //初始化内容
                if (QueryType == "合作办学")
                    CoopBuild.Visible = true;
                Introduce intr = new Introduce();
                if (QueryType == "专业介绍")
                {
                    //绑定子分类关联分类
                    dplSubType.DataSource = IntroduceHelper.getSubTypeRelationItem(dplType.SelectedValue);
                    dplSubType.DataBind();
                    dplSubType.Visible = true;
                    intr = db.Introduce.SingleOrDefault(p => p.name == "专业介绍:物理学");
                }
                else if(QueryType!="合作办学")
                    intr = db.Introduce.SingleOrDefault(p => p.name == "学院概况:学院介绍");
               myEditor11.InnerHtml = intr.text;
            }
            catch {  myEditor11.InnerHtml = ""; }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string saveField = string.Empty;
        if (dplSubType.Visible == false)
            saveField = dplType.SelectedValue;
        else
            saveField = dplSubType.SelectedValue;
        if (saveField == "合作办学")
            saveField = QueryType+":"+txtCoopTitle.Text.Trim();
        else
            saveField = QueryType + ":" + saveField;

        
        if (Server.HtmlDecode(myEditor11.InnerHtml).Trim().Length == 0 ||(QueryType=="合作办学" && txtCoopTitle.Text.Trim().Length==0))
            Response.Write(JSHelper.ShowAlert("内容不能为空！"));
        else
        {
            //判断是修改还是新增
            Introduce intr = db.Introduce.SingleOrDefault(p => p.name == saveField);
            if (intr == null)
            {
                //说明是新增
                intr = new Introduce
                {
                    name = saveField,
                    text = Server.HtmlDecode(myEditor11.InnerHtml)
                };
                db.Introduce.Add(intr);
                Response.Write(JSHelper.ShowAlert("添加成功！"));
            }
            else
            {
                //说明是修改
                intr.text = Server.HtmlDecode(myEditor11.InnerHtml);
                Response.Write(JSHelper.ShowAlert("修改成功！"));
            }
            db.SaveChanges();
            
        }
   
    }
    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        Introduce intr = db.Introduce.First(p => p.name == DropDownList1.SelectedValue);
    //        myEditor11.InnerHtml = intr.text;
    //    }
    //    catch {
    //        myEditor11.InnerHtml = "";
    //    }
    //}

    protected void dplType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (QueryType == "专业介绍")
        {
            dplSubType.DataSource = IntroduceHelper.getSubTypeRelationItem(dplType.SelectedValue);
            dplSubType.DataBind();
            dplSubType.Visible = true;
            SubContentBind();

        }
        else
        {
            try
            {
                
                Introduce intr = db.Introduce.First(p => p.name.Contains(QueryType+":"+ dplType.SelectedValue));
                myEditor11.InnerHtml = intr.text;
            }
            catch
            {
                myEditor11.InnerHtml = "";
            }
            dplSubType.Visible = false;
        }
    }

    protected void dplSubType_SelectedIndexChanged(object sender, EventArgs e)
    {
        SubContentBind();
    }

    /// <summary>
    /// 更新富文本编辑器内容
    /// </summary>
    private void SubContentBind()
    {
        try
        {
            Introduce intr = db.Introduce.First(p => p.name==QueryType+":"+dplSubType.SelectedValue);
            myEditor11.InnerHtml = intr.text;
        }
        catch
        {
            myEditor11.InnerHtml = "";
        }

    }
}