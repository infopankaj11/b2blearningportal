<%@ Page Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="ClientHome.aspx.cs" Inherits="CMPWeb.CMSClient.ClientHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Content Management Portal</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center><h1> <asp:Label ID="lblHeading" runat="server"></asp:Label> </h1></center>
<table width="100%" class="frame">
<tr>
<td width="100%" >
<center>
<asp:datagrid id="dgModules" runat="server" Font-Size="Medium" AutoGenerateColumns="False"
			AllowPaging="True"  BorderStyle="Solid">
			<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
<EditItemStyle></EditItemStyle>
<AlternatingItemStyle></AlternatingItemStyle>
<ItemStyle></ItemStyle>
<HeaderStyle></HeaderStyle>
<FooterStyle BackColor="#CCCC99"></FooterStyle>
<Columns>
    <asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID">				
	</asp:BoundColumn>
    <asp:TemplateColumn HeaderText="Content">
	    <HeaderStyle CssClass="headertext"></HeaderStyle>
		<ItemStyle HorizontalAlign="Left"></ItemStyle>
		<ItemTemplate>
		<asp:LinkButton id="LinkButton1" OnClick="SelectModule" runat="server">
		<%# DataBinder.Eval(Container.DataItem, "MODULE_NAME")%>
		</asp:LinkButton>
		</ItemTemplate>
	</asp:TemplateColumn>				
</Columns>						
</asp:datagrid>
</center>
</td>
</tr>
</table>
<asp:HiddenField id="hdnType" runat="server" />
</asp:Content>

