<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Survey.aspx.cs" Inherits="Survey" Title="Survey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <title>Surveys</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <center><h1>Surveys</h1></center>
    
  <table class ="middle">
<tr>
<td>
    

</td>
</tr>
<tr class="" >
<td>
<table cellpadding="0" cellspacing="0" width="100%" >
        <tr>
            <td style="width:60%" valign="top" >
                <asp:GridView Width="100%" runat="server" ID="gv_surveys" AutoGenerateColumns="false" DataKeyNames="survey_ID" >
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox runat="server" ID="cbSelectAll" AutoPostBack="True" Visible=false  OnCheckedChanged="cbSelectAll_OnCheckedChanged"  /> 
                        </HeaderTemplate>
                        <itemstyle horizontalalign="Center" />
                        <headerstyle horizontalalign="Center" />
                        
                        <itemtemplate>
                            <asp:CheckBox id="chkSelectedsurvey" runat="server" />  
                            <asp:HiddenField ID="hfsurveyListID" Value='<%#Eval("survey_ID")%>' runat="server" />
                        </itemtemplate>
                    </asp:TemplateField>
                     
                    <asp:HyperLinkField DataNavigateUrlFields="survey_ID" DataNavigateUrlFormatString="~/Survey/SurveyMaintenance.aspx?Action=Update&surveyID={0}"
                         DataTextField="survey_name" NavigateUrl="~/Survey/SurveyMaintenance.aspx" HeaderText = "survey Name"/>
                        
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbsurveyAbbrHeader" Text="Abbreviation" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbsurveyAbbr" Text='<%#Eval("survey_abbr") %>'/>
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
    <table>
    <tr>
    <td>
    <asp:Button ID="btnAdd" Text="Add" runat="server"  onclick="btnAdd_Click"/>
    </td>
    <td>
        <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick="btnDelete_Click" Width="80px"/>
        </td>
    <td>
    <asp:Button ID="btnClear" Text="Clear" runat="server" onclick="btnClear_Click" />
    </td>
    <td>
    <asp:Button ID="btnQuestions" Text="Manage Questions" runat="server" onclick="btnManageSection_Click" />
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

