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

}
