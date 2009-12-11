<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ContentPyramid_Maintenance.aspx.cs" Inherits="Web.CMS.ContentPyramid_Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Content Management Portal</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <script language="javascript" type="text/javascript">
    function postBackByObject()
{
    var o = window.event.srcElement;
    if (o.tagName == "INPUT" && o.type == "checkbox")
    {
       __doPostBack("","");
    } 
}

</script>

    <style type="text/css">
        .style1
        {
            height: 121px;
        }
    </style>
    
    <table>
    <tr>
    <td>
    <table>
    <tr>
    <td class="style1">
    <asp:TextBox ID="txt" runat="server" Width="141px"></asp:TextBox>
    <asp:Button ID="btn" runat="server" Text="Add" onclick="btn_Click"/> &nbsp;
    <asp:Button ID="chg" runat="server" Text="Edit" onclick="chg_Click" /> &nbsp;
    <asp:Button ID="save" runat="server" Text="Save" onclick="save_Click" /> 
    <br /> <br />
    <asp:Button ID="lt" runat="server" Text="  <  " onclick="lt_Click" /> &nbsp;
    <asp:Button ID="up" runat="server" Text="UP" onclick="up_Click" /> &nbsp;
    <asp:Button ID="down" runat="server" Text="DOWN" onclick="down_Click" /> &nbsp;
    <asp:Button ID="gr" runat="server" Text="  >  " onclick="gr_Click" /> &nbsp;
    <asp:Button ID="btnTag" Text="Link Page" runat="server" onclick="btnTag_Click" />
            
    <asp:HiddenField ID="nodeValue" runat="server" />
    <asp:HiddenField ID="hdnSiteName" runat="server" />
    <asp:HiddenField ID="hdnSiteID" runat="server" />
    </td>
    </tr>
    <tr>
    <td>
    <asp:TreeView ID="tv" runat="server" onclick="javascript:postBackByObject()"
            ontreenodecheckchanged="tv_TreeNodeCheckChanged">
    </asp:TreeView>
    </td>
    </tr>    
    </table>
    </td>
    <td>
    <table>
    <tr>
    <td>     
    <asp:ListBox ID="lbContentPage" SelectionMode="Single" runat="server" 
            Height="252px" Width="242px"></asp:ListBox>
    </td>
    </tr>
    </table>
    </td>
    </tr>
    </table>
</asp:Content>