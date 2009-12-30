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
using JMDCMS.Web.Lib;

namespace CMPWeb.CMS
{
    public partial class CMS_Addtnl_Page_Maintenance : System.Web.UI.Page
    {
        string _userName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            _userName = Session["userName"].ToString();

            if (!IsPostBack)
            {
                hdnSiteName.Value = Request.QueryString["siteName"].ToString();
                hdnCompanyName.Value = Request.QueryString["companyName"].ToString();
                hdnSiteID.Value = Request.QueryString["siteID"].ToString();
                
                if (Request.QueryString["type"] == "update")
                {
                    txtPageName.Enabled = false;
                    hdnPageID.Value = Request.QueryString["pageID"].ToString();
                    lblTitle.Text = "Update Page";
                    LoadFields();
                }
                else
                {
                    txtPageName.Enabled = true;
                    lblTitle.Text = "Add Page";                    
                }
            }
        }

        
        private void LoadFields()
        {
            try
            {
                CMSBL cmsBL = new CMSBL();
                DataTable pageDT = cmsBL.GetPage(hdnSiteID.Value, hdnChildPageID.Value);
                foreach (DataRow pageDR in pageDT.Rows)
                {
                    txtPageName.Text = pageDR["PAGE_NAME"].ToString();
                    txtPageCaption.Text = pageDR["PAGE_CAPTION"].ToString();
                    txtMetaTitle.Text = pageDR["META_TITLE"].ToString();
                    txtMetaKeywords.Text = pageDR["META_KEYWORDS"].ToString();
                    txtMetaDescription.Text = pageDR["META_DESC"].ToString();
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string pageModId = "0";
            SavePage();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("../CMS/CMS_Additional_Pages.aspx?companyName=" + hdnCompanyName.Value + "&siteName=" + hdnSiteName.Value + "&siteID=" + hdnSiteID.Value, false);
        }

        private void SavePage()
        {
            try
            {
                int returnNumber = -1;
                int childPageNumber = -1;
                string pageModID = "0";
                string pageName = txtPageName.Text.Replace("'", "''");
                string pageCaption = txtPageCaption.Text.Replace("'", "''");
                string metaTitle = txtMetaTitle.Text.Replace("'", "''");
                string metaDesc = txtMetaDescription.Text.Replace("'", "''");
                string metaKey = txtMetaKeywords.Text.Replace("'", "''");

                CMSBL cmsBL = new CMSBL();
                if (lblTitle.Text == "Add Page")
                {
                    bool duplicatePage = cmsBL.DuplicatePageName(hdnSiteID.Value, pageName);

                    if (duplicatePage)
                    {
                        lblMessage.Text = "Duplicate Page Name";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }

                SqlServer sqlServer = new SqlServer(Util.SqlConnectionString());

                childPageNumber = cmsBL.JMD_PAGE_SAVE(hdnChildPageID.Value, hdnSiteName.Value, pageName, pageCaption,
                metaTitle, metaDesc, metaKey, "",
                "1", "0", "0", "Admin", "Admin", "Admin", "Admin", "Admin", "Admin", "0", "0", "0", "1");

                if (lblTitle.Text == "Update Page")
                {
                    DataSet dsPageMod = new DataSet();
                    dsPageMod = sqlServer.JMD_LOAD_MODS(hdnSiteName.Value, pageName);
                    if (dsPageMod.Tables[0].Rows.Count > 0)
                    {
                        DataRow[] dr = dsPageMod.Tables[0].Select("PAGE_NAME='" + pageName + "'");
                        if (dr.Length > 0)
                            pageModID = dr[0]["PAGE_MOD_ID"].ToString();
                    }
                }

                sqlServer.JMD_PAGE_MOD_SAVE(pageModID, hdnSiteName.Value, pageName, "7",
                    "Mod_" + pageName, "7", "1", "0", "Admin;Guests;Registered;",
                    "Admin;", "Admin;", "Admin;", "Admin;", "0");

                lblMessage.Text = "Page Updated Successfully";
                lblMessage.ForeColor = System.Drawing.Color.Green;

            }
            catch (Exception ex)
            {
                lblMessage.Text = "Page Not Updated";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}
