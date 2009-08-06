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

public partial class PortalAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";

        populateTable();
        if (!(string.IsNullOrEmpty(Request.QueryString["UserName"])))
        {
           //populateData();
        }
    }

    private void populateTable()
    {
        DataTable dtPAdmin = new DataTable();
        DataRow drPAdmin;
        DataColumn dcCol;

        dcCol = new DataColumn("UserName");
        dtPAdmin.Columns.Add(dcCol);
        dcCol = new DataColumn("EmployeeID");
        dtPAdmin.Columns.Add(dcCol);
        dcCol = new DataColumn("EmployeeName");
        dtPAdmin.Columns.Add(dcCol);
        dcCol = new DataColumn("Email");
        dtPAdmin.Columns.Add(dcCol);


        drPAdmin = dtPAdmin.NewRow();
        drPAdmin["UserName"] = "pa1";
        drPAdmin["EmployeeID"] = "PA0002";
        drPAdmin["EmployeeName"] = "Michael Ang";
        drPAdmin["Email"] = "michael.ang@hotmail.com";
        dtPAdmin.Rows.Add(drPAdmin);

        drPAdmin = dtPAdmin.NewRow();
        drPAdmin["UserName"] = "pa2";
        drPAdmin["EmployeeID"] = "PA0003";
        drPAdmin["EmployeeName"] = "Angus Cheng";
        drPAdmin["Email"] = "angus.cheng@singnet.com";
        dtPAdmin.Rows.Add(drPAdmin);

        gv_PAdmins.DataSource = dtPAdmin;
        gv_PAdmins.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("PortalAdminAdd.aspx");
    }
    /*private void populateData()
    {
        if (Request.QueryString["UserName"] == "pa1")
        {
            tbUserID.Text = "pa1";
            tbEmployeeID.Text = "PA0002";
            tbEmployeeName.Text = "Michael Ang";
            tbEmail.Text = "michael.ang@hotmail.com";
        }

        if (Request.QueryString["UserName"] == "pa2")
        {
            tbUserID.Text = "pa2";
            tbEmployeeID.Text = "PA0003";
            tbEmployeeName.Text = "Angus Cheng";
            tbEmail.Text = "angus.cheng@singnet.com";
        }

    }*/
}
