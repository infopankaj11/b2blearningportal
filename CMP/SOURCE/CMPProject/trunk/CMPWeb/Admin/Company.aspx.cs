using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using WorkLayers.BusinessLayer;
using System.Configuration;

namespace CMPWeb.Admin
{
    public partial class Company : System.Web.UI.Page
    {
        CompanyBL companyBL;
        public Company()
        {
            companyBL = new CompanyBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";
            if (!Page.IsPostBack)
                PopulateCompanyList();
        }

        private void PopulateCompanyList()
        {
            DataTable dtCompany = companyBL.GetAllCompanies();
            gv_Companies.DataSource = dtCompany;
            gv_Companies.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompanyMaintenance.aspx?Action=Add");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int[] CompanyIDs = GetSelectedCompanyIDs();
            if (CompanyIDs.Length == 0)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please select Company before proceeding.";
                return;
            }
            else
            {
                companyBL.DeleteCompanies(CompanyIDs);
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Successfully deleted selected User(s).";
                PopulateCompanyList();
            }
        }

        protected int[] GetSelectedCompanyIDs()
        {
            ArrayList SelectedCompanyIDs = new ArrayList();
            CheckBox chkSelectedCompany;
            foreach (GridViewRow myRow in gv_Companies.Rows)
            {
                chkSelectedCompany = (CheckBox)(myRow.FindControl("chkSelectedCompany"));
                if (chkSelectedCompany.Checked)
                    SelectedCompanyIDs.Add(gv_Companies.DataKeys[myRow.RowIndex].Value);
            }
            return (int[])SelectedCompanyIDs.ToArray(typeof(int));
        }
    }
}
