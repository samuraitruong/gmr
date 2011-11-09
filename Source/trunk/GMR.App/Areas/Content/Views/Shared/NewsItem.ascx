<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ContentViewNewsModel>" %>
<div class="news_detail">
    <div class="title">
        <h3>
            <%:Model.NewsItem.Subject %><span class="time">(Mar 11, 2009)</span></h3>
    </div>
    <div>
        <div class="detail_top">
            <%=Model.NewsItem.Headline %>
        </div>
        <%= Model.NewsItem.Content %>
    </div>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="source">
    <tr valign="middle">
        <td width="25%">
            Source: <b>
                <%:Model.NewsItem.Source %>
            </b>
        </td>
        <%--<td width="46%" align="right"><a href="#"><img src="/Content/images/download_source.png" width="20" height="19" border="0"/></a><span class="download"><a href="#">Download</a></span></td>
                      <td width="18%" align="right"><a href="#"><img src="/Content/images/mail_source.png" width="20" height="19" border="0"/></a><span class="download"><a href="#">Send e-mail</a></span></td>
                      <td width="11%" align="right"><a href="#"><img src="/Content/images/print_source.png" width="20" height="19" border="0"/></a><span class="download"><a href="#">Print</a></span></td>--%>
    </tr>
</table>
<div class="news_other">
    <div class="title_news_other">
        <span>Tin liên quan:</span></div>
    <div class="div_news_other">
        <ul>
            <%foreach (var item in Model.RelatedNews)
              {%>
            <li><a href="<%=Url.NewsLink(item) %>" title="<%:item.Subject %>">
                <%:item.Subject %>
            </a><span class="time">(<%:item.UpdateDate.Value.ToString("MMM dd, yyyy") %>)</span></li>
            <%} %>
        </ul>
    </div>
    <%-- <div class="page"><a href="#" class="img"><img src="/Content/images/revious.gif" border="0"/></a>  <span class="current">1</span> | <a href="#">2</a> | <a href="#">3</a> | <a href="#">4</a> | <a href="#">5</a> | <a href="#">6</a> | <a href="#">7</a> | <a href="#">8</a> | <a href="#">9</a> | <a href="#">10</a>  <a href="#" class="img"><img src="/Content/images/next.gif" border="0"/></a></div>--%>
</div>
