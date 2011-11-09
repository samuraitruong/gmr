<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GMR.App.Areas.Administration.Models.LoginViewModel>" %>
<!--[if !IE]>start user details<![endif]-->
<div id="user_details">
    <ul id="user_details_menu">
        <li>Welcome <strong><%=Model.Fullname %></strong></li>
        <li>
            <ul id="user_access">
                <li class="first"><a href="<%=Url.Action("MyAccount","Partner")%>">Tài khoản</a></li>
                <li class="last"><a href="<%=Url.Action("Logout","Secure", new {returnUrl=  Url.Action(Model.Action, Model.Controller, new {Area = Model.Area} )})%>">
                    Log out</a></li>
            </ul>
        </li>
        <li><a class="new_messages" href="#">4 new messages</a></li>
    </ul>
    <div id="server_details">
        <dl>
            <dt>Server time :</dt>
            <dd>
                <%=Model.ServerTime %></dd>
        </dl>
        <dl>
            <dt>Last login ip :</dt>
            <dd>
                <%=Model.ClientIP %></dd>
        </dl>
    </div>
    <!--[if !IE]>start search<![endif]-->
    <div id="search_wrapper">
        <form action="#">
        <fieldset>
            <label>
                <input class="text" name="" type="text" />
            </label>
            <span class="go">
                <input name="" type="submit" /></span>
        </fieldset>
        </form>
        <ul id="search_wrapper_menu">
            <li class="first"><a href="#">Advanced Search</a></li>
            <li class="last"><a href="#">Admin Map</a></li>
        </ul>
    </div>
    <!--[if !IE]>end search<![endif]-->
</div>
<!--[if !IE]>end user details<![endif]-->
