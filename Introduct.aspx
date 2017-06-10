<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="Introduct.aspx.cs" Inherits="Display_Introduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="UTF-8"/>
    <link rel="stylesheet" type="text/css" href="css/first.css" />
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" Runat="Server">
    <div class="imggg"> <img id="backG" src="images/background01.png"/></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainText" Runat="Server">
    <form id="form1" runat="server">
          <div class="introduct-main">
			<div class="introduct-title">
				<div class="introduct-titleCont">
				    <img src="images/lineer.png"/>
				    <div class="introduct-basicInfor">
					    <h1>基本信息</h1>
					    <h2>basic information</h2>
				        </div>
				            <img src="images/lineer.png"/>
				        </div>
			 </div>
			<div class="introduct-information">
				<div class="introduct-inforDetail2">
					<ul>
						<li>
							<span>所在院系(中心):</span>
							<span><asp:Literal ID="ltDepartment" runat="server"></asp:Literal></span>
						</li>
						<li>
							<span>学历:</span>
							<span><asp:Literal ID="ltEducation" runat="server"></asp:Literal></span>
						</li>
						<li>
							<span>政治面貌:</span>
							<span><asp:Literal ID="ltPolitical" runat="server"></asp:Literal></span>
						</li>
						<li>
							<span>邮件地址:</span>
							<span><asp:Literal ID="ltEmail" runat="server"></asp:Literal></span>
						</li>
						<li>
							<span>办公电话:</span>
							<span><asp:Literal ID="ltPhone" runat="server"></asp:Literal></span>
						</li>
						<li>
							<span>办公室:</span>
							<span><asp:Literal ID="ltOffice" runat="server"></asp:Literal></span>
						</li>
					</ul>
				</div>
				<div class="introduct-inforImage">
					<div class="introduct-name">
						<h3><asp:Literal ID="ltName" runat="server"></asp:Literal></h3>
						<h4><asp:Literal ID="ltSpell" runat="server"></asp:Literal></h4>
					</div>
					<div class="introduct-personImag">
						<asp:Image ID="imgPerson" runat="server" />
					</div>
				</div>
			</div>
            <asp:Panel ID="Course" runat="server">
            <div class="introduct-title">
                <div class="introduct-titleCont">
                    <img src="images/lineer.png"/>
                    <div class="introduct-basicInfor">
                        <h1>课程介绍</h1>
                        <h2>course introduction</h2>
                        </div>
                            <img src="images/lineer.png"/>
                        </div>
             </div>
            <div id="introduct-education7">
                <span><asp:Literal ID="ltCourse" runat="server"></asp:Literal></span>
            </div>
            </asp:Panel>
            <asp:Panel ID="Experience" runat="server">
            <div class="introduct-title">
				<div class="introduct-titleCont">
				    <img src="images/lineer.png"/>
				    <div class="introduct-basicInfor">
					    <h1>教育及工作经历</h1>
					    <h2>education and work experience</h2>
				        </div>
				            <img src="images/lineer.png"/>
				        </div>
			 </div>
            <div id="introduct-education">
                <span><asp:Literal ID="ltExperience" runat="server"></asp:Literal></span>
            </div>
            </asp:Panel>

              <asp:Panel ID="ResearchDirection" runat="server">
                  <div class="introduct-title">
                      <div class="introduct-titleCont">
                          <img src="images/lineer.png" />
                          <div class="introduct-basicInfor">
                              <h1>研究方向</h1>
                              <h2>research direction</h2>
                          </div>
                          <img src="images/lineer.png" />
                      </div>
                  </div>
                  <div id="introduct-education1">
                      <span><asp:Literal ID="ltResearchDirection" runat="server"></asp:Literal></span>
                  </div>
              </asp:Panel>
              <asp:Panel ID="ResearchProject" runat="server">
                                    <div class="introduct-title">
                      <div class="introduct-titleCont">
                          <img src="images/lineer.png" />
                          <div class="introduct-basicInfor">
                              <h1>研究项目</h1>
                              <h2>research project</h2>
                          </div>
                          <img src="images/lineer.png" />
                      </div>
                  </div>
                  <div id="introduct-education2">
                      <span><asp:Literal ID="ltResearchProject" runat="server"></asp:Literal></span>
                  </div>
              </asp:Panel>
              <asp:Panel ID="Achievements" runat="server">
                                    <div class="introduct-title">
                      <div class="introduct-titleCont">
                          <img src="images/lineer.png" />
                          <div class="introduct-basicInfor">
                              <h1>学术成果</h1>
                              <h2>academic achievements</h2>
                          </div>
                          <img src="images/lineer.png" />
                      </div>
                  </div>
                  <div id="introduct-education3">
                      <span><asp:Literal ID="ltAchievements" runat="server"></asp:Literal></span>
                  </div>
              </asp:Panel>
              
              <asp:Panel ID="Paper" runat="server">
                  <div class="introduct-title">
                      <div class="introduct-titleCont">
                          <img src="images/lineer.png" />
                          <div class="introduct-basicInfor">
                              <h1>论文专利</h1>
                              <h2>patent of the paper</h2>
                          </div>
                          <img src="images/lineer.png" />
                      </div>
                  </div>
                  <div id="introduct-education4">
                      <span><asp:Literal ID="ltPaper" runat="server"></asp:Literal></span>
                  </div>
              </asp:Panel>
             <asp:Panel ID="Enrolment" runat="server">
                 <div class="introduct-title">
                     <div class="introduct-titleCont">
                         <img src="images/lineer.png" />
                         <div class="introduct-basicInfor">
                             <h1>研究生招生条件</h1>
                             <h2>postgraduate admissions conditions</h2>
                         </div>
                         <img src="images/lineer.png" />
                     </div>
                 </div>
                 <div id="introduct-education5">
                     <span><asp:Literal ID="ltEnrolment" runat="server"></asp:Literal></span>
                 </div>
             </asp:Panel>
             <asp:Panel ID="Remark" runat="server">
                 <div class="introduct-title">
                     <div class="introduct-titleCont">
                         <img src="images/lineer.png" />
                         <div class="introduct-basicInfor">
                             <h1>备注</h1>
                             <h2>remarks</h2>
                         </div>
                         <img src="images/lineer.png" />
                     </div>
                 </div>
                 <div id="introduct-education6">
                     <span><asp:Literal ID="ltRemark" runat="server"></asp:Literal></span>
                 </div>
             </asp:Panel>
        </div>
         <script  type="text/javascript" src="js/introductJs.js"></script>
         <script type="text/javascript">
    //内容页图片宽度控制
            var timer = setTimeout(function () {
                $(".introduct-personImag").find("img").each(function () {
                    if (parseInt($(this).css("width")) > 351) {
                        $(this).css({ "width": "351px","height":"auto" });
                    }
                });
            },50)

    
    </script>
 </form>
</asp:Content>

