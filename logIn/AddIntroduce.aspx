<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="AddIntroduce.aspx.cs" Inherits="Manage_Default" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../Ueditor/lang/zh-cn/zh-cn.js"></script>
    <title>添加简介</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h1><%= QueryType %></h1>
     请选择分类：
    <asp:DropDownList ID="dplType" runat ="server" OnSelectedIndexChanged="dplType_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
    <asp:DropDownList ID="dplSubType" runat ="server"  Visible="false" OnSelectedIndexChanged="dplSubType_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

    <asp:Panel ID="CoopBuild" runat ="server" Visible ="false" >
    标题：<asp:TextBox ID="txtCoopTitle" runat ="server" MaxLength="50" Width="800" ></asp:TextBox>
    </asp:Panel>

    <%--<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem>学院介绍</asp:ListItem>
        <asp:ListItem>物理系</asp:ListItem>
        <asp:ListItem>电子工程系</asp:ListItem>
        <asp:ListItem>计算机科学与技术系</asp:ListItem>
        <asp:ListItem>海洋技术系</asp:ListItem>
        <asp:ListItem>信息工程中心</asp:ListItem>
    </asp:DropDownList><br />
--%>

    <br />

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
    </script><br />
            
           

    <asp:Button ID="Button1" runat="server" Text="确定" OnClick="Button1_Click" />
</asp:Content>

