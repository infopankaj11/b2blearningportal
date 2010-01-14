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
    public partial class CMS_Site_Outline : System.Web.UI.Page
    {
        string _userName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            _userName = Session["userName"].ToString();
            if (!IsPostBack)
            {
                lblCompanyName.Text = Request.QueryString["companyName"].ToString();
                lblSiteName.Text = Request.QueryString["siteName"].ToString();
                if (Request.QueryString["siteID"] != null)
                {
                    hdnSiteID.Value = Request.QueryString["siteID"].ToString();
                    LoadOutlineDetails();                    
                }

                SetGrdRadiosOnClick();
            }
        }

        public void SetGrdRadiosOnClick()
        {
            int i;
            RadioButton radio;
            for (i = 0; i < dgOutline.Items.Count; i++)
            {
                radio = (RadioButton)dgOutline.Items[i].FindControl("rbSelect");
                radio.Attributes.Add("OnClick", "SelectOne(" + radio.ClientID + ", " + "'dgOutline'" + ")");
            }
        }

        private void LoadOutlineDetails()
        {
            try
            {
                CMSBL cmsBL = new CMSBL();
                DataTable siteDT = cmsBL.GetAllOutlines(hdnSiteID.Value);
                dgOutline.DataSource = siteDT;
                dgOutline.DataBind();

                /*if ((dgOutline.Items.Count % dgOutline.PageSize == 1) &&
                    (dgOutline.CurrentPageIndex == dgOutline.PageCount - 1) &&
                    (dgOutline.CurrentPageIndex != 0))
                {
                    dgOutline.CurrentPageIndex = dgOutline.CurrentPageIndex - 1;
                }*/
            }
            catch (Exception ex)
            {

            }
        }

        private int GetSelectedRow()
        {
            int rowNumber = -1;
            for (int i = 0; i < dgOutline.Items.Count; i++)
            {
                RadioButton rbFlag;
                rbFlag = (RadioButton)dgOutline.Items[i].Cells[0].FindControl("rbSelect");
                if (rbFlag.Checked)
                {
                    rowNumber = i;
                    break;
                }
            }

            return rowNumber;
        }

        public void EditOutline(object sender, System.EventArgs e)
        {
            LinkButton chkTemp = (LinkButton)sender;
            DataGridItem dgi;
            dgi = (DataGridItem)chkTemp.Parent.Parent;
            dgOutline.SelectedIndex = dgi.ItemIndex;
            string pageID = dgOutline.Items[dgOutline.SelectedIndex].Cells[0].Text;
            Response.Redirect("../CMS/CMS_Sites_Outline_Maintenance.aspx?type=update&companyName=" + lblCompanyName.Text + "&siteName=" + lblSiteName.Text + "&siteID=" + hdnSiteID.Value + "&pageID=" + pageID, false);
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int maxSortNum = 0;
            if (dgOutline.Items.Count > 0)
            {
                maxSortNum = Convert.ToInt32(dgOutline.Items[dgOutline.Items.Count - 1].Cells[2].Text);
            }
            Response.Redirect("../CMS/CMS_Sites_Outline_Maintenance.aspx?type=add&companyName=" + lblCompanyName.Text + "&siteName=" + lblSiteName.Text + "&siteID=" + hdnSiteID.Value + "&maxSortNum=" + maxSortNum, false);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int returnNumber = -1;
            int rowNumber = 0;
            rowNumber = GetSelectedRow();
            if (rowNumber >= 0)
            {
                string pageID = dgOutline.Items[rowNumber].Cells[0].Text;
                
                CMSBL cmsBL = new CMSBL();
                returnNumber = cmsBL.DeleteOutline(hdnSiteID.Value, pageID);
            }

            /*for (int i = 0; i < dgOutline.Items.Count; i++)
            {
                CheckBox chkFlag;
                chkFlag = (CheckBox)dgOutline.Items[i].Cells[0].FindControl("chkSelect");
                if (chkFlag.Checked)
                {
                    string pageID = dgOutline.Items[i].Cells[0].Text;
                
                    CMSBL cmsBL = new CMSBL();
                    returnNumber = cmsBL.DeleteOutline(hdnSiteID.Value, pageID);
                }
            }*/

            if (returnNumber > 0)
            {
                lblMessage.Text = "Successfully deleted the Outline.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                LoadOutlineDetails();
            }
            else
            {
                lblMessage.Text = "Outline Not Deleted.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnManageContent_Click(object sender, EventArgs e)
        {
            int rowNumber = 0;
            rowNumber = GetSelectedRow();
            if (rowNumber >= 0)
            {
                string pageID = dgOutline.Items[rowNumber].Cells[0].Text;
                string outlineName = dgOutline.Items[rowNumber].Cells[1].Text;
                Response.Redirect("../CMS/CMS_Pages.aspx?companyName=" + lblCompanyName.Text + "&siteName=" + lblSiteName.Text + "&outlineName=" + outlineName + "&siteID=" + hdnSiteID.Value + "&pageID=" + pageID, false);
            }
            else
            {
                lblMessage.Text = "Please select an outline before proceeding.";
            }
            /*for (int i = 0; i < dgOutline.Items.Count; i++)
            {
                CheckBox chkFlag;
                chkFlag = (CheckBox)dgOutline.Items[i].Cells[0].FindControl("chkSelect");
                if (chkFlag.Checked)
                {
                    string pageID = dgOutline.Items[i].Cells[0].Text;
                    string outlineName = dgOutline.Items[i].Cells[1].Text;
                    Response.Redirect("../CMS/CMS_Pages.aspx?companyName=" + lblCompanyName.Text + "&siteName=" + lblSiteName.Text + "&outlineName=" + outlineName + "&siteID=" + hdnSiteID.Value + "&pageID=" + pageID, false);
                }
            }*/
        }

        protected void btnGoSite_Click(object sender, EventArgs e)
        {
            Response.Redirect("../CMS/CMS_Sites.aspx", false);
        }

        protected void btnAdditionalPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("../CMS/CMS_Additional_Pages.aspx?companyName=" + lblCompanyName.Text + "&siteName=" + lblSiteName.Text + "&siteID=" + hdnSiteID.Value, false);
        }

        protected void dgOutline_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgOutline.CurrentPageIndex = e.NewPageIndex;
            LoadOutlineDetails();
            SetGrdRadiosOnClick();
        }

    }
}
