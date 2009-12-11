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
    public partial class CMS_Pages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblCompanyName.Text = Request.QueryString["companyName"].ToString();
                lblSiteName.Text = Request.QueryString["siteName"].ToString();
                lblOutlineName.Text = Request.QueryString["outlineName"].ToString();
                hdnSiteID.Value = Request.QueryString["siteID"].ToString();
                hdnPageID.Value = Request.QueryString["pageID"].ToString();
                LoadPageDetails();
                SetGrdRadiosOnClick();
            }
        }

        public void SetGrdRadiosOnClick()
        {
            int i;
            RadioButton radio;
            for (i = 0; i < dgPages.Items.Count; i++)
            {
                radio = (RadioButton)dgPages.Items[i].FindControl("rbSelect");
                radio.Attributes.Add("OnClick", "SelectOne(" + radio.ClientID + ", " + "'dgPages'" + ")");
            }
        }

        private void LoadPageDetails()
        {
            try
            {
                CMSBL cmsBL = new CMSBL();
                DataTable siteDT = cmsBL.GetAllPages(hdnSiteID.Value, hdnPageID.Value);

                dgPages.DataSource = siteDT;
                if ((dgPages.Items.Count % dgPages.PageSize == 1) &&
                    (dgPages.CurrentPageIndex == dgPages.PageCount - 1) &&
                    (dgPages.CurrentPageIndex != 0))
                {
                    dgPages.CurrentPageIndex = dgPages.CurrentPageIndex - 1;
                }
                dgPages.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        private int GetSelectedRow()
        {
            int rowNumber = -1;
            for (int i = 0; i < dgPages.Items.Count; i++)
            {
                RadioButton rbFlag;
                rbFlag = (RadioButton)dgPages.Items[i].Cells[0].FindControl("rbSelect");
                if (rbFlag.Checked)
                {
                    rowNumber = i;
                    break;
                }
            }

            return rowNumber;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int maxSortNum = 0;
            if (dgPages.Items.Count > 0)
            {
                maxSortNum = Convert.ToInt32(dgPages.Items[dgPages.Items.Count - 1].Cells[2].Text);
            }
            Response.Redirect("../CMS/CMS_Pages_Maintenance.aspx?type=add&siteName=" + lblSiteName.Text + "&companyName=" + lblCompanyName.Text +
                "&outlineName=" + lblOutlineName.Text + "&siteID=" + hdnSiteID.Value + "&pageID=" + hdnPageID.Value + "&maxSortNum=" + maxSortNum, false);
            /*int rowNumber = 0;
            rowNumber = GetSelectedRow();
            if (rowNumber >= 0)
            {
                string siteID = dgPages.Items[rowNumber].Cells[1].Text;
                string pageID = dgPages.Items[rowNumber].Cells[0].Text;                
                Response.Redirect("../CMS/CMS_Pages_Maintenance.aspx?siteID=" + siteID + "&pageID=" + pageID);
            } */
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int returnNumber = -1;
            int rowNumber = 0;
            rowNumber = GetSelectedRow();
            if (rowNumber >= 0)
            {
                string childPageID = dgPages.Items[rowNumber].Cells[0].Text;
                CMSBL cmsBL = new CMSBL();
                returnNumber = cmsBL.DeletePage(hdnSiteID.Value, hdnPageID.Value, childPageID);
            }

            if (returnNumber == 1)
            {
                lblMessage.Text = "Record Deleted Successfully";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                LoadPageDetails();
            }
            else
            {
                lblMessage.Text = "Record Not Deleted";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        public void EditOutline(object sender, System.EventArgs e)
        {
            LinkButton chkTemp = (LinkButton)sender;
            DataGridItem dgi;
            dgi = (DataGridItem)chkTemp.Parent.Parent;
            dgPages.SelectedIndex = dgi.ItemIndex;
            string childPageID = dgPages.Items[dgPages.SelectedIndex].Cells[0].Text;
            Response.Redirect("../CMS/CMS_Pages_Maintenance.aspx?type=update&siteName=" + lblSiteName.Text + "&companyName=" +
                lblCompanyName.Text + "&outlineName=" + lblOutlineName.Text + "&siteID=" + hdnSiteID.Value + "&pageID=" + hdnPageID.Value + "&childPageID=" + childPageID, false);
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            int rowNumber = 0;
            rowNumber = GetSelectedRow();
            if (rowNumber >= 0)
            {
                string pageID = dgPages.Items[rowNumber].Cells[0].Text;
                Response.Redirect("../CMS/CMS_Pages_Maintenance.aspx?siteName=" + lblSiteName.Text + "&companyName=" +
                    lblCompanyName.Text + "&outlineName=" + lblOutlineName.Text + "&siteID=" + hdnSiteID.Value + "&pageID=" + pageID, false);
            }
        }

        protected void btnManagePage_Click(object sender, EventArgs e)
        {
            try
            {
                string pageModID = "0";
                SqlServer sqlServer = new SqlServer(Util.SqlConnectionString()); ;
                DataSet dsPageMod = new DataSet();

                int rowNumber = 0;
                rowNumber = GetSelectedRow();
                if (rowNumber >= 0)
                {
                    string pageID = dgPages.Items[rowNumber].Cells[0].Text;
                    string pageName = dgPages.Items[rowNumber].Cells[1].Text;

                    dsPageMod = sqlServer.JMD_LOAD_MODS(lblSiteName.Text, pageName);
                    if (dsPageMod.Tables[0].Rows.Count > 0)
                    {
                        DataRow[] dr = dsPageMod.Tables[0].Select("ID='" + pageID + "'");
                        if (dr.Length > 0)
                            pageModID = dr[0]["PAGE_MOD_ID"].ToString();
                        //pageModID = dsPageMod.Tables[0].Rows[0]["PAGE_MOD_ID"].ToString();
                    }
                    Response.Redirect("../CMS/HTMLEdit.aspx?PageModId=" + pageModID + "&PageName=" + pageName + "&companyName=" + lblCompanyName.Text +
                        "&siteName=" + lblSiteName.Text + "&outlineName=" + lblOutlineName.Text + "&siteID=" + hdnSiteID.Value + "&pageID=" + hdnPageID.Value);
                }

            }
            catch (Exception ex)
            {

            }
        }

        protected void btnGoOutline_Click(object sender, EventArgs e)
        {
            Response.Redirect("../CMS/CMS_Site_Outline.aspx?companyName=" + lblCompanyName.Text + " &siteName=" + lblSiteName.Text + "&siteID=" + hdnSiteID.Value, false);
        }
    }
}
