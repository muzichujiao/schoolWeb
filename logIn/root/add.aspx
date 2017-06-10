<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/root/Root.master" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="Manage_root_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title >各种添加页面</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <!--管理员添加模块-->
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
    <!--添加组织-->
    <asp:Panel ID="addOrg" runat ="server" >
         <h1>添加组织</h1>
        <p>组织名字：<asp:TextBox ID="txtGpName" MaxLength ="15" runat="server"></asp:TextBox></p>
        <p>组织类型：<asp:DropDownList ID="dplAddTyped" runat ="server" >
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
    <asp:Button ID="editGroup" runat="server"  Text="添加组织"  OnClick="editGroup_Click" />

    </asp:Panel>

    <!--添加组织成员-->
    <asp:Panel ID="addOrgNumber" runat ="server" >
         <h1>为组织机构添加成员</h1>
        <label>请选择择组别</label>
        <asp:DropDownList ID="ddlGroup" runat="server"></asp:DropDownList>
        <br />
        <label>请输入要添加的老师的工号或学生的学号：</label>
        <asp:TextBox ID="txtNum" runat="server"></asp:TextBox>
        <asp:Button ID="btnCheck" runat="server" Text="检索" OnClick="btnCheck_Click" />
        <br />
        <asp:Label ID="lblName" runat="server" ForeColor="Red" Text=""></asp:Label><br />
        <label>请选择显示的等级：</label>
        <asp:DropDownList ID="ddlClass" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
        </asp:DropDownList>
        <br />
        <label>请选择权限：</label>
        <asp:DropDownList ID="ddlRight" runat="server">
            <asp:ListItem>管理员</asp:ListItem>
            <asp:ListItem>其他</asp:ListItem>
        </asp:DropDownList>
        <br />
        <label>请输入职务：</label>
        <asp:TextBox ID="txtJob" runat="server"></asp:TextBox>
        <br />
        <label>请输入职责：</label>
        <asp:TextBox ID="txtDuty" runat="server"></asp:TextBox>
        <br />
        <label>请输入电话：</label>
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        <br />
        <label>请输入Email:</label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="添加进Group"  OnClick="btnAdd_Click"/>
    </asp:Panel>
</asp:Content>

