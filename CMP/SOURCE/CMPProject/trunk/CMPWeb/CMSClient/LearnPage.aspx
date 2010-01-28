<%@ Page Language="C#" MasterPageFile="~/UserPage.master" AutoEventWireup="true" CodeBehind="LearnPage.aspx.cs" Inherits="CMPWeb.CMSClient.LearnPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Content Management Portal</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" language="javascript">
function callNextPrev(pageName)
{
    document.aspnetForm.action = "LearnPage.aspx?pageName=" + pageName;
    document.aspnetForm.submit();
}
</script>

<table>
<tr>
<td valign="top" width="20%">
    <asp:XmlDataSource ID="treeSource" runat="server"></asp:XmlDataSource>
    <asp:TreeView ID="tvContent" runat="server" 
        onselectednodechanged="tvContent_SelectedNodeChanged" >    
    </asp:TreeView>
            
</td>
<td valign="top" width="80%">
<asp:Literal ID="literal1" runat="server"></asp:Literal>
                    
</td>
</tr>
</table>
<asp:HiddenField ID="hdnStartTime" runat="server" />
<asp:HiddenField ID="hdnSiteID" runat="server" />
<asp:HiddenField ID="hdnUserName" runat="server" />

</asp:Content>

