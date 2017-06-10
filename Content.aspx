<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="Content.aspx.cs" Inherits="Display_Content" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/contentCss.css" />
	<script type="text/javascript" src="js/contentJs.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" Runat="Server">
     <div class="imggg"><img id="backG" src="images/background01.png"/></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainText" Runat="Server">
    <div class="content-main">
        <form id="form1" runat="server">
			<div class="content-tittle">
				<h1><asp:Literal ID="ltTitle" runat="server"></asp:Literal></h1>
                <asp:Panel runat="server" ID="plAcademic" Visible="false">
                        
                        <span><asp:Literal ID="ltHoldTime" runat="server"></asp:Literal></span>
                        
                        <span><asp:Literal ID="ltHoldPlace" runat="server"></asp:Literal></span>
                    </asp:Panel>
			</div>
			<div class="content-contText">
				<div class="content-sign">
                    <asp:Label ID="lbTe" runat="server"></asp:Label>
					<span>消息来源:</span>
					<span><asp:Literal ID="ltSource" runat="server"></asp:Literal></span>
					<span> 作者:</span>
					<span><asp:Literal ID="ltAuthor" runat="server"></asp:Literal></span>
					<span> 点击数：</span>
					<span><asp:Literal ID="ltHit" runat="server"></asp:Literal></span>
					<span> 更新时间：</span>
					<span><asp:Literal ID="ltTime" runat="server"></asp:Literal></span>
					<a href=""><asp:LinkButton ID="LinkAdd" runat="server" OnClick="Add_Click" Visible="false" CommandArgument="Add">有意向点击我</asp:LinkButton>
			        <asp:HiddenField ID="addID" runat="server" /></a>
<%--                    <asp:Panel runat="server" ID="plAcademic" Visible="false">
                        <br />
                        <br />
                        <span><asp:Literal ID="ltHoldTime" runat="server"></asp:Literal></span>
                        <br />
                        <span><asp:Literal ID="ltHoldPlace" runat="server"></asp:Literal></span>
                    </asp:Panel>--%>
				</div>
				<div class="content-article">
					<asp:Literal ID="ltContent" runat="server"></asp:Literal>
				</div>
			</div></form>
		</div>
        <script type="text/javascript">
            //内容页图片宽度控制
            $(window).ready(function () {
                var timer = setTimeout(function () {
                    $(".content-article").find("img").each(function () {
                        
                        if (parseInt($(this).css("width")) > parseInt($(".content-article").css("width"))) {
                            $(this).css({ "width": "100%", "height": "auto" });
                        }
                    });
                }, 50)

            });
    </script>

   
</asp:Content>

