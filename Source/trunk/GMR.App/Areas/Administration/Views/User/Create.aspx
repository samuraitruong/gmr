<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Administration/Views/Shared/CMS.Master" Inherits="System.Web.Mvc.ViewPage<GMR.App.Areas.Administration.Models.UserCreateModel>" %>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalHead" runat="server">
    <script language="javascript" type="text/javascript">
        //$("").change(function () { });
    </script>
    <style type="text/css">
    .general_form label
    {
        width:150px;
    }
    
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TopNagivationBar" runat="server">
    <div id="sec_menu">
					<ul>
						<li><a href="<%=Url.Action("Index", "User") %>" class="sm9">Danh sách quản trị viên</a></li>
                        <%--
						<li><a href="#" class="sm2">Chat and PMs</a></li>
						<li><a href="#" class="sm3">Search Options</a></li>--%>
						<li><a href="<%=Url.Action("Index", "Partner") %>" class="sm4">Đối tác</a></li>
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
<% using (Html.BeginForm("Create","User", FormMethod.Post, new {@class="search_form general_form"}))
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
															<%: Html.LabelFor(model => model.Username) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p=>p.Username, new {@class="text"}) %>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Username)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Password) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.Password, new { @class = "text", type="password"})%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Password)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                         <div class="row">
															<%: Html.LabelFor(model => model.ConfirmPassword)%>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.ConfirmPassword, new { @class = "text", type="password" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.ConfirmPassword)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Fullname) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.Fullname, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Fullname)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.GroupID) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.DropDownListFor(p => p.GroupID, GMR.App.Utilities.UIHelper.UserGroups)%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.GroupID)%>
																<span class="system positive"></span>
															</div>
														</div>


                                                         <div class="row">
															<%: Html.LabelFor(model => model.Email) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.Email, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Email)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Address) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p=>p.Address, new {@class="text"}) %>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Address)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                      
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Phone1) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.Phone1, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Phone1)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Phone2) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.Phone2, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Phone2)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Phone3) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.Phone3, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Phone3)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                         <div class="row">
															<%: Html.LabelFor(model => model.UserTypeId) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.DropDownListFor(p => p.UserTypeId, GMR.App.Utilities.UIHelper.UserTypes, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.UserTypeId)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                         <div class="row">
															<%: Html.LabelFor(model => model.PartnerId) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.DropDownListFor(p => p.PartnerId, GMR.App.Utilities.UIHelper.Partners, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.PartnerId)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                       
                                                        <div class="row">
															<%: Html.LabelFor(model => model.Occupation) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.Occupation, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Occupation)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        
                                                         <div class="row">
															<%: Html.LabelFor(model => model.Industry) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.Industry, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.Industry)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                         <div class="row">
															<%: Html.LabelFor(model => model.AnualIncome) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.AnualIncome, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.AnualIncome)%>
																<span class="system positive"></span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.BirthYear) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <% = Html.TextBoxFor(p => p.BirthYear, new { @class = "text" })%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.BirthYear)%>
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
                                                      

														<!--[if !IE]>start row<![endif]-->
														<div class="row">
															<div class="buttons">
																<ul>
																	<li><span class="button send_form_btn"><span><span>THÊM</span></span><input name="" type="submit" /></span></li>
																	<li><span class="button cancel_btn"><span><a href="<%=Url.Action("Index","User") %>"><span>QUAY LẠI</span></a></span></li>
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
												
												<%= Html.DisplayError() %>
												
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

