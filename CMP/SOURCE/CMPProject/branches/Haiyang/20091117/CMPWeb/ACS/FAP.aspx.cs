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

public partial class FAP : System.Web.UI.Page
{
    FAPBL fapBL;

    public FAP()
    {
        fapBL = new FAPBL();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";
        if (!Page.IsPostBack)
            PopulateFAPList();
    }

    private void PopulateFAPList()
    {
        DataTable dtFAP = fapBL.GetAllFAPs();
        gv_FAPs.DataSource = dtFAP;
        gv_FAPs.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("FAPMaintenance.aspx?Action=Add");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int[] FAPIDs = GetSelectedFAPIDs();
        if (FAPIDs.Length == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select FAP before proceeding.";
            return;
        }
        else
        {
            fapBL.DeleteFAPs(FAPIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully deleted selected FAP(s).";
            PopulateFAPList();
        }
    }

    protected int[] GetSelectedFAPIDs()
    {
        ArrayList SelectedFAPIDs = new ArrayList();
        CheckBox chkSelectedFAP;
        foreach (GridViewRow myRow in gv_FAPs.Rows)
        {
            chkSelectedFAP = (CheckBox)(myRow.FindControl("chkSelectedFAP"));
            if (chkSelectedFAP.Checked)
                SelectedFAPIDs.Add(gv_FAPs.DataKeys[myRow.RowIndex].Value);
        }
        return (int[])SelectedFAPIDs.ToArray(typeof(int));
    }
}
