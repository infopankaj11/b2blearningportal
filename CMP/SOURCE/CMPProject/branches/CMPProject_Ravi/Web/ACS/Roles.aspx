<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Roles.aspx.cs" Inherits="Roles" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>
    <table cellpadding="0" cellspacing = "0" width="100%">
            <tr>
            <td style="width:40%">
                <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                <td style="height:30px; width:30%">
                    <b>Role Name: 
                </b> 
                </td>
                <td style="width:70%">
                    <asp:TextBox runat="server" ID="tbRoleName" Width="120px"></asp:TextBox>
                </td>
                </tr>
                
                <tr>
                <td valign="top" class="style5" >
                    <b>FAPs: 
                </b> 
                </td>
                <td class="style6" valign="top" >
                    <asp:HyperLink runat="server" ID="hl_FAP1" Text="FAP1" NavigateUrl="~/Role.aspx?FAPName=fap1" /> <br />
                    <asp:HyperLink runat="server" ID="hl_FAP2" Text="FAP2" NavigateUrl="~/Role.aspx?FAPName=fap2" /> <br />
                    <asp:HyperLink runat="server" ID="hl_FAP3" Text="FAP3" NavigateUrl="~/Role.aspx?FAPName=fap3" /> <br />
                </td>
                </tr>
                
                <tr>
                <td valign="top" class="style7" valign="top" >
                    <b>DAPs: 
                </b> 
                </td>
                <td class="style8" valign="top" >
                    <asp:HyperLink runat="server" ID="hl_DAP1" Text="DAP1" NavigateUrl="~/Role.aspx?DAPName=dap1" /> <br />
                    <asp:HyperLink runat="server" ID="hl_DAP2" Text="DAP2" NavigateUrl="~/Role.aspx?DAPName=dap2" /> <br />
                    <asp:HyperLink runat="server" ID="hl_DAP3" Text="DAP3" NavigateUrl="~/Role.aspx?DAPName=dap3" /> <br />
                </td>
                </tr>
                
                <tr>
                <td valign="top" >
                    <b>Description:</b>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="tbDesc" Height="100px" Width="200px" />
                </td>
                </tr>
                
                <tr>
                <td colspan="2" align="center" >
                    <asp:Button runat="server" ID="btnAdd" Text="Add" SkinID="button" />
                    <asp:Button runat="server" ID="btnUpdate" Text="Update" SkinID="button" />
                    <asp:Button runat="server" ID="btnDelete" Text="Delete" SkinID="button" />
                </td>
                </tr>
                </table>
            </td>
            
            <td style="width:60%" valign="top" >
                <asp:GridView Width="100%" runat="server" ID="gv_Roles" AutoGenerateColumns="false" >
                <Columns>
                <asp:TemplateField HeaderText = "Role Name">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" ID="HyperLink1" Text='<%#Eval("RoleName") %>' NavigateUrl = '<%#Eval("RoleName", "~/Role.aspx?RoleName={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Description" DataField = "Description" />
                </Columns>
                </asp:GridView>
                
                <p />
                
                <asp:GridView Width="100%" runat="server" ID="gv_DAPs" AutoGenerateColumns="false" >
                <Columns>
                    <asp:BoundField HeaderText="DAPName" DataField = "Description" />
                    <asp:BoundField HeaderText="Description" DataField = "Description" />
                </Columns>
                </asp:GridView>
                
                <p />
                
                <asp:GridView Width="100%" runat="server" ID="gv_FAPs" AutoGenerateColumns="false" >
                <Columns>
                    <asp:BoundField HeaderText="FAPName" DataField = "Description" />
                    <asp:BoundField HeaderText="Description" DataField = "Description" />
                </Columns>
                </asp:GridView>
            </td>
            
            </tr>
        </table>
    </div>
    
</asp:Content>

