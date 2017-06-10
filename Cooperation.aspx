<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="Cooperation.aspx.cs" Inherits="Display_Cooperation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/contentCss.css" />
	<script type="text/javascript" src="js/contentJs.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" Runat="Server">
     <div class="imggg"><img id="backG" src="images/background01.png"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainText" Runat="Server">
    <div class="content-main">
        <form id="form1" runat="server">
			<div class="content-tittle">
				<h1><asp:Literal ID="ltTitle" runat="server"></asp:Literal></h1>
			</div>
			<div class="content-contText">
				<div class="content-sign">
				</div>
				<div class="content-article">
					<asp:Literal ID="ltContent" runat="server"></asp:Literal>
				</div>
			</div></form>
		</div>
      <script type="text/javascript">
    //内容页图片宽度控制
            var timer = setTimeout(function () {
               $(".content-article").find("img").each(function () {
                   if (parseInt($(this).css("width")) > parseInt($(".content-article").css("width"))) {
                       $(this).css({ "width": "100%","height":"auto"});
                   }
                });
            },50)

    
    </script>
</asp:Content>

