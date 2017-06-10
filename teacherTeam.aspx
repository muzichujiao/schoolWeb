<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="teacherTeam.aspx.cs" Inherits="Display_teacherTeam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
						<li><a href="introduceList.aspx?type=学院概况&item=计算机科学与技术系">计算机科学与技术系</a></li>
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
            <form runat ="server" >
			<div class="all-title">
				<h1><asp:label id="lblMajor" runat="server" text=""></asp:label></h1>
				<h2><asp:label id="lblEnglishMajor" runat="server" text=""></asp:label></h2>
				<ul class="clearfix">
					<asp:panel id="panelChoose" runat="server" cssclass="list-control">
                    <li><asp:linkbutton ID="lnkJob" runat="server" onclick="lnkJob_Click">按职称分类</asp:linkbutton></li>
                    <li><asp:linkbutton ID="lnkBshTutor" runat="server" onclick="lnkBshTutor_Click">博士生导师</asp:linkbutton></li>
                    <li><asp:linkbutton ID="lnkYjsTutor" runat="server" onclick="lnkYjsTutor_Click">硕士生导师</asp:linkbutton></li>
                </asp:panel>
				</ul>
			</div>
            <asp:panel id="panel1" runat="server">
			<div class="lists-title">
				<h1><asp:Label ID="lbName1" runat="server" Text="教授"></asp:Label></h1>
				<h2><asp:Label ID="lbJob1" runat="server" Text="professor"></asp:Label></h2>
			</div>
                <asp:Panel ID ="Panel6" runat ="server" >
			<div class="people-lists">
				<ul class="clearfix">
					<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Introduct.aspx?id=<%#Eval("UserID") %>">
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("UserID") %>'></asp:Label>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
				</ul>
			</div>		
                </asp:Panel>	
                <asp:Panel ID ="Panel7" runat ="server" >
            <div class="lists-title">
                <h1><asp:Label ID="lbName2" runat="server" Text="副教授"></asp:Label></h1>
				<h2><asp:Label ID="lbJob2" runat="server" Text="associate professor"></asp:Label></h2>
			</div>
			<div class="people-lists">
				<ul class="clearfix">
					<asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Introduct.aspx?id=<%#Eval("UserID") %>">
                                    <asp:Label ID="lblName4" runat="server" Text='<%#Eval("UserID") %>'></asp:Label>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
				</ul>
			</div>
        </asp:Panel>
        <asp:Panel ID ="Panel5" runat ="server" >
            <div class="lists-title">
                <h1><asp:Label ID="lbName3" runat="server" Text="高级工程师"></asp:Label></h1>
				<h2><asp:Label ID="lbJob3" runat="server" Text="senior engineer"></asp:Label></h2>
			</div>
			<div class="people-lists">
				<ul class="clearfix">
					<asp:Repeater ID="Repeater5" runat="server" OnItemDataBound="Repeater5_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Introduct.aspx?id=<%#Eval("UserID") %>">
                                    <asp:Label ID="lblName5" runat="server" Text='<%#Eval("UserID") %>'></asp:Label>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
				</ul>
			</div>
        </asp:Panel>
            <asp:Panel ID ="Panel8" runat ="server" >
            <div class="lists-title">
                <h1><asp:Label ID="lbName4" runat="server" Text="高级实验师"></asp:Label></h1>
				<h2><asp:Label ID="lbJob4" runat="server" Text="senior experimentalist"></asp:Label></h2>
			</div>
			<div class="people-lists">
				<ul class="clearfix">
					<asp:Repeater ID="Repeater6" runat="server" OnItemDataBound="Repeater6_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Introduct.aspx?id=<%#Eval("UserID") %>">
                                    <asp:Label ID="lblName6" runat="server" Text='<%#Eval("UserID") %>'></asp:Label>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
				</ul>
			</div>
            </asp:Panel>
            <asp:Panel ID ="Panel9" runat ="server" >
            <div class="lists-title">
                <h1><asp:Label ID="lbName5" runat="server" Text="讲师"></asp:Label></h1>
				<h2><asp:Label ID="lbJob5" runat="server" Text="lecturer"></asp:Label></h2>
			</div>
			<div class="people-lists">
				<ul class="clearfix">
					<asp:Repeater ID="Repeater7" runat="server" OnItemDataBound="Repeater7_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Introduct.aspx?id=<%#Eval("UserID") %>">
                                    <asp:Label ID="lblName7" runat="server" Text='<%#Eval("UserID") %>'></asp:Label>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
				</ul>
			</div>
            </asp:Panel>
                <asp:Panel ID ="Panel10" runat ="server" >
            <div class="lists-title">
                <h1><asp:Label ID="lbName6" runat="server" Text="助理工程师"></asp:Label></h1>
				<h2><asp:Label ID="lbJob6" runat="server" Text="assistant engineer"></asp:Label></h2>
			</div>
			<div class="people-lists">
				<ul class="clearfix">
					<asp:Repeater ID="Repeater8" runat="server" OnItemDataBound="Repeater8_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Introduct.aspx?id=<%#Eval("UserID") %>">
                                    <asp:Label ID="lblName8" runat="server" Text='<%#Eval("UserID") %>'></asp:Label>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
				</ul>
			</div>
            </asp:Panel>
                <asp:Panel ID ="Panel11" runat ="server" >
            <div class="lists-title">
                <h1><asp:Label ID="lbName7" runat="server" Text="助理实验师"></asp:Label></h1>
				<h2><asp:Label ID="lbJob7" runat="server" Text="assistant experimentalist"></asp:Label></h2>
			</div>
			<div class="people-lists">
				<ul class="clearfix">
					<asp:Repeater ID="Repeater9" runat="server" OnItemDataBound="Repeater9_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Introduct.aspx?id=<%#Eval("UserID") %>">
                                    <asp:Label ID="lblName9" runat="server" Text='<%#Eval("UserID") %>'></asp:Label>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
				</ul>
			</div>
            </asp:Panel>
        </asp:panel>
            <asp:panel id="panel2" runat="server">
                    <div class="people-lists">
                    <ul class="clearfix">
                        <asp:Repeater ID="Repeater3" runat="server" OnItemDataBound="Repeater3_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Introduct.aspx?id=<%#Eval("UserID") %>">
                                    <asp:Label ID="lblName2" runat="server" Text='<%#Eval("UserID") %>'></asp:Label>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                </div>
                </asp:panel>
                <asp:panel id="panel3" runat="server">
                    <div class="people-lists">
                    <ul class="clearfix">
                        <asp:Repeater ID="Repeater4" runat="server" OnItemDataBound="Repeater4_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Introduct.aspx?id=<%#Eval("UserID") %>">
                                    <asp:Label ID="lblName3" runat="server" Text='<%#Eval("UserID") %>'></asp:Label>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                </div>
                </asp:panel>
                <asp:panel id="panel4" runat="server">
                    <div class="people-lists">
                    <ul class="clearfix">
                        <asp:Repeater ID="Repeater10" runat="server" OnItemDataBound="Repeater10_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Introduct.aspx?id=<%#Eval("UserID") %>">
                                    <asp:Label ID="lblName10" runat="server" Text='<%#Eval("UserID") %>'></asp:Label>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                </div>
                </asp:panel>
            </form>
		</div>
	</div>
</asp:Content>

