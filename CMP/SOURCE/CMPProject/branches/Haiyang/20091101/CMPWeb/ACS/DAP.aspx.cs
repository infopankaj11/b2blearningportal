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

public partial class DAP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";

        populateTable();
        if (!(string.IsNullOrEmpty(Request.QueryString["DAPName"])))
        {
            populateData(Request.QueryString["DAPName"]);
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("DAPMaintenance.aspx");
    }

    private void populateTable()
    {
        DataTable dtDAP = new DataTable();
        DataRow drDAP;
        DataColumn dcCol;

        dcCol = new DataColumn("DAPName");
        dtDAP.Columns.Add(dcCol);
        dcCol = new DataColumn("Description");
        dtDAP.Columns.Add(dcCol);
        dcCol = new DataColumn("ModuleName");
        dtDAP.Columns.Add(dcCol);
        dcCol = new DataColumn("Type");
        dtDAP.Columns.Add(dcCol);

        drDAP = dtDAP.NewRow();
        drDAP["DAPName"] = "BAYERTR1";
        drDAP["Description"] = "Customer Service Tutorial for Bayer Staff";
        drDAP["ModuleName"] = "Customer Service";
        drDAP["Type"] = "Training";
        dtDAP.Rows.Add(drDAP);

        drDAP = dtDAP.NewRow();
        drDAP["DAPName"] = "BAYERT2";
        drDAP["Description"] = "Customer Service Exam";
        drDAP["ModuleName"] = "Customer Service";
        drDAP["Type"] = "Exam";
        dtDAP.Rows.Add(drDAP);

        drDAP = dtDAP.NewRow();
        drDAP["DAPName"] = "NTUC11";
        drDAP["Description"] = "NTUC Basic Manufacturing Training";
        drDAP["ModuleName"] = "Manufacturing";
        drDAP["Type"] = "Training";
        dtDAP.Rows.Add(drDAP);

        drDAP = dtDAP.NewRow();
        drDAP["DAPName"] = "NTUC12";
        drDAP["Description"] = "NTUC Basic Manufacturing Training Exam";
        drDAP["ModuleName"] = "Manufacturing";
        drDAP["Type"] = "MCQ";
        dtDAP.Rows.Add(drDAP);

        drDAP = dtDAP.NewRow();
        drDAP["DAPName"] = "NTUC13";
        drDAP["Description"] = "NTUC Basic Manufacturing Basic Exam";
        drDAP["ModuleName"] = "Manufacturing";
        drDAP["Type"] = "MCQ";
        dtDAP.Rows.Add(drDAP);

        gv_DAPs.DataSource = dtDAP;
        gv_DAPs.DataBind();
        gv_DAPs.Visible = true;
    }

    private void populateData(String a)
    {
        /* tbDAPName.Text = a;
         tbDesc.Text = Request.QueryString["DESC"];
         if (a.ToLower().Contains("bayer"))
         {
             cbl_Rights.Items[0].Selected = true;
             cbl_Rights.Items[1].Selected = false;
         }
         else
         {
             cbl_Rights.Items[1].Selected = true;
             cbl_Rights.Items[0].Selected = false;
         }*/
    }



    protected void btnManage_Click(object sender, EventArgs e)
    {
        Response.Redirect("DAPMaintenance.aspx");
    }
}
