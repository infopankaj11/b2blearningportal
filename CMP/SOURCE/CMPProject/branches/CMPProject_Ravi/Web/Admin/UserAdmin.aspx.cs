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

public partial class UserAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "UserAdmin";
        populateTable();
        if (!(string.IsNullOrEmpty(Request.QueryString["UserAdName"])))
        {
            populateData();
        }
    }

    private void populateTable()
    {
        DataTable dtUserAd = new DataTable();
        DataRow drUserAd;
        DataColumn dcCol;


        dcCol = new DataColumn("Company");
        dtUserAd.Columns.Add(dcCol);
        dcCol = new DataColumn("Tel");
        dtUserAd.Columns.Add(dcCol);
        dcCol = new DataColumn("Fax");
        dtUserAd.Columns.Add(dcCol);
        dcCol = new DataColumn("ContactPerson");
        dtUserAd.Columns.Add(dcCol);
        dcCol = new DataColumn("Email");
        dtUserAd.Columns.Add(dcCol);
        dcCol = new DataColumn("Website");
        dtUserAd.Columns.Add(dcCol);
        dcCol = new DataColumn("Communication");
        dtUserAd.Columns.Add(dcCol);

        drUserAd = dtUserAd.NewRow();
        drUserAd["Company"] = "Bayer Southeast Asia";
        drUserAd["Tel"] = "23497656";
        drUserAd["Fax"] = "12131-123";
        drUserAd["ContactPerson"] = "Anita Brown";
        drUserAd["Email"] = "maysph@gmail.com";
        drUserAd["Website"] = "Http:\\www.Bayer.Com";
        drUserAd["Communication"] = "Phone";
        dtUserAd.Rows.Add(drUserAd);

        drUserAd = dtUserAd.NewRow();
        drUserAd["Company"] = "NTUC";
        drUserAd["Tel"] = "21117656";
        drUserAd["Fax"] = "87558923";
        drUserAd["ContactPerson"] = "John Michael";
        drUserAd["Email"] = "masdh@gmail.com";
        drUserAd["Website"] = "Http:\\www.Ntuc.Com";
        drUserAd["Communication"] = "Email";
        dtUserAd.Rows.Add(drUserAd);

        gv_UserAds.DataSource = dtUserAd;
        gv_UserAds.DataBind();
        gv_UserAds.Visible = true;
    }

    private void populateData()
    {
        //tbUserAdName.Text = "Admin UserAd";
        //tbDesc.Text = "UserAd for Portal Admin";
        //cbl_Rights.Items[0].Selected = true;
        //cbl_Rights.Items[2].Selected = true; 
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserAdMaintenance.aspx");
    }

}
