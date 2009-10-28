<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionAdd.aspx.cs" Inherits="QuestionAdd" Title="Add a question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center><h1> Add Question</h1></center>
<center><h2> Sun Certified Java Developer (SCJD)</h2></center>
<center><h3> Object-Oriented Analysis and Design Using UML</h3></center>
        <table cellspacing="0" cellpadding="3">
    <tr>    
    <td >
    <asp:Label id="Label5" Text="Exam Level" runat="server"></asp:Label>
    </td>
    <td>
    <asp:DropDownList ID="ddlQType" runat="server">
        <asp:ListItem>Simple</asp:ListItem>
        <asp:ListItem>Moderate</asp:ListItem>
        <asp:ListItem>Complex</asp:ListItem>
    </asp:DropDownList>
    </td>
    </tr>
    <tr>    
    <td >
    <asp:Label id="lblID" Text="Question ID" runat="server"></asp:Label>
    </td>
    <td>
    <asp:Label id="lblExamID" runat="server"></asp:Label>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblExamName" Text="Question" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtExamName" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblExamAbbr" Text="Question Type" runat="server"></asp:Label>
    </td>
    <td>
    <asp:DropDownList ID="ddlQnType" runat="server">
    <asp:ListItem>Multiple Choice</asp:ListItem>
    <asp:ListItem>Mutually Exclusive</asp:ListItem>
    <asp:ListItem>Descriptive</asp:ListItem>
    </asp:DropDownList>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label2" Text="Exam Type" runat="server"></asp:Label>
    </td>
    <td>
    <asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem>Exam</asp:ListItem>
    <asp:ListItem>Exercise</asp:ListItem>
    </asp:DropDownList>
    </td>
    </tr>
    <tr>
    <td >Total no of options
    </td>
    <td>
    <asp:TextBox ID="txtTotalOption" runat="server"></asp:TextBox>
    </td>
    <td>
    <asp:Button ID="btnGo" Text="Go" runat="server" />
    </td>
    </tr>
    <tr>
    <td class="style1">
<table>
<tr>
<td><b>Ans Choice</b>
</td>
</tr>
<tr><td>
    <asp:CheckBox ID="chk01" runat="server" />
    <asp:TextBox ID="txt01" runat="server"></asp:TextBox><br />
    <asp:CheckBox ID="CheckBox1" runat="server" />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
    <asp:CheckBox ID="CheckBox2" runat="server" />
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
    <asp:CheckBox ID="CheckBox3" runat="server" />
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
    <asp:CheckBox ID="CheckBox4" runat="server" />
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    </td>
</tr></table>    
</td>
</tr></table>        
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Add" runat="server" />
    </td>
    <td>
    <asp:Button ID="Button1" Text="Clear" runat="server" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Cancel" runat="server"
            onclick="btnCancel_Click" />
    </td>
    </tr>
    </table>
</asp:Content>

