<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PortalAdminAdd.aspx.cs" Inherits="PortalAdminAdd" Title="Create a Portal admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1>Create a Portal Admin</h1></center>

       <table border="1" cellspacing="0" cellpadding="3">
   
    <tr>    
    <td style="background-color:Silver; font-weight:bold">
    <asp:Label id="lblID" Text="User ID:" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox runat="server" ID="TextBox2"  Width="200px" />
    </td>
    </tr>
     <tr>    
    <td style="background-color:Silver; font-weight:bold" >
        Employee ID:
    </td>
    <td class="style1">
    <asp:TextBox runat="server" ID="TextBox3"  Width="200px" />
    </td>
    </tr>
      <tr>    
    <td style="background-color:Silver; font-weight:bold">
        Name:</td>
    <td>
    <asp:TextBox runat="server" ID="TextBox4"  Width="200px" />
    </td>
    </tr>
    <tr>
    <td style="background-color:Silver; font-weight:bold">
        Email:</td>
    <td>
    <asp:TextBox runat="server" ID="TextBox5"  Width="200px" />
    </td>
    </tr>
   </table>        
    <table>
    <tr>
    <td>
    <asp:Button ID="Button1" Text="Add" runat="server" />
    </td>
    <td>
    <asp:Button ID="Button2" Text="Clear" runat="server" />
    </td>
    <td>
    <asp:Button ID="Button4" Text="Cancel" runat="server" />
          
    </td>
    </tr>
    </table>
    
</asp:Content>

