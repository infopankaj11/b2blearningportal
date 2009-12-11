<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CMS_Pages.aspx.cs" Inherits="CMPWeb.CMS.CMS_Pages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Content Management Portal</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center><h1> Page Maintenance </h1></center> <br />
    <b><asp:Label ID="lblCompany" Text="Company Name: " runat="server"></asp:Label> </b>
    <asp:Label ID="lblCompanyName" runat="server"></asp:Label> <br />
    <b><asp:Label ID="lblSite" Text="Site Name: " runat="server"></asp:Label></b>
    <asp:Label ID="lblSiteName" runat="server"></asp:Label> <br />
    <b><asp:Label ID="lblOutline" Text="Outline: " runat="server"></asp:Label></b>
    <asp:Label ID="lblOutlineName" runat="server"></asp:Label>
    <br />
    <br />
    <table width="100%" class="frame">
    <tr>
    <td width="100%" >
        <asp:datagrid id="dgPages" runat="server" Font-Size="Medium" AutoGenerateColumns="False"
			AllowPaging="True"  BorderStyle="Solid">
			<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
			<EditItemStyle></EditItemStyle>
			<AlternatingItemStyle></AlternatingItemStyle>
			<ItemStyle></ItemStyle>
			<HeaderStyle></HeaderStyle>
			<FooterStyle BackColor="#CCCC99"></FooterStyle>
			<Columns>
			    <asp:BoundColumn Visible="False" DataField="CHILD_PAGE_ID" HeaderText="CHILD_PAGE_ID">				
				</asp:BoundColumn>
				<asp:BoundColumn Visible="False" DataField="Page_Name" HeaderText="PAGE NAME">				
				</asp:BoundColumn>
				<asp:BoundColumn Visible="False" DataField="CHILD_SORT_PAGE_NUM" HeaderText="SORTNUMBER">
				</asp:BoundColumn>
				<asp:TemplateColumn HeaderText="">
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;<asp:RadioButton ID="rbSelect" runat="server" />
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Page Name">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;
				<asp:LinkButton id="LinkButton1" OnClick="EditOutline" runat="server">
				<%# DataBinder.Eval(Container.DataItem, "PAGE_NAME")%>
				</asp:LinkButton>	
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Page Caption">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;				
				<%# DataBinder.Eval(Container.DataItem, "PAGE_CAPTION")%>				
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Meta Title">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;				
				<%# DataBinder.Eval(Container.DataItem, "META_TITLE")%>				
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Meta Keywords">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;				
				<%# DataBinder.Eval(Container.DataItem, "META_KEYWORDS")%>				
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Sort Number">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;				
				<%# DataBinder.Eval(Container.DataItem, "CHILD_SORT_PAGE_NUM")%>				
				</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Is Published">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;				
				<%# DataBinder.Eval(Container.DataItem, "IS_PUBLISHED")%>				
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
    <asp:Button ID="btnManagePage" Text="Manage Page" runat="server" 
            onclick="btnManagePage_Click" />
    <asp:Button ID="btnGoOutline" Text="GoTo Outline" runat="server" onclick="btnGoOutline_Click" 
             />
    
    </td>
    </tr>
    </table>
<asp:HiddenField ID="hdnSiteID" runat="server" Value="0" />    
<asp:HiddenField ID="hdnPageID" runat="server" Value="0" />
</asp:Content>