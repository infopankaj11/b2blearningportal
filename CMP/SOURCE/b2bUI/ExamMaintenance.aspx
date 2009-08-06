<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ExamMaintenance.aspx.cs" Inherits="ExamMaintenance" Title="Exam Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Content Management Portal</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center><h1>Exam Maintenance</h1></center>
    
  <table>
<tr>
<td>
    <table class="search">
    <tr align="right">
    <td>
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" Text="Search" runat="server" />
    </td>
    </tr>
    <tr align="right">
    <td>
    <asp:RadioButton id="rb1" Text="by Exam" runat="server"/>
    <asp:RadioButton id="RadioButton1" Text="by Module" runat="server"/>
    </td>
    </tr>
    </table>

</td>
</tr>
<tr class="" >
<td>
    <table border="1" cellspacing="0" cellpadding="3" class="frame">
    <tr class="headertext" >    
    <td>    
    </td>
    <td  class="headertext" >
    Exam ID
    </td>
    <td class="headertext" >
    Exam Name
    </td>
    <td class="headertext" >
    Exam Abbr
    </td>
    <td class="headertext" >
    Module Name
    </td>
    <td class="headertext" >
    Total Qns
    </td >
    <td class="headertext" >
    Total Mark
    </td>
    <td class="headertext" >
    Pass Mark
    </td>
    <td class="headertext" >
    Exam Duration (in Mins)
    </td>
    </tr>
    <tr>
    <td>
    <asp:RadioButton ID="chk01" runat="server" />
    </td>
    <td>
    <a href="ExamAdd.aspx">Exm001</a>
    </td>
    <td>
    Sun Certified Java Developer
    </td>
    <td>
    SCJD
    </td>
    <td>
    Module 1
    </td>
    <td>
    50
    </td>
    <td>
    150
    </td>
    <td>
    120
    </td>
    <td>
    90
    </td>    
    </tr>
    <tr>
    <td>
    <asp:RadioButton ID="chk02" Text="" runat="server" />
    </td>
    <td>
    <a href="ExamAdd.aspx">Exm002</a>
    </td>
    <td>
    Sun Certified Java Programmer
    </td>
    <td>
    SCJP
    </td>
    <td>
    Module 2
    </td>
    <td>
    75
    </td>
    <td>
    150
    </td>
    <td>
    130
    </td>
    <td>
    120
    </td>
    </tr>
    </table>
    <br />    <br />    <br />    <br />    <br />    <br />    <br />    <br />    <br />    <br />
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
    <asp:Button ID="btnManage" Text="Manage Section" runat="server" 
            onclick="btnManage_Click" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" />
    </td>
    </tr>
    </table>

</td>
</tr>
</table>    
</asp:Content>


