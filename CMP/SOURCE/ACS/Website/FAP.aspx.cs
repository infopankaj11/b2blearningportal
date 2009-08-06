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

namespace Website
{
    public partial class FAP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populateTable();
            if (!(string.IsNullOrEmpty(Request.QueryString["FAPName"])))
            {
                populateData();
            }
        }

        private void populateTable()
        {
            DataTable dtFAP = new DataTable();
            DataRow drFAP;
            DataColumn dcCol;

            dcCol = new DataColumn("FAPName");
            dtFAP.Columns.Add(dcCol);
            dcCol = new DataColumn("Description");
            dtFAP.Columns.Add(dcCol);

            drFAP = dtFAP.NewRow();
            drFAP["FAPName"] = "Admin FAP";
            drFAP["Description"] = "FAP for Portal Admin";
            dtFAP.Rows.Add(drFAP);

            drFAP = dtFAP.NewRow();
            drFAP["FAPName"] = "User FAP";
            drFAP["Description"] = "FAP for User";
            dtFAP.Rows.Add(drFAP);

            gv_FAPs.DataSource = dtFAP;
            gv_FAPs.DataBind();
        }

        private void populateData() 
        {
            tbFAPName.Text = "Admin FAP";
            tbDesc.Text = "FAP for Portal Admin";
            cbl_Rights.Items[0].Selected = true;
            cbl_Rights.Items[2].Selected = true; 
        }

    }
}
