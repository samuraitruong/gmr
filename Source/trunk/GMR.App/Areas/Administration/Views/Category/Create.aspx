<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Administration/Views/Shared/CMS.Master" Inherits="System.Web.Mvc.ViewPage<GMR.App.Areas.Administration.Models.CreateCategoryModel>" %>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalHead" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.formatCurrency-1.4.0.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.numberformatter-1.2.2.js") %>" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>&nbsp;</h2>
<% using (Html.BeginForm("Create", "Category", FormMethod.Post, new { @class = "search_form general_form", enctype = "multipart/form-data" }))
   { %>
    
    
<!--[if !IE]>start section<![endif]-->	
					<div class="section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>Thêm danh mục tin tức</h2>
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
															<%: Html.LabelFor(model => model.Name) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p=>p.Name, new {@class="text"}) %>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Name)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <%--
                                                         <div class="row">
															<%: Html.LabelFor(model => model.LogoPath) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                    <input type="file" name="Logo" />
                                                                </span>
																<span class="system positive"></span>
															</div>
														</div>--%>

                                                        <div class="row">
															<%: Html.LabelFor(model => model.ParentCategoryID) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.DropDownListFor(p => p.ParentCategoryID, GMR.App.Utilities.UIHelper.NewsCategories, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.ParentCategoryID)%>
																<span class="system positive"></span>
															</div>
														</div>

                                                         <div class="row">
															<%: Html.LabelFor(model => model.AccessTypes) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                    <label> <%=Html.RadioButton("AccessTypes", GMR.Biz.Models.AccessTypes.Free, true)%> Miễn Phí</label>
                                                                    <br />
                                                                    <label> <%=Html.RadioButton("AccessTypes", GMR.Biz.Models.AccessTypes.Login)%> Đăng nhập</label>
                                                                    <br />
                                                                     <label> <%=Html.RadioButton("AccessTypes", GMR.Biz.Models.AccessTypes.SMS)%>Tin nhắn</label>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.ParentCategoryID)%>
																<span class="system positive"></span>
															</div>
														</div>

														<!--[if !IE]>start row<![endif]-->
														<div class="row">
															<div class="buttons">
																<ul>
																	<li><span class="button send_form_btn"><span><span>THÊM</span></span><input name="" type="submit" /></span></li>
																	<li><span class="button cancel_btn"><span><a href="<%=Url.Action("Index","Category") %>"><span>QUAY LẠI</span></a></span></li>
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
												
												<% = Html.DisplayError() %>
														
												
												
												
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

<asp:Content ID="Content4" ContentPlaceHolderID="TopNagivationBar" runat="server">
    <div id="sec_menu">
					<ul>
                    <li><a href="<%=Url.Action("Index", "Category") %>" class="sm_cat">Quản trị danh mục</a></li>
						<li><a href="<%=Url.Action("Create", "News") %>" class="sm_addnews">Thêm mới</a></li>
                        <%--
						<li><a href="#" class="sm2">Chat and PMs</a></li>
						<li><a href="#" class="sm3">Search Options</a></li>--%>
						<li><a href="<%=Url.Action("Index", "User") %>" class="sm4">Danh sách thành viên</a></li>
						<%--<li><a href="#" class="sm5">Upload Options</a></li>
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
						</li>--%>
					</ul>
				</div>
</asp:Content>