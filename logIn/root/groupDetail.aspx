<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/root/Root.master" AutoEventWireup="true" CodeFile="groupDetail.aspx.cs" Inherits="Manage_root_groupDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>组织详情页面</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="text-align:center" ><%=pageGp.GroupName %></h1>
    <h3>成员列表</h3>
    <asp:LinkButton ID="lbtnJumpAddOrgNum" runat ="server" Visible="false" Text ="还没有成员，去添加成员" PostBackUrl="~/Manage/root/add.aspx?type=orgNumber"></asp:LinkButton>
     <asp:GridView ID="gdvGpLs" runat ="server" AllowPaging="True" PageSize="20"  AutoGenerateColumns="False"  OnRowCommand="gdvGpLs_RowCommand" OnPageIndexChanging="gdvGpLs_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" >
         <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="序号">
                <ItemTemplate>
                    <span><%# this.gdvGpLs.PageIndex * this.gdvGpLs.PageSize + this.gdvGpLs.Rows.Count + 1%></span>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="number" HeaderText="学工号" ReadOnly="True" SortExpression="number" />
            <asp:BoundField DataField="name" HeaderText="名字" ReadOnly="True" SortExpression="number" />
            <asp:HyperLinkField HeaderText="修改" Text="修改" DataNavigateUrlFields="connID" DataNavigateUrlFormatString="~/Manage/root/groupNumEdit.aspx?connID={0}" />
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton  runat ="server" OnClientClick='return confirm("确定要删除此成员？")' CommandName="mydelete" CommandArgument='<%# Eval("connID") %>'>删除</asp:LinkButton>
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
   
    <asp:Panel ID="editGpFrm" runat="server">
        <p>组织名字：<asp:TextBox ID="txtGpName" MaxLength ="15" runat="server"></asp:TextBox></p>
        <p>组织类型：<asp:DropDownList ID="dpl" runat ="server" >
           <asp:ListItem>组织</asp:ListItem>
        <asp:ListItem >社团</asp:ListItem>
        <asp:ListItem >实验室</asp:ListItem>
        <asp:ListItem >其他</asp:ListItem>
                </asp:DropDownList></p>
        <p>
            组织图片:<br />
            <asp:Image ID="Image1" runat="server" Width ="256" Height="256"  />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btnUpload" runat="server" Text="上传" OnClick="btnUpload_Click" />
        </p>
        <p>
            组织网址：<asp:TextBox ID="txtGpLink" runat ="server" MaxLength ="30" ></asp:TextBox>
        </p>
    </asp:Panel>
    <asp:Button ID="editGroup" runat="server"  Text="修改组织信息"  OnClick="editGroup_Click"/>
</asp:Content>

