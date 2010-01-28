<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PortalAdmin.aspx.cs" Inherits="PortalAdmin" Title="Portal Admin page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1>Portal Administration Maintenance</h1></center>
 
<table class="middle"  >
<tr>
<td>
 
</td>
</tr>
<tr>
<td>
<center>
<table width="500px" >
<tr>
    <td>
          <a class="Portaladmin"  href="../ACS/DAP.aspx" >DAP Manager</a> <br /> 
    </td>
    <td>
          <a class="Portaladmin"  href="../ACS/FAP.aspx" >FAP Manager</a><br />
    </td>
    </tr>
    <tr>
    <td>
          <a class="Portaladmin"  href="../ACS/Roles.aspx" >Roles Manager</a> <br /> 
    </td><td>          
          <a  class="Portaladmin" href="../Admin/PortalAdmin.aspx" >Portal Admin</a> <br />
     </td>
     </tr>
     <tr>
     <td>
          <a class="Portaladmin"  href="../ACS/UserAdmin.aspx" >User Admin Manager</a><br />
     </td><td>
          <a class="Portaladmin"  href="../Admin/Company.aspx" >Company Manager</a> <br />
      </td>
      </tr>
      <tr>
      <td>
           <a class="Portaladmin" href="../CMS/CMS_Sites.aspx" >Module Manager</a>
           </td>
           <td> &nbsp;
           </td>
           </td>
           </table>
           </center>
                 
    <br />
  </td>
</tr>  
<tr>
<td>
<br /><br /><br /><br /><br />
    

</td>
</tr>
</table>    



    
</asp:Content>

