
<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/root/Root.master" AutoEventWireup="true" CodeFile="adminLog.aspx.cs" Inherits="Manage_root_adminLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>管理员登录记录</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>管理员登录记录</h1>
        <asp:GridView ID="gdvLog" runat="server" AutoGenerateColumns="False"  PageSize="20" OnPageIndexChanging="gdvLog_PageIndexChanging"  BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" CellSpacing="2">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                 <ItemTemplate>
                     <asp:CheckBox ID="CheckBox1" runat="server" /></ItemTemplate>
             </asp:TemplateField>
            <asp:BoundField DataField="LogID" HeaderText="LogID" ReadOnly="True" SortExpression="LogID"></asp:BoundField>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID"></asp:BoundField>
            <asp:BoundField DataField="Time" HeaderText="Time" ReadOnly="True" SortExpression="Time"></asp:BoundField>
            <asp:BoundField DataField="IP" HeaderText="IP" ReadOnly="True" SortExpression="IP"></asp:BoundField>
        </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

    <asp:Button ID="delete" runat="server"  Text="删除所有选中项" OnClick="delete_Click" />
&nbsp;
   
&nbsp;
    <asp:Button ID="clearAll" runat="server"  OnClick="clearAll_Click" Text="清空所有记录"  />

</asp:Content>

