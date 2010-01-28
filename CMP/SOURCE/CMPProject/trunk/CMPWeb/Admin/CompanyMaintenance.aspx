<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeBehind="CompanyMaintenance.aspx.cs" Inherits="CMPWeb.Admin.CompanyMaintenance" Title="Company Maintenance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1>Company Maintenance</h1></center>
 
    <table border="1" cellspacing="0" cellpadding="3">
        <tr>    
            <td style="background-color:Silver; font-weight:bold">
                Company Name:
            </td> 
            <td>
                <asp:TextBox runat="server" ID="txtCompanyName" Width="400px" />
            </td>
        </tr>
        
        <tr>    
            <td style="background-color:Silver; font-weight:bold">
                Remark: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtCompanyRemark" Width="400px" />
            </td>
        </tr>

        <tr>
            <td style="background-color:Silver; font-weight:bold">
                Address:
            </td>
            <td>
                 <asp:TextBox runat="server" ID="txtAddress1" Width="400px" />
            </td>
        </tr>
        
        <tr>
            <td style="background-color:Silver; font-weight:bold" />
            <td>
                 <asp:TextBox runat="server" ID="txtAddress2" Width="400px" />
            </td>
        </tr>
        
        <tr>
            <td style="background-color:Silver; font-weight:bold" />
            <td>
                 <asp:TextBox runat="server" ID="txtAddress3" Width="400px" />
            </td>
        </tr>
        
        <tr>
            <td style="background-color:Silver; font-weight:bold" >
                Postal Code:
            </td> 
            <td>
                 <asp:TextBox runat="server" ID="txtPostalCode" Width="400px" />
            </td>
        </tr>
        
        <tr>
            <td style="background-color:Silver; font-weight:bold" >
                Contact Person:
            </td> 
            <td>
                 <asp:TextBox runat="server" ID="txtContactPerson" Width="400px" />
            </td>
        </tr>
        
        <tr>
            <td style="background-color:Silver; font-weight:bold" >
                Contact Email:
            </td> 
            <td>
                 <asp:TextBox runat="server" ID="txtContactEmail" Width="400px" />
            </td>
        </tr>
        
        <tr>
            <td style="background-color:Silver; font-weight:bold" >
                Contact No.:
            </td> 
            <td>
                 <asp:TextBox runat="server" ID="txtContactNo" Width="400px" />
            </td>
        </tr>
        
        <tr>
            <td style="background-color:Silver; font-weight:bold" >
                Valid Period:
            </td> 
            <td>
                From:
                <asp:TextBox runat="server" ID="txtValidFrom" Width="100px" />
                <asp:Image runat="server" ID="imgCalendarFrom" ImageUrl="~/Images/Calendar.gif" />
                    <cc1:CalendarExtender runat="server" ID="ce_From"
                    TargetControlID="txtValidFrom"
                    Format="dd-MMM-yyyy"
                    PopupButtonID="imgCalendarFrom" />
                    
                To:
                <asp:TextBox runat="server" ID="txtValidTo" Width="100px" />
                <asp:Image runat="server" ID="imgCalendarTo" ImageUrl="~/Images/Calendar.gif" />
                    <cc1:CalendarExtender runat="server" ID="ce_To"
                    TargetControlID="txtValidTo"
                    Format="dd-MMM-yyyy"
                    PopupButtonID="imgCalendarTo" />
            </td>
        </tr>
    </table>
            
    <table>
        <tr>
            <td>
                <asp:Button ID="btnAddUpdate" Text="Add" runat="server" Width="80px" OnClick="btnAddUpdate_Click" />
            </td>
            <td>
                <asp:Button ID="btnCancel" Text="Cancel" runat="server" Width="80px" OnClick="btnCancel_Click" /> 
            </td>
        </tr>
    </table>
    
    <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" />
                <asp:Label runat="server" ID="lblCompanyID" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
            </td>
        </tr>
    </table>

</asp:Content>