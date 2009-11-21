using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using WorkLayers.BusinessLayer;

public partial class Roles : System.Web.UI.Page
{
    RoleBL roleBL;

    public Roles()
    {
        roleBL = new RoleBL();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";
        if (!Page.IsPostBack)
            PopulateRoleList();
    }

    private void PopulateRoleList()
    {
        DataTable dtRole = roleBL.GetAllRoles();
        gv_Roles.DataSource = dtRole;
        gv_Roles.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("RoleMaintenance.aspx?Action=Add");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int[] RoleIDs = GetSelectedRoleIDs();
        if (RoleIDs.Length == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select Role before proceeding.";
            return;
        }
        else
        {
            roleBL.DeleteRoles(RoleIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully deleted selected Role(s).";
            PopulateRoleList();
        }
    }

    protected int[] GetSelectedRoleIDs()
    {
        ArrayList SelectedRoleIDs = new ArrayList();
        CheckBox chkSelectedRole;
        foreach (GridViewRow myRow in gv_Roles.Rows)
        {
            chkSelectedRole = (CheckBox)(myRow.FindControl("chkSelectedRole"));
            if (chkSelectedRole.Checked)
                SelectedRoleIDs.Add(gv_Roles.DataKeys[myRow.RowIndex].Value);
        }
        return (int[])SelectedRoleIDs.ToArray(typeof(int));
    }
}
