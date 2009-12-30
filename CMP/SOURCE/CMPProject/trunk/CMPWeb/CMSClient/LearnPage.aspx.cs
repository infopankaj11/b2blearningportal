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
using System.Web.Services;

namespace CMPWeb.CMSClient
{
    public partial class LearnPage : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                hdnStartTime.Value = System.DateTime.Now.TimeOfDay.ToString(); ;
                hdnUserName.Value = "Temp";
                hdnSiteID.Value = "1";
                LoadTreeView();
                //tvwPhoneBook.ForeColor = System.Drawing.Color.Black;                
            }

            if (Request.QueryString["pageName"] != null)
            {
                GetHtmlContent(Request.QueryString["pageName"].ToString());
            }
        }

        private void LoadTreeView()
        {
            try
            {
                CMSBL cmsBL = new CMSBL();
                DataSet dsTreeView = cmsBL.GetClientTreeview(hdnSiteID.Value);
                DataTable dtOutline = new DataTable();
                DataTable dtTree = new DataTable();

                dtOutline = dsTreeView.Tables[0];
                dtTree = dsTreeView.Tables[1];

                foreach (DataRow drOutline in dtOutline.Rows)
                {
                    TreeNode node = new TreeNode(drOutline["PAGE_NAME"].ToString());
                    DataRow[] drChilds = dtTree.Select("PAGE_ID=" + drOutline["PAGE_ID"].ToString(), "CHILD_SORT_PAGE_NUM");
                    tvContent.Nodes.Add(node);
                    foreach (DataRow drChild in drChilds)
                    {
                        TreeNode childNode = new TreeNode(drChild["PAGE_NAME"].ToString());
                        node.ChildNodes.Add(childNode);
                    }

                }
            }
            catch (Exception ex)
            {

            }
        }

        
        private void GetHtmlContent(string pageName)
        {
            try
            {
                CMSBL cmsBL = new CMSBL();
                DataTable dtHtmlContent = cmsBL.GetHtmlContent(hdnSiteID.Value, pageName);
                foreach (DataRow drHtmlContent in dtHtmlContent.Rows)
                {
                    literal1.Text = Server.HtmlDecode(drHtmlContent["HTML_TEXT"].ToString().Replace("&#39;", "'"));
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void tvContent_SelectedNodeChanged(object sender, EventArgs e)
        {
            try
            {
                DateTime startTime = DateTime.Parse(hdnStartTime.Value);
                TimeSpan timeDiff = DateTime.Now.Subtract(startTime);
                double dTime = Convert.ToDouble(timeDiff.TotalSeconds);
                if (dTime > 10)
                {
                    CMSBL cmsBL = new CMSBL();
                    //cmsBL.CaptureContentUsage("", "", "", dTime.ToString(), "");
                }
                hdnStartTime.Value = System.DateTime.Now.TimeOfDay.ToString(); ;
                string pageName = tvContent.SelectedNode.Value;
                GetHtmlContent(pageName);
            }
            catch (Exception ex)
            {

            }
        }

    }
}
