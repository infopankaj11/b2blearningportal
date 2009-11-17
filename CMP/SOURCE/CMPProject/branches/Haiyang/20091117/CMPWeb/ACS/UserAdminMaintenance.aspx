<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="UserAdminMaintenance.aspx.cs" Inherits="CMPWeb.ACS.UserAdminMaintenance" Title="User Admin Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center><h1> User Admin Maintenance</h1></center>
 
    <table border="1" cellspacing="0" cellpadding="3">
        <tr>    
            <td style="background-color:Silver; font-weight:bold">
                User Admin Name:
            </td> 
            <td>
                <asp:TextBox runat="server" ID="txtUserAdminName" Width="400px" />
            </td>
        </tr>
        
        <tr>    
            <td style="background-color:Silver; font-weight:bold">
                Remark: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtUserAdminRemark" Width="400px" />
            </td>
        </tr>
        
        <tr>
            <td style="background-color:Silver; font-weight:bold" />
            <td>
                <asp:CheckBox runat="server" ID="chkChangePass" Text="Reset Password" OnCheckedChanged="chkChangePass_OnCheckedChanged" AutoPostBack="true" />
            </td>
        </tr>
        
        <tr runat="server" id="tr_Password">    
            <td style="background-color:Silver; font-weight:bold">
                Password: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtPassword" Width="400px" TextMode="Password" />
            </td>
        </tr>
        
        <tr runat="server" id="tr_ConfirmPassword">    
            <td style="background-color:Silver; font-weight:bold">
                Confirm Password: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtConfirmPassword" Width="400px" TextMode="Password" />
            </td>
        </tr>
        
        <tr>
            <td style="background-color:Silver; font-weight:bold">
                Roles:
            </td>
            <td>
                <asp:GridView runat="server" ID="gv_Roles" AutoGenerateColumns="false" 
                    OnRowDataBound="gv_Roles_RowDataBound" DataKeyNames="RoleListID" >
                    <Columns>
                        <asp:TemplateField>
                            <itemstyle horizontalalign="Center" />
                            
                            <itemtemplate>
                                <asp:CheckBox id="chkRoleSelected" runat="server" />
                                <asp:HiddenField ID="hfdHasRole" Value='<%#Eval("HasRole")%>' runat="server" />
                            </itemtemplate>
                        </asp:TemplateField>    
                        <asp:BoundField DataField="RoleName" HeaderText="Name" />             
                        <asp:BoundField DataField="Role_Remark" HeaderText="Remark" />
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
                <asp:Label runat="server" ID="lblUserAdminID" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
            </td>
        </tr>
    </table>

</asp:Content>

