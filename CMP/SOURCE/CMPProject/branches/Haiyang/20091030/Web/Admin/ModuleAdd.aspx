<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ModuleAdd.aspx.cs" Inherits="ModuleAdd" Title="Add Module" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center><h1> Add a  Module </h1></center>
        <table border="1" cellspacing="0" cellpadding="3">
    <tr>    
    <td >
    <asp:Label id="lblID" Text="Module Name" runat="server"></asp:Label>
    </td>
    <td>
 <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblExamName" Text="Company" runat="server"></asp:Label>
    </td>
    <td>
           <asp:DropDownList ID="ddlSeq" runat="server">
            <asp:ListItem>Bayer</asp:ListItem>
            <asp:ListItem>NTUC</asp:ListItem>
              </asp:DropDownList>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblExamAbbr" Text="Description" runat="server"></asp:Label>
    </td>
    <td>
   <asp:TextBox runat="server" ID="TextBox1" Height="100px" Width="200px" />
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label1" Text="Validity" runat="server"></asp:Label>
    </td>
    <td>
        From: <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar><br />
        To:  <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label2" Text="User Admin" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><asp:Button ID="Button2"
        runat="server" Text="Browse users" />
    </td>
    </tr>
     <tr>
    <td >
    <asp:Label id="Label3" Text="No of users" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
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
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" />
    </td>
    </tr>
    </table>
</asp:Content>

