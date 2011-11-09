<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Areas/Administration/Views/Shared/CMS.Master" Inherits="System.Web.Mvc.ViewPage<GMR.App.Areas.Administration.Models.CreateNewsModel>" %>


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

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>&nbsp;</h2>
<% using (Html.BeginForm("Create", "News", FormMethod.Post, new { @class = "search_form general_form", enctype = "multipart/form-data" }))
   { %>
    <%: Html.ValidationSummary(true)%>
    
<!--[if !IE]>start section<![endif]-->	
					<div class="section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>Thêm quản trị viên</h2>
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
															<%: Html.LabelFor(model => model.CategoryId) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.DropDownListFor(p => p.CategoryId, GMR.App.Utilities.UIHelper.NewsCategories, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.CategoryId)%>
																<span class="system positive"></span>
															</div>
														</div>

														<div class="row">
															<%: Html.LabelFor(model => model.Subject) %>
															<div class="inputs">
																<span class="input_wrapper_long">
                                                                <% = Html.TextBoxFor(p => p.Subject, new { @class = "text"  })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Subject)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Headline) %>
															<div class="inputs">
																<span class="input_wrapper_long">
                                                                <% = Html.TextAreaFor(p => p.Headline, new { size = "40", rows = "6" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Headline)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.SMSChannel) %>
															<div class="inputs">
																<span class="input_wrapper_long">
                                                                <% = Html.TextAreaFor(p => p.SMSChannel, new { size = "40", rows="6" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.SMSChannel)%>
																<span class="system positive"></span>
															</div>
														</div>

                                                         <div class="row">
															<%: Html.LabelFor(model => model.Content)%>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextAreaFor(p => p.Content, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Content)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Source) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.Source, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Source)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Author) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.Author, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Author)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                         
                                                       
                                                         <div class="row">
															<%: Html.LabelFor(model => model.Description) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextAreaFor(p=>p.Description, new {@class="text"}) %>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Description)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Image) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <input type="file" name="PreviewImage" />
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Image)%>
																<span class="system positive"></span>
															</div>
														</div>

														<!--[if !IE]>start row<![endif]-->
														<div class="row">
															<div class="buttons">
																<ul>
																	<li><span class="button send_form_btn"><span><span>THÊM</span></span><input name="" type="submit" /></span></li>
																	<li><span class="button cancel_btn"><span><a href="<%=Url.Action("Index","News") %>"><span>QUAY LẠI</span></a></span></li>
																</ul>
																
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

<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalHead" runat="server">
    <% Html.RenderPartial("CKEditor", new GMR.App.Areas.Administration.Models.CKConfig() { Id = "Content" });%>
</asp:Content>
