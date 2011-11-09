<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<GMR.App.Models.BetaHomeModel>" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/home.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Công ty THHH Nhiệp Điệu Thị Trường Toàn Cầu</title>
<link href="/content/css/general.css" rel="stylesheet" type="text/css"/>
<link href="/content/css/mainmenu.css" rel="stylesheet" type="text/css"/>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<script language="javascript" type="text/javascript">
    function textboxFocus(el, defaultValue) {
        if (defaultValue != null) {
            if (el.value == defaultValue) {
                el.value = '';
            }
        }
    }

    function textboxBlur(el, defaultValue) {
        if (defaultValue != null) {
            if (el.value == '') {
                el.value = defaultValue;
            }
        }
    }
</script>
<body>
<div class="main">
	<div class="menu">
    </div>
    
    <!--		START HEADER	-->
    
    <div class="header">   
	<!--
	<div class="language">
            <span class="time">Mar 12, 2009</span>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="#" title="English">English</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="#" title="Vietnamese">Vietnamese</a>        
    </div>
	-->
    <!--	<div class="logo">
			<img src="images/logo.png" />            
		</div>
		-->
        <!--<div class="slogan">
          <img src="images/slogan.png"/>            
        </div> -->
			
        
    <!--		END HEADER	-->
<!--	<div class="bg_left">
		<table width="29%" border="0" cellspacing="0" cellpadding="0" class="market_top">
				  <tr>
					<td class="bold">HOSE</td>
					<td class="green_tahoma_11">+5 (1.5%)</td>
					<td class="green_tahoma_11 border">7051.38</td>
					<td class="bold">HASTC</td>
					<td class="red_tahoma_11">+5 (1.5%)</td>
					<td class="red_tahoma_11">7051.38</td>
				  </tr>
				  <tr>
					<td><img src="images/up_m.gif" width="10" height="12" /></td>
					<td>Vol: 19,47</td>
					<td class="border">VL: 311</td>
					<td><img src="images/down_m.gif" width="10" height="12" /></td>
					<td>Vol: 19,47</td>
					<td>VL: 311</td>
				  </tr>
		</table>
	</div>-->
<!--
	<div class="latestnews">
		<div class="title">Tin m?i nh?t</div>
		<ul>
			<li>10:15AM <a href="#">HSC Phone and Fax Numbers Change</a></li>
			<li>10:10AM <a href="#">Download Fiachra Maccana's presentation "Market turns ... can it last ?"</a></li>
			<li>10:00AM <a href="#">Strategic Investment Arm of the Government</a></li>

		</ul>
	</div>
	-->
	<!-- START ADV --> 
	<div class="adv">
		<img src="<%=Url.Content("~/Content/images/adv.jpg") %>" display="none"/>
	</div>
	<!--END ADV --> 
	<!--		START MENU	-->
    <div class="menu">
      <ul class="mainmenu">
        <li class="current"><a href="<%=Url.Action("Index", "Home") %>" class="current_link">Trang Chủ </a></li>

        </ul>
        <div class="searchStock">
            <input type="text" name="textfield" id="textfield" value="" onfocus="textboxFocus(this, ' ');" onblur="textboxBlur(this, ' ');"/>
            <a href="#"><span><img src="<%=Url.Content("~/Content/images/button_search.png" )%>" border="0" /> </span></a>        
        </div>
  </div>
  <!--		END MENU	-->
<!-- 
 <div class="adv">
  	<img src="images/adv.jpg" />
  </div>
--> 
 <!--		START CONTENT	-->
  <div class="content"><!-- InstanceBeginEditable name="main" -->
  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr valign="top">
        <td class="bg_left">
        	<div class="left_content1">
            	<!--<div class="live_board">
                	<ul>
                    	<li class="text">Live board:</li>
                        <li><a href="#">HOSE</a></li>
                        <li><a href="#">HASTC</a></li>         
                    </ul>
                </div> -->
                
                 <h1 align="center">PHIÊN BẢN THỬ NGHIỆM</h1>	
                        	                        
                                
              <div class="module_market">
               	  <div class="title">
                    <div class="text">
                           Loại            	
                    </div>
					<div class="text">
                            Doanh Nghiệp            	
                    </div>

                    <div class="text"style="margin-left:40px;">Giá mua(Ngàn)</div>     

                    <div class="text" style="margin-left:40px;">Giá bán(Ngàn)</div>     
                    <div class="text1">Thời gian cập nhật</div>     
						
                  </div>
                    <table border="0" cellspacing="0" cellpadding="0" class="table_market">
					      <%foreach (var item in Model.LiveMarketPrices)
             {%>
                  <tr>
							<td width="137" class="bold"><%=item.SymbolType.DisplayName %></td>
							<td width="137" class="bold"><%=item.Partner.Name %></td>
							<td width="150" align="right" ><%=Html.FormatCurrency(item.CurrBuyPrice) %> </td>
							<td width="195" align="right"> <%=Html.FormatCurrency(item.CurrSellPrice) %></td>
 							<td class="green_tahoma_11 last"><% =item.UpdateDateTime.Value.ToString("hh:mm tt - dd/MM/yyyy") %></td>
                      </tr>
                 
           <%  } %>        
					 
	
					  
					 					 
					  <tr>
							<td width="137" class="bold"></td>
							<td width="137" class="bold"></td>
							<td width="150" align="right" > </td>
							<td width="195" align="right"> </td>
 							<td class="green_tahoma_11 last"></td>
                      </tr>
                                           
                  </table>
              </div>
              
            </div>
        </td>                  
      </tr>
    </table>  
  <!-- InstanceEndEditable --></div>
  <!--		END CONTENT	-->
  <!--		START FOOTER	-->
  <div class="footer">
    <div class="left">
        Bản quyền thuộc về công ty Nhịp điệu thị trường toàn cầu</div>
    <div class="right">
        |  <a href="#">Trang chủ</a>  
        |  <a href="#">Điều khoản sử dụng</a>  
        |  <a href="#">Tuyên bố riêng tư </a>  
        |  <a href="#">Liên hệ</a>  |    </div>
  </div>
  <!--		END FOOTER	-->
   <div style="padding-top:35px">
  <!--		END FOOTER	-->
  <!-- Histats.com  START  (standard)-->
<script type="text/javascript">    document.write(unescape("%3Cscript src=%27http://s10.histats.com/js15.js%27 type=%27text/javascript%27%3E%3C/script%3E"));</script>
<a href="http://www.histats.com" target="_blank" title="site stats" ><script  type="text/javascript" >
                                                                         try {
                                                                             Histats.start(1, 1700320, 4, 205, 255, 27, "00000011");
                                                                             Histats.track_hits();
                                                                         } catch (err) { };
</script></a>
<noscript><a href="http://www.histats.com" target="_blank"><img  src="http://sstatic1.histats.com/0.gif?1700320&101" alt="site stats" border="0"></a></noscript>
<!-- Histats.com  END  -->
</div>
</div>
</div>

</body>
<!-- InstanceEnd -->
</html>
