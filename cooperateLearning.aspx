<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="cooperateLearning.aspx.cs" Inherits="Display_cooperateLearning" %>

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
			<div class="common-lists"><!--普通列表示例-->
				<div class="lists-title">
					<h1><asp:Label runat="server" ID="lbType"></asp:Label></h1>
					<h2><asp:Label runat="server" ID="lbEnglishType"></asp:Label></h2>
				</div>
				<ul>
                     <asp:Repeater ID="rptList" runat="server" ItemType="Introduce">
                    <ItemTemplate>
                        <li><!--每条-->
						<a href="<%#"Cooperation.aspx?id="+Item.id %>" target="_blank">
							<%--<div class="news-time"><!--时间-->
								<p><span class="day"><%#Item.UpdateTime.Month>9?Item.UpdateTime.Month.ToString():"0"+Item.UpdateTime.Month %>.<%#Item.UpdateTime.Day>9?Item.UpdateTime.Day.ToString():"0"+Item.UpdateTime.Day %></span></p>
								<p><%#Item.UpdateTime.Year %></p>
							</div>--%>
							<div class="news-title"><!--标题内容-->
								<h1><%#Item.name.Substring(5) %></h1>
								<p><%#MyHtmlHelper.RemoveTags(Item.text).Length>=50?MyHtmlHelper.RemoveTags(Item.text).Substring(0,50):MyHtmlHelper.RemoveTags(Item.text) %></p>
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

