<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Content/Views/Shared/GMR_CONTENT.Master" Inherits="System.Web.Mvc.ViewPage<ContentViewNewsModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="title_main">
   <%= Html.PageBreadcrum(Model.NewsItem) %>			
</div>
     <% Html.RenderPartial("NewsItem", Model); %>             

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