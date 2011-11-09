<%@ Page Language="C#" MasterPageFile="~/Views/Shared/GMR.Master" Inherits="System.Web.Mvc.ViewPage<HomePageModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <title>Công ty TNHH Nhịp Điệu Thị Trường Toàn Cầu</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="news_homepage">
                    <div class="market_commentary">
                        <table width="100%" border="1px" cellspacing="0" cellpadding="0" style="border-color:#EEC900;">
							<tr valign="top" style="color:#115ba2;">
							<td colspan="4"><h2><span><center>
								THỊ TRƯỜNG VIỆT NAM
							</center></span></h2></td>
							<td colspan="3"><h2><span><center>
								THỊ TRƯỜNG THẾ GIỚI
							</center></span></h2></td>							
							</tr>

                            <tr>
                                <td colspan="4">
                                    <table width="100%" border="1px" cellspacing="0" cellpadding="0" style="border-color:#EEC900;">
                                        <tr>
							            <td><h3><span><center>
								            DOANH NGHIỆP
							            </center></span></h3></td>
							            <td><h3><span><center>
								            LOẠI
							            </center></span></h3></td>
							            <td><h3><span><center>
								            MUA
							            </center></span></h3></td>
							            <td><h3><span><center>
								            BÁN
							            </center></span></h3></td>	
                                        </tr>
                                            <%foreach (var item in Model.LiveMarketPrices)
                                              {%>
                                                   <tr>
							                <td><h4><span><center>
								                <%:item.Partner.Name %>
								                <br>Liên hệ:
							                </center></span></h3></td>

							                <td><h3><span><center>
								                <%:item.SymbolType.DisplayName %>
								                <br><%=item.UpdateDateTime.Value.ToString("hh:mm tt") %>
							                </center></span></h3></td>
							                <td><h3><span><center>
								                <%=Html.FormatCurrency(item.CurrBuyPrice) %>
							                </center></span></h3></td>
							                <td><h3><span><center>
								                <%=Html.FormatCurrency(item.CurrSellPrice) %>
							                </center></span></h3></td>
                                        </tr>
                                              <%} %>
                                       
                                    </table>    
                                </td>
							<td colspan="3"  valign="top">
                                <table width="100%" border="1px" cellspacing="0" cellpadding="0" style="border-color:#EEC900;">
                                <tr>
                                    <td><h3><span><center>
								    THÔNG TIN THỊ TRƯỜNG
							        </center></span></h3></td>
							        <td><h3><span><center>
								        MUA
							        </center></span></h3></td>
							        <td><h3><span><center>
								        BÁN
							        </center></span></h3></td>
                                    </tr>
                                    <tr>
                                        <td><h4><span><center>
								        EURUSD
							        </center></span></h4></td>
							        <td><h3><span><center>
								        49484
							        </center></span></h4></td>
							        <td><h4><span><center>
								        3938
							        </span></h4></td>
							        </tr>
                                    <tr>
                                        <td><h4><span><center>
								        GOLD
							        </center></span></h4></td>
							        <td><h3><span><center>
								        49484
							        </center></span></h4></td>
							        <td><h4><span><center>
								        3938
							        </span></h4></td>
							        </tr>
                                    <tr>
                                        <td><h4><span><center>
								        USDJPY
							        </center></span></h4></td>
							        <td><h3><span><center>
								        49484
							        </center></span></h4></td>
							        <td><h4><span><center>
								        3938
							        </span></h4></td>
							        </tr>
                                    <tr>
                                        <td><h4><span><center>
								        GBPUSD
							        </center></span></h4></td>
							        <td><h3><span><center>
								        49484
							        </center></span></h4></td>
							        <td><h4><span><center>
								        3938
							        </span></h4></td>
							        </tr>
                            </table>
                            </td>	
                
							

							<tr valign="middle" style="color:#115ba2;">
							<td colspan="4"><h2><span><center>
								THÔNG TIN QUAN TRỌNG VN
							</center></span></h2></td>
							<td colspan="3"><h2><span><center>
								THÔNG TIN QUAN TRỌNG TG
							</center></span></h2></td>							
							</tr>
							<td colspan="2"><h4><span><center>
								Tỷ giá liên ngân hàng của NHNN
							</center></span></h4></td>
							<td colspan="2"><h4><span><center>
								1 USD = 20.803,00 VND
							</center></span></h4></td>							
							<td><h4><span><center>
								USD INDEX
							</center></span></h4></td>
							<td colspan="2"><h4><span><center>
								77.45
							</center></span></h4></td>
							</tr>
							<tr>
							<td colspan="2"><h4><span><center>
								VN INDEX
							</center></span></h4></td>
							<td colspan="2"><h4><span><center>
								422,07   +7,32/+1,76%
							</center></span></h4></td>
							<td><h4><span><center>
								U.S. 10-YEAR
							</center></span></h4></td>
							<td colspan="2"><h4><span><center>
								2.317%   -0.080
							</center></span></h4></td>							
							</tr>
							<tr>
							<td colspan="2"><h4><span><center>
								HNX INDEX
							</center></span></h4></td>
							<td colspan="2"><h4><span><center>
								422,07   +7,32/+1,76%
							</center></span></h4></td>
							<td><h4><span><center>
								SILVER
							</center></span></h4></td>
							<td colspan="2"><h4><span><center>
								3938
							</center></span></h4></td>							
							</tr>
							<tr>
							<td colspan="2"><h4><span><center>
								Giá Vàng TG - VCB
							</center></span></h4></td>
							<td colspan="2"><h4><span><center>
								44370
							</center></span></h4></td>
							<td><h4><span><center>
								PLATIUM
							</center></span></h4></td>
							<td colspan="2"><h4><span><center>
								3938
							</center></span></h4></td>							
							</tr>
							<tr>
							<td colspan="2"><h4><span><center>
								Giá Vàng TG - Tự Do
							</center></span></h4></td>
							<td colspan="2"><h4><span><center>
								44390
							</center></span></h4></td>
							<td><h4><span><center>
								BRENT CRUDE
							</center></span></h4></td>
							<td colspan="2"><h4><span><center>
								9393
							</center></span></h4></td>							
							</tr>
							<tr height="150">
							<td style="color:#115ba2;"><h3><span><center>
								THÔNG TIN THỊ TRƯỜNG
							</center></span></h3>
							</td>
							<td colspan="6" valign="top" style="color:#006ad0;">
								<table>
									<tr height="10">
										<td>    
										</td>
									</tr>
                                   <%foreach (var item1 in Model.LastestMarketInfoNews)
                                     {%>
                                         <tr>
										<td> <a href="<%=Url.NewsLink(item1) %>"> <%=item1.UpdateDate.Value.ToString("hh:mm:ss tt") %> - <%:item1.Subject %> (<%:item1.Category.CategoryName %>) </a>
										</td>
									</tr>
                                    <% } %>
									
									<tr height="10">
										<td>    
										</td>
									</tr>
								</table>
							
							</td>
							</tr>
							
							<tr height="20">
							<td colspan="7" style="color:#115ba2;"><h3><span><center>
								CÁC ĐỒ THỊ QUAN TRỌNG
							</center></span></h3>
							</td>
							</tr>
                            <tr>
							<td colspan="7" style="color:#115ba2; padding-left:5px" >
                                 <table width="100%" cellspacing="0" cellpadding="0" style="border-color:#EEC900; border:0px" runat="server" visible="true">
							       <%-- <tr style="color:#115ba2;" valign="top">
                                        <td >
                                            <img src="http://www.kitco.com/images/live/gold.gif" width="340" height="215" style="border:none" /> 
                                            <p>Biểu đồ giá vàng  (nguồn: www.kitco.com)</p>
							            </td>
							            <td >
                                        <div style="width:400px; height:290px; overflow:hidden; position:relative">
                                                <iframe style="position:absolute;width:1024px; height:900px; left:-400px; top:-284px;" src="http://118.69.35.146/sjc/"  frameborder="0"   scrolling="no"></iframe>
							             </div>
                                         <p>Biểu đồ giá vàng SJC (nguồn: www.sjc.com.vn)</p>
                                        </td>
                                    </tr>--%>
                                    <tr style="border-bottom:solid 1px #EEC900;">
							            <td>
                                        <div style="width:580px; height:290px; overflow:hidden; position:relative">
                                                <iframe style="position:absolute;width:600px; height:900px; left:-10px; top:-425px;" src="http://www.marketwatch.com/investing/future/GC1Z?CountryCode=US"  frameborder="0"   scrolling="no"></iframe>
							             </div>
                                         <p>Biểu đồ giá vàng (nguồn: www.marketwatch.com)</p>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
							            <td colspan="2" >
                                        <div style="width:580px; height:275px; overflow:hidden; position:relative">
                                                <iframe style="position:absolute;width:600px; height:900px; left:-10px; top:-417px;" src="http://www.marketwatch.com/investing/index/DXY?link=MW_story_quote"  frameborder="0"   scrolling="no"></iframe>
							             </div>
                                         <p>Biểu đồ giá Dollar (nguồn: www.marketwatch.com)</p>
                                        </td>
                                    </tr>

                                   <tr>
							            <td colspan="2" >
                                        <div style="width:580px; height:290px; overflow:hidden; position:relative">
                                                <iframe style="position:absolute;width:600px; height:900px; left:-10px; top:-440px;" src="http://www.marketwatch.com/investing/future/crude%20oil%20-%20electronic"  frameborder="0"   scrolling="no"></iframe>
							             </div>
                                         <p>Biểu đồ giá dầu (nguồn: www.marketwatch.com)</p>
                                        </td>
                                    </tr>

                                </table>
							</td>
							</tr>
							
							</table>
						
                         </div>
                         
</asp:Content>
