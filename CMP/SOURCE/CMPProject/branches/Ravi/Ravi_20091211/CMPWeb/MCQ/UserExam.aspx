<%@ Page Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserExam.aspx.cs" Inherits="UserExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3><asp:Label id="lblExamName" Text="" runat="server"></asp:Label></h3>

    <asp:Table ID="Table1" runat="server" Width="550px" Height="100px" CellPadding="1" CellSpacing="1"></asp:Table>
    <asp:Label ID="lblQuestion" runat="server"></asp:Label>
    <br />
    <asp:RadioButtonList ID="rbChoiceList" Visible="false" runat="server" />
    <asp:CheckBoxList ID="chkChoiceList" Visible="false" runat="server">
    </asp:CheckBoxList>
    <br />
    <asp:Button ID="btnConfirm" Text="Confirm" runat="server" 
        onclick="btnConfirm_Click"  />
    <asp:Button ID="btnNext" Text="Next" runat="server" onclick="btnNext_Click"  />
    <br />
    <br />
    
    <asp:datagrid id="dgQns" runat="server" Font-Size="Medium" AutoGenerateColumns="False"
			AllowPaging="false" BorderStyle="Solid" >
                <Columns>
                <asp:BoundColumn Visible="False" DataField="user_exam_id" HeaderText="user_exam_id">				
				</asp:BoundColumn>
				<asp:BoundColumn Visible="False" DataField="rownum" HeaderText="rownum">				
				</asp:BoundColumn>
				
                <asp:TemplateColumn HeaderText="Qn No.">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;
				<asp:LinkButton id="LinkButton1" OnClick="NextQuestion" runat="server">
				<%# DataBinder.Eval(Container.DataItem, "rownum")%>
				</asp:LinkButton>	
				</ItemTemplate>
				</asp:TemplateColumn>
				
				<asp:TemplateColumn HeaderText="Qn Read">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Center"></ItemStyle>
				<ItemTemplate>
				&nbsp;				
				<asp:Label ID="lblRead" Text=" - " runat="server"></asp:Label>
				</ItemTemplate>
				</asp:TemplateColumn>
				
                <asp:TemplateColumn HeaderText="Qn Answered">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Center"></ItemStyle>
				<ItemTemplate>
				&nbsp;				
				<asp:Label ID="lblAns" Text=" - " runat="server"></asp:Label>
				</ItemTemplate>
				</asp:TemplateColumn>
				    
                 <asp:TemplateColumn HeaderText="Question">
				<HeaderStyle CssClass="headertext"></HeaderStyle>
				<ItemStyle HorizontalAlign="Left"></ItemStyle>
				<ItemTemplate>
				&nbsp;				
				<%# DataBinder.Eval(Container.DataItem, "question_text")%>
				</ItemTemplate>
				</asp:TemplateColumn>                       
                </Columns>
                </asp:datagrid>
    <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" />
    <asp:HiddenField ID="hdnQNo" runat="server" />
    <asp:HiddenField ID="hdnAnswer" runat="server" />
    <asp:HiddenField ID="hdnSectionId" Value="0" runat="server" />
    <asp:HiddenField ID="hdnExamId" Value="0" runat="server" />
    <asp:HiddenField ID="hdnUserExamID" Value="0" runat="server" />
    <asp:HiddenField ID="hdnQnCnt" Value="0" runat="server" />
    <asp:HiddenField ID="hdnTotQn" Value="0" runat="server" />

</asp:Content>