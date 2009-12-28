using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using WorkLayers.BusinessLayer;

namespace CMPWeb.Admin
{
    public partial class CompanyMaintenance : System.Web.UI.Page
    {
        CompanyBL companyBL;
        DataTable dtCompanyInfo;

        public CompanyMaintenance()
        {
            companyBL = new CompanyBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";
            if (!Page.IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["CompanyID"]))
                    lblCompanyID.Text = Request.QueryString["CompanyID"];
                lblAction.Text = Request.QueryString["Action"];
                if (lblAction.Text == "Update")
                {
                    btnAddUpdate.Text = "Update";
                    PopulateCompanyInfo();
                }
                if (lblAction.Text == "Add")
                    btnAddUpdate.Text = "Add";
            }
        }

        protected void PopulateCompanyInfo()
        {
            dtCompanyInfo = companyBL.GetCompanyInfoByCompanyID(lblCompanyID.Text);
            txtCompanyName.Text = dtCompanyInfo.Rows[0]["CompanyName"].ToString();
            txtCompanyRemark.Text = dtCompanyInfo.Rows[0]["Company_Remark"].ToString();
            txtAddress1.Text = dtCompanyInfo.Rows[0]["CompanyAddress1"].ToString();
            txtAddress2.Text = dtCompanyInfo.Rows[0]["CompanyAddress2"].ToString();
            txtAddress3.Text = dtCompanyInfo.Rows[0]["CompanyAddress3"].ToString();
            txtPostalCode.Text = dtCompanyInfo.Rows[0]["PostalCode"].ToString();
            txtContactPerson.Text = dtCompanyInfo.Rows[0]["ContactPerson"].ToString();
            txtContactEmail.Text = dtCompanyInfo.Rows[0]["ContactEmail"].ToString();
            txtContactNo.Text = dtCompanyInfo.Rows[0]["ContactNo"].ToString();
            txtValidFrom.Text = DateTime.Parse(dtCompanyInfo.Rows[0]["ValidPeriod_From"].ToString()).ToString("dd-MMM-yyyy");
            txtValidTo.Text = DateTime.Parse(dtCompanyInfo.Rows[0]["ValidPeriod_To"].ToString()).ToString("dd-MMM-yyyy");
        }

        protected void btnAddUpdate_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtCompanyName.Text.Trim()))
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please input company namebefore proceeding.";
                return;
            }

            if (lblAction.Text == "Add") //Add new company
            {
                companyBL.InsertCompanyInfo(txtCompanyName.Text, txtAddress1.Text, txtAddress2.Text, txtAddress3.Text, txtPostalCode.Text,
                    txtContactPerson.Text, txtContactEmail.Text, txtContactNo.Text, DateTime.Today.ToString("dd-MMM-yyyy"), "", Session["UserName"].ToString(),
                    DateTime.Today.ToString("dd-MMM-yyyy"), txtValidFrom.Text, txtValidTo.Text, Session["UserName"].ToString(), DateTime.Today.ToString("dd-MMM-yyyy"),
                    txtCompanyRemark.Text);
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Successfully added the new Company.";
            }

            if (lblAction.Text == "Update") //Update Existing Customer
            {
                companyBL.UpdateCompanyInfo(lblCompanyID.Text, txtCompanyName.Text, txtAddress1.Text, txtAddress2.Text, txtAddress3.Text,
                    txtPostalCode.Text, txtContactPerson.Text, txtContactEmail.Text, txtContactNo.Text, txtValidFrom.Text, txtValidTo.Text,
                    Session["UserName"].ToString(), DateTime.Today.ToString("dd-MMM-yyyy"), txtCompanyRemark.Text);
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Successfully updated the Customer.";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Company.aspx");
        }
    }
}
