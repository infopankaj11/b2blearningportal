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
     <table cellpadding="0" cellspacing="0" width="100%" >
        <tr>
            <td style="width:60%" valign="top" >
                <asp:GridView Width="100%" runat="server" ID="gv_FAPs" AutoGenerateColumns="false" DataKeyNames="FAPListID" >
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox runat="server" ID="cbSelectAll" /> 
                        </HeaderTemplate>
                        <itemstyle horizontalalign="Center" />
                        <headerstyle horizontalalign="Center" />
                        
                        <itemtemplate>
                            <asp:CheckBox id="chkSelectedFAP" runat="server" />  
                            <asp:HiddenField ID="hfFAPListID" Value='<%#Eval("FAPListID")%>' runat="server" />
                        </itemtemplate>
                    </asp:TemplateField>
                     
                    <asp:HyperLinkField DataNavigateUrlFields="FAPListID" DataNavigateUrlFormatString="~/ACS/FAPMaintenance.aspx?Action=Update&FAPID={0}"
                         DataTextField="FAPName" NavigateUrl="~/ACS/FAPMaintenance.aspx" HeaderText = "Name"/>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbFAPRemarkHeader" Text="Remark" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbFAPRemark" Text='<%#Eval("FAP_Remark") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbCreatedByHeader" Text="Created By" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbCreatedBy" Text='<%#Eval("Created_By") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbCreatedDateHeader" Text="Created Date" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbCreatedDate" Text='<%#Convert.ToDateTime(Eval("Created_Date")).ToString("dd-MMM-yyyy") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbModifiedByHeader" Text="Modified By" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbModifiedBy" Text='<%#Eval("Modified_By") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbModifiedDateHeader" Text="Modified Date" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbModifiedDate" Text='<%#Convert.ToDateTime(Eval("Modified_Date")).ToString("dd-MMM-yyyy") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
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
        <asp:Button ID="btnAdd" Text="Add" runat="server" onclick="btnAdd_Click" Width="80px" />
        </td>
        <td>
        <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick="btnDelete_Click" Width="80px"/>
        </td>
    </tr>
    </table>
</td>
</tr>

<tr>
<td>
    <asp:Label runat="server" ID="lblMsg" ForeColor="Red" />
</td>
</tr>
</table>    
</asp:Content>

