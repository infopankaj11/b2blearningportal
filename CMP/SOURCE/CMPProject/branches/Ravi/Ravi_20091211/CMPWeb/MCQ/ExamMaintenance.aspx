<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ExamMaintenance.aspx.cs" Inherits="ExamMaintenance" Title="Add/Update an exam " %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center><h1>Add Exam</h1></center>
    <table border="1" cellspacing="0" cellpadding="3">
    <tr>    
    <td >
    <asp:Label id="lblID" Text="Fill the information:" runat="server" Font-Bold></asp:Label>
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
    <asp:TextBox ID="txtAbbr" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label1" Text="Total Questions" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtTotQns" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label2" Text="Total Marks" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtTotMarks" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label3" Text="Pass Marks" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtPassMark" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label4" Text="Exam Duration (in Mins)" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
    </td>
    </tr>
    </table>
        <br />
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAddUpdate" Text="Add" runat="server" onclick="btnAddUpdate_Click" />
    </td>
    <td>
    <asp:Button ID="Button1" Text="Clear" runat="server" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" onclick="btnCancel_Click" />
    </td>
    </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" />
                <asp:Label runat="server" ID="lblExamID2" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
            </td>
        </tr>
    </table>
</asp:Content>

