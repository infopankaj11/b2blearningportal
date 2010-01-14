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
    public partial class CMS_Sites_Outline_Maintenance : System.Web.UI.Page
    {
        string _userName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            _userName = Session["userName"].ToString();
            if (!IsPostBack)
            {
                loadSort();
                hdnSiteID.Value = Request.QueryString["siteID"].ToString();
                hdnCompanyName.Value = Request.QueryString["companyName"].ToString();
                hdnSiteName.Value = Request.QueryString["siteName"].ToString();

                if (Request.QueryString["type"].ToString() == "update")
                {
                    hdnPageID.Value = Request.QueryString["pageID"].ToString();
                    lblTitle.Text = "Update Outline";
                    LoadFields(hdnSiteID.Value, hdnPageID.Value);                                            
                }
                else
                {
                    hdnMaxSortNum.Value = Request.QueryString["maxSortNum"].ToString();
                    ddlSortNumber.SelectedValue = (Convert.ToInt32(hdnMaxSortNum.Value) + 1).ToString();
                    lblTitle.Text = "Add Outline";
                }
            }
        }

        private void loadSort()
        {
            for (int i = 1; i < 100; i++)
                ddlSortNumber.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }

        private void LoadFields(string siteID, string pageID)
        {
            try
            {                
                CMSBL cmsBL = new CMSBL();
                DataTable siteDT = cmsBL.GetOutline(siteID, pageID);
                foreach (DataRow siteDR in siteDT.Rows)
                {
                    txtOutlineName.Text = siteDR["PAGE_NAME"].ToString();
                    txtOutlineRemark.Text = siteDR["PAGE_REMARK"].ToString();
                    ddlSortNumber.SelectedValue = siteDR["SORT_NUMBER"].ToString();
                    hdnMaxSortNum.Value = siteDR["SORT_NUMBER"].ToString();
                }
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
                int sortNumber = -1;
                string outlineName = txtOutlineName.Text.Replace("'", "''");
                string outlineRemark = txtOutlineRemark.Text.Replace("'", "''");
                

                sortNumber = cmsBL.GetDuplicateOutlineSort(hdnSiteID.Value, ddlSortNumber.SelectedValue);

                if (sortNumber == 0)
                {
                    if (lblTitle.Text == "Add Outline")
                    {
                        returnNumber = cmsBL.GetDuplicateOutline(hdnSiteID.Value, outlineName);

                        if (returnNumber == 0)
                        {
                            returnNumber = cmsBL.CreateOutline(hdnSiteID.Value, outlineName, outlineRemark, ddlSortNumber.SelectedValue, "Y", _userName);
                        }
                    }
                    else if (lblTitle.Text == "Update Outline")
                    {
                        returnNumber = cmsBL.UpdateOutline(hdnSiteID.Value, hdnPageID.Value, outlineName, outlineRemark, ddlSortNumber.SelectedValue, _userName);
                    }
                }
                if (returnNumber == 1)
                {
                    if (lblTitle.Text == "Add Outline")
                    {
                        lblMessage.Text = "Successfully added the new Outline.";
                    }
                    else
                    {
                        lblMessage.Text = "Successfully updated the Outline.";
                    }
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                }
                else if (returnNumber == 10)
                {
                    lblMessage.Text = "Outline already exist.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else if (sortNumber == 10)
                {
                    lblMessage.Text = "Sort Number already exist.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    if (lblTitle.Text == "Add Outline")
                    {
                        lblMessage.Text = "Outline Not Added.";
                    }
                    else
                    {
                        lblMessage.Text = "Outline Not Updated.";
                    }
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("../CMS/CMS_Site_Outline.aspx?companyName=" + hdnCompanyName.Value + " &siteName=" + hdnSiteName.Value + "&siteID=" + hdnSiteID.Value, false);
        }
    }
}
