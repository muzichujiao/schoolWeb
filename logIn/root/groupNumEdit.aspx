<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/root/Root.master" AutoEventWireup="true" CodeFile="groupNumEdit.aspx.cs" Inherits="Manage_root_groupNumEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>组织成员信息修改</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h1>成员权限修改</h1>
    <p>
    请选择组别：<asp:DropDownList ID="dplGp" runat ="server"  >
       </asp:DropDownList>
        </p>
    <p>
        请选择显示的等级：        <asp:DropDownList ID="ddlClass" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>请选择权限：
        <asp:DropDownList ID="ddlRight" runat="server">
            <asp:ListItem>管理员</asp:ListItem>
            <asp:ListItem>其他</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:Button ID="submit" runat ="server" Text="提交" OnClick="submit_Click" />
    </p>
</asp:Content>

