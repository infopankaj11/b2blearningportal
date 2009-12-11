<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ModuleMaintenance.aspx.cs" Inherits="ModuleMaintenance" Title="Module Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 10px;
        }
        .style2
        {
            width: 74px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center><h1> Module Maintenance</h1></center>
<center><h2> &nbsp;</h2></center>
    <table border="1" cellspacing="0" cellpadding="3">
    <tr>
    <td class="headertext">    
    </td>
    <td class="headertext">
        Module ID
    </td>
    <td class="headertext">
        Module Name
    </td>
    <td class="headertext">
        Company</td>
    <td class="headertext" >
        Description</td>
    <td class="headertext" >
        Valid From</td>
    <td class="headertext">
        Valid Until</td>
    <td class="headertext">
        User Admin
    </td>
    <td class="headertext">
        No of Users</td>
    </tr>
    <tr>
    <td>
    <asp:RadioButton ID="chk01" runat="server" />
    </td>
    <td>
        Mod<a href="ModuleAdd.aspx">001</a>
    </td>
    <td>
    &nbsp;Certified Java Developer (SCJD)</td>
    <td>
        Bayer
    </td>
    <td class="style1">
        &nbsp;</td>
    <td class="style2">
        12 Aug 2009</td>
    <td>
        12 Aug 2010</td>
    <td>
        Shee Sui Hoon</td>
    <td>
        30</td>
    </tr>
    <tr>
    <td>
    <asp:RadioButton ID="chk02" Text="" runat="server" />
    </td>
    <td>
        Mod<a href="ModuleAdd.aspx">002</a>
    </td>
    <td>
    Developing Applications With the Java SE Platform
    </td>
    <td>
        NTUC</td>
    <td class="style1">
        &nbsp;</td>
    <td class="style2">
        1 Dec 2000</td>
    <td>
        20 Dec 2015</td>
    <td>
        Jack John
    </td>
    <td>
        1000</td>
    </tr>
    <tr>
    <td>
    <asp:RadioButton ID="chk3" Text="" runat="server" />
    </td>
    <td>
        Mod003</td>
    <td>
        <a id="ctl00_ContentPlaceHolder1_gv_DAPs_ctl02_HyperLink1" 
            href="http://localhost:53128/b2bUI/DAP.aspx?DAPName=BAYERTR1&amp;DESC=Customer%20Service%20Tutorial%20for%20Bayer%20Staff">
        </a>Customer Service Tutorial for Bayer Staff</td>
    <td>
        Bayer</td>
    <td class="style1">
        &nbsp;</td>
    <td class="style2">
        1 Mar 2005</td>
    <td>
        30 Mar 2009</td>
    <td>
        Santino Revelleza</td>
    <td>
        40</td>
    </tr>
    </table>
    <br />
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Add" runat="server" onclick="btnAdd_Click" />
    </td>
    <td>
    <asp:Button ID="btnDelete" Text="Delete" runat="server" />
    </td>
    <td>
    <asp:Button ID="Button1" Text="Modify" runat="server" />
    </td>
    <td>
    <asp:Button ID="Button3" Text="View" runat="server" />
    </td>
    <td>
    <asp:Button ID="Button2" Text="Manage Question" runat="server" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" />
    </td>
    </tr>
    </table>
</asp:Content>

