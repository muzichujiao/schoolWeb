<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="Recycle.aspx.cs" Inherits="Manage_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>回收站</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <h1 style="text-align:left">回收站</h1>
   
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="716px" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <Columns>

            <asp:TemplateField HeaderText="选择">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ArticleID" HeaderText="ArticleID" ReadOnly="True" SortExpression="ArticleID" />
        <%--<asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" SortExpression="Title" />
             --%>
           <asp:TemplateField HeaderText="Title">
                <ItemTemplate>
                    <asp:HyperLink runat ="server"  Target="_blank" NavigateUrl='<%# "/Display/Content.aspx?id="+Eval("ArticleID") %>'><%#Eval("Title")%></asp:HyperLink>

                </ItemTemplate>
           </asp:TemplateField>
            <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="True" SortExpression="Type" />
            <asp:BoundField DataField="UpdateTime" HeaderText="UpdateTime" ReadOnly="True" SortExpression="UpdateTime" />

        </Columns>
    </asp:GridView>
    <br />
    <asp:Button ID="delete" runat="server" OnClientClick='confirm("操作不可逆，确定执行？")' Text="彻底删除所有选中项" OnClick="delete_Click" />
    &nbsp;
   
    <asp:Button ID="restore" runat="server" Text="恢复所有选中项" OnClick="restore_Click" />
    &nbsp;
   
    <asp:Button ID="clearAll" runat="server" OnClick="clearAll_Click" OnClientClick='confirm("操作不可逆，确定执行？")' Text="清空回收站" />
</asp:Content>

