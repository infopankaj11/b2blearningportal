<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ExamAdd.aspx.cs" Inherits="ExamAdd" Title="Add an exam " %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center><h1>Add Exam</h1></center>
    <table border="1" cellspacing="0" cellpadding="3">
    <tr>    
    <td >
    <asp:Label id="lblID" Text="Exam ID" runat="server"></asp:Label>
    </td>
    <td>
    <asp:Label id="lblExamID" runat="server"></asp:Label>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblExamName" Text="Exam Name" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtExamName" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblExamAbbr" Text="Exam Abbreviation" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label1" Text="Total Questions" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label2" Text="Total Marks" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label3" Text="Pass Marks" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label4" Text="Exam Duration (in Mins)" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    </td>
    </tr>
    </table>
        <br />
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Add" runat="server" />
    </td>
    <td>
    <asp:Button ID="Button1" Text="Clear" runat="server" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" onclick="btnCancel_Click" />
    </td>
    </tr>
    </table>
    
</asp:Content>

