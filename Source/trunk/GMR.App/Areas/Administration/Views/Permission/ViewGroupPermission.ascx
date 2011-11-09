<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ViewGroupPermissionModel>" %>

<!--[if !IE]>start section<![endif]-->	
	<div class="section table_section">
		<!--[if !IE]>start title wrapper<![endif]-->
		<div class="title_wrapper">
			<h2>Phân quyền cho nhóm : <%=Model.Name %></h2>
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
												
								<% using (Html.BeginForm("GroupEdit", "Permision", FormMethod.Post, new { @class = "search_form general_form", enctype = "multipart/form-data" }))
           { %>
                                    <%: Html.ValidationSummary(true)%>
                                        <fieldset>                        
								<!--[if !IE]>start table_wrapper<![endif]-->
								<div class="table_wrapper">
									<div class="table_wrapper_inner">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody><tr>
											<%--<th>No.</th>--%>
											<th><a href="#" class="asc">Module</a></th>
											<th><a href="#" class="desc">Toàn quyền</a></th>
                                            <th><a href="#" class="desc">Thêm</a></th>	
											<th><a href="#" class="desc">Xem</a></th>	
                                            <th><a href="#" class="desc">Sửa</a></th>		
											<th style="width: 96px;">Actions</th>
										</tr>
										<% if (Model.Modules != null)
             {%>
										<% int index = 0; %>
										<% foreach (var item in Model.Modules)
             { %>
                <%
                 var permissionItem = item.Permissions.Where(p => p.GroupID == Model.GroupId).FirstOrDefault();
                     %>
										<tr class="<%: index++%2==0?"first":"second" %>">
											<%--<td><%: index %></td>--%>
											<td><%: item.Name%></td>
											<td><%=Html.CheckBox("Full_" + item.ModuleID, permissionItem != null && permissionItem.Full.HasValue && permissionItem.Full.Value ? true : false, new { @class = "CheckedItem", @readonly = "true", disabled = "true" })%></td>
                                            <td><%=Html.CheckBox("Create_" + item.ModuleID, permissionItem != null && permissionItem.Create.HasValue && permissionItem.Create.Value ? true : false, new { @class = "CheckedItem", @readonly = "true", disabled = "true" })%></td>
                                            <td><%=Html.CheckBox("Read_" + item.ModuleID, permissionItem != null && permissionItem.Read.HasValue && permissionItem.Read.Value ? true : false, new { @class = "CheckedItem", @readonly = "true", disabled = "true" })%></td>
                                            <td><%=Html.CheckBox("Edit_" + item.ModuleID, permissionItem != null && permissionItem.Edit.HasValue && permissionItem.Edit.Value ? true : false, new { @class = "CheckedItem", @readonly = "true", disabled = "true" })%></td>
											<td style="width: 96px;">
												<div class="actions">
													
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
										<li><a href="<%=Url.Action("GroupEdit","Permission", new {id = Model.GroupId}) %>" class="button add_new"><span><span>Chỉnh sửa nhóm</span></span></a></li>
									</ul>
									<ul class="right">
										<li><a href="#" class="button check_all"><span><span>CHECK ALL</span></span></a></li>
										<li><a href="#" class="button uncheck_all"><span><span>UNCHECK ALL</span></span></a></li>
										<li><span class="button approve"><span><span>APPROVE</span></span></span></li>
									</ul>
								</div>
								<!--[if !IE]>end table menu<![endif]-->
												
												
								</fieldset>
								<%} %>
												
												
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