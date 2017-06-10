<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="ClickMore.aspx.cs" Inherits="Display_ClickMore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/clickMoreCss.css"/>
	<script type="text/javascript" src="js/clickMoreJs.js"></script>
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
    
    <!-- ============主要内容================= -->
		<div class="clickMore-main">
		<!-- ============标题============= -->
			<div class="clickMore-tittle">
				<div class="clickMore-mainTittle">
					<img src="images/long.png">
					<div class="clickMore-news">
						<h1><asp:Literal ID="ltTitleC" runat="server"></asp:Literal></h1>
						<h2><asp:Literal ID="ltTitleE" runat="server"></asp:Literal></h2>
					</div>
					<img src="images/long.png">
				</div>
                <asp:Panel runat="server" ID="pnSubTitle">
				<div class="clickMore-subtittle">
					<img src="images/lineer.png">
					<div class="clickMore-college">
						<h2><asp:Literal ID="ltSubC" runat="server"></asp:Literal></h2>
						<h3><asp:Literal ID="ltSubE" runat="server"></asp:Literal></h3>
					</div>
					<img src="images/lineer.png"/>
				</div>		
                </asp:Panel>	
			</div>
			<!-- ======信息列表============ -->
			<div class="clickMore-information">
				<div class="clickMore-inforLine">
					<ul>
                    <asp:Repeater ID="rptData" runat="server" ItemType="IndexCard">
                        <ItemTemplate>
                            <li><a href="<%# Item.HasLink ? Item.link : "Content.aspx?id=" + Item.id %>" target="_blank">
                                <p id="clickMore-data">
                                    <%# Item.month_count%>.<%# Item.day.Length==1?"0"+Item.day:Item.day %>
							<span><%# Item.year %></span>
                                </p>
                                <div class="clickMore-inforText">
                                    <h3><%# Item.title.Length>40?Item.title.Substring(0,40)+"...":Item.title %></h3>
                                   <p><%# Item.text%></p>
                                </div>
                            </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
					</ul>
				</div><form runat="server" id="form1">
				<div class="change-page">
					<ul>
						<li><a href=""><asp:HyperLink ID="Prev" runat="server" >上一页</asp:HyperLink></a></li>
						<li><a href=""><asp:HyperLink ID="First" runat="server" NavigateUrl="~/Index/ClickMore.aspx?page=0" >首页</asp:HyperLink></a></li>
						<li>共 <span><asp:Literal ID="TotalPage" runat="server"></asp:Literal></span>页 </li>
						<li>第 <span>1</span> 页 </li>
						<li><a href=""><asp:HyperLink ID="Last" runat="server">尾页</asp:HyperLink></a></li>
						<li><a href=""><asp:HyperLink ID="Next" runat="server">下一页</asp:HyperLink></a></li>
					</ul>
					<%--<input type="text" value="1">--%>
                    <asp:TextBox ID="txtPage" runat="server" onkeyup="this.value=this.value.replace(/\D/g,'')"></asp:TextBox>
				</div></form>
			</div>
			
			
		</div>
</asp:Content>

