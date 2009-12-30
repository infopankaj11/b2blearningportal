<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CMS_Site_Outline.aspx.cs" Inherits="CMPWeb.CMS.CMS_Site_Outline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Content Management Portal</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1> Site Outline Maintenance </h1></center> <br />
    <b><asp:Label ID="lblCompany" Text="Company Name: " runat="server"></asp:Label> </b>
    <asp:Label ID="lblCompanyName" runat="server"></asp:Label> <br />
    <b><asp:Label ID="lblSite" Text="Site Name: " runat="server"></asp:Label></b>
    <asp:Label ID="lblSiteName" runat="server"></asp:Label>
    <br />
    <br />

<table width="100%" class="frame">
    <tr>
    <td width="100%" >
        <asp:datagrid id="dgOutline" runat="server" Font-Size="Medium" AutoGenerateColumns="False"
			AllowPaging="True"  BorderStyle="Solid">
			<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
			<EditItemStyle></EditItemStyle>
			<AlternatingItemStyle></AlternatingItemStyle>
			<ItemStyle></ItemStyle>
			<HeaderStyle></HeaderStyle>
			<FooterStyle BackColor="#CCCC99"></FooterStyle>
			<Columns>
			    <asp:BoundColumn Visible="False" DataField="PAGE_ID" HeaderText="PAGEID">
				</asp:BoundColumn>
				<asp:BoundColumn Visible="False" DataField="PAGE_NAME" HeaderText="PAGENAME">
				</asp:BoundColumn>
				<asp:BoundColumn Visible="False" DataField="SORT_NUMBER" HeaderText="SORTNUMBER">
				</asp:BoundColumn>
				<asp:TemplateColumn HeaderText="">
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;<asp:RadioButton ID="rbSelect" runat="server" />
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Outline Name">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;
				<asp:LinkButton id="LinkButton1" OnClick="EditOutline" runat="server">
				<%# DataBinder.Eval(Container.DataItem, "PAGE_NAME")%>			
				</asp:LinkButton>	
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Remark">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;				
				<%# DataBinder.Eval(Container.DataItem, "PAGE_REMARK")%>				
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Page Sort No">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;				
				<%# DataBinder.Eval(Container.DataItem, "SORT_NUMBER")%>				
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
    <asp:Button ID="btnManageContent" Text="Manage Content" runat="server" 
            onclick="btnManageContent_Click" />
    <asp:Button ID="btnAdditionalPage" Text="Create Addtnl Page" runat="server" 
            onclick="btnAdditionalPage_Click" />        
    <asp:Button ID="btnGoSite" Text="GoTo Site" runat="server" 
            onclick="btnGoSite_Click" />
    </td>
    </tr>
    </table>
    <asp:HiddenField ID="hdnSiteID" runat="server" Value="0" />    
</asp:Content>