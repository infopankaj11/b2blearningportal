<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FAPMaintenance.aspx.cs" Inherits="FAPMaintenance" Title="FAP Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <center><h1> FAP Maintenance</h1></center>
 
    <table border="1" cellspacing="0" cellpadding="3">
        <tr>
            <td style="background-color:Silver; font-weight:bold">
                <asp:Label id="lblFAPName" Text="FAP Name:" runat="server"></asp:Label>
            </td>
            
            <td>
                <asp:TextBox runat="server" ID="txtFAPName" Width="200px" />
            </td>
        </tr>
        
        <tr>
            <td>
                <asp:Label id="lblRemark" Text="Remark:" runat="server"></asp:Label>
            </td>
            
            <td>
                <asp:TextBox runat="server" ID="txtFAPRemark" Width="200px" />
            </td>
        </tr>
        
        <tr>
            <td>
                <asp:Label id="lblFunction" Text="Functions:" runat="server"></asp:Label>
            </td>
            
            <td>
                <asp:GridView runat="server" ID="gv_Functions" AutoGenerateColumns="false" ShowHeader="false" 
                    OnRowDataBound="gv_Functions_RowDataBound" DataKeyNames="FAPFunctionID" >
                    <Columns>
                        <asp:TemplateField>
                            <itemstyle horizontalalign="Center" />
                            
                            <itemtemplate>
                                <asp:CheckBox id="chkFunctionSelected" runat="server" />
                                <asp:HiddenField ID="hfdHasFunction" Value='<%#Eval("HasFunction")%>' runat="server" />
                            </itemtemplate>
                        </asp:TemplateField>                    
                        <asp:BoundField DataField="FAP_Function"/>
                    
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
      
    </table>       
     
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

