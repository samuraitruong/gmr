<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GMR.App.Models.MainMenuModel>" %>
<ul class="mainmenu">
    <li class="top"><a href="<%=Url.Action("Index","Home", new {area=""}) %>" class="top_link"><span>Trang chủ</span></a></li>

    <%foreach (var item in Model.Categories)
      {%>
         <li class="top"><a href="<%=Url.CategoryLink(item) %>" class="top_link"><span><%: item.CategoryName %></span>
        <!--[if gte IE 7]><!-->
        </a>
            <!--<![endif]-->
            <!--[if lte IE 6]><table><tr><td><![endif]-->
            <!-- <ul class="sub1"> -->
            <%if (item.Categories1.Count > 0)
              {%>
            <ul class="sub_news">
                <%foreach (var subitem in item.Categories1)
                  {%>
                      <li><a href="<%=Url.CategoryLink(subitem) %>"><%:subitem.CategoryName%></a></li>
                <%  } %>
             </ul>
               <%} %>

                <%--<li class="last"><a href="#">Events Calendar</a></li>--%>
           
            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
        </li>  
          
     <% } %>
   
   

    <li class="top"><a href="#" class="top_link"><span>Giới thiệu</span>
        <!--[if gte IE 7]><!-->
    </a>
        <!--<![endif]-->
        <!--[if lte IE 6]><table><tr><td><![endif]-->
        <ul class="sub_intro">
            <li><a href="#">Corporate Value</a></li>
            <li><a href="#">Corporate Profile</a></li>
            <li class="last"><a href="#">Business Activities</a></li>
        </ul>
        <!--[if lte IE 6]></td></tr></table></a><![endif]-->
    </li>
    <li class="top"><a href="#" class="top_link"><span>Hổ trợ</span>
        <!--[if gte IE 7]><!-->
    </a>
        <!--<![endif]-->
        <!--[if lte IE 6]><table><tr><td><![endif]-->
        <ul class="sub_support">
            <li><a href="#">Instructions</a></li>
            <li><a href="#">Telephone Instructions</a></li>
            <li><a href="#">SMS 8177</a></li>
            <li class="last"><a href="#">Schedule of Fees</a></li>
        </ul>
        <!--[if lte IE 6]></td></tr></table></a><![endif]-->
    </li>
</ul>
