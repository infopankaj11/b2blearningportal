<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CMS_Sites.aspx.cs" Inherits="Web.CMS.CMS_Sites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Content Management Portal</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1> Company-Site Maintenance </h1></center>

    <table width="100%" class="frame">
    <tr>
    <td width="100%" >
        <asp:datagrid id="dgSites" runat="server" Font-Size="Medium" AutoGenerateColumns="False"
			AllowPaging="True"  BorderStyle="Solid">
			<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
			<EditItemStyle></EditItemStyle>
			<AlternatingItemStyle></AlternatingItemStyle>
			<ItemStyle></ItemStyle>
			<HeaderStyle></HeaderStyle>
			<FooterStyle BackColor="#CCCC99"></FooterStyle>
			<Columns>
			    <asp:BoundColumn Visible="False" DataField="SITE_ID" HeaderText="SITEID">				
				</asp:BoundColumn>
				<asp:BoundColumn Visible="False" DataField="SITE_NAME" HeaderText="SITENAME">
				</asp:BoundColumn>
				<asp:BoundColumn Visible="False" DataField="COMPANYID" HeaderText="COMPANYID">
				</asp:BoundColumn>
				<asp:BoundColumn Visible="False" DataField="COMPANYNAME" HeaderText="COMPANYNAME">				
				</asp:BoundColumn>
				<asp:TemplateColumn HeaderText="">
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;<asp:RadioButton ID="rbSelect" runat="server" />
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Site Name">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				<asp:LinkButton id="LinkButton1" OnClick="EditSite" runat="server">
				<%# DataBinder.Eval(Container.DataItem, "SITE_NAME")%>
				</asp:LinkButton>
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Company Name">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>								
				<%# DataBinder.Eval(Container.DataItem, "COMPANYNAME")%>
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Style Sheet">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				<%# DataBinder.Eval(Container.DataItem, "STYLE_SHEET")%>
				</ItemTemplate>
				</asp:TemplateColumn>				
				<asp:TemplateColumn HeaderText="Site Folder">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				<%# DataBinder.Eval(Container.DataItem, "SITE_FOLDER")%>
				</ItemTemplate>
				</asp:TemplateColumn>
				</Columns>
				<PagerStyle BorderColor="White" HorizontalAlign="Right" ForeColor="#003300" Position="TopAndBottom"
				BackColor="Transparent" Mode="NumericPages"></PagerStyle>
		</asp:datagrid>    
    </td>
    </tr>
    </table>
    <br />
        <br />
        <b><asp:Label ID="lblMessage" runat="server"></asp:Label></b>
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Add" runat="server" onclick="btnAdd_Click" />
    <asp:Button ID="btnDelete" Text="Delete" runat="server" onclick="btnDelete_Click" />    
    <asp:Button ID="btnManageSite" Text="Manage Outline" runat="server" 
            onclick="btnManageSite_Click" />
    </td>
    </tr>
    </table>
</asp:Content>