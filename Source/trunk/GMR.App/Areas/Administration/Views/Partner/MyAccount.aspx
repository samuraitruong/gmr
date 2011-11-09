<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Administration/Views/Shared/CMS.Master" Inherits="System.Web.Mvc.ViewPage<GMR.App.Areas.Administration.Models.MyAccountModel>" %>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalHead" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.formatCurrency-1.4.0.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.numberformatter-1.2.2.js") %>" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>&nbsp;</h2>
<% using (Html.BeginForm("MyAccount", "Partner", FormMethod.Post, new { @class = "search_form general_form", enctype = "multipart/form-data" }))
   { %>
    <%: Html.ValidationSummary(true)%>
    
<!--[if !IE]>start section<![endif]-->	
					<div class="section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>Cập nhật thông tin cá nhân</h2>
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
												
												<h3>Nhập thông tin bên dưới.</h3>
														
												<%--<p>
													Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec blandit, nisl sit amet iaculis ullamcorper, orci tellus feugiat est, at dapibus massa dui vel lectus. Sed felis nunc, pharetra ullamcorper, fermentum nec, cursus nec, ipsum. Nunc porta blandit risus. Proin pharetra. Proin ultrices viverra lorem. Phasellus tellus enim, accumsan et, luctus vitae, mattis in, diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vulputate, arcu consectetur auctor lacinia, justo est suscipit massa, a 
												</p>
												--%>
												
												<!--[if !IE]>start forms<![endif]-->
												
													<!--[if !IE]>start fieldset<![endif]-->
													<fieldset>
														<!--[if !IE]>start forms<![endif]-->
														<div class="forms">
														
														
														
														<!--[if !IE]>start row<![endif]-->
														<div class="row">
															<%: Html.LabelFor(model => model.OldPassword) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.PasswordFor(p=>p.OldPassword, new {@class="text"}) %>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.OldPassword)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Password) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.PasswordFor(p => p.Password, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Password)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.ConfirmPassword) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.PasswordFor(p => p.ConfirmPassword, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.ConfirmPassword)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                       
														<!--[if !IE]>start row<![endif]-->
														<div class="row">
															<div class="buttons">
																<ul>
																	<li><span class="button send_form_btn"><span><span>CẬP NHẬT</span></span><input name="" type="submit" /></span></li>
																	<li><span class="button cancel_btn"><span><a href="<%=Url.Action("Restricted","Dashboard") %>"><span>QUAY LẠI</span></a></span></li>
																</ul>
																<%: Html.ValidationSummary() %>
																<%--<ul>
																	<li><span class="button orange_btn"><span><span>ORANGE</span></span><input name="" type="submit" /></span></li>
																	<li><span class="button red_btn"><span><span>RED</span></span><input name="" type="submit" /></span></li>
																</ul>
																
																
																<ul>
																	<li><span class="button grey_btn"><span><span>GREY</span></span><input name="" type="submit" /></span></li>
																	<li><span class="button light_blue_btn"><span><span>LIGHT BLUE</span></span><input name="" type="submit" /></span> </li>
																</ul>--%>
															</div>
														</div>
														<!--[if !IE]>end row<![endif]-->
														
														
														
														</div>
														<!--[if !IE]>end forms<![endif]-->
														
													</fieldset>
													<!--[if !IE]>end fieldset<![endif]-->
											
												<!--[if !IE]>end forms<![endif]-->	
												
												<!--[if !IE]>start system messages<![endif]-->
												<%--<ul class="system_messages">
													<li class="white"><span class="ico"></span><strong class="system_title">White bar can be used for system messages and other neutral things.</strong> defwe fwef we</li>
													<li class="red"><span class="ico"></span><strong class="system_title">This is a negative error message !</strong></li>
													<li class="blue"><span class="ico"></span><strong class="system_title">Blue bar can be used for tips, information etc.</strong></li>
													<li class="green"><span class="ico"></span><strong class="system_title">This is a positive message !</strong></li>
													<li class="yellow"><span class="ico"></span><strong class="system_title">This is a warning !</strong></li>
												</ul>--%>
												<!--[if !IE]>end system messages<![endif]-->
														
												
												
												
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
					<!--[if !IE]>end section<![endif]-->
                    
    <%} %>
</asp:Content>

