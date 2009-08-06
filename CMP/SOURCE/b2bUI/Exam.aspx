<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Exam.aspx.cs" Inherits="Exam" Title="Examination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table>
    <tr>
    <td>
    <asp:Label ID="lblQuestion" Text="1. Which are most typically thrown by an API developer or an application developer as opposed to being thrown by the JVM? (Choose all that apply.)"
     runat="server"></asp:Label><br />
    <asp:CheckBoxList ID="chkChoiceList" runat="server">
    <asp:ListItem>ClassCastException</asp:ListItem>
    <asp:ListItem>IllegalStateException</asp:ListItem>
    <asp:ListItem>NumberFormatException</asp:ListItem>
    <asp:ListItem>IllegalArgumentException </asp:ListItem>
    <asp:ListItem>ExceptionInInitializerError </asp:ListItem>
    </asp:CheckBoxList>    
    </td>
    </tr>
    <tr>
    <td>
    <asp:Button ID="Button3" Text="Previous" runat="server" />
    <asp:Button ID="btnConfirm" Text="Confirm" runat="server" />
    <asp:Button ID="btnNext" Text="Next" runat="server" />
    </td>
    </tr>
    </table>
    <br />
    <br />
    <table border="1" cellspacing="0" cellpadding="3">
    <tr>
    <td>
    Q No.
    </td>
    <td>
    Read
    </td>
    <td>
    Answered
    </td>
    <td>
    Weight
    </td>
    <td>
    Question
    </td>
    </tr>
    <tr>
    <td>
    <a href="#">2</a>
    </td>
    <td>
    <asp:Button ID="btnRead1" Text="-" runat="server" />
    </td>
    <td>
    <asp:Button ID="btnAnswer1" Text="-" runat="server" />
    </td>
    <td>
    2
    </td>
    <td>
    Using the fragments below, complete the following code so that it compiles and prints "40 36 30 28". Note, you may use a fragment from zero to many times.
    </td>
    </tr>
    
    <tr>
    <td>
    <a href="#">3</a>
    </td>
    <td>
    <asp:Button ID="Button1" Text="-" runat="server" />
    </td>
    <td>
    <asp:Button ID="Button2" Text="-" runat="server" />
    </td>
    <td>
    5
    </td>
    <td>
    Which statement(s) must be added for MyClass to compile? (Choose all that apply.)
    </td>
    </tr>
    </table>

</asp:Content>

