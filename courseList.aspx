<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="courseList.aspx.cs" Inherits="Display_courseList" %>

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
				<h1>课程介绍</h1>
				<h2>course introduction</h2>
				<ul class="clearfix">
					<li><a href="courseList.aspx?type=本科生教育&item=物理系">物理系</a></li>
					<li><a href="courseList.aspx?type=本科生教育&item=电子工程系">电子工程系</a></li>
					<li><a href="courseList.aspx?type=本科生教育&item=计算机科学与技术系">计算机科学与技术系</a></li>
					<li><a href="courseList.aspx?type=本科生教育&item=海洋技术系">海洋技术系</a></li>
				</ul>
			</div>
            <form runat ="server">
			<div class="common-lists"><!--普通列表示例-->
				<div class="lists-title">
					<h1><asp:Label ID ="lbdepartment" runat ="server"></asp:Label></h1>
					<h2><asp:Label ID="lbenglishDepart" runat ="server"></asp:Label></h2>
                    
					<ul class="clearfix">
				        <li><asp:LinkButton ID ="lbtnMajor1" runat ="server" onclick="lbtnMajor1_Click" Visible ="true" ></asp:LinkButton></li>
                        <li><asp:LinkButton ID ="lbtnMajor2" runat ="server" onclick="lbtnMajor2_Click" Visible ="false" ></asp:LinkButton></li>
                        <li><asp:LinkButton ID ="lbtnMajor3" runat ="server" onclick="lbtnMajor3_Click" Visible ="false" ></asp:LinkButton></li>
					</ul>
                
				</div>
				<div class="course-lists">
                       <ul class="mtree bubba clearfix">
						<asp:repeater ID="Repeater1" runat="server" ItemType="Course" Visible ="true">   
                            <ItemTemplate>
							<li>
								<h1><%#Item.CourseName %></h1>
                                <ul class="clearfix">
									<!-- 这里是课程的详细内容 -->
                                <li>
									<h2>开课院系：</h2>
									<p><%#Item.Department %></p>
								</li>
                                <li>
									<h2>课程编号：</h2>
									<p><%#Item.Number %></p>
								</li>	
                                <li>
									<h2>课程英文名称：</h2>
									<p><%#Item.EnglishName %></p>
								</li>	
                                <li>
									<h2>课程总学时: </h2>
									<p><%#Item.CourseHours %></p>
								</li>	
                                <li>
									<h2>课程总学分: </h2>
									<p><%#Item.CourseMark %></p>
								</li>	
                                <li>
									<h2>含实验或实践学时：</h2>
									<p><%#Item.ExperimentHours??0 %></p>
								</li>			
                                <li>
									<h2>含实验或实践学分：</h2>
									<p><%#Item.ExperimentMark??0 %></p>
								</li>		                       
                            <asp:Panel ID="experiment" runat="server" Visible='<%#Item.Type == 3 ? true : false %>'>
                               
                                <li>
									<h2>周学时：</h2>
									<p><%#Item.WeekHours %></p>
								</li>	
                                <li>
									<h2>学期安排：</h2>
									<p><%#Item.TermArrange %></p>
								</li>
                                <li>
									<h2>实验、实习场所：</h2>
									<p><%#Item.ExperimentPlace %></p>
								</li>
                                <li>
									<h2>实验教学目标：</h2>
									<p><%#Item.ExperimentObject %></p>
								</li>
                            </asp:Panel>

                            <asp:Panel ID="type12" runat="server" Visible='<%#Item.Type == 2 ? true : false %>'>
                                
                                <li>
									<h2>实验环节教学目标与基本要求：</h2>
									<p><%#Item.ExperimentPartObject%></p>
								</li>
                            </asp:Panel>
                            <asp:Panel ID="Panel1" runat="server" Visible='<%#Item.Type != 1 ? true : false %>'>
                                <li>
									<h2>实验指导书：</h2>
									<p><%#Item.ExperimentGuideBook %></p>
								</li>
                            </asp:Panel>
                                <li>
									<h2>推荐使用教材：</h2>
									<p><%#Item.Textbook %></p>
								</li>
                                <li>
									<h2>推荐使用教材编者：</h2>
									<p><%#Item.TextbookAuthor %></p>
								</li>
                                <li>
									<h2>推荐使用教材出版社：</h2>
									<p><%#Item.TextbookPublisher %></p>
								</li>
                                <li>
									<h2>推荐使用教材出版时间及版次：</h2>
									<p><%#Item.TextbookVersion %></p>
								</li>
                                <li>
									<h2>课程教学目标与基本要求：</h2>
									<p><%#Item.CourseObject %></p>
								</li>
                                <li>
									<h2>考试形式：</h2>
									<p><%#Item.ExamType %></p>
								</li>
                                <li>
									<h2>参考书：</h2>
									<p><%#Item.Reference %></p>
								</li>
                                <li>
									<h2>了解更多：</h2>
									<p><a href="<%#Item.ContentAndTimeArrange %>"  target="_blank">点击下载</a></p>
								</li>

                                </ul>

							</li>
                            </ItemTemplate>
                            
                         </asp:repeater>
                    

							
                    
                        <asp:repeater runat="server" ID="Repeater2" ItemType="Course" Visible ="false">   
                            <ItemTemplate>

							<li>
								<h1><%#Item.CourseName %></h1>
                                <ul class="clearfix">
									<!-- 这里是课程的详细内容 -->
                                <li>
									<h2>开课院系：</h2>
									<p><%#Item.Department %></p>
								</li>
                                <li>
									<h2>课程编号：</h2>
									<p><%#Item.Number %></p>
								</li>	
                                <li>
									<h2>课程英文名称：</h2>
									<p><%#Item.EnglishName %></p>
								</li>	
                                <li>
									<h2>课程总学时: </h2>
									<p><%#Item.CourseHours %></p>
								</li>	
                                <li>
									<h2>课程总学分: </h2>
									<p><%#Item.CourseMark %></p>
								</li>	
                                <li>
									<h2>含实验或实践学时：</h2>
									<p><%#Item.ExperimentHours??0 %></p>
								</li>			
                                <li>
									<h2>含实验或实践学分：</h2>
									<p><%#Item.ExperimentMark??0 %></p>
								</li>		                       
                            <asp:Panel ID="experiment" runat="server" Visible='<%#Item.Type == 3 ? true : false %>'>
                               
                                <li>
									<h2>周学时：</h2>
									<p><%#Item.WeekHours %></p>
								</li>	
                                <li>
									<h2>学期安排：</h2>
									<p><%#Item.TermArrange %></p>
								</li>
                                <li>
									<h2>实验、实习场所：</h2>
									<p><%#Item.ExperimentPlace %></p>
								</li>
                                <li>
									<h2>实验教学目标：</h2>
									<p><%#Item.ExperimentObject %></p>
								</li>
                            </asp:Panel>

                            <asp:Panel ID="type12" runat="server" Visible='<%#Item.Type == 2 ? true : false %>'>
                                
                                <li>
									<h2>实验环节教学目标与基本要求：</h2>
									<p><%#Item.ExperimentPartObject%></p>
								</li>
                            </asp:Panel>
                            <asp:Panel ID="Panel1" runat="server" Visible='<%#Item.Type != 1 ? true : false %>'>
                                <li>
									<h2>实验指导书：</h2>
									<p><%#Item.ExperimentGuideBook %></p>
								</li>
                            </asp:Panel>
                                <li>
									<h2>推荐使用教材：</h2>
									<p><%#Item.Textbook %></p>
								</li>
                                <li>
									<h2>推荐使用教材编者：</h2>
									<p><%#Item.TextbookAuthor %></p>
								</li>
                                <li>
									<h2>推荐使用教材出版社：</h2>
									<p><%#Item.TextbookPublisher %></p>
								</li>
                                <li>
									<h2>推荐使用教材出版时间及版次：</h2>
									<p><%#Item.TextbookVersion %></p>
								</li>
                                <li>
									<h2>课程教学目标与基本要求：</h2>
									<p><%#Item.CourseObject %></p>
								</li>
                                <li>
									<h2>考试形式：</h2>
									<p><%#Item.ExamType %></p>
								</li>
                                <li>
									<h2>参考书：</h2>
									<p><%#Item.Reference %></p>
								</li>
                                <li>
									<h2>了解更多：</h2>
									<p><a href="<%#Item.ContentAndTimeArrange %>"  target="_blank">点击下载</a></p>
								</li>

                                </ul>

							</li>
                            </ItemTemplate>
                         </asp:repeater>
                        
                    
                        <asp:repeater runat="server" ID="Repeater3" ItemType="Course" Visible ="false">   
                            <ItemTemplate>
							<li>
								<h1><%#Item.CourseName %></h1>
                                <ul class="clearfix">
									<!-- 这里是课程的详细内容 -->
                                <li>
									<h2>开课院系：</h2>
									<p><%#Item.Department %></p>
								</li>
                                <li>
									<h2>课程编号：</h2>
									<p><%#Item.Number %></p>
								</li>	
                                <li>
									<h2>课程英文名称：</h2>
									<p><%#Item.EnglishName %></p>
								</li>	
                                <li>
									<h2>课程总学时: </h2>
									<p><%#Item.CourseHours %></p>
								</li>	
                                <li>
									<h2>课程总学分: </h2>
									<p><%#Item.CourseMark %></p>
								</li>	
                                <li>
									<h2>含实验或实践学时：</h2>
									<p><%#Item.ExperimentHours??0 %></p>
								</li>			
                                <li>
									<h2>含实验或实践学分：</h2>
									<p><%#Item.ExperimentMark??0 %></p>
								</li>		                       
                            <asp:Panel ID="experiment" runat="server" Visible='<%#Item.Type == 3 ? true : false %>'>
                               
                                <li>
									<h2>周学时：</h2>
									<p><%#Item.WeekHours %></p>
								</li>	
                                <li>
									<h2>学期安排：</h2>
									<p><%#Item.TermArrange %></p>
								</li>
                                <li>
									<h2>实验、实习场所：</h2>
									<p><%#Item.ExperimentPlace %></p>
								</li>
                                <li>
									<h2>实验教学目标：</h2>
									<p><%#Item.ExperimentObject %></p>
								</li>
                            </asp:Panel>

                            <asp:Panel ID="type12" runat="server" Visible='<%#Item.Type == 2 ? true : false %>'>
                                
                                <li>
									<h2>实验环节教学目标与基本要求：</h2>
									<p><%#Item.ExperimentPartObject%></p>
								</li>
                            </asp:Panel>
                            <asp:Panel ID="Panel1" runat="server" Visible='<%#Item.Type != 1 ? true : false %>'>
                                <li>
									<h2>实验指导书：</h2>
									<p><%#Item.ExperimentGuideBook %></p>
								</li>
                            </asp:Panel>
                                <li>
									<h2>推荐使用教材：</h2>
									<p><%#Item.Textbook %></p>
								</li>
                                <li>
									<h2>推荐使用教材编者：</h2>
									<p><%#Item.TextbookAuthor %></p>
								</li>
                                <li>
									<h2>推荐使用教材出版社：</h2>
									<p><%#Item.TextbookPublisher %></p>
								</li>
                                <li>
									<h2>推荐使用教材出版时间及版次：</h2>
									<p><%#Item.TextbookVersion %></p>
								</li>
                                <li>
									<h2>课程教学目标与基本要求：</h2>
									<p><%#Item.CourseObject %></p>
								</li>
                                <li>
									<h2>考试形式：</h2>
									<p><%#Item.ExamType %></p>
								</li>
                                <li>
									<h2>参考书：</h2>
									<p><%#Item.Reference %></p>
								</li>
                                <li>
									<h2>了解更多：</h2>
									<p><a href="<%#Item.ContentAndTimeArrange %>"  target="_blank">点击下载</a></p>
								</li>
                                    </ul>
                                </li>
                            </ItemTemplate>
                         </asp:repeater>

                       </ul>
				</div>
                
			</div>
	    </form>
	</div>
        </div>
</asp:Content>

