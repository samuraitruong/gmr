<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<News>>" %>


<%foreach (var item in Model) {%>

 <div class="newsitem">
          <a class="bighead" href="<%=Url.NewsLink(item) %>"><%:item.Subject %> </a>
            <div class="container">
            <div style="width: 65px; float:left">
			<%=Html.Image(item.ImagePath) %>
              
            </div>
            <div style="float:left; width:650px;">
            <p>
              <%:item.Headline %>
              
            </p>
            </div>
            </div>
          <span class="info">
            <span class="timespan"><span class="timeAgo"><span>5 min ago</span><span class="invisible">10:19 a.m. Nov. 2, 2011</span></span></span>
          </span>
      
      <div class="clear"></div>
    </div>
    <%} %>