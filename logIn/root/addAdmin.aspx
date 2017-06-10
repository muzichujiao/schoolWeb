<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/root/Root.master" AutoEventWireup="true" CodeFile="addAdmin.aspx.cs" Inherits="Manage_root_addAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>添加管理员</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="addAdmin" runat ="server" >
    <h1>添加管理员</h1>
   
    选择添加类型：
    <asp:DropDownList ID="dpl" runat ="server" >
        <asp:ListItem Selected="True">老师</asp:ListItem>
        <asp:ListItem>学生</asp:ListItem>
    </asp:DropDownList>
    <p>
    学工号：<asp:TextBox ID="userNum" runat ="server" MaxLength="12"></asp:TextBox>
        <asp:RegularExpressionValidator ID="reUserNum" runat ="server"  ErrorMessage="学号/工号不正确" ControlToValidate="userNum" ForeColor="Red" ValidationExpression="[0-9a-zA-Z]{1,11}" ValidationGroup="valid"></asp:RegularExpressionValidator>
    </p>
    
     <p>
    姓名：<asp:TextBox ID="userName" runat ="server" MaxLength="16"></asp:TextBox>
      <!--   <asp:RegularExpressionValidator ID="reName" runat ="server"  ErrorMessage="姓名不能为空" ControlToValidate="userName" ForeColor="Red"  ValidationGroup="valid"></asp:RegularExpressionValidator>-->
    </p>
    <p>
   密码：<asp:TextBox ID="userPwd" runat ="server" MaxLength="18" TextMode="Password"></asp:TextBox>(密码正确格式为：以字母开头，长度在6-18之间，只能包含字符、数字和下划线。)
        <asp:RegularExpressionValidator ID="reUserPwd" runat ="server"  ErrorMessage="请输入合法密码" ControlToValidate="userPwd" ForeColor="Red" ValidationExpression="^[a-zA-Z]\w{6,18}$" ValidationGroup="valid"></asp:RegularExpressionValidator>
    </p>
        <p>
   确认密码：<asp:TextBox ID="userPwdRpt" runat ="server" MaxLength="18" TextMode="Password" ></asp:TextBox>
            <asp:CompareValidator ID="cmpPwd" runat ="server"  ForeColor ="Red" ErrorMessage="两次密码不一致" ControlToValidate="userPwd" ControlToCompare="userPwdRpt" ValidationGroup="valid"></asp:CompareValidator>
    </p>
    <p>
        <asp:Button ID="submit" runat ="server" Text ="注册" OnClick="submit_Click" ValidationGroup="valid" />
    </p>

        </asp:Panel>
</asp:Content>

