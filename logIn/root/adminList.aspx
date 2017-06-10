<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/root/Root.master" AutoEventWireup="true" CodeFile="adminList.aspx.cs" Inherits="Manage_root_adminList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>管理员列表</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>管理员列表</h1>

    请选择管理员类型：<asp:DropDownList ID="dpl" runat ="server"  AutoPostBack="true"  OnSelectedIndexChanged="dpl_SelectedIndexChanged">
    <asp:ListItem Selected="True">老师</asp:ListItem>
        <asp:ListItem >学生</asp:ListItem>
    </asp:DropDownList>


    <asp:GridView ID="gdvTeacherLs" runat ="server" AllowPaging="True" PageSize="20"  AutoGenerateColumns="False"  OnRowCommand="gdvTeacherLs_RowCommand"  OnPageIndexChanging="gdvTeacherLs_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" >
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="序号">
                <ItemTemplate>
                    <span><%# this.gdvTeacherLs.PageIndex * this.gdvTeacherLs.PageSize + this.gdvTeacherLs.Rows.Count + 1%></span>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="number" HeaderText="工号" ReadOnly="True" SortExpression="number" />
            <asp:BoundField DataField="name" HeaderText="名字" ReadOnly="True" SortExpression="number" />
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton  runat ="server" OnClientClick='return confirm("确定要删除此用户？")' CommandName="mydelete" CommandArgument='<%# Eval("userId") %>'>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
                    <asp:TemplateField HeaderText="密码重置">
                <ItemTemplate>
                    <asp:LinkButton  runat ="server" OnClientClick='return confirm("确定要重置此用户密码？")' CommandName="Reset" CommandArgument='<%# Eval("number") %>'>密码重置</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>




     <asp:GridView ID="gdvStudentLs" runat ="server" Visible="False" AllowPaging="True" PageSize="20"  AutoGenerateColumns="False"  OnRowCommand="gdvStudentLs_RowCommand"  OnPageIndexChanging="gdvStudentLs_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" >
         <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="序号">
                <ItemTemplate>
                    <span><%# this.gdvStudentLs.PageIndex * this.gdvStudentLs.PageSize + this.gdvStudentLs.Rows.Count + 1%></span>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="number" HeaderText="学号" ReadOnly="True" SortExpression="number" />
            <asp:BoundField DataField="name" HeaderText="名字" ReadOnly="True" SortExpression="number" />
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton  runat ="server" OnClientClick='return confirm("确定要删除此用户？")' CommandName="mydelete" CommandArgument='<%# Eval("userId") %>'>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
                    <asp:TemplateField HeaderText="密码重置">
                <ItemTemplate>
                    <asp:LinkButton  runat ="server" OnClientClick='return confirm("确定要重置此用户密码？")' CommandName="Reset" CommandArgument='<%# Eval("number") %>'>密码重置</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>


</asp:Content>

