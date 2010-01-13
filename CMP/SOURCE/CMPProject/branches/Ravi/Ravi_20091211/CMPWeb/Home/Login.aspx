<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login" EnableSessionState="True" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
        <link href="../styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
    <td style="width:30%"></td>
    
    <td style="width:40%">
    <center> <img alt="" src="../Images/logo.gif" style="width: 324px; height: 83px" /></center> 
    <br /> <br /> <br />
        <center> 
        <table cellpadding="5" cellspacing="0" width="100%" border=1>
            <tr>
                <td style="font-size: small; font-family: Verdana">
                    UserID:
                </td>
                <td class="style3">
                    <asp:TextBox runat="server" ID="txtUserName" Width="200px" />
                    <asp:RequiredFieldValidator runat="server" ID="rfv_UserName" ControlToValidate="txtUserName" ErrorMessage="*" />
                </td>
            </tr>
            
            <tr>
                <td style="font-size: small; font-family: Verdana">
                    Password:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtUserPass" Width="200px" TextMode="Password" />
                    <asp:RequiredFieldValidator runat="server" ID="rfv_UserPass" ControlToValidate="txtUserPass" ErrorMessage="*" />
                </td>
            </tr>
            
            <tr>
                <td style="font-size: small; font-family: Verdana">
                    User Level
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="ddl_UserLevel" Width="200px">
                        <asp:ListItem Text="Portal Administrator" Value="PortalAdmin" />
                        <asp:ListItem Text="User Administrator" Value="UserAdmin" />
                        <asp:ListItem Text="User" Value="User"  Selected="True"/>
                    </asp:DropDownList>
                </td>
            </tr>
            
            <tr>
                <td/>
                <td>
                    <asp:Button runat="server" ID="btnLogin" Text="Login" Width="80px" OnClick="btnLogin_Click"/>
                     <br />
                    <asp:Label runat="server" ID="lblMsg" ForeColor="Red" />
               
                </td>
            </tr>
            
            </table>
        </center> 
    </td>
    
    <td style="width:30%"></td>
    </tr>
    </table>
    </form>
</body>
</html>
