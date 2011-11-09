<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Administration/Views/Shared/CMS.Master" Inherits="System.Web.Mvc.ViewPage<GMR.App.Areas.Administration.Models.AccessDeniedModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <img src="/Content/images/access_denied.gif" alt="Alternate Text"" />
    <ul class="system_messages">
    <li class="red"><span class="ico"></span><strong class="system_title">Bạn không có quyền truy cập trang này</strong></li>
		<%--<li class="white"><span class="ico"></span><strong class="system_title">White bar can be used for system messages and other neutral things.</strong> defwe fwef we</li>
		
		<li class="blue"><span class="ico"></span><strong class="system_title">Blue bar can be used for tips, information etc.</strong></li>
		<li class="green"><span class="ico"></span><strong class="system_title">This is a positive message !</strong></li>
		<li class="yellow"><span class="ico"></span><strong class="system_title">This is a warning !</strong></li>--%>
</ul>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalHead" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TopNagivationBar" runat="server">
</asp:Content>
