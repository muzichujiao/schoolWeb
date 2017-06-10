<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/root/Root.master" AutoEventWireup="true" CodeFile="editPwd.aspx.cs" Inherits="Manage_root_editPwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>修改密码</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>修改密码</h1>
    <p>
    <label>新密码：</label>
    <asp:TextBox ID="txtNewPsw" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>(密码正确格式为：以字母开头，长度在6-18之间，只能包含字符、数字和下划线。)
    <asp:RegularExpressionValidator ID="reUserPwd" runat ="server"  ErrorMessage="请输入合法密码" ControlToValidate="txtNewPsw" ForeColor="Red" ValidationExpression="^[a-zA-Z]\w{6,18}$" ValidationGroup="valid"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="valrNewPwd" runat="server" ErrorMessage="新密码不能为空" ForeColor="Red" ControlToValidate="txtNewPsw"></asp:RequiredFieldValidator>
    </p>
    <p>
    <label>确认密码：</label>
    <asp:TextBox ID="txtAgainPsw" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valrAgainPwd" runat="server" ErrorMessage="确认密码不能为空" ForeColor="Red" ControlToValidate="txtAgainPsw"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="两次输入的密码不一致" ForeColor="Red"  ControlToCompare="txtNewPsw" ControlToValidate="txtAgainPsw"></asp:CompareValidator>
    </p>
        <asp:Button ID="btnEdit" runat="server" Text="确认修改" OnClick="btnEdit_Click" />
</asp:Content>

