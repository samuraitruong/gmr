<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GMR.App.Areas.Administration.Models.CKConfig>" %>
<script type="text/javascript" src="<%=Url.Content("~/Scripts/ckeditor/ckeditor.js")%>"></script>
<script type="text/javascript" src="<%=Url.Content("~/Scripts/ckeditor/adapters/jquery.js")%>"></script>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        
        var config = {
            skin: 'v2',
            width :'800',
            height: '600'
        };

        $('#<%= Model.Id %>').ckeditor(config);
    });
</script>
