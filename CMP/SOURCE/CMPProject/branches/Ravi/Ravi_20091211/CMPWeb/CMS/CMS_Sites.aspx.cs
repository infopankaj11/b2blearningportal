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
    public partial class CMS_Sites : System.Web.UI.Page
    {
        string _userName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ConfigurationManager.AppSettings["CurrentMenu"] = "Modules";
            _userName = Session["UserName"].ToString();
            
            if (!IsPostBack)
            {
                LoadSiteDetails();
                SetGrdRadiosOnClick();
            }
        }

        public void SetGrdRadiosOnClick()
        {
            int i;
            RadioButton B;
            for (i = 0; i < dgSites.Items.Count; i++)
            {
                B = (RadioButton)dgSites.Items[i].FindControl("rbSelect");
                B.Attributes.Add("OnClick", "SelectOne(" + B.ClientID + ", " + "'dgSites'" + ")");
            }
        }


        private void LoadSiteDetails()
        {
            try
            {
                CMSBL cmsBL = new CMSBL();
                DataTable siteDT = cmsBL.GetAllSites();

                dgSites.DataSource = siteDT;
                if ((dgSites.Items.Count % dgSites.PageSize == 1) &&
                    (dgSites.CurrentPageIndex == dgSites.PageCount - 1) &&
                    (dgSites.CurrentPageIndex != 0))
                {
                    dgSites.CurrentPageIndex = dgSites.CurrentPageIndex - 1;
                }
                dgSites.DataBind();
            }
            catch (Exception ex)
            {
                
            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("../CMS/CMS_Sites_Maintenance.aspx?type=add", false);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int returnNumber = -1;
            int rowNumber = 0;
            rowNumber = GetSelectedRow();

            if (rowNumber >= 0)
            {
                string companyID = dgSites.Items[rowNumber].Cells[2].Text;
                string siteID = dgSites.Items[rowNumber].Cells[0].Text;

                CMSBL cmsBL = new CMSBL();
                returnNumber = cmsBL.DeleteSite(companyID, siteID, _userName);
            }

            /*for (int i = 0; i < dgSites.Items.Count; i++)
            {
                CheckBox chkFlag;
                chkFlag = (CheckBox)dgSites.Items[i].Cells[0].FindControl("chkSelect");
                if (chkFlag.Checked)
                {
                    string companyID = dgSites.Items[i].Cells[2].Text;
                    string siteID = dgSites.Items[i].Cells[0].Text;

                    CMSBL cmsBL = new CMSBL();
                    returnNumber = cmsBL.DeleteSite(companyID, siteID, _userName);
                }
            }*/

            if (returnNumber > 0)
            {
                lblMessage.Text = "Record Deleted Successfully";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                LoadSiteDetails();
            }
            else
            {
                lblMessage.Text = "Record Not Deleted";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        /*protected void btnModify_Click(object sender, EventArgs e)
        {
            int rowNumber = 0;            
            rowNumber = GetSelectedRow();
            if (rowNumber >= 0)
            {
                string companyID = dgSites.Items[rowNumber].Cells[2].Text;
                string siteID = dgSites.Items[rowNumber].Cells[0].Text;
                Response.Redirect("../CMS/CMS_Sites_Maintenance.aspx?companyID="+ companyID + "&siteID=" + siteID, false);
            }
        }*/

        public void EditSite(object sender, System.EventArgs e)
        {
            LinkButton chkTemp = (LinkButton)sender;
            DataGridItem dgi;
            dgi = (DataGridItem)chkTemp.Parent.Parent;
            dgSites.SelectedIndex = dgi.ItemIndex;
            Response.Redirect("../CMS/CMS_Sites_Maintenance.aspx?type=update&companyID=" + dgSites.Items[dgSites.SelectedIndex].Cells[2].Text + "&siteID=" + dgSites.Items[dgSites.SelectedIndex].Cells[0].Text, false);            
        }

        /*private int GetSelectedRow()
        {
            int rowNumber = -1;
            for (int i = 0; i < dgSites.Items.Count; i++)
            {
                CheckBox chkFlag;
                chkFlag = (CheckBox)dgSites.Items[i].Cells[0].FindControl("chkSelect");
                if (chkFlag.Checked)
                {
                    rowNumber = i;
                    break;
                }
            }

            return rowNumber;
        }*/

        private int GetSelectedRow()
        {
            int rowNumber = -1;
            for (int i = 0; i < dgSites.Items.Count; i++)
            {
                RadioButton rbFlag;
                rbFlag = (RadioButton)dgSites.Items[i].Cells[0].FindControl("rbSelect");
                if (rbFlag.Checked)
                {
                    rowNumber = i;
                    break;
                }
            }

            return rowNumber;
        }

        protected void btnManageSite_Click(object sender, EventArgs e)
        {
            int rowNumber = 0;
            rowNumber = GetSelectedRow();
            if (rowNumber >= 0)
            {
                string companyName = dgSites.Items[rowNumber].Cells[3].Text;
                string siteName = dgSites.Items[rowNumber].Cells[1].Text;
                string siteID = dgSites.Items[rowNumber].Cells[0].Text;
                //Response.Redirect("../CMS/CMS_Pages.aspx?companyName=" + companyName +" &siteName=" + siteName + "&siteID=" + siteID, false);
                Response.Redirect("../CMS/CMS_Site_Outline.aspx?companyName=" + companyName + " &siteName=" + siteName + "&siteID=" + siteID, false);
            }            
        }

        /*protected void btnManageTreeView_Click(object sender, EventArgs e)
        {
            int rowNumber = 0;
            rowNumber = GetSelectedRow();
            if (rowNumber >= 0)
            {
                string siteName = dgSites.Items[rowNumber].Cells[1].Text;
                string siteID = dgSites.Items[rowNumber].Cells[0].Text;
                Response.Redirect("../CMS/ContentPyramid_Maintenance.aspx?siteName=" + siteName + "&siteID=" + siteID, false);
            }        
        }*/
    }
}