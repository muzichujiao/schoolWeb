<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="majorIntroduction.aspx.cs" Inherits="Display_majorIntroduction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link type="text/css" href="css/style.css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" Runat="Server">
      <div class="imggg"><img id="backG" src="images/background01.png"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainText" Runat="Server">
    	<div class="container"><!--主要内容-->
		<div class="left-nav"><!--左边二级导航栏-->
			<ul class="mtree bubba">
				<li>
					<a href="#">本科生教育</a>
					<ul>
						<li><a href="majorIntroduction.aspx?type=本科生教育">专业介绍</a></li>
						<li><a href="teachingPlan.aspx?type=本科生教育">培养计划</a></li>
						<li><a href="courseList.aspx?type=本科生教育">课程介绍</a></li>
						<li><a href="stuEducate.aspx?type=本科生教育&item=规章制度">规章制度</a></li>
					</ul>
				</li>
				<li>
					<a href="#">研究生教育</a>
					<ul>
						<li><a href="http://it.ouc.edu.cn/graduEnroll/index.php?title=%E9%A6%96%E9%A1%B5">招生工作</a></li>
						<li><a href="stuEducate.aspx?type=研究生教育&item=奖励实施细则">奖励实施细则</a></li>
					</ul>
				</li>
				<li><a href="cooperateLearning.aspx?type=合作办学">合作办学</a></li>
			</ul>
		</div>
		<div class="right-lists"><!--右边列表内容-->
			<div class="all-title">
				<h1>专业介绍</h1>
				<h2>major introduction</h2>
				<ul class="clearfix">
					<li><a href="majorIntroduction.aspx?type=本科生教育&item=物理系">物理系</a></li>
					<li><a href="majorIntroduction.aspx?type=本科生教育&item=电子工程系">电子工程系</a></li>
					<li><a href="majorIntroduction.aspx?type=本科生教育&item=计算机科学与技术系">计算机科学与技术系</a></li>
					<li><a href="majorIntroduction.aspx?type=本科生教育&item=海洋技术系">海洋技术系</a></li>
				</ul>
			</div>
			<div class="common-lists"><!--普通列表示例-->
				<div class="lists-title">
					<h1><asp:Label ID ="lbdepartment" runat ="server"></asp:Label></h1>
					<h2><asp:Label ID="lbenglishDepart" runat ="server"></asp:Label></h2>
				</div>
				<div class="course-lists">
                    
					    <asp:Panel runat ="server" Visible ="false" ID ="Panel1" >
                            <ul class="mtree bubba clearfix">
                                <li>
							        <h1>物理学</h1>
							        <ul class="clearfix">
								        <li>
									        <p>
										        <asp:Literal ID ="Literal1" runat ="server" ></asp:Literal>
									        </p>
								        </li>
							        </ul>
					            </li>
                                <li>
                                    <h1>光电信息科学与技术</h1>
                                    <ul class="clearfix">
                                        <li>
                                            <p>
                                                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                                            </p>
                                        </li>
                                    </ul>
                                </li>
                            </ul>                        
					    </asp:Panel>
                    <asp:Panel runat ="server" Visible ="false" ID ="Panel2" >
                       <ul class="mtree bubba clearfix">

                            <li>
                                <h1>电子信息科学与技术</h1>
                                <ul class="clearfix">
                                    <li>
                                        <p>
                                            <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <h1>通信工程</h1>
                                <ul class="clearfix">
                                    <li>
                                        <p>
                                            <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <h1>电子信息工程</h1>
                                <ul class="clearfix">
                                    <li>
                                        <p>
                                            <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                                        </p>
                                    </li>
                                </ul>
                            </li>
                        </ul>                        
					</asp:Panel>
                    <asp:Panel runat ="server" Visible ="false" ID ="Panel3" >
                        <ul class="mtree bubba clearfix">
                            <li>
                                <h1>计算机科学与技术</h1>
                                <ul class="clearfix">
                                    <li>
                                        <p>
                                            <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                                        </p>
                                    </li>
                                </ul>
                            </li>                    
                        </ul>                        
					</asp:Panel>
                    <asp:Panel runat ="server" Visible ="false" ID ="Panel4" >
                        <ul class="mtree bubba clearfix">
                            <li>
                                <h1>海洋技术</h1>
                                <ul class="clearfix">
                                    <li>
                                        <p>
                                            <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                                        </p>
                                    </li>
                                </ul>
                            </li>
                        </ul>                        
					</asp:Panel>
				</div>
			</div>
		</div>
	</div>
</asp:Content>

