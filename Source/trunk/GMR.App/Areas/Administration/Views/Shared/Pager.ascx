<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PaginationInfo>" %>
<% if (null != Model) {  %>
<!--[if !IE]>start pagination<![endif]-->
<div class="pagination">
    <span class="page_no">Page 1 of 217</span>
    <ul class="pag_list">
        <li><a href="#" class="button light_blue_btn"><span><span>PREVIOUS</span></span></a>
        </li>
        <li><a href="#">1</a></li>
        <li><a href="#" class="current_page"><span><span>2</span></span></a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li>[...]</li>
        <li><a href="#">217</a></li>
        <li><a href="#" class="button light_blue_btn"><span><span>NEXT</span></span></a>
        </li>
    </ul>
</div>
<!--[if !IE]>end pagination<![endif]-->
<%} %>