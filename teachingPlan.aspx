
<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="teachingPlan.aspx.cs" Inherits="Display_teachingPlan" %>

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
				<h1>培养计划</h1>
				<h2>teach plan</h2>
				<ul class="clearfix">
					<li><a href="teachingPlan.aspx?type=本科生教育&item=物理系">物理系</a></li>
					<li><a href="teachingPlan.aspx?type=本科生教育&item=电子工程系">电子工程系</a></li>
					<li><a href="teachingPlan.aspx?type=本科生教育&item=计算机科学与技术系">计算机科学与技术系</a></li>
					<li><a href="teachingPlan.aspx?type=本科生教育&item=海洋技术系">海洋技术系</a></li>
				</ul>
			</div>
			<div class="common-lists"><!--普通列表示例-->
				<div class="lists-title">
					<h1><asp:Label ID ="lbdepartment" runat ="server"></asp:Label></h1>
					<h2><asp:Label ID="lbenglishDepart" runat ="server"></asp:Label></h2>
				</div>
				<div class="course-lists">
					<%--<h4>点击专业名称直接下载培养方案</h4>--%>
					<asp:Panel runat ="server" Visible ="false" ID ="Panel1" >
                        <ul>
                            <li><a href='../Uploads/outlines/<%:GetFileName("wuli") %>' target="_blank">物理学</a></li>
                            <li><a href='../Uploads/outlines/<%:GetFileName("guangke") %>' target="_blank">光电信息科学与技术</a></li>
                        </ul>                        
					</asp:Panel>
                    <asp:Panel runat ="server" Visible ="false" ID ="Panel2" >
                        <ul>
                            <li><a href='../Uploads/outlines/<%:GetFileName("dianke") %>' target="_blank">电子信息科学与技术</a></li>
                            <li><a href='../Uploads/outlines/<%:GetFileName("tongxin") %>' target="_blank">通信工程</a></li>
                            <li><a href='../Uploads/outlines/<%:GetFileName("diangong") %>' target="_blank">电子信息工程</a></li>
                            <li><a href='../Uploads/outlines/<%:GetFileName("zhongfa") %>' target="_blank">电子信息工程-中法卓越班</a></li>
                        </ul>                        
					</asp:Panel>
                    <asp:Panel runat ="server" Visible ="false" ID ="Panel3" >
                        <ul>
                            <li><a href='../Uploads/outlines/<%:GetFileName("jisuanji") %>' target="_blank">计算机科学与技术</a></li>                    
                        </ul>                        
					</asp:Panel>
                    <asp:Panel runat ="server" Visible ="false" ID ="Panel4" >
                        <ul>
                            <li><a href='../Uploads/outlines/<%:GetFileName("haiji") %>' target="_blank">海洋技术</a></li>
                        </ul>                        
					</asp:Panel>
				</div>
			</div>
		</div>
	</div>
</asp:Content>

