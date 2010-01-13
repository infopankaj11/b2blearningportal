<%@ Page Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserSurveyList.aspx.cs" Inherits="UserSurveyList" Title="Surveys" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <center><h1>Surveys</h1></center>
    
  <table width ="100%">
<tr>
<td>
    <table class="search">
    <tr align="right">
    <td>
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" Text="Search" runat="server" />
    </td>
    </tr>
    <tr align="right">
    <td>
    <asp:RadioButton id="rb1" Text="by survey" runat="server"/>
    <asp:RadioButton id="RadioButton1" Text="by Module" runat="server"/>
    </td>
    </tr>
    </table>

</td>
</tr>
<tr class="" >
<td>
<table cellpadding="0" cellspacing="0" width="100%"   >
        <tr>
            <td style="width:60%" valign="top" >
                <asp:GridView Width="100%" runat="server" ID="gv_surveys" AutoGenerateColumns="false" DataKeyNames="survey_ID" >
                <Columns>
                    <asp:TemplateField>
                        <itemstyle horizontalalign="Center" />
                        <headerstyle horizontalalign="Center" />
                        
                        <itemtemplate>
                            <asp:HiddenField ID="hfsurveyListID" Value='<%#Eval("survey_ID")%>' runat="server" />
                        </itemtemplate>
                    </asp:TemplateField>
                     
                    <asp:HyperLinkField DataNavigateUrlFields="survey_ID" DataNavigateUrlFormatString="~/Survey/UserSurveyPage.aspx?surveyID={0}"
                         DataTextField="survey_name" NavigateUrl="~/Survey/UserSurveyPage.aspx" HeaderText = "survey Name"/>
                        
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lbsurveyAbbrHeader" Text="Abbreviation" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbsurveyAbbr" Text='<%#Eval("survey_abbr") %>'/>
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
