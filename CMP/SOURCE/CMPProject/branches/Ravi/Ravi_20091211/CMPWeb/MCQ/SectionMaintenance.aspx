<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SectionMaintenance.aspx.cs" Inherits="SectionMaintenance" Title="Add a Section" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center><h1>  <asp:Label ID="lblOperation"  runat="server" Text=""> </asp:Label> </h1></center>
<center><h2> <asp:Label ID="lblExamName"  runat="server" Text=""></asp:Label>  </h2></center>

        <table border="1" cellspacing="0" cellpadding="3">
    <tr>    
    <td >
    <asp:Label id="lblID" Text="Fill the information:" runat="server" Font-Bold></asp:Label>
    </td>
    <td>
    <asp:Label id="lblModuleID" runat="server"></asp:Label>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblSectionName" Text="Section Name" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtSectionName" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblSectionAbbr" Text="Section Abbreviation" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtSectionAbbr" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label1" Text="Section Sequence" runat="server"></asp:Label>
    </td>
    <td>
    <asp:DropDownList ID="ddlSeq" runat="server">
    <asp:ListItem>1</asp:ListItem>
    <asp:ListItem>2</asp:ListItem>
    <asp:ListItem>3</asp:ListItem>
    <asp:ListItem>4</asp:ListItem>
    </asp:DropDownList>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label2" Text="Section Weight (%)" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtSectionWeigth" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label3" Text="Total Easy Question" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtEasy" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label4" Text="Easy Question Weight" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtEasyWgt" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label5" Text="Total Medium Question" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtMed" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label6" Text="Medium Question Weight" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtMedWgt" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label7" Text="Total High Question" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtHard" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label8" Text="High Question Weight" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtHrdWgt" runat="server"></asp:TextBox>
    </td>
    </tr>
    </table>
        <br />
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAddUpdate" Text="Add" runat="server"  onclick="btnAddUpdate_Click"/>
    </td>
    <td>
    <asp:Button ID="btnClear" Text="Clear" runat="server"  onclick="btnClear_Click" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Back to Sections" runat="server"
            onclick="btnCancel_Click" />
    </td>
    </tr>
    </table>
    
      <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" />
                <asp:Label runat="server" ID="lblExamID2" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblSectionID" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
            </td>
        </tr>
    </table>
    
</asp:Content>

