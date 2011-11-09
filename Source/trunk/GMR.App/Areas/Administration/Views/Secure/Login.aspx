<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<GMR.App.Areas.Administration.Models.LoginModel>" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><!-- Source is https://secure.marketwatch.com/user/account/logon -->
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=9"/> 
    <title>Đăng nhập - Nhịp Điệu Thị Trường Toàn Cầu</title>
	<link rel="shortcut icon" href="https://i.origin.mktw.net/MW5/content/images/favicon.ico"/>
    <!--[if IE 7]>
        <link rel="stylesheet" href="/content/logon_files/combined-ie7-min-1.0.4651.css" type="text/css"/>
    <![endif]-->
    <!--[if lte IE 6]>
        <link rel="stylesheet" href="/content/logon_files/combined-ie6-min-1.0.4651.css" type="text/css"/>
    <![endif]-->
    <!--[if !IE | gt IE 7]><!-->
        <link rel="stylesheet" href="/content/logon_files/combined-min-1.0.4651.css" type="text/css"/>
    <!--<![endif]-->
    <script type="text/javascript" src="/content/logon_files/combined-head-min-1.0.4651.js"></script>

    <script type="text/javascript">
        MarketWatch.setBaseUrl('');
    </script>
        
    <!--[if IE 6]>
        <script type="text/javascript" src="/content/logon_files/ie6.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="/content/logon_files/marketwatch.member.css" type="text/css"/>
  </head>
  <body>


<div id="blanket" class="mini">
	<!--[if IE 6]><div id="sheet"><![endif]-->
<!-- MarketWatch.Common.News.WebPackage.Models -->





<div id="breakingnews">
  <div class="slidearea ">
    <div class="bulletinarea">
      <span class="bulletinlabel">Bulletin</span>
      <div class="bulletinholder">
        <div id="bulletin" class="bulletin">
		</div>
      </div>
    </div>
  </div>
</div>
		
	<div class="theshadow">
		<!--[if IE 6]><div id="something"><![endif]-->
		<div id="nonchrome" class="clear">
				<div id="above">
				</div>
				<div id="maincontent" class="tenwide">



<div class="tenwide block" style="margin-top: 00px; margin-bottom: 0px; background: none;">
	<h2 style="background: none; border-top: none;"><span style="margin-top: 10px;">Đăng nhập</span></h2>
</div>

<div style="margin-left: 7px; padding-bottom: 7px;">
			
		<span>Vui lòng nhập tên và mật khẩu để đăng nhập. </span>
	
	<!--<a id="registerLink" href="https://secure.marketwatch.com/user/registration/register">Registper</a> if you don't have an account.-->
	
	<div class="ui-dialog" style="width: 206px; border-style: none !important;">
    <% =Html.BeginForm() { %>
	<div>
		<p>
			<span>Tên đăng nhập:</span><br/>
			<%=Html.TextBoxFor(p=>p.Username) %>
		</p>
		<p>
			<span>Mật khẩu:</span><br/>
			<%=Html.TextBoxFor(p=>p.Password) %>
		</p>
	</div>
	<div>
		<input type="submit" value="Sign In" class="button-style1 login-button"/>
		<p class="rememberCheck">
			<%=Html.TextBoxFor(p=>p.RememberMe) %><label for="RememberMe">Lưu cho lần sau</label>
		</p>
		<p>
			<!--<a href="/login/forgot.asp">Forgot password?</a>-->
		</p>
	</div>
	<input id="returnUrl" name="returnUrl" type="hidden" value="" />
	<input id="persist" name="persist" type="hidden" value="" />
<%} %>
	</div>
</div>
        

				</div>
				<div id="below">
				</div>
			<div class="clear"></div>
		</div>
		<!--[if IE 6]></div><![endif]-->
	</div>

	<div id="chrome">
	    <div id="topchrome">
			<div style="height: 30px;">&nbsp;</div>
			<div id="header">
				<div class="leftsection">
					<div id="logo">
						
							<h1 style="background: none; border-top: none;"> <span>Công ty TNHH Nhịp Điệu Thị Trường Toàn Cầu. <br>
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>Trang dành cho đối tác.</i></span></h1>
							
					
					</div> 
				</div>  
				<!-- <div class="clear"/> -->
			</div>
	    </div><div id="footer">	
	<div class="fourwide addgutter">
		<p>
			<br/>
			Bản quyền &copy; 2011 Công ty TNHH Nhịp điệu thị trường tòan cầu.<br/>
			Phiên bản thử nghiệm - Cập nhật ngày 15/19/2011</a>.
		</p>
	</div>
<!--	<div class="sixwide">
		<p>
      Intraday Data provided by SIX Telekurs and subject to <a href="/investing/terms-of-use">terms of use</a>. Historical and current end-of-day data provided by SIX Telekurs. Intraday data delayed per exchange requirements. Dow Jones Indexes (SM) from Dow Jones & Company, Inc. All quotes are in local exchange time. Real time last sale data provided by NASDAQ. More information on <a href="http://www.nasdaq.com/services/DelDefOpenReport.pdf">NASDAQ traded symbols</a> and their current financial status. Intraday data delayed 15 minutes for Nasdaq, and 20 minutes for other exchanges. Dow Jones IndexesSM from Dow Jones & Company, Inc. SEHK intraday data is provided by SIX Telekurs and is at least 60-minutes delayed. All quotes are in local exchange time.		
    </p>
	</div>
-->	<div class="clear"></div>
</div>

	</div>
	
	<!--[if IE 6]></div><![endif]-->
</div>

        
	<!-- SiteCatalyst code version: H.20.2.
	Copyright 1997-2009 Omniture, Inc. More info available at
	http://www.omniture.com -->
  <script type="text/javascript" language="JavaScript" src="/content/logon_files/s_code.js"></script>
 
	<script language="JavaScript" type="text/javascript"><!--
	    if (navigator.appVersion.indexOf('MSIE') >= 0) document.write(unescape('%3C') + '\!-' + '-')
	//--></script><noscript><a href="http://www.omniture.com" title="Web Analytics"><img src="http://om.dowjoneson.com/b/ss/djglobal,djmarketwatch/1/H.20.2--NS/0" height="1" width="1" border="0" alt=""/></a></noscript><!--/DO NOT REMOVE/-->
	<!-- End SiteCatalyst code version: H.20.2. -->
    <!-- begin tail -->
    <script type="text/javascript" src="/content/logon_files/combined-tail-min-1.0.4651.js"></script>
	<script type="text/javascript">
	    if (MarketWatch.Member != undefined && MarketWatch.Member.init != undefined) {
	        MarketWatch.Member.init();
	    }

	    $("input.userName")[0].focus();
	</script>
  <script type="text/javascript">
      $(function () {
      });
  </script>
    <!-- end tail -->
	<script type="text/javascript">
    </script>
  </body>
</html>

