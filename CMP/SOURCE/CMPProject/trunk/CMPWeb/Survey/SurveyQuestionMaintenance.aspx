<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SurveyQuestionMaintenance.aspx.cs" Inherits="SurveyQuestionMaintenance" Title="Survey Maintenance Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center><h1> Questions</h1></center>
<center><h2> <asp:Label ID="lblSurveyName"  runat="server" Text="></asp:Label></h2></center>      
 <table cellspacing="0" cellpadding="3">

    <tr>    
    <td >
    <asp:Label id="lblID" Text="Fill the information:" runat="server" Font-Bold ></asp:Label>
    </td>
    <td>
    <asp:Label id="lblSurveyID" runat="server"></asp:Label>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblQuestion" Text="Question" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtQuestion" TextMode="MultiLine" Rows="5" runat="server" MaxLength="50"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblSurveyAbbr" Text="Question Type" runat="server" MaxLength="50"></asp:Label>
    </td>
    <td>
    <asp:DropDownList ID="ddlQnType" runat="server">
    <asp:ListItem Value="Multiple" >Multiple Choice</asp:ListItem>
    <asp:ListItem Value="Exclusive">Mutually Exclusive</asp:ListItem>
    </asp:DropDownList>
    </td>
    </tr>
  
    <tr>
    <td >Choices:<br>(Check the correct answers)
    </td>
    <td>
    
    <asp:GridView Width="100%" runat="server" ID="gv_Object" AutoGenerateColumns="false" DataKeyNames="opt_id" >
                <Columns>                                                          
                       
                                     
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="OptText" Text="Option Text"  />
                             <asp:Button ID="btnAddOpt" Text="Add" runat="server"  OnClick="btnAddOpt_Click"/> 
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="txtOptiontxt" Text='<%#Eval("Choice") %>' MaxLength="50"/>                                                        
                        </ItemTemplate>
                    </asp:TemplateField>                  
                   
                    <asp:TemplateField>                       
                        <ItemTemplate>
                              <asp:Button ID="btnDeleteOpt" Text="Delete" runat="server" CommandArgument='<%#Eval("opt_id")%>'  OnClick="btnDeleteOpt_Click"/>              
                        </ItemTemplate>
                    </asp:TemplateField>        
                    
                </Columns>
                </asp:GridView>

    
    
      
    </td>
    <td>
       </td>
    </tr>
    <tr>
    <td class="style1">  
    

</td>
</tr></table>        
    <br />
        <br />
        <br />
        <br />
        <br />
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAddUpdate" Text="Add" runat="server"  OnClick="btnAddUpdate_Click"/>
    </td>
    <td>
    <asp:Button ID="btnClear" Text="Clear" runat="server"  OnClick="btnClear_Click" />
    </td>
    <td>
    <asp:Button ID="btnCancel" Text="Back to Questions" runat="server"
            onclick="btnCancel_Click" />
    </td>
    </tr>
    </table>
        
     <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" />
                <asp:Label runat="server" ID="lblSurveyID2" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblQID" Visible="false" Text="" />    
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
            </td>
        </tr>
    </table>

</asp:Content>
