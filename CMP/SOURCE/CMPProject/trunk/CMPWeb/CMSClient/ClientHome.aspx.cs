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

namespace CMPWeb.CMSClient
{
    public partial class ClientHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getModules();
        }

        private void getModules()
        {
            if (Request.QueryString["type"] != null)
            {
                string type = Request.QueryString["type"].ToString();
                UserBL userBL = new UserBL();
                DataTable dtModule = userBL.GetUserModule(Session["UserName"].ToString(), Session["UserID"].ToString(), type);

                dgModules.DataSource = dtModule;
                if ((dgModules.Items.Count % dgModules.PageSize == 1) &&
                    (dgModules.CurrentPageIndex == dgModules.PageCount - 1) &&
                    (dgModules.CurrentPageIndex != 0))
                {
                    dgModules.CurrentPageIndex = dgModules.CurrentPageIndex - 1;
                }
                dgModules.DataBind();
            }
        }

        public void SelectModule(object sender, System.EventArgs e)
        {
            LinkButton chkTemp = (LinkButton)sender;
            DataGridItem dgi;
            dgi = (DataGridItem)chkTemp.Parent.Parent;
            dgModules.SelectedIndex = dgi.ItemIndex;
            string ID = dgModules.Items[dgModules.SelectedIndex].Cells[0].Text;
            Response.Redirect("../CMSClient/LearnPage.aspx?siteID=" + ID, false);
        }
    }
}
