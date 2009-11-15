<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PortalAdmin.aspx.cs" Inherits="PortalAdmin" Title="Portal Admin page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1>Portal Administration Maintenance</h1></center>
 
<table>
<tr>
<td>
    <table class="search">
    <tr align="right">
    <td>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button4" Text="Search" runat="server" />
    </td>
    </tr>
    <tr align="right">
    <td>
    <asp:RadioButton id="RadioButton2" Text="by Exam" runat="server"/>
    <asp:RadioButton id="RadioButton3" Text="by Module" runat="server"/>
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
                <asp:GridView Width="100%" runat="server" ID="gv_PAdmins" AutoGenerateColumns="false" >
                <Columns>
                <asp:TemplateField HeaderText = "User ID" HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" ID="HyperLink1" Text='<%#Eval("UserName") %>' NavigateUrl = '<%#Eval("UserName", "~/PortalAdmin.aspx?UserName={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Employee ID" DataField = "EmployeeID" HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true" />
                <asp:BoundField HeaderText="Employee Name" DataField = "EmployeeName" HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true" />
                <asp:BoundField HeaderText="Email" DataField = "Email" HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true" />
                </Columns>
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

