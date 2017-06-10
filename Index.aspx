<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index_Index" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="renderer" content="webkit" /> 
	<title>中国海洋大学信息科学与工程学院</title>
	<meta charset="UTF-8"/>
    <link rel="shortcut icon" href="images/blogo.png"/>
	
    <link  rel="stylesheet" type="text/css" href="css/footer.css"/>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
 

    <link rel="stylesheet" type="text/css" href="css/homePageCss.css">
    <script type="text/javascript" src="js/respond.min.js"></script>
    <!--[if lte IE 8]>
<link rel="stylesheet" type="text/css" href="css/homePageCss.css">
<![endif]-->

  
</head>

<body>
    <form runat="server">
<div class="cont">
	<div class="header">
	<!-- 轮播图 -->
	<!--[if !IE 8]><!-->
        <div class="expert_list">
			<div id="list">
				<img src="images/it-banner3.jpg" alt=""/>
				<img src="images/it-banner1.jpg" alt=""/>
				<img src="images/it-banner2.jpg" alt=""/>
				<img src="images/banners.png" alt=""/>
				<img src="images/it-banner7.jpg" alt=""/>
				<img src="images/it-banner3.jpg" alt=""/>
				<img src="images/it-banner1.jpg" alt=""/>
			</div>
			<div id="prev" class="arrow">
    	        
    		</div>
    		<div id="next" class="arrow">
    		    
   			</div>
			
		</div>
         <!--<![endif]-->
       <!--[if IE 8]>
             <div class="expert_list">
			<div id="list" class="listIE">
				<img src="images/it-banner3.jpg" alt=""/>
				<img src="images/it-banner1.jpg" alt=""/>
				<img src="images/it-banner2.jpg" alt=""/>
				<img src="images/banners.png" alt=""/>
				<img src="images/it-banner7.jpg" alt=""/>
				<img src="images/it-banner3.jpg" alt=""/>
				<img src="images/it-banner1.jpg" alt=""/>
			</div>
			<div id="prev" class="arrow">
    	
    		</div>
    		<div id="next" class="arrow">
    		
   			</div>
			
		</div>
        <![endif]-->
     
  		
		<div class="head">	
    		<div class='content'>
    		<div class='tabbed_content'>
                <div id="white"></div>
    			<div class='tabs'>		
    				<span class="tit"><a href="Index.aspx">学院首页</a></span>
    				<span class='tab_item'>学院概况</span>
    				<span class='tab_item'>人才培养</span>
    				<span class='tab_item'>党团工作</span>
    				<span class='tab_item'>科学研究</span>
    				<span class='tab_item'>办事指南</span>
    			</div>
                <div id="white1"></div>
    			<div class="slideC"><div class='slide_content'>
    				<div class='tabslider'>
    				
						<ul class="outlook">
								<div class="outlookCoin">
									<h3><a href="introduceList.aspx?type=学院概况&item=学院介绍">学院概况</a></h3>
									<ul>
										<li><a href="introduceList.aspx?type=学院概况&item=学院介绍">学院介绍</a></li>
						                <li><a href="introduceList.aspx?type=学院概况&item=物理系">物理系</a></li>
						                <li><a href="introduceList.aspx?type=学院概况&item=电子工程系">电子工程系</a></li>
						                <li><a href="introduceList.aspx?type=学院概况&item=计算机科学与技术系">计算机科学与技术系</a></li>
						                <li><a href="introduceList.aspx?type=学院概况&item=海洋技术系">海洋技术系</a></li>
						                <li><a href="introduceList.aspx?type=学院概况&item=信息工程中心">信息工程中心</a></li>
									</ul>
									<img src="images/blueline.png">
								</div>
								<div class="outlookCoin">
									<h3><a href="structureList.aspx?type=组织机构&item=党委团委">组织机构</h3>
									<ul>
										<li><a href="structureList.aspx?type=组织机构&item=党委团委">党委团委</a></li>
						                <li><a href="structureList.aspx?type=组织机构&item=院行政">院行政</a></li>
						                <li><a href="structureList.aspx?type=组织机构&item=院工会妇委会">院工会 妇委会</a></li>
									</ul>
									<img src="images/blueline.png">
								</div>
								<div class="outlookCoin">
									<h3><a href="teacherTeam.aspx?type=师资队伍&item=physics">师资团队</a></h3>
									<ul>
										<li><a href="teacherTeam.aspx?type=师资队伍&item=physics">物理系</a></li>
						                <li><a href="teacherTeam.aspx?type=师资队伍&item=electron">电子工程系</a></li>
						                <li><a href="teacherTeam.aspx?type=师资队伍&item=computer">计算机系</a></li>
						                <li><a href="teacherTeam.aspx?type=师资队伍&item=ocean">海洋技术系</a></li>
						                <li><a href="teacherTeam.aspx?type=师资队伍&item=it">信息工程中心</a></li>
									</ul>
								</div>
						</ul>
						<!-- 人才培养 -->
						<ul class="outlook">
								<div class="outlookCoin">
									<h3><a href="majorIntroduction.aspx?type=本科生教育">本科生教育</a></h3>
									<ul>
										<li><a href="majorIntroduction.aspx?type=本科生教育">专业介绍</a></li>
										<li><a href="teachingPlan.aspx?type=本科生教育">培养计划</a></li>
										<li><a href="courseList.aspx?type=本科生教育">课程介绍</a></li>
										<li><a href="stuEducate.aspx?type=本科生教育&item=规章制度">规章制度</a></li>
									</ul>
									<img src="images/blueline.png">
								</div>
								<div class="outlookCoin">
									<h3><a href="http://it.ouc.edu.cn/graduEnroll/index.php?title=%E9%A6%96%E9%A1%B5">研究生教育</a></h3>
									<ul>
										<li><a href="http://it.ouc.edu.cn/graduEnroll/index.php?title=%E9%A6%96%E9%A1%B5">招生工作</a></li>
										<li><a href="stuEducate.aspx?type=研究生教育&item=奖励实施细则">奖励实施细则</a></li>
									</ul>
									<img src="images/blueline.png">
								</div>
								<div class="outlookCoin">
									<h3><a href="cooperateLearning.aspx?type=合作办学" >合作办学</a></h3>
								</div>
						</ul>
						<!-- 党团工作 -->
    					<ul class="outlook">
								<div class="outlookCoin outlookWork">
									<h3><a href="committeeJob.aspx?type=党建工作&item=规章制度">党建工作</a></h3>
									<ul>
										<li><a href="committeeJob.aspx?type=党建工作&item=规章制度"">规章制度</a></li>
						                <li><a href="committeeJob.aspx?type=党建工作&item=党员发展">党员发展</a></li>
						                <li><a href="committeeJob.aspx?type=党建工作&item=党支部建设">党支部建设</a></li>
						                <li><a href="committeeJob.aspx?type=党建工作&item=党建管理">党建管理</a></li>
									</ul>
                                
                                    <h3><a href="committeeJob.aspx?type=学生风采">学生风采</a></h3>
									<img id="studentColor" src="images/blueline.png">
								</div>
								<div class="outlookCoin outlookWork">
									<h3><a href="committeeJob.aspx?type=团建工作&item=规章制度" >团建工作</a></h3>
									<ul>
										<li><a href="committeeJob.aspx?type=团建工作&item=规章制度">规章制度</a></li>
						                <li><a href="committeeJob.aspx?type=团建工作&item=团支部">团支部建设</a></li>
						                <li><a href="committeeJob.aspx?type=团建工作&item=特色活动">特色活动</a></li>
									</ul>
                                    <h3><a href="studentOrganization.aspx?type=学生组织">学生组织</a></h3>
									<img id="studentOrg" src="images/blueline.png">
								</div>
								<div class="outlookCoin outlookWork">
									<h3><a href="committeeJob.aspx?type=奖助工作&item=通知公告">奖助工作</a></h3>
									<ul>
										<li><a href="committeeJob.aspx?type=奖助工作&item=通知公告">通知公告</a></li>
						                <li><a href="committeeJob.aspx?type=奖助工作&item=获奖情况">获奖情况</a></li>
									</ul>
									<img src="images/blueline.png">
								</div>
								<div class="outlookCoin outlookWork">
									<h3><a href="committeeJob.aspx?type=就业工作&item=通知公告">就业工作</a></h3>
									<ul>
										<li><a href="committeeJob.aspx?type=就业工作&item=通知公告">通知公告</a></li>
						                <li><a href="committeeJob.aspx?type=就业工作&item=就业政策">就业政策</a></li>
					                	<li><a href="committeeJob.aspx?type=就业工作&item=招聘信息">招聘信息</a></li>
						                <li><a href="committeeJob.aspx?type=就业工作&item=实习招聘">实习招聘</a></li>
					
									</ul><img src="images/blueline.png">
								</div>
								<div class="outlookCoin outlookWork">
									<h3><a href="committeeJob.aspx?type=科技创新&item=通知公告" >科技创新</a></h3>
									<ul>
										<li><a href="committeeJob.aspx?type=科技创新&item=通知公告">通知公告</a></li>
						                <li><a href="committeeJob.aspx?type=科技创新&item=获奖情况">获奖情况</a></li>
					
									</ul>
								</div>
						</ul>
						<!-- 科学研究 -->
						<ul class="outlook">
						
								<div class="outlookCoin instruct">
									<ul>
										<li><a href="scienceResearch.aspx?type=科研通知">科研通知</a></li>
									</ul>
									<img src="images/blueline.png">
								</div>
								<div class="outlookCoin instruct">
									<ul>
										<li><a href="scienceResearch.aspx?type=科研新闻">科研新闻</a></li>
									</ul>
									<img src="images/blueline.png">
								</div>
								<div class="outlookCoin instruct">
									<ul>
										<li><a href="scienceResearch.aspx?type=学术动态">学术动态</a></li>
									</ul>
									<img src="images/blueline.png">
								</div>
								<div class="outlookCoin instruct">
									<ul>
										<li><a href="scienceResearch.aspx?type=科研成果">科研成果</a></li>
									</ul>
								</div>
						</ul>
						<!-- 办事指南 -->
    					<ul class="outlook">
    						<div class="outlookCoin instruct">
									<ul>
										<li><a href="officeDirection.aspx?type=学业学籍" >学业学籍</a></li>
										<li><a href="officeDirection.aspx?type=宿舍相关">宿舍相关</a></li>
										<li><a href="officeDirection.aspx?type=创新创业">创新创业</a></li>
									</ul>
									<img src="images/blueline.png">
								</div>
								<div class="outlookCoin instruct">
									<ul>
										<li><a href="officeDirection.aspx?type=场地申请">场地申请</a></li>
										<li><a href="officeDirection.aspx?type=处分相关">处分相关</a></li>
										<li><a href="officeDirection.aspx?type=其他">其他</a></li>
									</ul>
									<img src="images/blueline.png">
								</div>
								<div class="outlookCoin instruct">
									<ul>
										<li><a href="officeDirection.aspx?type=请假相关">请假相关</a></li>
										<li><a href="officeDirection.aspx?type=资助相关">资助相关</a></li>
										<li><a href="officeDirection.aspx?type=出国相关">出国相关</a></li>
									</ul>
									<img src="images/blueline.png">
								</div>
								<div class="outlookCoin instruct">
									<ul>
										<li><a href="officeDirection.aspx?type=就业相关" >就业相关</a></li>
                                    
									</ul>
								</div>
						</ul>
    					
    				</div>
    				<br style='clear: both' />
    			</div></div>
 
    		</div>
    		</div>
    		
   		</div>


		<!-- 标题 -->
		<div class="search">
			<div class="searchCont">
				<p id="searchInfor">信 息 科 学 与 工 程 学 院</p>
				<p>College of Infornmation Science and Engineering</p>
			</div>
		</div>
		<!-- 学术报告 -->
        <asp:Panel ID="pnAcademic" runat="server">
		<div class="headerInfor">
			<div class="headerInforCont">
			<div class="inforTittle">
                 <a id="lecture" href="">
				    <h3>学术报告</h3>
				    <p>ACADEMIC REPORT</p>
                </a>
                <a id="moreLecture" href="ClickMore.aspx?more=5&&page=0"">更多</a>
			</div>
			<div class="inforMore">
				
			</div>
			<div class="inforTA">
				<p class="time">时间：<asp:Literal ID="ltTime" runat="server"></asp:Literal></p>
				<p>地点：<asp:Literal ID="ltPlace" runat="server"></asp:Literal></p>
			</div>
			<div class="inforDetail">
                <a href=""><asp:LinkButton ID="lbtReporter" runat="server">
				    <h3><asp:Literal ID="ltTitle" runat="server"></asp:Literal></h3>
				    <p><asp:Literal ID="ltContent" runat="server"></asp:Literal></p></asp:LinkButton>
                </a>
			</div>
			</div>
		</div>
            </asp:Panel>
	</div>

	<div class="main">
		<!-- 新闻动态 -->
		<div class="news">
			<div class="Tittle">
			<div class="co clear">
				<img src="images/lineer.png">
				<div><h1>新 闻 动 态</h1><h2>NEWS</h2></div>
				<img src="images/lineer.png">
				
			</div>
			</div>
			<div class="newsCont">
				<div class="college">
					<div class="Sign">
						<h3>学 院</h3><p>Colloge</p><a href="ClickMore.aspx?more=1">更多</a>
					</div>
					<div class="collegeList">
						<ul>
                            <asp:Repeater ID="rptCollege" runat="server"  ItemType="IndexCard">
                                <ItemTemplate>
                                    <li><a href="<%# Item.HasLink ? Item.link : "Content.aspx?id=" + Item.id %>">
                                       <div class="college-img"> <asp:Image ID="Image1" runat="server" ImageUrl="<%#Item.img%>" Visible="<%#Item.HasImg %>" /></div>
                                        <%--<img src="images/pic.png">--%>
                                       <div class="college-txttitle"> <h4><%#Item.title.Length>23?Item.title.Substring(0,23)+"...":Item.title %></h4></div>
                                        <span><%#Item.year + "." +Item.month_count + "." +Item.day %></span>
                                    </a></li>
                                </ItemTemplate>
                            </asp:Repeater>
							
							
						</ul>
						
					</div>
				</div>
				<div class="student">
					<div class="Sign">
						<h3>学 生</h3><p>Student</p><a href="ClickMore.aspx?more=2">更多</a>
					</div>
					<div class="studentList">
						<ul>
                            <asp:Repeater ID="rptStudent" runat="server" ItemType="IndexCard">
                                <ItemTemplate>
                                    <li><a href="<%# Item.HasLink ? Item.link : "Content.aspx?id=" + Item.id %>">
                                        <div class="student-img"><asp:Image ID="Image1" runat="server" ImageUrl="<%#Item.img%>" Visible="<%#Item.HasImg %>" /></div>
                                        <div class="student-txttitle"><h4><%#Item.title.Length>23?Item.title.Substring(0,23)+"...":Item.title %></h4></div>
                                        <span><%#Item.year + "." +Item.month_count + "." +Item.day %></span>
                                    </a></li>
                                </ItemTemplate>
                            </asp:Repeater>
							
						</ul>
						
					</div>
				</div>
			</div>
		</div>
		<!-- 通知公告 -->
		<div class="notice">
			<div class="Tittle">
			<div class="co">
				<img src="images/lineer.png">
				<div><h1>通 知 公 告</h1><h2>NOTICE</h2></div>
				<img src="images/lineer.png">
			</div>
			</div>
			<div class="noticeCont">
                <div class="noticeUl">
				<ul id="employList">
                    <asp:Repeater ID="rptNotice1" runat="server" ItemType="IndexCard">
                        <ItemTemplate>
                            <li><a href="<%# Item.HasLink ? Item.link : "Content.aspx?id=" + Item.id %>">
                                <p><%# Item.day%><span><%# Item.month %></span></p>
                                <h3><%#Item.title.Length>21?Item.title.Substring(0,21)+"...":Item.title %></h3>
                            </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
			    </ul>
				<ul>
                    <asp:Repeater ID="rptNotice2" runat="server"  ItemType="IndexCard">
                        <ItemTemplate>
                            <li><a href="<%# Item.HasLink ? Item.link : "Content.aspx?id=" + Item.id %>">
                                <p><%# Item.day%><span><%# Item.month %></span></p>
                                <h3><%# Item.title%></h3>
                            </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
				</ul>
                </div>
				<p class="moreInfor"><a href="ClickMore.aspx?more=3">更多</a></p>
			</div>
		</div>
		<!-- 就业信息 -->
		<div class="employ">
			<div class="Tittle">
			<div class="co">
				<img src="images/lineer.png">
				<div><h1>就 业 信 息</h1><h2>EMPLOY</h2></div>
				<img src="images/lineer.png">
			</div>
			</div>
			<div class="employCont">
                <div class="employUl">
				<ul id="employList">
                    <asp:Repeater ID="rptJob1" runat="server"  ItemType="IndexCard">
                        <ItemTemplate>
					        <li><a href="<%# Item.HasLink ? Item.link : "Content.aspx?id=" + Item.id %>">
						        <p><%# Item.day%><span><%# Item.month %></span></p>
                                <h3><%# Item.title%></h3>
					        </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
				</ul>
				<ul>
                    <asp:Repeater ID="rptJob2" runat="server"  ItemType="IndexCard">
                        <ItemTemplate>
					        <li><a href="<%# Item.HasLink ? Item.link : "Content.aspx?id=" + Item.id %>">
						        <p><%# Item.day%><span><%# Item.month %></span></p>
                                <h3><%# Item.title%></h3>
					        </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
				</ul>
                </div>
				<p class="moreInfor"><a href="ClickMore.aspx?more=4">更多</a></p>
			</div>
		</div>
	</div>
	<!-- 底部 -->
	
     <div class="footer"><!--底部-->
		<div class="footer-container clearfix"><!--底部主要内容-->
			<div class="footer-left"><!--左边学院信息-->
				<div class="footer-icon"><!--二维码-->
                    <img src="images/2Dbarcodes.png"/>
				</div>
				<div class="footer-information"><!--信息学院-->
					<h1>扬帆信息 驰骋海洋</h1>
					<h2>中国海洋大学信息科学与工程学院</h2>
					<h2>College of Information Science and Engineering</h2>
					<div class="footer-xinyx">
                        <img src="images/weixin.png" />
						<h2>中国海洋大学信印象</h2>
                        
					</div>
				</div>
			</div>
			<div class="footer-center"></div>
			<div class="footer-right"><!--右边菜单选项-->
				<ul>
					<h1>网站地图</h1>
					<li><a href="introduceList.aspx?type=学院概况&item=学院介绍">学院概况</a></li>
					<li><a href="majorIntroduction.aspx?type=本科生教育">人才培养</a></li>
					<li><a href="committeeJob.aspx?type=党建工作&item=规章制度">党团工作</a></li>
					<li><a href="scienceResearch.aspx?type=科研通知">科学研究</a></li>
                    <li><a href="officeDirection.aspx?type=学业学籍">办事指南</a></li>
				</ul>
				<ul>
					<h1>友情链接</h1>
					<li><a href="http://www.ouc.edu.cn" target="_blank">中国海洋大学</a></li>
					<li><a href="http://222.195.158.131/xb/" target="_blank">党委校长办公室</a></li>
					<li><a href="http://www2.ouc.edu.cn/oceanyouth/" target="_blank">校委处</a></li>
					<li><a href="http://web.ouc.edu.cn/jwc/" target="_blank">教务处</a></li>
				</ul>
				<ul>
					<h1>联系我们</h1>
					<li>电话：0532-66781208</li>
					<li>地址：青岛市松岭路238号</li>
					<li>邮编：266100</li>
				</ul>
			</div>
		</div>
		<div class="footer-footer"><!--爱特工作室-->
			<div class="footer-copyright">
				<p>Copyright© 2017 中国海洋大学信息科学与工程学院  All Right Reserved.</p>
			</div>
			<div class="footer-backstage">
				<ul>
                    <li><a href="../Manage/login.aspx" target="_blank">后台登录</a></li>
					<li><a href="http://it.ouc.edu.cn/itstudio/" target="_blank">爱特工作室出品</a></li>
					<%--<li><a href="http://github.com/maplor/oucIT_Web/commits/gh-pages" target="_blank">更新日志</a></li>--%>
					<li><a href="http://git.oschina.net/OUCITWEB/web/commits/dev" target="_blank">更新日志</a></li>

					<li><a href="http://new.cnzz.com/v1/login.php?siteid=1253702079" target="_blank">站长统计</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
    <!--[if lt IE9]>
        <script src ="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
        <script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/homePageJs.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
    </form>
</body>
</html>
