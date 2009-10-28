<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FAPMaintenance.aspx.cs" Inherits="FAPMaintenance" Title="FAP Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <center><h1> FAP Maintenance</h1></center>
        <table border="1" cellspacing="0" cellpadding="3">
   
    <tr>    
    <td style="background-color:Silver; font-weight:bold">
    <asp:Label id="lblID" Text="FAP Name:" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox runat="server" ID="TextBox2"  Width="200px" />
    </td>
    </tr>
     <tr>    
    <td style="background-color:Silver; font-weight:bold">
    <asp:Label id="Label1" Text="Program Name:" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox runat="server" ID="TextBox3"  Width="200px" />
    </td>
    </tr>
      <tr>    
    <td style="background-color:Silver; font-weight:bold">
    <asp:Label id="Label2" Text="Type:" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox runat="server" ID="TextBox4"  Width="200px" />
    </td>
    </tr>
    <tr>
    <td style="background-color:Silver; font-weight:bold">
    <asp:Label id="lblExamName" Text="Rights:" runat="server"></asp:Label>
    </td>
    <td>
                    <asp:CheckBoxList runat="server" ID="CheckBoxList1">                    
                    <asp:ListItem Text="Exam" Value="Take Exam" />
                    <asp:ListItem Text="Survey" Value="Take Survey" />              
                    <asp:ListItem Text="Certificate" Value="Print Certiificate" />
                                     
                    </asp:CheckBoxList>
    </td>
    </tr>
    <tr>
    <td style="background-color:Silver; font-weight:bold" class="style2">
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

