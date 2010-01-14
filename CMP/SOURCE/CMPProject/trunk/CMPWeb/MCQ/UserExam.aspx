<%@ Page Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserExam.aspx.cs" Inherits="CMPWeb.MCQ.UserExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3><asp:Label id="lblExamName" Text="" runat="server"></asp:Label></h3>
<asp:GridView ID="gv" runat="server"></asp:GridView>
    <asp:Table ID="Table1" runat="server" Width="550px" Height="100px" CellPadding="1" CellSpacing="1"></asp:Table>
    <asp:Label ID="lblQuestion" runat="server"></asp:Label>
    <br />
    <asp:RadioButtonList ID="rbChoiceList" Visible="false" runat="server" />
    <asp:CheckBoxList ID="chkChoiceList" Visible="false" runat="server">
    </asp:CheckBoxList>
    <asp:Button ID="btnNext" Text="Next" runat="server" onclick="btnNext_Click" />
    <asp:HiddenField ID="hdnQNo" runat="server" />
    <asp:HiddenField ID="hdnAnswer" runat="server" />

</asp:Content>