<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sections.aspx.cs" Inherits="Sections" Title="Section Manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center><h1> Section Maintenance</h1></center>
<center><h2> <asp:Label ID="lblExamName"  runat="server" Text="Label"></asp:Label></h2></center>
<center><h3> <asp:Label ID="lblInfo"  runat="server" Text=""></asp:Label></h3></center>

       <table cellpadding="0" cellspacing="0" width="100%" >
        <tr>
            <td style="width:60%" valign="top" >
                <asp:GridView Width="100%" runat="server" ID="gv_Object" AutoGenerateColumns="false" DataKeyNames="section_id" >
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox runat="server" ID="cbSelectAll" AutoPostBack="True" Visible=false   OnCheckedChanged="cbSelectAll_OnCheckedChanged" /> 
                        </HeaderTemplate>
                        <itemstyle horizontalalign="Center" />
                        <headerstyle horizontalalign="Center" />
                        
                        <itemtemplate>
                            <asp:CheckBox id="chkSelectedObject" runat="server" />  
                            <asp:HiddenField ID="hfObjectID" Value='<%#Eval("section_id")%>' runat="server" />
                        </itemtemplate>
                    </asp:TemplateField>
                     
                    <asp:HyperLinkField DataNavigateUrlFields="section_id,exam_id" DataNavigateUrlFormatString="~/MCQ/SectionMaintenance.aspx?Action=Update&SID={0}&ExamID={1}"
                         DataTextField="section_name" NavigateUrl="~/MCQ/SectionMaintenance.aspx" HeaderText = "Section Name"/>
                        
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
                            <asp:Label runat="server" ID="lbsection_seq" Text="Section Sequence" />
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbsection_seq" Text='<%#Eval("section_seq") %>'/>
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
    <asp:Button ID="btnAddUpdate" Text="Add" runat="server" onclick="btnAddUpdate_Click"   />
    </td>
    <td>
    <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick ="btnDelete_Click" />
    </td>    
        <td>
    <asp:Button ID="btnClear" Text="Clear" runat="server" OnClick ="btnClear_Click" />
    </td>    
    <td>
    <asp:Button ID="Button2" Text="Manage Question pool" runat="server"  OnClick ="btnManage_Click" />
    </td>
    <td>
    <asp:Button ID="btnBack" Text="Back to Exams" runat="server"  OnClick ="btnback_Click"/>
    </td>
    </tr>
    </table>
   
      <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" />
                <asp:Label runat="server" ID="lblExamID2" Visible="false" Text="" />
                <asp:Label runat="server" ID="lblAction" Visible="false" Text="" />
            </td>
        </tr>
    </table>
    
</asp:Content>

