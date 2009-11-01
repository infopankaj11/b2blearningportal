<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SectionAdd.aspx.cs" Inherits="SectionAdd" Title="Add a Section" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center><h1> Add Section </h1></center>
<center><h2> Sun Certified Java Developer (SCJD)</h2></center>
        <table border="1" cellspacing="0" cellpadding="3">
    <tr>    
    <td >
    <asp:Label id="lblID" Text="Section ID" runat="server"></asp:Label>
    </td>
    <td>
    <asp:Label id="lblModuleID" runat="server"></asp:Label>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblExamName" Text="Section Name" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtExamName" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblExamAbbr" Text="Section Abbreviation" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
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
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label3" Text="Total Easy Question" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label4" Text="Easy Question Weight" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label5" Text="Total Medium Question" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label6" Text="Medium Question Weight" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label7" Text="Total High Question" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label8" Text="High Question Weight" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
    </td>
    </tr>
    </table>
        <br />
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Add" runat="server" />
    </td>
    <td>
    <asp:Button ID="Button1" Text="Clear" runat="server" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Cancel" runat="server"
            onclick="btnCancel_Click" />
    </td>
    </tr>
    </table>
    
</asp:Content>

