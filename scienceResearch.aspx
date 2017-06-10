<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="scienceResearch.aspx.cs" Inherits="Display_scienceResearch" %>

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
				<li><a href="scienceResearch.aspx?type=科研通知">科研通知</a></li>
				<li><a href="scienceResearch.aspx?type=科研新闻">科研新闻</a></li>
				<li><a href="scienceResearch.aspx?type=学术动态">学术动态</a></li>
				<li><a href="scienceResearch.aspx?type=科研成果">科研成果</a></li>
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
						<li>共<span><asp:Literal ID="TotalPage" runat="server"></asp:Literal></span>页 </li>
						<li>第<span><asp:Literal ID="currentPage" runat="server"></asp:Literal></span>页</li>
						<li><asp:HyperLink ID="Last" runat="server">尾页</asp:HyperLink></li>
						<li><asp:HyperLink ID="Next" runat="server">下一页</asp:HyperLink></li>                        
					</ul>                 
                    <asp:TextBox ID="turnTopage" runat ="server" value="1" MaxLength ="3"></asp:TextBox>
				</div>
               </form>
			</div>
		</div>
	</div>
</asp:Content>

