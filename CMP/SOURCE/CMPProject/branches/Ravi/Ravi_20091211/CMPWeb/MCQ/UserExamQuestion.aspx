<%@ Page Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserExamQuestion.aspx.cs" Inherits="UserExamQuestion" Title="Exam Question Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3><asp:Label id="lblExamName" Text="" runat="server"></asp:Label></h3>
<h4><asp:Label id="lblSectionName" Text="" runat="server"></asp:Label> </h4>
  
<table>    <tr>
    <td>
   <center><h2> <asp:Label ID="lblQuestion" Text="" runat="server"></asp:Label></h2></center><br />
   
    
    <asp:GridView Width="100%" runat="server" ID="gv_Object" AutoGenerateColumns="false" DataKeyNames="option_id"  BorderStyle="None" RowStyle-BorderStyle="None" GridLines=None  >
    
                <Columns>                                                          
                       
                    <asp:TemplateField>                 
                        
                        <itemtemplate>
                            <asp:CheckBox id="chkSelectedAnswer" runat="server"  />  
                            <asp:HiddenField ID="hfObjectID" Value='<%#Eval("option_id")%>' runat="server" />
                            <asp:Label ID="lblQuestion" Text='<%#Eval("OptText") %>' runat="server" Font-Bold> <br /> </asp:Label>

                        </itemtemplate>
                    </asp:TemplateField>                         
           
                </Columns>
                </asp:GridView>    
       
    </td>
    </tr>
    <tr>
    <td>
    <p>&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p> 
    <asp:Button ID="btnPrevious" Text="Previous" runat="server"  OnClick="btnPrevious_Click"  />
    <asp:Button ID="btnConfirm" Text="Confirm" runat="server"  OnClick="btnConfirm_Click"  />
    <asp:Button ID="btnNext" Text="Next" runat="server"  OnClick="btnNext_Click"  />
    </td>
    </tr>
    </table>
     <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" />
                <asp:Label runat="server" ID="lblExamID2" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblSectionID2" Visible="false" Text="" />    
                <asp:Label runat="server" ID="lblQID" Visible="false" Text="" /> 
                <asp:Label runat="server" ID="lblUserExamId" Visible="false" Text="" />    
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
            </td>
        </tr>
    </table>

</asp:Content>
