<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="AddArticle.aspx.cs" Inherits="Manage_Default" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../Ueditor/lang/zh-cn/zh-cn.js"></script>
    <title>添加文章</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1><%= h1_type %></h1>
    <asp:Label ID="Label1" runat="server" Text="标题"></asp:Label><asp:TextBox ID="tbTitle" runat="server" MaxLength="50"></asp:TextBox><br />
    <asp:Label ID="Label2" runat="server" Text="副标题"></asp:Label><asp:TextBox ID="tbSubTitle" runat="server" MaxLength="50" ></asp:TextBox><br />

    <asp:Label ID="Label3" runat="server" Text="所属栏目"></asp:Label>

    <asp:DropDownList ID="subTypes" runat="server" OnSelectedIndexChanged="subTypes_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

    <%--<asp:Panel ID="newsSource" runat ="server" Visible="false">--%>
    <asp:DropDownList ID="dplNewsSource" runat="server" Visible="false">
        <asp:ListItem Selected="True">学院官方</asp:ListItem>
        <asp:ListItem>学生组织</asp:ListItem>
    </asp:DropDownList>
    <%--</asp:Panel>--%>
    <asp:DropDownList ID="relationItemOfSubType" runat="server" Visible="false" AutoPostBack="true"></asp:DropDownList>
    <asp:Label ID="Label11" runat="server" Text="Label" Visible="false"></asp:Label>

    <br />
    <asp:Label ID="Label4" runat="server" Text="作者"></asp:Label><asp:DropDownList ID="DropDownList3" runat="server">
        <asp:ListItem>我自己</asp:ListItem>
        <asp:ListItem>匿名</asp:ListItem>
        <asp:ListItem>未知</asp:ListItem>
    </asp:DropDownList><br />
    <asp:Label ID="Label5" runat="server" Text="来源"></asp:Label><asp:DropDownList ID="DropDownList4" runat="server">
        <asp:ListItem>本站原创</asp:ListItem>
        <asp:ListItem>未知</asp:ListItem>
        <asp:ListItem>来自网络</asp:ListItem>
    </asp:DropDownList>

    <br />
    启用转向链接<asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
    <asp:Label ID="Label6" runat="server" Text="转向链接"></asp:Label><asp:TextBox ID="tbLink" runat="server"></asp:TextBox><br />

    <asp:Panel ID="panelAcademic" runat ="server" Visible="false">
            <p>
              举办地点：<asp:TextBox ID="txtPlace" runat ="server"  MaxLength="50"></asp:TextBox> 
             <br /> 举办日期：
     <asp:DropDownList ID="dplYear" runat ="server" OnSelectedIndexChanged="dplYear_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>年
     <asp:DropDownList ID="dplMonth" runat ="server" OnSelectedIndexChanged="dplMonth_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>月
     <asp:DropDownList ID="dplDay" runat ="server" ></asp:DropDownList>日&nbsp&nbsp&nbsp&nbsp&nbsp
           <asp:DropDownList ID="dplHour" runat ="server" ></asp:DropDownList>时
           <asp:DropDownList ID="dplMinute" runat ="server" ></asp:DropDownList>分
       </p>
        </asp:Panel>
    <div >

        <asp:Panel ID="content" runat="server">
            <asp:Label ID="Label7" runat="server" Text="正文"></asp:Label>

            <br />
            <textarea id="myEditor11" name="myEditor11" runat="server" onblur="setUeditor()" style="width: 1030px; height: 250px;"></textarea>
            <%-- 上面这个style这里是实例化的时候给实例化的这个容器设置宽和高，不设置的话，或默认为auto可能会造成部分显示的情况--%>

            <script type="text/javascript">
                var editor = new baidu.editor.ui.Editor();

                editor.render("<%=myEditor11.ClientID%>");
            </script>

            <script type="text/javascript">
                function setUeditor() {
                    var myEditor11 = document.getElementById("myEditor11");
                    myEditor11.value = editor.getContent();//把得到的值给textarea
                }
            </script>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="首页图片 "></asp:Label>
            <asp:CheckBox ID="CheckBox2" runat="server" Text="从本文中获取" />
            <br />
        </asp:Panel>
    </div>

    <asp:Label ID="Label9" runat="server" Text="属性"></asp:Label>
    <asp:CheckBox ID="cbTop" runat="server" Text="置顶文章" />
    <asp:CheckBox ID="cbHot" runat="server" Text="热门文章" />
    <asp:CheckBox ID="cbAttach" runat="server" Text="有附件" />

    <br />
    <div class="man-time">
        <asp:Label ID="Label10" runat="server" Text="录入时间"></asp:Label>
        <asp:TextBox ID="tyear" runat="server"></asp:TextBox>年
    <asp:TextBox ID="tmonth" runat="server"></asp:TextBox>月
    <asp:TextBox ID="tday" runat="server"></asp:TextBox>日
    </div>
    <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" />
    <a href="MyArticles.aspx">返回</a>
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="预览" />
    <asp:Panel ID="Panel1" runat="server" Visible="false" CssClass="preview">
        <h2>
            <asp:Literal ID="PreTitle" runat="server"></asp:Literal></h2>
        <asp:Literal ID="PreText" runat="server"></asp:Literal>
    </asp:Panel>
</asp:Content>

