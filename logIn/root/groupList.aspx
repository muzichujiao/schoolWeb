<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/root/Root.master" AutoEventWireup="true" CodeFile="groupList.aspx.cs" Inherits="Manage_root_groupList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>组织列表</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>组织列表</h1>
      请选择组织类型：<asp:DropDownList ID="dpl" runat ="server"  AutoPostBack="true"  OnSelectedIndexChanged="dpl_SelectedIndexChanged">
    <asp:ListItem Selected="True">组织</asp:ListItem>
        <asp:ListItem >社团</asp:ListItem>
        <asp:ListItem >实验室</asp:ListItem>
        <asp:ListItem >其他</asp:ListItem>
    </asp:DropDownList>
      <asp:GridView ID="gdvGroupLs" runat ="server" AllowPaging="True" PageSize="20"  AutoGenerateColumns="False"  OnRowCommand="gdvGroupLs_RowCommand"  OnPageIndexChanging="gdvGroupLs_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" >
          <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="序号">
                <ItemTemplate>
                    <span><%# this.gdvGroupLs.PageIndex * this.gdvGroupLs.PageSize + this.gdvGroupLs.Rows.Count + 1%></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataTextField="GroupName" Target="_self" HeaderText="组织名字" DataNavigateUrlFields="GroupID"  DataNavigateUrlFormatString ="~/Manage/root/groupDetail.aspx?groupId={0}" />
          <%--<asp:BoundField DataField="groupType" HeaderText="类型" ReadOnly="True"  />--%>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton  runat ="server" OnClientClick='return confirm("确定要删除此组织吗？这将导致所有组织成员被删除！")' CommandName="mydelete" CommandArgument='<%# Eval("GroupID") %>'>删除</asp:LinkButton>
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

