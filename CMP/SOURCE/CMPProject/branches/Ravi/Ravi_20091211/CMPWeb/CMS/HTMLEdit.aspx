<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="HTMLEdit.aspx.cs" Inherits="CMPWeb.CMS.HTMLEdit" validateRequest="false"%>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Content Management Portal</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script language="javascript" type="text/javascript">
// <!CDATA[

function Button5_onclick() {
   
}


// ]]>
</script>

<table class="TableForm">
    <tr>
        <th class="TableFormTdLeft" colspan="2">
            <h2 class="TableFormH2">
                Module Contents</h2>
                Hint: You can use <a href="FileManager.aspx" target="_blank">File Manager</a> to upload images.                
        </th>
    </tr>
    
    <tr>
        <td>
            <asp:RadioButtonList ID="rbEditorSelection" runat="server" AutoPostBack="True" RepeatDirection="Horizontal"
                Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                <asp:ListItem Selected="True" Value="1">HTML Editor</asp:ListItem>
                <asp:ListItem Value="2">HTML Source</asp:ListItem>
            </asp:RadioButtonList>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="~/FCKeditor/" Height="400px">
                </FCKeditorV2:FCKeditor>
            </asp:View>
                           
                <asp:View ID="View2" runat="server">
            <asp:TextBox ID="Html_Text" Width="100%" runat="server" TextMode="MultiLine" Height="400px"></asp:TextBox></asp:View>
            </asp:MultiView>
            <br />
        </td>
    </tr>
    <tr>
        <td style="width: 402px">
            <asp:Button ID="btnSave" runat="server" Text="Save" Width="30%" 
                onclick="btnSave_Click"/>
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="30%" 
                onclick="btnCancel_Click" />
            &nbsp;&nbsp;
        </td>
    </tr>
</table>
<asp:HiddenField ID="hdnPageModID" runat="server" Value="0" />    
<asp:HiddenField ID="hdnPageName" runat="server" Value="0" />    
<asp:HiddenField ID="hdnSiteID" runat="server" Value="0" />    
<asp:HiddenField ID="hdnPageID" runat="server" Value="0" />
<asp:HiddenField ID="hdnCompanyName" runat="server" Value="0" />    
<asp:HiddenField ID="hdnSiteName" runat="server" Value="0" />
<asp:HiddenField ID="hdnOutlineName" runat="server" Value="0" />

<asp:Literal ID="Literal1" runat="server"></asp:Literal>
</asp:Content>