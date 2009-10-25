<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DAPMaintenance.aspx.cs" Inherits="DAPMaintenance" Title="DAP Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <center><h1> DAP Maintenance</h1></center>
    <table border="1" cellspacing="0" cellpadding="3">
  
    <tr>    
    <td style="background-color:Silver; font-weight:bold">
    <asp:Label id="lblID" Text="DAP Name:" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox runat="server" ID="TextBox2"  Width="200px" />
    </td>
    </tr>
     <tr>    
    <td style="background-color:Silver; font-weight:bold">
    <asp:Label id="Label1" Text="Module Name:" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox runat="server" ID="TextBox3"  Width="200px" />
    </td>
    </tr>
   
    <tr>
    <td style="background-color:Silver; font-weight:bold">
    <asp:Label id="lblExamName" Text="Type:" runat="server"></asp:Label>
    </td>
    <td>
                    <asp:CheckBoxList runat="server" ID="CheckBoxList1">                    
                    <asp:ListItem Text="BAYERTR1" Value="BAYERTR1" />
                    <asp:ListItem Text="BAYERTR2" Value="BAYERTR2" />              
                    <asp:ListItem Text="NTUC11" Value="NTUC11" />
                    <asp:ListItem Text="NTUC12" Value="NTUC12" />  
                    <asp:ListItem Text="NTUC13" Value="NTUC13" />                          
                    </asp:CheckBoxList>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblExamAbbr" Text="Description" runat="server"></asp:Label>
    </td>
    <td class="style2">
   <asp:TextBox runat="server" ID="TextBox1" Height="100px" Width="200px" />
    </td>
  
    <td class="style2">

</td>
</tr></table>        
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Add" runat="server" />
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

