<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<News>>" %>

    <div class="title">Tin mới nhất</div>
    <ul id="smsnews">
        <%foreach (var item in Model)
          {%>
        <li>
            <%: item.UpdateDate.Value.ToString("hh:mmtt") %>
            <a href="<%=Url.NewsLink(item as News) %>" rel="<%=SessionManager.SMSVerified?"":"SMS" %>">
                <%:item.Subject %></a></li>
        <%} %>
    </ul>
    <br />
   

   <%--http://css-tricks.com/3412-anythingslider-jquery-plugin/--%>

