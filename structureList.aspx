<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="structureList.aspx.cs" Inherits="Display_structureList" %>

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
            <asp:Panel ID="Panel1" runat="server">
			<%--<div class="all-title">
				<h1>党委团委</h1>
				<h2>party committee</h2>
			</div>--%>
			<div class="common-lists"><!--普通列表示例-->
				<div class="lists-title">
					<h1>学院党委</h1>
					<h2>college party committee</h2>
				</div>
				<div class="lists">
					<ul class="clearfix">          
                            <li>姓名</li>
                            <li>职务</li>
                            <li>职责</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li>
					</ul>	
                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" ItemType ="Connection">                            
                                <ItemTemplate>
                                    <ul class="clearfix">
                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                        <asp:Label ID="Label1" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Item.Job %></li>
                                        <li><%#Item.Duty == null?"":Item.Duty.Length>=8?Item.Duty.Substring(0,8)+"…":Item.Duty %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>				
				</div>
				<div class="lists-title">
					<h1>学院团委</h1>
					<h2>college youth league</h2>
				</div>
				<div class="lists">
					<ul class="clearfix">          
                            <li>姓名</li>
                            <li>职务</li>
                            <li>职责</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li>
					</ul>		
                    <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound" ItemType ="Connection">
                                <HeaderTemplate>
                                    
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <ul class="clearfix">
                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                            <asp:Label ID="Label2" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Eval("Job") %></li>
                                        <li><%#Item.Duty == null?"":Item.Duty.Length>=8?Item.Duty.Substring(0,8)+"…":Item.Duty %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>			
				</div>
			
            <div class="lists-title">
					<h1>教工党支部</h1>
					<h2>teacher party branch</h2>
			</div>
				<div class="lists">
					<ul class="clearfix">          
                            <li>姓名</li>
                            <li>职务</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li>
					</ul>	
                    <asp:Repeater ID="Repeater3" runat="server" OnItemDataBound="Repeater3_ItemDataBound" ItemType ="Connection">
                                <HeaderTemplate> 
                                                           
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <ul class="clearfix">
                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                            <asp:Label ID="Label3" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Item.Job == null?"":Item.Job.Length>=25?Item.Job.Substring(0,25)+"…":Item.Job %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>				
				</div>
            <div class="lists-title">
					<h1>学生党支部</h1>
					<h2>student party branch</h2>
			</div>
				<div class="lists">
					<ul class="clearfix">
                            <li>党支部名称</li>
					</ul>			
                    <asp:Repeater ID="Repeater4" runat="server" >                       
                                <ItemTemplate>
                                    <ul class="clearfix">
                                        <li><%#Eval("Job") %></li> 
                                    </ul>                                                                        
                                </ItemTemplate>                    
                            </asp:Repeater>		
				</div>   
                </div>         
                </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
            <div class="common-lists">
                <div class="lists-title">
					<h1>院行政</h1>
					<h2>college administration</h2>
				</div>
				<div class="lists">
					<ul class="clearfix">
                            <li>姓名</li>
                            <li>职务</li>
                            <li>职责</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li>  						
					</ul>	
                    <asp:Repeater ID="Repeater5" runat="server" OnItemDataBound="Repeater5_ItemDataBound" ItemType ="Connection">
                                <ItemTemplate>
                                    <ul class="clearfix">
                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Eval("Job") %></li>
                                        <li><%#Item.Duty == null?"":Item.Duty.Length>=8?Item.Duty.Substring(0,8)+"…":Item.Duty %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>				
				</div>
                <div class="lists-title">
					<h1>院办公室</h1>
					<h2>college office</h2>
				</div>
				<div class="lists">
					<ul class="clearfix">
                            <li>姓名</li>
                            <li>职务</li>
                            <li>职责</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li> 						
					</ul>
                    <asp:Repeater ID="Repeater6" runat="server" OnItemDataBound="Repeater6_ItemDataBound" ItemType ="Connection">
                                <ItemTemplate>
                                    <ul class="clearfix">
                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Item.Job == null?"":Item.Job.Length>=4?Item.Job.Substring(0,4)+"…":Item.Job %></li>
                                        <li><%#Item.Duty == null?"":Item.Duty.Length>=8?Item.Duty.Substring(0,8)+"…":Item.Duty %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>				
				</div>
                <div class="lists-title">
					<h1>物理系</h1>
					<h2>physics</h2>
				</div>
				<div class="lists">
					<ul class="clearfix">
                            <li>姓名</li>
                            <li>职务</li>
                            <li>职责</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li>
					</ul>					
                    <asp:Repeater ID="Repeater7" runat="server" OnItemDataBound="Repeater7_ItemDataBound" ItemType ="Connection">
                                <ItemTemplate>
                                    <ul class="clearfix">
                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Item.Job == null?"":Item.Job.Length>=4?Item.Job.Substring(0,4)+"…":Item.Job %></li>
                                        <li><%#Item.Duty == null?"":Item.Duty.Length>=8?Item.Duty.Substring(0,8)+"…":Item.Duty %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>
				</div>
                <div class="lists-title">
					<h1>电子工程系</h1>
					<h2>electronic engineering</h2>
				</div>
				<div class="lists">
					<ul class="clearfix">
                            <li>姓名</li>
                            <li>职务</li>
                            <li>职责</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li>						
					</ul>	
                    <asp:Repeater ID="Repeater8" runat="server" OnItemDataBound="Repeater8_ItemDataBound" ItemType ="Connection">
                                <ItemTemplate>
                                    <ul class="clearfix">

                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Item.Job == null?"":Item.Job.Length>=4?Item.Job.Substring(0,4)+"…":Item.Job %></li>
                                        <li><%#Item.Duty == null?"":Item.Duty.Length>=8?Item.Duty.Substring(0,8)+"…":Item.Duty %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>				
				</div>
                <div class="lists-title">
					<h1>计算机科学与技术系</h1>
					<h2>computer science and technology</h2>
				</div>
				<div class="lists">
					<ul class="clearfix">
                            <li>姓名</li>
                            <li>职务</li>
                            <li>职责</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li> 						
					</ul>	
                    <asp:Repeater ID="Repeater9" runat="server" OnItemDataBound="Repeater9_ItemDataBound" ItemType ="Connection">
                                <ItemTemplate>
                                    <ul class="clearfix">

                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Item.Job == null?"":Item.Job.Length>=4?Item.Job.Substring(0,4)+"…":Item.Job %></li>
                                        <li><%#Item.Duty == null?"":Item.Duty.Length>=8?Item.Duty.Substring(0,8)+"…":Item.Duty %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>				
				</div>
                <div class="lists-title">
					<h1>海洋技术系</h1>
					<h2>marine technology</h2>
				</div>
				<div class="lists">
					<ul class="clearfix">
                            <li>姓名</li>
                            <li>职务</li>
                            <li>职责</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li>     						
					</ul>	
                    <asp:Repeater ID="Repeater10" runat="server" OnItemDataBound="Repeater10_ItemDataBound" ItemType ="Connection">
                                <ItemTemplate>
                                    <ul class="clearfix">

                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Item.Job == null?"":Item.Job.Length>=4?Item.Job.Substring(0,4)+"…":Item.Job %></li>
                                        <li><%#Item.Duty == null?"":Item.Duty.Length>=8?Item.Duty.Substring(0,8)+"…":Item.Duty %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>				
				</div>
                <div class="lists-title">
					<h1>信息工程中心</h1>
					<h2>information engineering center</h2>
				</div>
				<div class="lists">
					<ul class="clearfix">
                            <li>姓名</li>
                            <li>职务</li>
                            <li>职责</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li>					
					</ul>	
                    <asp:Repeater ID="Repeater11" runat="server" OnItemDataBound="Repeater11_ItemDataBound" ItemType ="Connection">
                                <ItemTemplate>
                                    <ul class="clearfix">
                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Item.Job == null?"":Item.Job.Length>=4?Item.Job.Substring(0,4)+"…":Item.Job %></li>
                                        <li><%#Item.Duty == null?"":Item.Duty.Length>=8?Item.Duty.Substring(0,8)+"…":Item.Duty %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>				
				</div>
            </div>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server">
            <div class="common-lists">
                <div class="lists-title">
					<h1>院工会</h1>
					<h2>college union</h2>
				</div>
				<div class="lists">
					<ul class="clearfix">
                            <li>姓名</li>
                            <li>职务</li>
                            <li>职责</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li>						
					</ul>	
                    <asp:Repeater ID="Repeater12" runat="server" OnItemDataBound="Repeater12_ItemDataBound" ItemType ="Connection">
                                <ItemTemplate>
                                    <ul class="clearfix">
                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Item.Job == null?"":Item.Job.Length>=4?Item.Job.Substring(0,4)+"…":Item.Job %></li>
                                        <li><%#Item.Duty == null?"":Item.Duty.Length>=8?Item.Duty.Substring(0,8)+"…":Item.Duty %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>				
				</div>
                <div class="lists-title">
					<h1>院妇女委员会</h1>
					<h2>college women's committee</h2>
				</div>
				<div class="lists">
					<ul class="clearfix">
                            <li>姓名</li>
                            <li>职务</li>
                            <li>职责</li>
                            <li>联系电话</li>
                            <li>电子邮箱</li>					
					</ul>	
                    <asp:Repeater ID="Repeater13" runat="server" OnItemDataBound="Repeater13_ItemDataBound" ItemType ="Connection">
                                <ItemTemplate>
                                    <ul class="clearfix">
                                        <li><a href="Introduct.aspx?id=<%#Item.UserID%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Item.UserID%>'></asp:Label></a></li>
                                        <li><%#Item.Job == null?"":Item.Job.Length>=4?Item.Job.Substring(0,4)+"…":Item.Job %></li>
                                        <li><%#Item.Duty == null?"":Item.Duty.Length>=8?Item.Duty.Substring(0,8)+"…":Item.Duty %></li>
                                        <li><%#Eval("Phone") %></li>
                                        <li><%#Eval("Email") %></li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>				
				</div>
            </div>
            </asp:Panel>
		</div>
	</div>
</asp:Content>

