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

public partial class DAPMaintenance : System.Web.UI.Page
{
    DAPBL dapBL;
    HiddenField hfHasModule;
    CheckBox chkModuleSelected;
    DataTable dtModules, dtDAPInfo;

    public DAPMaintenance()
    {
        dapBL = new DAPBL();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["DAPID"]))
                lblDAPID.Text = Request.QueryString["DAPID"];
            lblAction.Text = Request.QueryString["Action"];
            if (lblAction.Text == "Update")
            {
                btnAddUpdate.Text = "Update";
                PopulateDAPInfo();
            }
            if (lblAction.Text == "Add")
                btnAddUpdate.Text = "Add";
            PopulateModules();
        }
    }
        
    protected void PopulateDAPInfo()
    {
        dtDAPInfo = dapBL.GetDAPInfoByDAPID(lblDAPID.Text);
        txtDAPName.Text = dtDAPInfo.Rows[0]["DAPName"].ToString();
        txtDAPRemark.Text = dtDAPInfo.Rows[0]["DAP_Remark"].ToString();
    }

    protected void PopulateModules()
    {
        dtModules = dapBL.GetModulesByDAPID(lblDAPID.Text);
        gv_Modules.DataSource = dtModules;
        gv_Modules.DataBind();
    }

    protected void gv_Modules_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            hfHasModule = (HiddenField)e.Row.FindControl("hfdHasModule");
            chkModuleSelected = (CheckBox)e.Row.FindControl("chkModuleSelected");
            if (hfHasModule.Value == "Yes")
            {
                chkModuleSelected.Checked = true;
            }
        }
    }

    protected void btnAddUpdate_Click(object sender, EventArgs e)
    {
        int[] ModuleIDs = GetSelectedModuleIDs();
        if (ModuleIDs.Length == 0) //means no function selected, which is not allowed. 
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select Modules before proceeding.";
            return;
        }
        else
        {
            if (String.IsNullOrEmpty(txtDAPName.Text))
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please give DAP name before proceeding.";
            }
        }

        if (lblAction.Text == "Add") //Add new DAP
        {
            dapBL.InsertDAPInfo(txtDAPName.Text, Session["UserName"].ToString(), txtDAPRemark.Text, ModuleIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully added the new DAP.";
        }

        if (lblAction.Text == "Update") //Update Existing DAP
        {
            dapBL.UpdateDAPInfoNModules(int.Parse(lblDAPID.Text), txtDAPName.Text, txtDAPRemark.Text, ModuleIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully updated the DAP.";

        }
    }

    protected int[] GetSelectedModuleIDs()
    {
        ArrayList SelectedModuleIDs = new ArrayList();
        foreach (GridViewRow myRow in gv_Modules.Rows)
        {
            chkModuleSelected = (CheckBox)(myRow.FindControl("chkModuleSelected"));
            if (chkModuleSelected.Checked)
                SelectedModuleIDs.Add(gv_Modules.DataKeys[myRow.RowIndex].Value);
        }
        return (int[])SelectedModuleIDs.ToArray(typeof(int));
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("DAP.aspx");
    }
}
