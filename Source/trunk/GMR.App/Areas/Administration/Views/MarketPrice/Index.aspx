<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Administration/Views/Shared/CMS_Restricted.Master" Inherits="System.Web.Mvc.ViewPage<GMR.App.Areas.Administration.Models.DashBoardRestrictedModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>&nbsp;</h2>

<!--[if !IE]>start section<![endif]-->	
					<div class="section table_section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>Bảng giá thị trường</h2>
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
															<th><a href="#">Loại</a></th>
															<th><a href="#" class="asc">Place</a></th>
															<th><a href="#" class="desc">CurrBuyPrice</a></th>
															<th><a href="#">CurrSellPrice</a></th>
															<th><a href="#">DailyOpenPrice</a></th>
                                                            <th><a href="#">DailyClosePrice</a></th>
                                                            <th><a href="#">DailyClosePrice</a></th>
                                                            <th><a href="#">DailyPriceChange</a></th>
                                                            <th><a href="#">AdjustedRate</a></th>
                                                            
															<th style="width: 96px;">Actions</th>
														</tr>
                                                        <% int index = 0; %>
                                                        <% foreach (var item in Model.MarketkPrices)
                                                           { %>
														<tr class="<%: index++%2==0?"first":"second" %>">
															<td><%: index %></td>
															<td><%: item.SymbolType.DisplayName %></td>
															<td><%: item.District.DisplayName
                                                             %></td>
															<td><%: item.CurrBuyPrice %></td>
															<td><%: item.CurrSellPrice %></td>
															<td><%: item.DailyOpenPrice %></td>
                                                            <td><%: item.DailyClosePrice %></td>
                                                             <td><%: item.DailyPriceChange %></td>
                                                              <td><%: item.AdjustedRate %></td>
                                                            <td><%: item.UpdateDateTime.Value.ToString("hh:mm tt") %></td>
															<td style="width: 96px;">
																<div class="actions">
																	<ul>
																		<li><a class="action1" href="#">1</a></li>
																		<li><a class="action2" href="#">2</a></li>
																		<li><a class="action3" href="#">3</a></li>
																		<li><a class="action4" href="<%=Url.Action("Delete","MarketPrice", new {Id=item.MarketPriceID }) %>" onclick="return confirm('Bạn chắc chắn muốn xóa dữ liệu này chứ')"; >4</a></li>
																		<li><input class="radio" name="" type="checkbox" value="" /></li>
																	</ul>
																</div>
															</td>
														</tr>
                                                        <%} %>
													</tbody></table>
													</div>
												</div>
												<!--[if !IE]>end table_wrapper<![endif]-->
												
												<!--[if !IE]>start table menu<![endif]-->
												<div class="table_menu">
													<ul class="left">
														<li><a href="<%=Url.Action("Create","MarketPrice") %>" class="button add_new"><span><span>Thêm mới</span></span></a></li>
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
