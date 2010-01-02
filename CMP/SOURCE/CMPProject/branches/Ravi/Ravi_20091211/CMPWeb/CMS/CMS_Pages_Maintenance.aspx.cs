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
    public partial class CMS_Pages_Maintenance : System.Web.UI.Page
    {
        string _userName = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            _userName = Session["UserName"].ToString();

            if (!IsPostBack)
            {
                loadSort();
                hdnSiteName.Value = Request.QueryString["siteName"].ToString();
                lblOutlineName.Text = Request.QueryString["outlineName"].ToString();
                hdnCompanyName.Value = Request.QueryString["companyName"].ToString();
                hdnSiteID.Value = Request.QueryString["siteID"].ToString();
                hdnPageID.Value = Request.QueryString["pageID"].ToString(); 

                if (Request.QueryString["type"] == "update")
                {
                    txtPageName.Enabled = false;
                    hdnChildPageID.Value = Request.QueryString["childPageID"].ToString(); 
                    lblTitle.Text = "Update Page";
                    LoadFields();
                }
                else
                {
                    hdnMaxSortNum.Value = Request.QueryString["maxSortNum"].ToString();
                    ddlSortNumber.SelectedValue = (Convert.ToInt32(hdnMaxSortNum.Value) + 1).ToString();
                    txtPageName.Enabled = true;
                    lblTitle.Text = "Add Page";
                }
            }
            else
            {

            }
        }

        private void loadSort()
        {
            for (int i = 1; i < 100; i++)
                ddlSortNumber.Items.Add(new ListItem(i.ToString(), i.ToString()));
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
                    ddlSortNumber.SelectedValue = pageDR["CHILD_SORT_PAGE_NUM"].ToString();
                    string isPublished = pageDR["IS_PUBLISHED"].ToString();
                    hdnMaxSortNum.Value = pageDR["CHILD_SORT_PAGE_NUM"].ToString();
                    if (isPublished == "1")
                        rbYes.Checked = true;
                    else
                        rbNo.Checked = true;
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SavePage();            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {            
            Response.Redirect("../CMS/CMS_Pages.aspx?companyName=" + hdnCompanyName.Value + "&siteName=" + hdnSiteName.Value + "&outlineName=" + lblOutlineName.Text + "&siteID=" + hdnSiteID.Value + "&pageID=" + hdnPageID.Value, false);
        }

        private void SavePage()
        {
            try
            {
                int returnNumber = -1;
                int sortNumber = -1;
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

                SqlServer sqlServer = new SqlServer(Util.SqlConnectionString()); ;

                string isPublished = "";
                if (rbYes.Checked)
                    isPublished = "1";
                else if (rbNo.Checked)
                    isPublished = "0";

                sortNumber = cmsBL.GetDuplicatePageSort(hdnSiteID.Value, hdnPageID.Value, ddlSortNumber.SelectedValue);

                if (sortNumber == 0)
                {
                    childPageNumber = cmsBL.JMD_PAGE_SAVE(hdnChildPageID.Value, hdnSiteName.Value, pageName, pageCaption,
                    metaTitle, metaDesc, metaKey, "",
                    isPublished, "0", "0", "Admin", "Admin", "Admin", "Admin", "Admin", "Admin", "0", "0", "0", "1");

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

                        returnNumber = cmsBL.UpdateTreeview(hdnSiteID.Value, hdnPageID.Value, childPageNumber.ToString(), ddlSortNumber.SelectedValue, _userName);
                    }
                    else
                    {
                        returnNumber = cmsBL.CreateTreeview(hdnSiteID.Value, hdnPageID.Value, childPageNumber.ToString(), ddlSortNumber.SelectedValue, _userName);
                    }

                    sqlServer.JMD_PAGE_MOD_SAVE(pageModID, hdnSiteName.Value, pageName, "7",
                    "Mod_" + pageName, "7", "1", "0", "Admin;Guests;Registered;",
                    "Admin;", "Admin;", "Admin;", "Admin;", "0");

                    lblMessage.Text = "Page Updated Successfully";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                }
                else
                {
                    lblMessage.Text = "Sort Number already exist";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Page Not Updated";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        
    }
}
