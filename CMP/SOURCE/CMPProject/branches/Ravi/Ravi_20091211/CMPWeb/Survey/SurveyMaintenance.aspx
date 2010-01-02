<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SurveyMaintenance.aspx.cs" Inherits="SurveyMaintenance" Title="Survey Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center><h1>Add Survey</h1></center>
    <table border="1" cellspacing="0" cellpadding="3">
    <tr>    
    <td >
    <asp:Label id="lblID" Text="Fill the information:" runat="server" Font-Bold></asp:Label>
    </td>
    <td>
    <asp:Label id="lblSurveyID" runat="server"></asp:Label>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblSurveyName" Text="Survey Name" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtSurveyName" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblSurveyAbbr" Text="Survey Abbreviation" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtAbbr" runat="server"></asp:TextBox>
    </td>
    </tr>
    </table>
        <br />
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAddUpdate" Text="Add" runat="server" onclick="btnAddUpdate_Click" />
    </td>
    <td>
    <asp:Button ID="Button1" Text="Clear" runat="server" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" onclick="btnCancel_Click" />
    </td>
    </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" />
                <asp:Label runat="server" ID="lblSurveyID2" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
            </td>
        </tr>
    </table>



</asp:Content>

