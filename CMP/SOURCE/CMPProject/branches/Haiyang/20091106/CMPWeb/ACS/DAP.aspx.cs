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

public partial class DAP : System.Web.UI.Page
{
    DAPBL dapBL;

    public DAP()
    {
        dapBL = new DAPBL();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";

        if (!Page.IsPostBack)
            PopulateDAPList();
    }

    private void PopulateDAPList()
    {
        DataTable dtDAP = dapBL.GetAllDAPs();
        gv_DAPs.DataSource = dtDAP;
        gv_DAPs.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("DAPMaintenance.aspx?Action=Add");
    }

    protected void btnManage_Click(object sender, EventArgs e)
    {
        Response.Redirect("DAPMaintenance.aspx");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int[] DAPIDs = GetSelectedDAPIDs();
        if (DAPIDs.Length == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select DAP before proceeding.";
            return;
        }
        else
        {
            dapBL.DeleteDAPs(DAPIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully deleted selected DAP(s).";
            PopulateDAPList();
        }
    }

    protected int[] GetSelectedDAPIDs()
    {
        ArrayList SelectedDAPIDs = new ArrayList();
        CheckBox chkSelectedDAP;
        foreach (GridViewRow myRow in gv_DAPs.Rows)
        {
            chkSelectedDAP = (CheckBox)(myRow.FindControl("chkSelectedDAP"));
            if (chkSelectedDAP.Checked)
                SelectedDAPIDs.Add(gv_DAPs.DataKeys[myRow.RowIndex].Value);
        }
        return (int[])SelectedDAPIDs.ToArray(typeof(int));
    }


}
