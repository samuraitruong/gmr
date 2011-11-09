<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Content/Views/Shared/GMR_CONTENT.Master" Inherits="System.Web.Mvc.ViewPage<ViewCategoryModel>" %>
<asp:Content ContentPlaceHolderID="AdditionalHead" runat="server">
    <style type="text/css">
    .bighead{
        font-size: 1.167em;
        font-weight: bold;
        }
        .newsitem
        {
            padding-top:10px;
            padding-bottom:15px;
            border-bottom:#CECECE 1px solid;
            overflow:auto;
        }
        .newsblock .info, .newsitem .info {
            font-size: .9em;
            color: #888;
        }
         .newsblock .info
         {
             clear:both;
         }
         .invisible
         {
             display:none;}
             
    </style>


</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <%Html.RenderPartial("CategoryLastestNews", Model.LastestNews); %>



        <%foreach (var item in Model.SubCategories)
          {%>
           <div class="news_category">
               <div class="title_category"><%:item.CategoryName %></div>
               <% var lastest = item.GetLastestNew(); %>
               <%if (lastest != null && lastest.Count>0)  {
                foreach (var news in lastest)
	                {%>
		            <p>
                    	<a href="<%=Url.NewsLink(news) %>"><%:news.Subject %></a> <span class="time">(<%= news.UpdateDate.Value.ToString("dd/MM/yyyy") %>)</span><br/>
                        <%: news.Headline %> </p>
                    <p>
	                
          <%} }%>
                <div class="read_more_news">
                    <a href="<%=Url.CategoryLink(item) %>">Xem thêm <span>>></span></a>                    
                </div>
            </div>
          <%  }%>

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="SubCategoryNavigation">
    <div class="menu_news">
        <div class="title"><span><%:Model.Category.CategoryName %></span></div>
        <% if (Model.SubCategories != null && Model.SubCategories.Count > 0)
           {  %>
        <ul>
        <%foreach (var item in Model.SubCategories)
          {%>
              <li><a href="<%=Url.CategoryLink(item) %>"><%: item.CategoryName %></a></li>
          <%} %>
            
                      
        </ul>
        <%} %>
    </div>
</asp:Content>