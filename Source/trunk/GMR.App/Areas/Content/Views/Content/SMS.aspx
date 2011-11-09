<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<SMSAccessModel>" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>SMS</title>
    <link href="/content/css/validation.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="header">
    <div class="container">
        </div>
       
</div>

<div id="wrapper">
    <div id="shell" class="container">
        <div id="content" class="pad">
           <% using (Html.BeginForm("VerifySMSAccess", "Content", new { area = "Content" }, FormMethod.Post))
              {%>
            <%= Html.HiddenFor(model=>model.Source)%>
            <p>
                Để đọc được nội dung bài viết này bạn phải đăng nhập bằng mã tin nhắn<br />
                Vui lòng nhắn tin với nội dung xxxx gửi đến yyyy: sau đó đăng nhập bằng form bên
                dưới</p>
            <input name="data[User][action]" value="globalLogin" type="hidden">
            <input name="data[User][type]" value="virb" type="hidden">
            <p>
                <span class="field big">
                    <input id="dataUserEmail" name="data[User][email]" tabindex="1" class="validate[email] titleinside"
                        title="Email Address" value="Email Address" autocomplete="off" type="input"></span></p>
            <p>
                <span class="field password big">
                    <input class="validate[required] titleinside focus" tabindex="2" title="Password"
                        id="dataUserPassword" name="data[User][password]" size="20" type="password">
                    <a href="#reset" onclick="$.login.showReset(true);return false;">Forgot your password?</a>
                </span>
            </p>
            <div id="form_submit">
                <input name="submit" tabindex="4" value="Log In →" class="submit link green rounded_5"
                    type="submit">
                <label class="remember" for="dataUserRemember">
                    <input id="dataUserRemember" name="data[User][remember_me]" checked="checked" tabindex="3"
                        type="checkbox">
                    Remember my login on this computer</label>
            </div>
            <%} %>
            <script type="text/javascript" charset="utf-8">
                $(function () {
                    $('#dataUserPassword').focus(function () {
                        $this = $(this);
                        $this.unbind('focus').changeInputType('password');


                        document.getElementById('dataUserPassword').focus();

                        setTimeout("document.getElementById('dataUserPassword').focus()", 100);
                    });

                    $("#loginFormMain").validationEngine('attach', { onValidationComplete: function () { $.login.submit({ redirect: true, formId: '#loginFormMain' }); }, bindMethod: 'bind' });

                });
	
</script>
        </div>
    </div>
</div>
</body>
</html>
