<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Administration/Views/Shared/CMS.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="TopNagivationBar" runat="server">
				<div id="sec_menu">
					<ul>
						<li><a href="#" class="sm1">Security Settings</a></li>
						<li><a href="#" class="sm2">Chat and PMs</a></li>
						<li><a href="#" class="sm3">Search Options</a></li>
						<li><a href="#" class="sm4">Moderators</a></li>
						<li><a href="#" class="sm5">Upload Options</a></li>
						<li><a href="#" class="sm6">Download Options</a></li>
						<li><a href="#" class="sm7">Emails</a></li>
						<li>
							<span class="drop"><span><span><a href="#" class="sm8">More</a></span></span></span>
							<ul>
								<li><a class="sm6" href="#">Download options</a></li>
								<li><a class="sm4" href="#">Menu item</a></li>
								<li><a class="sm6" href="#">Download options</a></li>
								<li><a class="sm6" href="#">Download options</a></li>
								<li><a class="sm6" href="#">Download options</a></li>
							</ul>
						</li>
					</ul>
				</div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>Dashboard</h2>
							<span class="title_wrapper_left"></span>
							<span class="title_wrapper_right"></span>
						</div>
						<!--[if !IE]>end title wrapper<![endif]-->
						<!--[if !IE]>start section content<![endif]-->
						<div class="section_content">
							<!--[if !IE]>start section content top<![endif]-->
							<div class="sct">
								<div class="sct_left">
									<div class="sct_right">
										<div class="sct_left">
											<div class="sct_right">
												<!--[if !IE]>start dashboard menu<![endif]-->
												<div class="dashboard_menu_wrapper">
												<ul class="dashboard_menu">
													<li><a href="#" class="d1"><span>User Management Tools</span></a></li>
													<li><a href="#" class="d2"><span>Setup upload folders</span></a></li>
													<li><a href="#" class="d3"><span>Manage photo galleries</span></a></li>
													<li><a href="#" class="d4"><span>Change site templates</span></a></li>
													<li><a href="#" class="d5"><span>SEO Tools and Settings</span></a></li>
													<li><a href="#" class="d6"><span>Email Settings and Templates</span></a></li>
													<li><a href="#" class="d7"><span>Homepage and Static Pages</span></a></li>
													<li><a href="#" class="d8"><span>Website Security Settings</span></a></li>
													<li><a href="#" class="d9"><span>Printable Pages Template</span></a></li>
													<li><a href="#" class="d10"><span>Date and Time Setup</span></a></li>
													<li><a href="#" class="d11"><span>Favorires Settings</span></a></li>
													<li><a href="#" class="d12"><span>Statistics and Graphs</span></a></li>
												</ul>
												</div>
												<!--[if !IE]>end dashboard menu<![endif]-->
												
												
												
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--[if !IE]>end section content top<![endif]-->
							<!--[if !IE]>start section content bottom<![endif]-->
							<span class="scb"><span class="scb_left"></span><span class="scb_right"></span></span>
							<!--[if !IE]>end section content bottom<![endif]-->
							
						</div>
						<!--[if !IE]>end section content<![endif]-->
					</div>

</asp:Content>
