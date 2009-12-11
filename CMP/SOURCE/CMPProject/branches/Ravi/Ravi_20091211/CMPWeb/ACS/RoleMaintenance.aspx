<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="RoleMaintenance.aspx.cs" Inherits="CMPWeb.ACS.RoleMaintenance" Title="Role Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center><h1> Role Maintenance</h1></center>

        <table cellpadding="0" cellspacing="0" width="100%" >
            <tr>
                <td colspan="2">
                    <table border="1" cellspacing="0" cellpadding="3" >
                        <tr>
                            <td style="background-color:Silver; font-weight:bold" align="center" >
                                Role Name:
                            </td>
                            
                            <td>
                                <asp:TextBox runat="server" ID="txtRoleName" Width="300px" />
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:Silver; font-weight:bold" align="center" >
                                Remark:
                            </td>
                            
                            <td>
                                <asp:TextBox runat="server" ID="txtRoleRemark" Width="300px" />
                            </td>
                        </tr>
                    </table> 
                </td>
            </tr>
            
            <tr>
                <td valign="top" >
                    <table border="1" cellspacing="0" cellpadding="3">
                        <tr>
                            <td style="background-color:Silver; font-weight:bold" align="center" >
                                FAP List
                            </td> 
                        </tr>
                        
                        <tr>
                            <td>
                                <asp:GridView runat="server" ID="gv_FAPs" AutoGenerateColumns="false" 
                                        OnRowDataBound="gv_FAPs_RowDataBound" DataKeyNames="FAPListID" >
                                    <Columns>
                                        <asp:TemplateField>
                                            <itemstyle horizontalalign="Center" />
                                            
                                            <itemtemplate>
                                                <asp:CheckBox id="chkFAPSelected" runat="server" />
                                                <asp:HiddenField ID="hfdHasFAP" Value='<%#Eval("HasFAP")%>' runat="server" />
                                            </itemtemplate>
                                        </asp:TemplateField>                    
                                        <asp:BoundField DataField="FAPName" HeaderText="FAP Name" />
                                        <asp:BoundField DataField="FAP_Remark" HeaderText="Remark" /> 
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table> 
                </td>
                
                <td valign="top" >
                    <table border="1" cellspacing="0" cellpadding="3">
                        <tr>
                            <td style="background-color:Silver; font-weight:bold" align="center" >
                                DAP List
                            </td> 
                        </tr>
                        
                        <tr>
                            <td>
                                <asp:Panel Height="250px" ScrollBars="Auto" runat="server" ID="pnlDAPs">
                                    <asp:GridView runat="server" ID="gv_DAPs" AutoGenerateColumns="false" 
                                            OnRowDataBound="gv_DAPs_RowDataBound" DataKeyNames="DAPListID" >
                                        <Columns>
                                            <asp:TemplateField>
                                                <itemstyle horizontalalign="Center" />
                                                
                                                <itemtemplate>
                                                    <asp:CheckBox id="chkDAPSelected" runat="server" />
                                                    <asp:HiddenField ID="hfdHasDAP" Value='<%#Eval("HasDAP")%>' runat="server" />
                                                </itemtemplate>
                                            </asp:TemplateField>                    
                                            <asp:BoundField DataField="DAPName" HeaderText="DAP Name" />
                                            <asp:BoundField DataField="DAP_Remark" HeaderText="Remark" /> 
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel> 
                            </td>
                        </tr>
                    </table>
                </td>
                
            </tr>
        </table> 
        
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnAddUpdate" Text="Add" runat="server" Width="80px" OnClick="btnAddUpdate_Click" />
                </td>
                <td>
                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" Width="80px" OnClick="btnCancel_Click" /> 
                </td>
            </tr>
        </table>
        
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" />
                    <asp:Label runat="server" ID="lblRoleID" Visible="false" Text="" />
                    <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
                </td>
            </tr>
        </table>
    
</asp:Content>