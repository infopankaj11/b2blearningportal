<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DAPMaintenance.aspx.cs" Inherits="DAPMaintenance" Title="DAP Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center><h1> DAP Maintenance</h1></center>
 
    <table border="1" cellspacing="0" cellpadding="3">
        <tr>    
            <td style="background-color:Silver; font-weight:bold">
                DAP Name:
            </td> 
            <td>
                <asp:TextBox runat="server" ID="txtDAPName" Width="400px" />
            </td>
        </tr>
        
        <tr>    
            <td style="background-color:Silver; font-weight:bold">
                Remark: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtDAPRemark" Width="400px" />
            </td>
        </tr>
        
        <tr>
            <td style="background-color:Silver; font-weight:bold">
                Modules:
            </td>
            <td>
                <asp:GridView runat="server" ID="gv_Modules" AutoGenerateColumns="false" 
                    OnRowDataBound="gv_Modules_RowDataBound" DataKeyNames="module_id" >
                    <Columns>
                        <asp:TemplateField>
                            <itemstyle horizontalalign="Center" />
                            
                            <itemtemplate>
                                <asp:CheckBox id="chkModuleSelected" runat="server" />
                                <asp:HiddenField ID="hfdHasModule" Value='<%#Eval("HasModule")%>' runat="server" />
                            </itemtemplate>
                        </asp:TemplateField>    
                        <asp:BoundField DataField="module_name" HeaderText="Name" />             
                        <asp:BoundField DataField="module_type" HeaderText="Type" />
                        <asp:BoundField DataField="module_remarks" HeaderText="Remark" />
                    </Columns>
                </asp:GridView>
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
                <asp:Label runat="server" ID="lblDAPID" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
            </td>
        </tr>
    </table>

</asp:Content>

