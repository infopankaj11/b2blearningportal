<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAP.aspx.cs" Inherits="Website.FAP" StylesheetTheme="MainSkin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing = "0" width="100%">
            <tr>
            <td style="width:40%">
                <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                <td style="height:30px; width:30%">
                    <b>FAP Name: 
                </b> 
                </td>
                <td style="width:70%">
                    <asp:TextBox runat="server" ID="tbFAPName" Width="120px"></asp:TextBox>
                </td>
                </tr>
                
                <tr>
                <td style="height:30px; width:30%" valign="top" >
                    <b>Rights: 
                </b> 
                </td>
                <td style="width:70%">
                    <asp:CheckBoxList runat="server" ID="cbl_Rights">
                    <asp:ListItem Text="Take Exam" Value="TakeExam" />
                    <asp:ListItem Text="Print Certificate" Value="PrintCert" />
                    <asp:ListItem Text="Take Survey" Value="TakeSurvey" />
                    </asp:CheckBoxList>
                </td>
                </tr>
                
                <tr>
                <td valign="top" >
                    <b>Description:</b>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="tbDesc" Height="100px" Width="200px" />
                </td>
                </tr>
                
                <tr>
                <td colspan="2" align="center" >
                    <asp:Button runat="server" ID="btnAdd" Text="Add" SkinID="button" />
                    <asp:Button runat="server" ID="btnUpdate" Text="Update" SkinID="button" />
                    <asp:Button runat="server" ID="btnDelete" Text="Delete" SkinID="button" />
                </td>
                </tr>
                </table>
            </td>
            
            <td style="width:60%" valign="top" >
                <asp:GridView Width="100%" runat="server" ID="gv_FAPs" AutoGenerateColumns="false" >
                <Columns>
                <asp:TemplateField HeaderText = "FAP Name">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" ID="HyperLink1" Text='<%#Eval("FAPName") %>' NavigateUrl = '<%#Eval("FAPName", "~/FAP.aspx?FAPName={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Description" DataField = "Description" />
                </Columns>
                </asp:GridView>
            </td>
            
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
