<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="committeeJob.aspx.cs" Inherits="Display_committeeJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link type="text/css" href="css/style.css" rel="stylesheet">
    <script type="text/javascript">
        $(document).ready(function(){

            $("form1").submit(function (e) {
                e.defaultPrevented();
                alert('45646');
                var url = "";
                if (urlPage != -1) {
                    url= decodeURI(window.location.href).substring(0, urlPage - 1) + "&page=" + (num - 0 - 1).toString();
                }
                else if (urlPage == -1) {
                    url = decodeURI(window.location.href) + "&page=" + (num - 0 - 1).toString();
                }

                alert(url);
                return false;
            });
        })

          
           
         
  
    </script>
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
			<div class="common-lists"><!--普通列表示例-->
				<div class="lists-title">
					<h1><asp:Label runat="server" ID="lbType"></asp:Label></h1>
					<h2><asp:Label runat="server" ID="lbEnglishType"></asp:Label></h2>
				</div>
				<ul>
                     <asp:Repeater ID="rptList" runat="server" ItemType="Article">
                    <ItemTemplate>
                        <li><!--每条-->
						<a href="<%#Item.Link??"Content.aspx?id="+Item.ArticleID %>" target="_blank">
							<div class="news-time"><!--时间-->
								<p><span class="day"><%#Item.UpdateTime.Month>9?Item.UpdateTime.Month.ToString():"0"+Item.UpdateTime.Month %>.<%#Item.UpdateTime.Day>9?Item.UpdateTime.Day.ToString():"0"+Item.UpdateTime.Day %></span></p>
								<p><%#Item.UpdateTime.Year %></p>
							</div>
							<div class="news-title"><!--标题内容-->
								<h1><%#Item.Title.Length >= 35?Item.Title.Substring(0,35)+"…":Item.Title %></h1>
								<p><%#MyHtmlHelper.RemoveTags(Item.Content).Length>=50?MyHtmlHelper.RemoveTags(Item.Content).Substring(0,50):MyHtmlHelper.RemoveTags(Item.Content) %></p>
							</div>
						</a>
					</li>
                    </ItemTemplate>
                </asp:Repeater>					
				</ul>
                <form id ="form1" runat ="server" >
				<div class="change-page">
					<ul>
						<li><asp:HyperLink ID="Prev" runat="server" >上一页</asp:HyperLink></li>
						<li><asp:HyperLink ID="First" runat="server"  >首页</asp:HyperLink></li>
						<li>共<span><asp:Literal ID="TotalPage" runat="server"></asp:Literal></span>页</li>
						<li>第<asp:Label ID="currentPage" runat="server" ></asp:Label>页</li>
						<li><asp:HyperLink ID="Last" runat="server">尾页</asp:HyperLink></li>
						<li><asp:HyperLink ID="Next" runat="server">下一页</asp:HyperLink></li>                        
					</ul>                 
                    <asp:TextBox ID="turnTopage" runat ="server" MaxLength ="3"></asp:TextBox>
				</div>
               </form>
			</div>
		</div>

	</div>
</asp:Content>


