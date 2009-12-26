<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login" EnableSessionState="True" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .style3
        {
            height: 34px;
        }
        .style4
        {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table cellpadding="0" cellspacing="0" width="100%">
    <tr style="height:200px" >
    <td></td>
    </tr>
    
    <tr>
    <td style="width:30%"></td>
   
    <td style="width:40%">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td class="style3">
                    UserID:
                </td>
                <td class="style3">
                    <asp:TextBox runat="server" ID="txtUserName" Width="200px" />
                    <asp:RequiredFieldValidator runat="server" ID="rfv_UserName" ControlToValidate="txtUserName" ErrorMessage="*" />
                </td>
            </tr>
            
            <tr>
                <td class="style4">
                    Password:
                </td>
                <td class="style4">
                    <asp:TextBox runat="server" ID="txtUserPass" Width="200px" TextMode="Password" />
                    <asp:RequiredFieldValidator runat="server" ID="rfv_UserPass" ControlToValidate="txtUserPass" ErrorMessage="*" />
                </td>
            </tr>
            
            <tr>
                <td class="style4">
                    User Level
                </td>
                <td class="style4">
                    <asp:DropDownList runat="server" ID="ddl_UserLevel" Width="200px">
                        <asp:ListItem Text="Portal Administrator" Value="PortalAdmin" />
                        <asp:ListItem Text="User Administrator" Value="UserAdmin" />
                        <asp:ListItem Text="User" Value="User" Selected="True" />
                    </asp:DropDownList>
                </td>
            </tr>
            
            <tr>
                <td/>
                <td>
                    <asp:Button runat="server" ID="btnLogin" Text="Login" Width="80px" OnClick="btnLogin_Click"/>
                </td>
            </tr>
            
            <tr>
                <td colspan="2">
                    <asp:Label runat="server" ID="lblMsg" ForeColor="Red" />
                </td>
            </tr>
        </table> 
    </td>
    
    <td style="width:30%"></td>
    </tr>
    </table>
    </form>
</body>
</html>
