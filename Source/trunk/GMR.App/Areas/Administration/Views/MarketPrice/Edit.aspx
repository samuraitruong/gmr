<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Administration/Views/Shared/CMS_Restricted.Master" Inherits="System.Web.Mvc.ViewPage<GMR.App.Areas.Administration.Models.EditMarketPriceModel>" %>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalHead" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.formatCurrency-1.4.0.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.numberformatter-1.2.2.js") %>" type="text/javascript"></script>
    
<!-- Dependencies -->
<script src="<%: Url.Content("~/Scripts/UI/jquery.ui.draggable.js")%>" type="text/javascript"></script>
<!-- Core files -->
<script src="<%: Url.Content("~/Scripts/jquery.alerts.js")%>" type="text/javascript"></script>
<link href="<%: Url.Content("~/Content/jquery.alerts.css")%>" rel="stylesheet" type="text/css" media="screen" />


    <script type="text/javascript">
        function UpdatePrice(id) {
            $.ajax({
                type: "POST",
                url: '<%=Url.Action("GetChange","MarketPrice") %>',

                data: { symbolId: id },
                success: function (data) {

                    $("#DailyOpenPrice").val(data.OpenPrice);
                    $("#DailyClosePrice").val(data.ClosePrice);
                }
            });
        }
        function Recalculate() {
        
        var curr = parseFloat($("#CurrBuyPrice").val());
        var close = parseFloat($("#DailyClosePrice").val());
        var change = curr - close;
        var number = (change / close) * 100;

        $("#DailyPriceChange").val(change);
        if (close != 0) {
            $("#AdjustedRate").val(number);
            $("#AdjustedRate").parseNumber({ format: "#.0%", locale: "us" }, false);
        }
    }

        $(document).ready(function () {
            $("#CurrBuyPrice").change(function () { Recalculate() });

            $("#SymbolNameId").change(function () {

                UpdatePrice($(this).val());
            });
            UpdatePrice($("#SymbolNameId").val());

            $('#CurrSellPricex').blur(function () {

                //$('#CurrSellPrice').html(null);
                $(this).formatCurrency({ colorize: true, negativeFormat: '-%s%n', roundToDecimalPlace: 2 });
            })
			.keyup(function (e) {
			    var e = window.event || e;
			    var keyUnicode = e.charCode || e.keyCode;
			    if (e !== undefined) {
			        switch (keyUnicode) {
			            case 16: break; // Shift
			            case 17: break; // Ctrl
			            case 18: break; // Alt
			            case 27: this.value = ''; break; // Esc: clear entry
			            case 35: break; // End
			            case 36: break; // Home
			            case 37: break; // cursor left
			            case 38: break; // cursor up
			            case 39: break; // cursor right
			            case 40: break; // cursor down
			            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
			            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
			            case 190: break; // .
			            default: $(this).formatCurrency({ colorize: true, negativeFormat: '-%s%n', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });
			        }
			    }
			})
			.bind('decimalsEntered', function (e, cents) {
			    if (String(cents).length > 2) {
			        var errorMsg = 'Please do not enter any cents (0.' + cents + ')';
			        $('#formatWhileTypingAndWarnOnDecimalsEnteredNotification2').html(errorMsg);
			        log('Event on decimals entered: ' + errorMsg);
			    }
			});
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>&nbsp;</h2>
<% using (Html.BeginForm("Edit","MarketPrice", FormMethod.Post, new {@class="search_form general_form"}))
   { %>
    <%: Html.ValidationSummary(true)%>
    
<!--[if !IE]>start section<![endif]-->	
					<div class="section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>Cập Nhật Giá Thị Trường</h2>
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
														<%=Html.HiddenFor(model=>model.Id) %>
														
														<!--[if !IE]>start row<![endif]-->
														<div class="row">
															<%: Html.LabelFor(model => model.SymbolNameId) %>
															<div class="inputs">
																<span class="input_wrapper">
                                                                <%= Html.DropDownListFor(model => model.SymbolNameId, GMR.App.Utilities.UIHelper.SymbolNames, new { @class="x"})%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.SymbolNameId)%>
																<span class="system positive"></span>
															</div>
														</div>
														<!--[if !IE]>end row<![endif]-->
														
														<!--[if !IE]>start row<![endif]-->
														<div class="row">
															<%: Html.LabelFor(model => model.PlaceId) %>
															<div class="inputs">
                                                                <span class="input_wrapper">
                                                                <%= Html.DropDownListFor(model => model.PlaceId, GMR.App.Utilities.UIHelper.Districts, new { @class="x"})%>
                                                                </span>
                                                                <%=Html.ValidationMessageFor(model => model.PlaceId)%>
																<span class="system positive"></span>
                                                                </span>
																
															</div>
														</div>
                                                         <div class="row">
															<%: Html.LabelFor(model => model.CurrBuyPrice) %>
															<div class="inputs">
																<span class="input_wrapper"> <%= Html.TextBoxFor(model => model.CurrBuyPrice, new { @class = "text" })%> </span>(Ngàn)
																<span class="system negative">
                                                                 <%=Html.ValidationMessageFor(p => p.CurrBuyPrice)%>
                                                                </span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.CurrSellPrice) %>
															<div class="inputs">
																<span class="input_wrapper"> <%= Html.TextBoxFor(model => model.CurrSellPrice, new { @class="text"})%> </span>(Ngàn)
																<span class="system negative">
                                                                 <%=Html.ValidationMessageFor(p=>p.CurrSellPrice) %>
                                                                </span>
															</div>
														</div>
                                                        <div class="row">
															<%: Html.LabelFor(model => model.DailyOpenPrice)%>
															<div class="inputs">
																<span class="input_wrapper"> <%= Html.TextBoxFor(model => model.DailyOpenPrice, new { @class = "text", @readonly="true", disabled="disabled" })%> </span>(Ngàn)
																<span class="system negative"></span>
															</div>
														</div>

                                                         <div class="row">
															<%: Html.LabelFor(model => model.DailyClosePrice)%>
															<div class="inputs">
																<span class="input_wrapper"> <%= Html.TextBoxFor(model => model.DailyClosePrice, new { @class = "text" , @readonly="true", disabled="disabled"})%> </span>(Ngàn)
																<span class="system negative"></span>
															</div>
														</div>
                                                         <div class="row">
															<%: Html.LabelFor(model => model.DailyPriceChange)%>
															<div class="inputs">
																<span class="input_wrapper"> <%= Html.TextBoxFor(model => model.DailyPriceChange, new { @class = "text", @readonly = "true" , disabled="disabled"})%> </span> (Ngàn)
																<span class="system negative"></span>
															</div>
														</div>
                                                         

                                                         <div class="row">
															<%: Html.LabelFor(model => model.AdjustedRate)%>
															<div class="inputs">
																<span class="input_wrapper"> <%= Html.TextBoxFor(model => model.AdjustedRate, new { @class = "text", @readonly = "true" })%></span>
																<span class="system negative"></span>
															</div>
														</div>

														
														
														<!--[if !IE]>start row<![endif]-->
														<div class="row">
															<div class="buttons">
																<ul>
																	<li><span class="button send_form_btn"><span><span>CẬP NHẬT</span></span><input name="" type="submit" /></span></li>
																	<li><span class="button cancel_btn"><span><a href="<%=Url.Action("Restricted","Dashboard") %>"><span>QUAY LẠI</span></a></span></li>
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
                                                <!--
												<ul class="system_messages">
													<li class="white"><span class="ico"></span><strong class="system_title">White bar can be used for system messages and other neutral things.</strong> defwe fwef we</li>
													<li class="red"><span class="ico"></span><strong class="system_title">This is a negative error message !</strong></li>
													<li class="blue"><span class="ico"></span><strong class="system_title">Blue bar can be used for tips, information etc.</strong></li>
													<li class="green"><span class="ico"></span><strong class="system_title">This is a positive message !</strong></li>
													<li class="yellow"><span class="ico"></span><strong class="system_title">This is a warning !</strong></li>
												</ul>--%>
												<!--[if !IE]>end system messages<![endif]-->
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

