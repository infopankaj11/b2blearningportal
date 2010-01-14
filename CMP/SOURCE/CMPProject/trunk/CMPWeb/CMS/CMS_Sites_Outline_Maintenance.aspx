<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CMS_Sites_Outline_Maintenance.aspx.cs" Inherits="Web.CMS.CMS_Sites_Outline_Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Content Management Portal</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
function ClearFields()
{    
    document.getElementById('ctl00_ContentPlaceHolder1_txtOutlineName').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_ddlSortNumber').selectedIndex = 0;
    document.getElementById('ctl00_ContentPlaceHolder1_txtOutlineRemark').value = '';
    
}

function CheckSubmit()
{
        var pOutlineName = document.getElementById('ctl00_ContentPlaceHolder1_txtOutlineName');
        var pOutlineRemark = document.getElementById('ctl00_ContentPlaceHolder1_txtOutlineRemark');
        
        if ((pOutlineName.value == null)||(pOutlineName.value.length==0))
	    {
	        alert("Outline Name cannot be empty");
	        pOutlineName.focus();
	        return false;
	    }			 
}
</script>

    <center><h1> Site Outline Maintenance </h1></center>
        <center><h1><asp:Label ID="lblTitle" runat="server"></asp:Label></h1></center>
    <table border="1" cellspacing="0" cellpadding="3">
    <tr>
    <td >
    <asp:Label id="lblOutlineName" Text="Outline Name" runat="server"></asp:Label>
    &nbsp; <asp:Label id="Label1" ForeColor="Red" Text="*" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtOutlineName" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblOutlineRemark" Text="Outline Remark" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtOutlineRemark" Rows="5" TextMode="MultiLine" runat="server"></asp:TextBox>    
    </td>
    </tr>    
    <tr>
    <td >
    <asp:Label id="lblSortNumber" Text="Sort Number" runat="server"></asp:Label>
    &nbsp; <asp:Label id="Label3" ForeColor="Red" Text="*" runat="server"></asp:Label>
    </td>
    <td>
    <asp:DropDownList ID="ddlSortNumber" runat="server"></asp:DropDownList>    
    </td>
    </tr>
    </table>
        <br />
        <br />
        <b><asp:Label ID="lblMessage" runat="server"></asp:Label></b>
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Save" runat="server" onclick="btnAdd_Click" OnClientClick="JavaScript:return CheckSubmit();" />
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
<asp:HiddenField ID="hdnPageID" runat="server" Value="0" />
<asp:HiddenField ID="hdnCompanyName" runat="server" Value="0" />
<asp:HiddenField ID="hdnSiteName" runat="server" Value="0" />
<asp:HiddenField ID="hdnMaxSortNum" runat="server" Value="0" />
</asp:Content>