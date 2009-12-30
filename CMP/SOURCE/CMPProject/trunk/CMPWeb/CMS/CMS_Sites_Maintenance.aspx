<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CMS_Sites_Maintenance.aspx.cs" Inherits="Web.CMS.CMS_Sites_Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Content Management Portal</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
function ClearFields()
{    
    document.getElementById('ctl00_ContentPlaceHolder1_txtSiteName').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_ddlCompany').selectedIndex = 0;
    document.getElementById('ctl00_ContentPlaceHolder1_ddlStyleSheet').selectedIndex = 0;
    document.getElementById('ctl00_ContentPlaceHolder1_txtFolderName').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_lblMessage').style.visibility = 'hidden';
}

function ContainSpecialChar(str)
{
    var iChars = "!@#$%^&*()+=-[]\';,./{}|\":<>?";

    for (var i = 0; i < str.length; i++) 
    {
  	    if (iChars.indexOf(str.charAt(i)) != -1) 
  	    {  	        
  	        return true;
  	    }
	}	
	return false;
}

function CheckSubmit()
{
        var pSiteName = document.getElementById('ctl00_ContentPlaceHolder1_txtSiteName');
        var pFolderName = document.getElementById('ctl00_ContentPlaceHolder1_txtFolderName');
        var pCompany = document.getElementById('ctl00_ContentPlaceHolder1_ddlCompany')[document.getElementById('ctl00_ContentPlaceHolder1_ddlCompany').selectedIndex].text;
        var pStyleSheet = document.getElementById('ctl00_ContentPlaceHolder1_ddlStyleSheet')[document.getElementById('ctl00_ContentPlaceHolder1_ddlStyleSheet').selectedIndex].text;
        
        if ((pSiteName.value == null)||(pSiteName.value.length==0))
	    {
	        alert("Site Name cannot be empty");
	        pSiteName.focus();
	        return false;
	    }			
	    
	    if (ContainSpecialChar(pSiteName.value))
	    {
	        alert("Site Name should not have special character");
	        pSiteName.focus();
	        return false;
	    }
	    
	    if (pCompany == "Select Company")
	    {
	        alert("Company Name cannot be empty");
	        document.getElementById('ctl00_ContentPlaceHolder1_ddlCompany').focus();
	        return false;
	    }	
	    
	    if (pStyleSheet == "Select Stylesheet")
	    {
	        alert("Style Sheet cannot be empty");
	        document.getElementById('ctl00_ContentPlaceHolder1_ddlStyleSheet').focus();
	        return false;
	    }	
	    
	    if ((pFolderName.value == null)||(pFolderName.value.length==0))
	    {
	        alert("Folder Name cannot be empty");
	        pFolderName.focus();
	        return false;
	    }
	    
	    if (ContainSpecialChar(pFolderName.value))
	    {
	        alert("Folder Name should not have special character");
	        pFolderName.focus();
	        return false;
	    }			
}
</script>
    <center><h1><asp:Label ID="lblTitle" runat="server"></asp:Label></h1></center>
    <table border="1" cellspacing="0" cellpadding="3">
    <tr>
    <td >
    <asp:Label id="lblSiteName" Text="Site Name" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtSiteName" MaxLength="255" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblCompany" Text="Company" runat="server"></asp:Label>
    </td>
    <td>
    <asp:DropDownList ID="ddlCompany" runat="server"></asp:DropDownList>    
    </td>
    </tr>    
    <tr>
    <td >
    <asp:Label id="lblStyleSheet" Text="Style Sheet" runat="server"></asp:Label>
    </td>
    <td>
    <asp:DropDownList ID="ddlStyleSheet" runat="server"></asp:DropDownList>    
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblFolder" Text="Site Folder" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtFolderName" MaxLength="255" runat="server"></asp:TextBox>
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
    <asp:Button ID="btnClear" Text="Clear" OnClientClick="ClearFields();" runat="server" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" onclick="btnCancel_Click" />
    </td>
    </tr>
    </table>
<asp:HiddenField ID="hdnSiteID" runat="server" Value="0" />
</asp:Content>