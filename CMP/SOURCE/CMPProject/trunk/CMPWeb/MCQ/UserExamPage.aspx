<%@ Page Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserExamPage.aspx.cs" Inherits="UserExamPage" Title="Exam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3> <asp:Label ID="lblExamName"  runat="server" Text="Label"></asp:Label></h3>
<h4> <asp:Label ID="lblInfo"  runat="server" Text=""></asp:Label></h4>

  <table>
       <tr>
       <td>
       <asp:Label ID="lblTotalQnsText" Text="Total Questions" runat="server"></asp:Label>       
       </td>
       <td>
       <asp:Label ID="Label1" Text=":" runat="server"></asp:Label>       
       </td>
       <td>
       <asp:Label ID="lblTotalQns" runat="server"></asp:Label>
       </td>
       </tr>
       <tr>
       <td>
       <asp:Label ID="lblTotalMarksText" Text="Total Marks" runat="server"></asp:Label>
       </td>
       <td>
       <asp:Label ID="Label2" Text=":" runat="server"></asp:Label>       
       </td>
       <td>
       <asp:Label ID="lblTotalMarks" runat="server"></asp:Label>       
       </td>
       </tr>
       <tr>
       <td>
       <asp:Label ID="lblPassMarksText" Text="Pass Marks" runat="server"></asp:Label>
       </td>
       <td>
       <asp:Label ID="Label3" Text=":" runat="server"></asp:Label>       
       </td>
       <td>
       <asp:Label ID="lblPassMarks" runat="server"></asp:Label>
       </td>
       </tr>
       <tr>
       <td>
       <asp:Label ID="lblExamDurationText" Text="Exam Duration" runat="server"></asp:Label>
       </td>
       <td>
       <asp:Label ID="Label4" Text=":" runat="server"></asp:Label>       
       </td>
       <td>
       <asp:Label ID="lblExamDuration" runat="server"></asp:Label>
       </td>
       </tr>
       </table>
       <br />
       <br />
       <table cellpadding="0" cellspacing="0" width="100%" >       
        <tr>
            <td valign="top" >
                <asp:GridView Width="80%" runat="server" ID="gv_Object" AutoGenerateColumns="false" DataKeyNames="section_id" >
                <Columns>                    
                        
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbsection_abbrHeader" Text="Abbreviation" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbsection_abbr" Text='<%#Eval("section_abbr") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>                     
                    
                   <asp:TemplateField>        
                         <HeaderTemplate>
                            <asp:Label runat="server" ID="lbsection_weight" Text="Section Weight (%)"/>
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbsection_weight" Text='<%#Eval("section_weight") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbtotal_simple_qns" Text="Total Simple Question" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbtotal_simple_qns" Text='<%#Eval("total_simple_qns") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    
                     <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbsimple_qn_weight" Text="Simple Qn Wgt " />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbsimple_qn_weight" Text='<%#Eval("simple_qn_weight") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                  
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbetotal_moderate_qnsr" Text="Total Moderate Question" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbtotal_moderate_qns" Text='<%#Eval("total_moderate_qns") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>      

                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbmoderate_qn_weight" Text="Moderate Qn Wgt " />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbmoderate_qn_weight" Text='<%#Eval("moderate_qn_weight") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>    

                  
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbtotal_complex_qns" Text="Total Complex Question " />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbtotal_complex_qns" Text='<%#Eval("total_complex_qns") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>      

                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbcomplex_qn_weight" Text="Complex Qn Wgt" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbcomplex_qn_weight" Text='<%#Eval("complex_qn_weight") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>    

                    
                </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
        <td>
        <br />
        <asp:Button id="btnStart" Text="Next" runat="server" onclick="btnStart_Click" />
        </td>
        </tr>
    </table>
   
    <br />
    
      <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" />
                <asp:Label runat="server" ID="lblExamID2" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblSectionID" Visible="false" Text="" />
                <asp:HiddenField runat="server" ID="hdnQnCnt" />
            </td>
        </tr>
    </table>

</asp:Content>
