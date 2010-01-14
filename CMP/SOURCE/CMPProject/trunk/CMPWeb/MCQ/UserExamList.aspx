<%@ Page Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserExamList.aspx.cs" Inherits="UserExamList" Title="Exams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">Examinations
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <center><h1>Your Exams</h1></center>

<table cellpadding="0" cellspacing="0" width="100%" border=0>
        <tr>
            <td style="width:60%" valign="top" >
                <asp:GridView Width="100%" runat="server" ID="gv_Exams" AutoGenerateColumns="false" DataKeyNames="exam_ID" >
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbexam_takenHEader" Text="Take Exercise?" />
                        </HeaderTemplate>
                        <itemstyle horizontalalign="Center" />
                        <headerstyle horizontalalign="Center" />
                        
                        <itemtemplate>
                            <asp:HiddenField ID="hfExamListID" Value='<%#Eval("exam_ID")%>' runat="server" />
                            <asp:Label runat="server" ID="lbhas_Exercise" Text='<%#Eval("Taken") %>'/>
                        </itemtemplate>
                    </asp:TemplateField>
                     
                    <asp:HyperLinkField DataNavigateUrlFields="exam_ID" DataNavigateUrlFormatString="~/MCQ/UserExamPage.aspx?Action=Update&ExamID={0}"
                         DataTextField="exam_name" NavigateUrl="~/MCQ/UserExamPage.aspx" HeaderText = "Exam Name"/>
                        
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbExamAbbrHeader" Text="Abbreviation" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbExamAbbr" Text='<%#Eval("exam_abbr") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    
                                        <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbtotal_qnsHeader" Text="Total Questions" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbtotal_qns" Text='<%#Eval("total_qns") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    
                   <asp:TemplateField>        
                         <HeaderTemplate>
                            <asp:Label runat="server" ID="lbtotal_marksHeader" Text="Total Marks" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbtotal_marks" Text='<%#Eval("total_marks") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbpass_markHeader" Text="Passing Mark" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbpass_mark" Text='<%#Eval("pass_mark") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    
                     <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbexam_durationHeader" Text="Duration" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbexam_duration" Text='<%#Eval("exam_duration") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>        
                    
                        <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbexam_takenHEader" Text="Taken?" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbexam_taken" Text='<%#Eval("Taken") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>               
                               
                   
                                        
                </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    

</td>
</tr>
<tr>
<td>
    <asp:Label runat="server" ID="lblMsg" ForeColor="Red" />
</td>
</tr>
</table>    

</asp:Content>
