<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FAP.aspx.cs" Inherits="FAP" Title="FAP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center><h1>FAP Maintenance</h1></center>
 
<table>
<tr>
<td>
   <table class="search">
    <tr align="right">
    <td class="style1">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button4" Text="Search" runat="server" />
    </td>
    </tr>
    <tr align="right">
    <td>
    <asp:RadioButton id="RadioButton2" Text="by Company" runat="server"/>
    <asp:RadioButton id="RadioButton3" Text="by Name" runat="server"/>
    </td>
    </tr>
    </table>

</td>
</tr>
<tr>
<td>
    <table border="1" cellspacing="0" cellpadding="3">
   <tr>
   <td style="width:60%" valign="top" >
                <asp:GridView Width="100%" runat="server" ID="gv_FAPs" >
                </asp:GridView>
            </td>
    </tr>
    </table>
    <br />
  </td>
</tr>  
<tr>
<td>
    <table>
    <tr>
        <td>
        <asp:Button ID="btnAdd" Text="Add" runat="server" onclick="btnAdd_Click" />
        </td>
        <td>
        <asp:Button ID="btnDelete" Text="Delete" runat="server" />
        </td>
        <td>
        <asp:Button ID="Button5" Text="Modify" runat="server" onclick="btnAdd_Click" />
        </td>
        <td>
        <asp:Button ID="Button6" Text="Cancel" runat="server" />
        </td>
    </tr>
    </table>

</td>
</tr>
</table>    
</asp:Content>

