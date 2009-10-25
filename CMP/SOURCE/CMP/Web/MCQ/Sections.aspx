<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sections.aspx.cs" Inherits="Sections" Title="Section Manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center><h1> Section Maintenance</h1></center>
<center><h2> Sun Certified Java Developer (SCJD)</h2></center>
       <table border="1" cellspacing="0" cellpadding="3">
    <tr>
    <td style="background-color:Silver; font-weight:bold">    
    </td>
    <td style="background-color:Silver; font-weight:bold">
    Section ID
    </td>
    <td style="background-color:Silver; font-weight:bold">
    Section Name
    </td>
    <td style="background-color:Silver; font-weight:bold">
    Section Abbr
    </td>
    <td style="background-color:Silver; font-weight:bold">
    Section Sequence
    </td>
    <td style="background-color:Silver; font-weight:bold">
    Section Weight (%)
    </td>
    <td style="background-color:Silver; font-weight:bold">
    Total Simple Question
    </td>
    <td style="background-color:Silver; font-weight:bold">
    Simple Qn Wgt
    </td>
    <td style="background-color:Silver; font-weight:bold">
    Total Moderate Question
    </td>
    <td style="background-color:Silver; font-weight:bold">
    Moderate Qn Wgt
    </td>
    <td style="background-color:Silver; font-weight:bold">
    Total Complex Question
    </td>
    <td style="background-color:Silver; font-weight:bold">
    Complex Qn Wgt
    </td>
    </tr>
    <tr>
    <td>
    <asp:RadioButton ID="chk01" runat="server" />
    </td>
    <td>
    <a href="ModuleAdd.aspx">Sec001</a>
    </td>
    <td>
    Object-Oriented Analysis and Design Using UML
    </td>
    <td>
    OOAD
    </td>
    <td>
    1
    </td>
    <td>
    50
    </td>
    <td>
    3
    </td>
    <td>
    2
    </td>    
    <td>
    3
    </td>
    <td>
    3
    </td>    
    <td>
    2
    </td>
    <td>
    5
    </td>    
    </tr>
    <tr>
    <td>
    <asp:RadioButton ID="chk02" Text="" runat="server" />
    </td>
    <td>
    <a href="ModuleAdd.aspx">Sec002</a>
    </td>
    <td>
    Developing Applications With the Java SE Platform
    </td>
    <td>
    -
    </td>
    <td>
    2
    </td>
    <td>
    50
    </td>
    <td>
    2
    </td>
    <td>
    2
    </td>
    <td>
    3
    </td>
    <td>
    3
    </td>
    <td>
    2
    </td>
    <td>
    6
    </td>
    </tr>
    </table>
    <br />
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Add" runat="server" onclick="btnAdd_Click"  />
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

