<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CMS_Addtnl_Page_Maintenance.aspx.cs" Inherits="CMPWeb.CMS.CMS_Addtnl_Page_Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Content Management Portal</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
function ClearFields()
{    
    document.getElementById('ctl00_ContentPlaceHolder1_txtPageName').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_txtPageCaption').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_txtMetaTitle').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_txtMetaDescription').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_txtMetaKeywords').value = '';
}

function CheckSubmit()
{
        var pPageName = document.getElementById('ctl00_ContentPlaceHolder1_txtPageName');
        
        if ((pPageName.value == null)||(pPageName.value.length==0))
	    {
	        alert("Page Name cannot be empty");
	        pPageName.focus();
	        return false;
	    }			 
}
</script>
    <center><h1><asp:Label ID="lblTitle" runat="server"></asp:Label></h1></center>
    <table border="1" cellspacing="0" cellpadding="3">
    <tr>
    <td >
    <asp:Label id="lblPageName" Text="Page Name" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtPageName" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblPageCaption" Text="Page Caption" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtPageCaption" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblMetaTitle" Text="Meta Title" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtMetaTitle" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblMetaDescription" Text="Meta Description" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtMetaDescription" TextMode="MultiLine" Rows="4" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblMetaKeywords" Text="Meta Keywords" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtMetaKeywords" runat="server"></asp:TextBox>
    </td>
    </tr>
    </table>
        <br />
        <br />
        <b><asp:Label ID="lblMessage" runat="server"></asp:Label></b>
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Save" runat="server" onclick="btnAdd_Click" OnClientClick="JavaScript:return CheckSubmit();"/>
    </td>
    <td>
    <asp:Button ID="btnClear" Text="Clear" runat="server" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" onclick="btnCancel_Click" />
    </td>
    </tr>
    </table>
<asp:HiddenField ID="hdnPageID" runat="server" Value="0" />
<asp:HiddenField ID="hdnCompanyName" runat="server" Value="0" />
<asp:HiddenField ID="hdnSiteID" runat="server" Value="0" />
<asp:HiddenField ID="hdnSiteName" runat="server" Value="0" />
<asp:HiddenField ID="hdnChildPageID" runat="server" Value="0" />
<asp:HiddenField ID="hdnMaxSortNum" runat="server" Value="0" />
</asp:Content>