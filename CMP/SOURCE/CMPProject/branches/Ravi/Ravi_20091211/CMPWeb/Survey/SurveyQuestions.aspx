<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SurveyQuestions.aspx.cs" Inherits="SurveyQuestions" Title="Survey questions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<center><h1> Survey Questions</h1></center>
<center><h2> <asp:Label ID="lblSurveyName"  runat="server" Text="Label"></asp:Label></h2></center>
        <center><h3> <asp:Label ID="lblInfo"  runat="server" Text=""></asp:Label></h3></center>

 <table class="middle">
<tr align="right">
<td>
<asp:GridView Width="100%" runat="server" ID="gv_Object" AutoGenerateColumns="false" DataKeyNames="squestion_id" >
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox runat="server" ID="cbSelectAll" AutoPostBack="True" Visible=false OnCheckedChanged="cbSelectAll_OnCheckedChanged" /> 
                        </HeaderTemplate>
                        <itemstyle horizontalalign="Center" />
                        <headerstyle horizontalalign="Center" />
                        
                        <itemtemplate>
                            <asp:CheckBox id="chkSelectedObject" runat="server" />  
                            <asp:HiddenField ID="hfObjectID" Value='<%#Eval("squestion_id")%>' runat="server" />
                        </itemtemplate>
                    </asp:TemplateField>
                     
                    <asp:HyperLinkField DataNavigateUrlFields="squestion_id,survey_id" DataNavigateUrlFormatString="~/Survey/SurveyQuestionMaintenance.aspx?Action=Update&QID={0}&SurveyID={1}"
                         DataTextField="question" NavigateUrl="~/Survey/SurveyQuestionMaintenance.aspx" HeaderText = "Question"/>
                        
                               
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbsection_seq" Text="Question Type" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbsection_seq" Text='<%#Eval("qn_type") %>'/>
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
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Add" runat="server" onclick="btnAdd_Click" />
    </td>
    <td>
    <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick="btnDelete_Click"  />
    </td>    
      <td>
    <asp:Button ID="btnClear" Text="Clear" runat="server" OnClick="btnClear_Click"  />
    </td>  
    <td>
    <asp:Button ID="btnCancel" Text="Back to Surveys" runat="server" onclick="btnCancel_Click"/>
    </td>
    </tr>
    </table>
           
     <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" />
                <asp:Label runat="server" ID="lblSurveyID2" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
            </td>
        </tr>
    </table>

</asp:Content>
