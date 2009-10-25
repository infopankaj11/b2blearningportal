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

public partial class ExamMaintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "Exams";
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("ExamAdd.aspx");
    }

    protected void btnManage_Click(object sender, EventArgs e)
    {
        Response.Redirect("ModuleMaintenance.aspx");
    }
}
