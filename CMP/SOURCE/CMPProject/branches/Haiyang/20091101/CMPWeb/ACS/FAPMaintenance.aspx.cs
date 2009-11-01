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

    public FAPMaintenance()
    {
        fapBL = new FAPBL();
        //PopulateFAPList();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";
        PopulateFunctions();
    }

    private void PopulateFunctions()
    {
        DataTable dtFunctions = fapBL.GetAllFAPs();
        gv_Functions.DataSource = dtFunctions;
        gv_Functions.DataBind();
    }

}
