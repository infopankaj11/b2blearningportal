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

public partial class Roles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        populateTableforRole();
        if (!(string.IsNullOrEmpty(Request.QueryString["RoleName"])))
        {
            populateData();
            populateTableforRole();
        }
        else
        {
            if (!(string.IsNullOrEmpty(Request.QueryString["DAPName"])))
                populateTableforDAP();
            if (!(string.IsNullOrEmpty(Request.QueryString["FAPName"])))
                populateTableforFAP();
        }
    }

    private void populateTableforRole()
    {
        DataTable dtFAP = new DataTable();
        DataRow drFAP;
        DataColumn dcCol;

        dcCol = new DataColumn("RoleName");
        dtFAP.Columns.Add(dcCol);
        dcCol = new DataColumn("Description");
        dtFAP.Columns.Add(dcCol);

        drFAP = dtFAP.NewRow();
        drFAP["RoleName"] = "User Admin Role";
        drFAP["Description"] = "Role for User Admin";
        dtFAP.Rows.Add(drFAP);

        drFAP = dtFAP.NewRow();
        drFAP["RoleName"] = "User Role";
        drFAP["Description"] = "Role for User";
        dtFAP.Rows.Add(drFAP);

        gv_Roles.DataSource = dtFAP;
        gv_Roles.DataBind();
    }

    private void populateTableforDAP()
    {

        DataTable dtDAP = new DataTable();
        DataRow drDAP;
        DataColumn dcCol;

        dcCol = new DataColumn("DAPName");
        dtDAP.Columns.Add(dcCol);
        dcCol = new DataColumn("Description");
        dtDAP.Columns.Add(dcCol);

        drDAP = dtDAP.NewRow();
        drDAP["DAPName"] = "Module1";
        drDAP["Description"] = "Module1 description";
        dtDAP.Rows.Add(drDAP);

        drDAP = dtDAP.NewRow();
        drDAP["DAPName"] = "Module2";
        drDAP["Description"] = "Module2 description";
        dtDAP.Rows.Add(drDAP);

        gv_DAPs.DataSource = dtDAP;
        gv_DAPs.DataBind();
    }

    private void populateTableforFAP()
    {
        gv_DAPs.Visible = false;

        DataTable dtFAP = new DataTable();
        DataRow drFAP;
        DataColumn dcCol;

        dcCol = new DataColumn("FAPName");
        dtFAP.Columns.Add(dcCol);
        dcCol = new DataColumn("Description");
        dtFAP.Columns.Add(dcCol);

        drFAP = dtFAP.NewRow();
        drFAP["FAPName"] = "Take Exam";
        drFAP["Description"] = "User rights to take exam";
        dtFAP.Rows.Add(drFAP);

        drFAP = dtFAP.NewRow();
        drFAP["FAPName"] = "Print Certificate";
        drFAP["Description"] = "User rights to print certificate";
        dtFAP.Rows.Add(drFAP);

        gv_FAPs.DataSource = dtFAP;
        gv_FAPs.DataBind();
    }

    private void populateData()
    {
        if (Request.QueryString["RoleName"] == "User Admin Role")
        {
            tbRoleName.Text = "User Admin Role";
            tbDesc.Text = "Role for User Admin";

            hl_FAP1.Text = "userFAP";
            hl_FAP2.Text = "UserAdminFAP";
            hl_FAP3.Text = "PortalAdminFAP";

            hl_DAP1.Text = "UserDAP";
            hl_DAP2.Text = "UserAdminDAP";
            hl_DAP3.Text = "PortalAdminDAP";
        }
        if (Request.QueryString["RoleName"] == "User Role")
        {
            hl_FAP1.Text = "userFAP";
            hl_FAP2.Visible = false;
            hl_FAP3.Visible = false;

            hl_DAP1.Text = "UserDAP";
            hl_DAP2.Visible = false;
            hl_DAP3.Visible = false;

            tbRoleName.Text = "User Role";
            tbDesc.Text = "Role for end user only.";
        }
    }
}
