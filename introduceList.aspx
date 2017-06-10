<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="introduceList.aspx.cs" Inherits="Display_introduceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--<<<<<<< HEAD
	<link type="text/css" href="css/XYGK.css" rel="stylesheet" />
	<script type="text/javascript" src="js/XYGK.js"></script>
=======--%>
    <link type="text/css" href="css/style.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" Runat="Server">
      <div class="imggg"><img id="backG" src="images/background01.png"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainText" Runat="Server">
	<div class="container"><!--主要内容-->
		<div class="left-nav"><!--左边二级导航栏-->
			<ul class="mtree bubba">
				<li>
					<a href="#">学院概况</a>
					<ul>
						<li><a href="introduceList.aspx?type=学院概况&item=学院介绍">学院介绍</a></li>
						<li><a href="introduceList.aspx?type=学院概况&item=物理系">物理系</a></li>
						<li><a href="introduceList.aspx?type=学院概况&item=电子工程系">电子工程系</a></li>
						<li><a href="introduceList.aspx?type=学院概况&item=计算机科学与技术系">计算机科学与技术</a></li>
						<li><a href="introduceList.aspx?type=学院概况&item=海洋技术系">海洋技术系</a></li>
						<li><a href="introduceList.aspx?type=学院概况&item=信息工程中心">信息工程中心</a></li>
					</ul>
				</li>
				<li>
					<a href="#">组织机构</a>
					<ul>
						<li><a href="structureList.aspx?type=组织机构&item=党委团委">党委团委</a></li>
						<li><a href="structureList.aspx?type=组织机构&item=院行政">院行政</a></li>
						<li><a href="structureList.aspx?type=组织机构&item=院工会妇委会">院工会 妇委会</a></li>
					</ul>
				</li>
				<li>
					<a href="#">师资团队</a>
					<ul>
						<li><a href="teacherTeam.aspx?type=师资队伍&item=physics">物理系</a></li>
						<li><a href="teacherTeam.aspx?type=师资队伍&item=electron">电子工程系</a></li>
						<li><a href="teacherTeam.aspx?type=师资队伍&item=computer">计算机系</a></li>
						<li><a href="teacherTeam.aspx?type=师资队伍&item=ocean">海洋技术系</a></li>
						<li><a href="teacherTeam.aspx?type=师资队伍&item=it">信息工程中心</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="right-lists"><!--右边列表内容-->
			<div class="all-title">
				<h1><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h1>
				<h2><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h2>
			</div>
			<div class="right-content"><!--内容页-->
				<asp:Literal ID="Literal1" runat="server"></asp:Literal>
			</div>
		</div>
	</div>

       <script type="text/javascript">
    //内容页图片宽度控制
            var timer = setTimeout(function () {
                var imgNum = $(".right-content").find("img").length;
                for (i = 0; i < imgNum; i++) {
                    if (parseInt($(".right-content").find("img").eq(i).css("width")) > parseInt($(".right-content").css("width"))) {
                        $(".right-content").find("img").eq(i).css({ "width": "100%","height":"auto" });
                    }
                }
            },10)

    
    </script>

</asp:Content>

