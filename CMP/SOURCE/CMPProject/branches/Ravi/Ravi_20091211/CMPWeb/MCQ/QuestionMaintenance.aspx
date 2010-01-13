<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionMaintenance.aspx.cs" Inherits="QuestionMaintenance" Title="Question Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center><h1> Add Question</h1></center>
<center><h2>     <asp:Label id="lblExamName" Text="" runat="server"></asp:Label></h2></center>
<center><h3> <asp:Label id="lblSectionName" Text="" runat="server"></asp:Label> </h3></center>
        <table cellspacing="0" cellpadding="3">
    <tr>    
    <td >
    <asp:Label id="Label5" Text="Question Level" runat="server"></asp:Label>
    </td>
    <td>
    <asp:DropDownList ID="ddlQLevel" runat="server">
        <asp:ListItem Value ="Simple" >Simple</asp:ListItem>
        <asp:ListItem  Value ="Moderate">Moderate</asp:ListItem>
        <asp:ListItem  Value ="Complex" >Complex</asp:ListItem>
    </asp:DropDownList>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblQuestion" Text="Question" runat="server"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtQuestion" TextMode="MultiLine" Rows="5" runat="server" MaxLength ="250" ></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="lblExamAbbr" Text="Question Type" runat="server"></asp:Label>
    </td>
    <td>
    <asp:DropDownList ID="ddlQnType" runat="server">
    <asp:ListItem Value="Multiple" >Multiple Choice</asp:ListItem>
    <asp:ListItem Value="Exclusive">Mutually Exclusive</asp:ListItem>
    </asp:DropDownList>
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label id="Label2" Text="Exam Type" runat="server"></asp:Label>
    </td>
    <td>
    <asp:DropDownList ID="ddlExamType" runat="server">
    <asp:ListItem>Exam</asp:ListItem>
    <asp:ListItem>Exercise</asp:ListItem>
    </asp:DropDownList>
    </td>
    </tr>

    <tr>
    <td >Choices:<br>(Check the correct answers)
    </td>
    <td>
    
    <asp:GridView Width="100%" runat="server" ID="gv_Object" AutoGenerateColumns="false" DataKeyNames="option_id" >
                <Columns>                                                          
                       
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbAns" Text="is Answer?"  />      
                        </HeaderTemplate>
                        <itemstyle horizontalalign="Center" />
                        <headerstyle horizontalalign="Center" />
                        
                        <itemtemplate>
                            <asp:CheckBox id="chkSelectedAnswer" runat="server" Checked='<%#Eval("isAnswer")%>'  />  
                            <asp:HiddenField ID="hfObjectID" Value='<%#Eval("option_id")%>' runat="server" />
                        </itemtemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="OptText" Text="Option Text"  />
                             <asp:Button ID="btnAddOpt" Text="Add" runat="server"  OnClick="btnAddOpt_Click"/> 
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="txtOptiontxt" Text='<%#Eval("OptText") %>' MaxLength="250"/>                              
                        </ItemTemplate>
                    </asp:TemplateField>                  
                   
                    <asp:TemplateField>                       
                        <ItemTemplate>
                              <asp:Button ID="btnDeleteOpt" Text="Delete" runat="server"  OnClick="btnDeleteOpt_Click"/>              
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
               
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAddUpdate" Text="Add" runat="server"  OnClick="btnAddUpdate_Click"/>
    </td>
    <td>
    <asp:Button ID="btnClear" Text="Clear" runat="server" OnClick="btnClear_Click" />
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
                <asp:Label runat="server" ID="lblExamID2" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblSectionID2" Visible="false" Text="" />    
                <asp:Label runat="server" ID="lblQID" Visible="false" Text="" />    
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
            </td>
        </tr>
    </table>
    
</asp:Content>

