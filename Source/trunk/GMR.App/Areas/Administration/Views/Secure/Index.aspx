﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<GMR.App.Areas.Administration.Models.LoginModel>" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<title>Administration Panel</title>
<link media="screen" rel="stylesheet" type="text/css" href="<%=Url.Content("~/content/admin/css/admin-login.css") %>"  />
<!--[if lte IE 6]><link media="screen" rel="stylesheet" type="text/css" href="<%=Url.Content("~/content/admin/css/admin-login-ie.css")%>" /><![endif]-->

</head>

<body>
	<!--[if !IE]>start wrapper<![endif]-->
	<div id="wrapper">
		
		
		
		
		<!--[if !IE]>start login wrapper<![endif]-->
		<div id="login_wrapper">
			
            <% if (Model != null)
               {  %>
			
			<div class="error">
				<div class="error_inner">
					<strong>Access Denied</strong> | <span>user/password combination wrong</span>
				</div>
			</div>
			
			<%} %>
			
			<!--[if !IE]>start login<![endif]-->
			<% using (Html.BeginForm()) { %>
				<fieldset>

					
					<h1 id="logo"><a href="#">websitename Administration Panel</a></h1>
					<div class="formular">
						<div class="formular_inner">
						
						<label>
							<strong>  Username:</strong>
							<span class="input_wrapper">
								 <%= Html.TextBoxFor(m => m.Username) %>
							</span>
						</label>
						<label>
							<strong>  Password:</strong>
							<span class="input_wrapper">
								 <%= Html.PasswordFor(m => m.Password) %>
							</span>
						</label>
						<label class="inline">
							<input class="checkbox" name="" type="checkbox" value="" />
							remember me on this computer
						</label>
						
						
						<ul class="form_menu">
							<li><span class="button"><span><span>Submit</span></span><input type="submit" name=""/></span></li>
							<li><a href="#"><span><span>Back</span></span></a></li>
							<li><a href="#"><span><span>Forgot Pass</span></span></a></li>
						</ul>
						
						</div>
					</div>
				</fieldset>
			<% } %>
			<!--[if !IE]>end login<![endif]-->
		</div>
		<!--[if !IE]>end login wrapper<![endif]-->
	</div>
	<!--[if !IE]>end wrapper<![endif]-->
</body>
</html>
