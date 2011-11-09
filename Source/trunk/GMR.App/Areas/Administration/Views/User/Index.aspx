<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Administration/Views/Shared/CMS.Master" Inherits="System.Web.Mvc.ViewPage<GMR.App.Areas.Administration.Models.UserIndexModel>" %>


<asp:Content ID="Content3" ContentPlaceHolderID="TopNagivationBar" runat="server">
    <div id="sec_menu">
					<ul>
						<li><a href="<%=Url.Action("Create", "User") %>" class="sm9">Thêm quản trị viên</a></li>
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

<!--[if !IE]>start section<![endif]-->	
					<div class="section table_section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>Danh sách quản trị viên</h2>
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
												
												<form action="#">
												<fieldset>
												<!--[if !IE]>start table_wrapper<![endif]-->
												<div class="table_wrapper">
													<div class="table_wrapper_inner">
													<table cellpadding="0" cellspacing="0" width="100%">
														<tbody><tr>
															<th>No.</th>
															<th><a href="#">Tên Đăng Nhập</a></th>
															<th><a href="#" class="asc">Địa Chỉ</a></th>
															<th><a href="#" class="desc">Điện Thoại</a></th>
															<th><a href="#">Loại</a></th>
															<th><a href="#">Đối tác</a></th>
                                                            <th><a href="#">Trạng thái</a></th>
															<th style="width: 96px;">Actions</th>
														</tr>
                                                        <% if (Model.Users != null)
                                                           {%>
                                                        <% int index = 0; %>
                                                        <% foreach (var item in Model.Users)
                                                           { %>
														<tr class="<%: index++%2==0?"first":"second" %>">
															<td><%: index %></td>
															<td><%: item.UserName %> [<%=item.Email %>]</td>
															<td><%: item.Address
                                                             %></td>
															<td><%: item.PhoneNumber1 %></td>
															<td><%: item.UserType.DisplayName%></td>
															
                                                              <td><%:item.Partner!= null ?item.Partner.Name: string.Empty %></td>
                                                            <td><%:item.StatusID %></td>
															<td style="width: 96px;">
																<div class="actions">
																	<ul>
																		<li><a class="security_policies" href="<%=Url.Action("UserEdit","Permission", new {Id=item.UserID }) %>">2</a></li>
																		<li><a class="actionedit" href="<%=Url.Action("Edit","User", new {Id=item.UserID }) %>">3</a></li>
																		<li><a class="action4" href="<%=Url.Action("Delete","User", new {Id=item.UserID }) %>" onclick="return confirm('Bạn chắc chắn muốn xóa dữ liệu này chứ')"; >4</a></li>
																		<li><input class="radio" name="" type="checkbox" value="" /></li>
																	</ul>
																</div>
															</td>
														</tr>
                                                        <%}
                                                           }%>
													</tbody></table>
													</div>
												</div>
												<!--[if !IE]>end table_wrapper<![endif]-->
												
												<!--[if !IE]>start table menu<![endif]-->
												<div class="table_menu">
													<ul class="left">
														<li><a href="<%=Url.Action("Create","User") %>" class="button add_new"><span><span>Thêm mới</span></span></a></li>
													</ul>
													<ul class="right">
														<li><a href="#" class="button check_all"><span><span>CHECK ALL</span></span></a></li>
														<li><a href="#" class="button uncheck_all"><span><span>UNCHECK ALL</span></span></a></li>
														<li><span class="button approve"><span><span>APPROVE</span></span></span></li>
													</ul>
												</div>
												<!--[if !IE]>end table menu<![endif]-->
												
												
												</fieldset>
												</form>
												
												
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

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalHead" runat="server">
</asp:Content>
