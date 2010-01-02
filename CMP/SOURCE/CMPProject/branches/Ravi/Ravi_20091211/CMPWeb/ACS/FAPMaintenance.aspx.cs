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
using System.Collections;

public partial class FAPMaintenance : System.Web.UI.Page
{
    FAPBL fapBL;
    HiddenField hfHasFunction;
    CheckBox chkFunctionSelected;
    DataTable dtFunctions, dtFAPInfo;

    public FAPMaintenance()
    {
        fapBL = new FAPBL();
        hfHasFunction = new HiddenField();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["FAPID"]))
                lblFAPID.Text = Request.QueryString["FAPID"];
            lblAction.Text = Request.QueryString["Action"];
            if (lblAction.Text == "Update")
            {
                btnAddUpdate.Text = "Update";
                PopulateFAPInfo();
            }
            if (lblAction.Text == "Add")
                btnAddUpdate.Text = "Add";
            PopulateFunctions();
        }
    }

    protected void PopulateFAPInfo()
    {
        dtFAPInfo = fapBL.GetFAPInfoByFAPID(lblFAPID.Text);
        txtFAPName.Text = dtFAPInfo.Rows[0]["FAPName"].ToString();
        txtFAPRemark.Text = dtFAPInfo.Rows[0]["FAP_Remark"].ToString();
    }

    protected void PopulateFunctions()
    {
        dtFunctions = fapBL.GetFunctionsByFAPID(lblFAPID.Text);
        gv_Functions.DataSource = dtFunctions;
        gv_Functions.DataBind();
    }

    protected void gv_Functions_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            hfHasFunction = (HiddenField)e.Row.FindControl("hfdHasFunction");
            chkFunctionSelected = (CheckBox)e.Row.FindControl("chkFunctionSelected");
            if (hfHasFunction.Value == "Yes")
            {
                chkFunctionSelected.Checked = true;
            }
        }
    }

    protected void btnAddUpdate_Click(object sender, EventArgs e)
    {
        int[] FunctionIDs = GetSelectedFunctionIDs();
        if (FunctionIDs.Length == 0) //means no function selected, which is not allowed. 
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select functions before proceeding.";
            return;
        }
        else
        {
            if (String.IsNullOrEmpty(txtFAPName.Text))
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please give FAP name before proceeding.";
            }
        }

        if (lblAction.Text == "Add") //Add new FAP
        {
            fapBL.InsertFAPInfo(txtFAPName.Text, Session["UserName"].ToString(), txtFAPRemark.Text, FunctionIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully added the new FAP.";
        }

        if (lblAction.Text == "Update") //Update Existing FAP
        {
            fapBL.UpdateFAPInfoNFunctions(int.Parse(lblFAPID.Text), txtFAPName.Text, txtFAPRemark.Text, FunctionIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully updated the FAP.";

        }
    }

    protected int[] GetSelectedFunctionIDs()
    {
        ArrayList SelectedFunctionIDs = new ArrayList();
        foreach (GridViewRow myRow in gv_Functions.Rows)
        {
            chkFunctionSelected = (CheckBox)(myRow.FindControl("chkFunctionSelected"));
            if (chkFunctionSelected.Checked)
                SelectedFunctionIDs.Add(gv_Functions.DataKeys[myRow.RowIndex].Value);
        }
        return (int[])SelectedFunctionIDs.ToArray(typeof(int));
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("FAP.aspx");
    }
}
