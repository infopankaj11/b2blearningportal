<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionMaintenance.aspx.cs" Inherits="QuestionMaintenance" Title="Question maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center><h1> Question Maintenance</h1></center>
<center><h2> Sun Certified Java Developer (SCJD)</h2></center>
<center><h3> Object-Oriented Analysis and Design Using UML</h3></center>
 <table style="width: 598px">
<tr align="right">
<td>
<asp:DropDownList ID="ddlQType" runat="server">
<asp:ListItem>Simple</asp:ListItem>
<asp:ListItem>Moderate</asp:ListItem>
<asp:ListItem>Complex</asp:ListItem>
</asp:DropDownList>
<asp:DropDownList ID="DropDownList1" runat="server">
<asp:ListItem>Exam</asp:ListItem>
<asp:ListItem>Exercise</asp:ListItem>
</asp:DropDownList>
<asp:Button ID="btnGo" Text="Search" runat="server" />
</td>
</tr>
</table>
<table>
<tr>
<td>
    <table border="1" cellspacing="0" cellpadding="3">
    <tr>
    <td>
    </td>
    <td>
    Question ID
    </td>
    <td>
    Question
    </td>
    <td>
    Question Type
    </td>
    <td>
    Exam Type
    </td>
    <td>
    Question Level
    </td>
    </tr>
    <tr>
    <td>
    <asp:RadioButton ID="chk01" runat="server" />
    </td>
    <td>
    <a href="QuestionAdd.aspx">Qn001</a>
    </td>
    <td>
    What is your name?
    </td>
    <td>
            Multiple Choice
    </td>
    <td>
    Exam
    </td>
    <td>
    Easy
    </td>
    </tr>
    <tr>
    <td>
    <asp:RadioButton ID="chk02" Text="" runat="server" />
    </td>
    <td>
    <a href="QuestionAdd.aspx">Qn002</a>
    </td>
    <td>
    Where do you live?
    </td>
    <td>
    Mutually Exclusive
    </td>
    <td>
    Exam
    </td>
    <td>
    Easy
    </td>
    </tr>
    </table>
</td>
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
    <asp:Button ID="Button2" Text="View" runat="server" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" />
    </td>
    </tr>
    </table>
</asp:Content>

