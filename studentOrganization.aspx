<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="studentOrganization.aspx.cs" Inherits="Display_studentOrganization" %>

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
					<a href="#">党建工作</a>
					<ul>
						<li><a href="committeeJob.aspx?type=党建工作&item=规章制度">规章制度</a></li>
						<li><a href="committeeJob.aspx?type=党建工作&item=党员发展">党员发展</a></li>
						<li><a href="committeeJob.aspx?type=党建工作&item=党支部建设">党支部建设</a></li>
						<li><a href="committeeJob.aspx?type=党建工作&item=党建管理">党建管理</a></li>
					</ul>
				</li>
				<li>
					<a href="#">团建工作</a>
					<ul>
						<li><a href="committeeJob.aspx?type=团建工作&item=规章制度">规章制度</a></li>
						<li><a href="committeeJob.aspx?type=团建工作&item=团支部">团支部建设</a></li>
						<li><a href="committeeJob.aspx?type=团建工作&item=特色活动">特色活动</a></li>
					</ul>
				</li>
				<li>
					<a href="#">奖助工作</a>
					<ul>
						<li><a href="committeeJob.aspx?type=奖助工作&item=通知公告">通知公告</a></li>
						<li><a href="committeeJob.aspx?type=奖助工作&item=获奖情况">获奖情况</a></li>
					</ul>
				</li>
				<li>
					<a href="#">就业工作</a>
					<ul>
						<li><a href="committeeJob.aspx?type=就业工作&item=通知公告">通知公告</a></li>
						<li><a href="committeeJob.aspx?type=就业工作&item=就业政策">就业政策</a></li>
						<li><a href="committeeJob.aspx?type=就业工作&item=招聘信息">招聘信息</a></li>
						<li><a href="committeeJob.aspx?type=就业工作&item=实习招聘">实习招聘</a></li>
					</ul>
				</li>
				<li>
					<a href="#">科技创新</a>
					<ul>
						<li><a href="committeeJob.aspx?type=科技创新&item=通知公告">通知公告</a></li>
						<li><a href="committeeJob.aspx?type=科技创新&item=获奖情况">获奖情况</a></li>
					</ul>
				</li>
				<li><a href="committeeJob.aspx?type=学生风采">学生风采</a></li>
				<li><a href="studentOrganization.aspx?type=学生组织">学生组织</a></li>
			</ul>
		</div>

		<div class="right-lists"><!--右边列表内容-->
			<div class="all-title">
				<h1>学生组织</h1>
				<h2>student organization</h2>
			</div>
			<div class="organization-lists">
				<ul class="clearfix">
					<li class="material-shadow">
						<a href="studentOrglist.aspx?type=学生组织&item=学生会" target="_blank">
							<h1>学生会</h1>
							<img src="images/students-union.png">
						</a>
					</li>
					<li class="material-shadow">
						<a href="studentOrglist.aspx?type=学生组织&item=研究生会" target="_blank">
							<h1>研究生会</h1>
							<img src="images/alogo.png">
						</a>
					</li>
					<li class="material-shadow">
						<a href="studentOrglist.aspx?type=学生组织&item=研究会" target="_blank">
							<h1>研究会</h1>
							<img src="images/seminar.png">
						</a>
					</li>
					<li class="material-shadow">
						<a href="studentOrglist.aspx?type=学生组织&item=东乡行西部志愿者协会" target="_blank">
							<h1>东乡行西部志愿者协会</h1>
							<img src="images/volunteers.png">
						</a>
					</li>
					<li class="material-shadow">
						<a href="http://it.ouc.edu.cn/itstudio/PC/index.html" target="_blank">
							<h1>爱特工作室</h1>
							<img src="images/itStudio.png">
						</a>
					</li>
					<li class="material-shadow">
						<a href="studentOrglist.aspx?type=学生组织&item=自强社" target="_blank">
							<h1>自强社</h1>
							<img src="images/self-improvement.jpg">
						</a>
					</li>
					<li class="material-shadow">
						<a href="http://blue-whale.me/" target="_blank">
							<h1>BLUE-WHALE</h1>
							<img src="images/blue-whale.png">
						</a>
					</li>
					<li class="material-shadow">
						<a href="studentOrglist.aspx?type=学生组织&item=信印象" target="_blank">
							<h1>信印象</h1>
							<img src="images/xinyx.png">
						</a>
					</li>
					<li class="material-shadow">
						<a href="studentOrglist.aspx?type=学生组织&item=信息之光志愿者服务协会" target="_blank">
							<h1>信息之光志愿者服务协会</h1>
							<img src="images/alogo.png">
						</a>
					</li>
					<li class="material-shadow">
						<a href="studentOrglist.aspx?type=学生组织&item=心晴协会" target="_blank">
							<h1>心晴协会</h1>
							<img src="images/moonlight.png">
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

</asp:Content>

