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

namespace Web.CMS
{
    public partial class CMS_Sites_Maintenance : System.Web.UI.Page
    {
        string _userName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            _userName = Session["UserName"].ToString();
            if (!IsPostBack)
            {
                //btnClear.Attributes.Add("onclick", "ClearFields()");
                LoadCompany();
                LoadStyleSheet();
                if (Request.QueryString["type"].ToString() == "update")
                {
                    lblTitle.Text = "Update Company-Site";                    
                    if (Request.QueryString["companyID"] != null && Request.QueryString["siteID"] != null)
                    {
                        LoadFields(Request.QueryString["companyID"].ToString(), Request.QueryString["siteID"].ToString());
                        txtSiteName.Enabled = false;
                        ddlCompany.Enabled = false;
                    }
                }
                else
                {
                    txtSiteName.Enabled = true;
                    ddlCompany.Enabled = true;
                    lblTitle.Text = "Add Company-Site";                    
                }
            }
            else
            {
                
            }
        }

        private void LoadFields(string companyID, string siteID)
        {
            try
            {
                CMSBL cmsBL = new CMSBL();
                DataTable siteDT = cmsBL.GetSite(companyID, siteID);
                foreach (DataRow siteDR in siteDT.Rows)
                {
                    txtSiteName.Text = siteDR["SITE_NAME"].ToString();
                    ddlCompany.SelectedValue = siteDR["COMPANYID"].ToString();
                    ddlStyleSheet.SelectedValue = siteDR["STYLE_SHEET"].ToString();
                    txtFolderName.Text = siteDR["SITE_FOLDER"].ToString();
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void LoadCompany()
        {
            try
            {
                CMSBL cmsBL = new CMSBL();
                DataTable companyDT = cmsBL.GetAllCompany();
                ddlCompany.Items.Clear();
                ddlCompany.Items.Add(new ListItem("Select Company", "Select Company"));
                foreach (DataRow companyDR in companyDT.Rows)
                {
                    ddlCompany.Items.Add(new ListItem(companyDR["COMPANYNAME"].ToString(), companyDR["COMPANYID"].ToString()));
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void LoadStyleSheet()
        {
            try
            {
                ddlStyleSheet.Items.Clear();
                string styleSheet = ConfigurationSettings.AppSettings.Get("StyleSheet");
                char[] split = {','};
                string[] styleSheets = styleSheet.Split(split, StringSplitOptions.None);
                ddlStyleSheet.Items.Add(new ListItem("Select Stylesheet", "Select Stylesheet"));
                foreach (string sheet in styleSheets)
                {                    
                    ddlStyleSheet.Items.Add(new ListItem(sheet, sheet));
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void createFolder(string siteFolder)
        {
            try
            {
                string folderPath = ConfigurationSettings.AppSettings.Get("DirPath");
                System.IO.Directory.CreateDirectory(folderPath + siteFolder);
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                CMSBL cmsBL = new CMSBL();
                int returnNumber = -1;
                int folderNumber = -1;
                int siteNumber = -1;
                string siteName = txtSiteName.Text.Replace("'", "''");
                string companyName = ddlCompany.SelectedValue.ToString();

                folderNumber = cmsBL.GetDuplicateFolder(txtFolderName.Text);
                
                if (lblTitle.Text == "Add Company-Site")
                {
                    siteNumber = cmsBL.GetDuplicateSite(siteName, companyName);
                    
                    if (siteNumber == 0 && folderNumber == 0)
                    {
                        returnNumber = cmsBL.CreateSite(companyName, siteName, "", ddlStyleSheet.SelectedValue.ToString(), "", txtFolderName.Text, _userName);
                        if (returnNumber == 1)
                        {
                            createFolder(txtFolderName.Text);
                            cmsBL.UpdateModuleMaster(companyName, siteName, _userName);
                        }
                    }
                }
                else if (lblTitle.Text == "Update Company-Site")
                {                    
                        returnNumber = cmsBL.UpdateSite(ddlCompany.SelectedValue.ToString(), siteName, "", ddlStyleSheet.SelectedValue.ToString(), "", txtFolderName.Text, _userName);                    
                }

                if (returnNumber == 1)
                {
                    lblMessage.Text = "Record Updated Successfully";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    
                }
                else if (returnNumber == 10)
                {
                    lblMessage.Text = "Site already exist";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else if (returnNumber == 11)
                {
                    lblMessage.Text = "Folder already exist";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lblMessage.Text = "Record Not Updated";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("../CMS/CMS_Sites.aspx");
        }
    }
}
