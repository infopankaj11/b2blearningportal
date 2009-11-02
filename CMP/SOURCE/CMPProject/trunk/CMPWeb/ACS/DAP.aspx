﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DAP.aspx.cs" Inherits="DAP" Title="DAP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1>DAP Maintenance</h1></center>
 
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
    <asp:RadioButton id="RadioButton2" Text="by Company" runat="server"/>
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
                <asp:GridView Width="100%" runat="server" ID="gv_DAPs" AutoGenerateColumns="false" >
                <Columns>
                        <asp:TemplateField HeaderText = "" HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true">
                            <ItemTemplate>
                                <asp:RadioButton ID="chk02" Text="" runat="server" />
                             </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText = "DAP Name" HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" ID="HyperLink1" Text='<%#Eval("DAPName") %>' NavigateUrl = '<%#Eval("DAPName", "~/DAP.aspx?DAPName={0}&DESC=")  + Eval("Description")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Description" DataField = "Description" HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true" />
                        <asp:BoundField HeaderText="Module Name" DataField = "ModuleName" HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true" />
                        <asp:BoundField HeaderText="Type" DataField = "Type" HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true" />
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
