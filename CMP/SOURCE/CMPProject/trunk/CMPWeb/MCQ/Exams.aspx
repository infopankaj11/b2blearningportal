<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Exams.aspx.cs" Inherits="Exams" Title="Exams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Examinations</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center><h1>Exams</h1></center>
    
  <table class="middle" >
<tr>
<td>


</td>
</tr>
<tr class="" >
<td>
<table cellpadding="0" cellspacing="0" width="100%" >
        <tr>
            <td style="width:60%" valign="top" >
                <asp:GridView Width="100%" runat="server" ID="gv_Exams" AutoGenerateColumns="false" DataKeyNames="exam_ID" >
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox runat="server" ID="cbSelectAll" AutoPostBack="True" Visible=false OnCheckedChanged="cbSelectAll_OnCheckedChanged"  /> 
                        </HeaderTemplate>
                        <itemstyle horizontalalign="Center" />
                        <headerstyle horizontalalign="Center" />
                        
                        <itemtemplate>
                            <asp:CheckBox id="chkSelectedExam" runat="server" />  
                            <asp:HiddenField ID="hfExamListID" Value='<%#Eval("exam_ID")%>' runat="server" />
                        </itemtemplate>
                    </asp:TemplateField>
                     
                    <asp:HyperLinkField DataNavigateUrlFields="exam_ID" DataNavigateUrlFormatString="~/MCQ/ExamMaintenance.aspx?Action=Update&ExamID={0}"
                         DataTextField="exam_name" NavigateUrl="~/MCQ/ExamMaintenance.aspx" HeaderText = "Exam Name"/>
                        
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
                            <asp:Label runat="server" ID="lbCreatedByHeader" Text="Created By" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbCreatedBy" Text='<%#Eval("Created_By") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbCreatedDateHeader" Text="Created Date" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbCreatedDate" Text='<%#Convert.ToDateTime(Eval("Created_Date")).ToString("dd-MMM-yyyy") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbModifiedByHeader" Text="Modified By" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbModifiedBy" Text='<%#Eval("Modified_By") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbModifiedDateHeader" Text="Modified Date" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbModifiedDate" Text='<%#Convert.ToDateTime(Eval("Modified_Date")).ToString("dd-MMM-yyyy") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Add" runat="server"  onclick="btnAdd_Click"/>
    </td>
    <td>
        <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick="btnDelete_Click" Width="80px"/>
        </td>
    <td>
    <asp:Button ID="Button1" Text="Clear" runat="server" onclick="btnClear_Click" />
    </td>
    <td>
    <asp:Button ID="Button2" Text="Manage Sections" runat="server" onclick="btnManageSection_Click" />
    </td>
    <td>
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


