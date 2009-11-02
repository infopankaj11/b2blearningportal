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

public partial class FAPMaintenance : System.Web.UI.Page
{
    FAPBL fapBL;
    String FAPID;
    String Action; 
    HiddenField hfHasFunction;
    CheckBox chkFunctionSelected;

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
            FAPID = Request.QueryString["FAPID"];
            Action = Request.QueryString["Action"];
            if (Action == "Update")
                PopulateFAPInfo(); 
            PopulateFunctions();
        }
    }

    protected void PopulateFAPInfo()
    {
        DataTable dtFAPInfo = fapBL.GetFAPInfoByFAPID(FAPID);
        txtFAPName.Text = dtFAPInfo.Rows[0]["FAPName"].ToString();
        txtFAPRemark.Text = dtFAPInfo.Rows[0]["FAP_Remark"].ToString();
    }

    protected void PopulateFunctions()
    {
        DataTable dtFunctions = fapBL.GetFunctionsByFAPID(FAPID);
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


}
