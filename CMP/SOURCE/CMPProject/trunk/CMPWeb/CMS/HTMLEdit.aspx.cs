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
using JMDCMS.Web.Lib;
using System.Net;

namespace CMPWeb.CMS
{
    public partial class HTMLEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hdnCompanyName.Value = Request.QueryString["companyName"].ToString();
                hdnSiteName.Value = Request.QueryString["siteName"].ToString();
                hdnSiteID.Value = Request.QueryString["siteID"].ToString();
                if (Request.QueryString["outlineName"] == null)
                    hdnOutlineName.Value = "";
                else
                    hdnOutlineName.Value = Request.QueryString["outlineName"].ToString();
                if (Request.QueryString["pageID"] == null)
                    hdnPageID.Value = "";
                else
                    hdnPageID.Value = Request.QueryString["pageID"].ToString();
                
                LoadContentDetails();
                GetCookies();                
            }
        }

        /*protected void Button1_Click(object sender, EventArgs e)
        {
            if (rbEditorSelection.SelectedIndex == 0)
            {
                Html_Text.Text = FCKeditor1.Value;
            }
            else
            {
                FCKeditor1.Value = Html_Text.Text;
            }
            /*string PageParams = Util.PageParams(Request.QueryString["Pg"].ToString());
            string PageModId = string.Empty;
            string Page_Name = string.Empty;
            if (string.Compare(PageParams, String.Empty) != 0)
            {
                string[] ParamParts = PageParams.Split(new char[] { ',' });
                PageModId = ParamParts[0].Split(new char[] { '=' })[1].ToString();
                Page_Name = ParamParts[1].Split(new char[] { '=' })[1].ToString();
            }*/
            //Server.HtmlEncode(Reviews.Text).Replace("\r\n", "<br />").Replace("'","&#39;")
          /*  SqlServer sqlServer = new SqlServer(Util.SqlConnectionString());
            sqlServer.JMD_MOD_HTML_SAVE(hdnPageModID.Value, string.Empty,
                Server.HtmlEncode(Html_Text.Text).Replace("'", "&#39;"));
            //Response.Redirect(string.Format("{0}.aspx", Page_Name));
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            /*string PageParams = Util.PageParams(Request.QueryString["Pg"].ToString());
            string PageModId = string.Empty;
            string Page_Name = string.Empty;
            if (string.Compare(PageParams, String.Empty) != 0)
            {
                string[] ParamParts = PageParams.Split(new char[] { ',' });
                PageModId = ParamParts[0].Split(new char[] { '=' })[1].ToString();
                Page_Name = ParamParts[1].Split(new char[] { '=' })[1].ToString();
            }
            Response.Redirect(string.Format("{0}.aspx", Page_Name));
        }*/
        /*protected void Button2_Click(object sender, EventArgs e)
        {
            /*string PageParams = "";// Util.PageParams(Request.QueryString["Pg"].ToString());
            string PageModId = string.Empty;
            string Page_Name = string.Empty;
            if (string.Compare(PageParams, String.Empty) != 0)
            {
                string[] ParamParts = PageParams.Split(new char[] { ',' });
                PageModId = ParamParts[0].Split(new char[] { '=' })[1].ToString();
                Page_Name = ParamParts[1].Split(new char[] { '=' })[1].ToString();
            }
            Response.Redirect(string.Format("{0}.aspx", Page_Name));*/
          /*  Response.Redirect("../CMS/CMS_Pages.aspx?companyName=" + hdnCompanyName.Value + "&siteName=" + hdnSiteName.Value + "&outlineName=" + hdnOutlineName.Value + "&siteID=" + hdnSiteID.Value + "&pageID=" + hdnPageID.Value, false);
        }*/

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbEditorSelection.SelectedIndex == 0)
            {
                MultiView1.SetActiveView(View1);
                FCKeditor1.Value = Html_Text.Text;
            }
            else if (rbEditorSelection.SelectedIndex == 1)
            {
                Html_Text.Text = FCKeditor1.Value;
                MultiView1.SetActiveView(View2);

            }
            SetCookies();
        }

        private void LoadContentDetails()
        {
            FCKeditor1.ID = "FCKeditor1";
            FCKeditor1.UseBROnCarriageReturn = true;
            FCKeditor1.FormatSource = false;

            Html_Text.ID = "Html_Text";
            /*string PageParams = Util.PageParams(Request.QueryString["Pg"].ToString());
            string PageModId = string.Empty;
            if (string.Compare(PageParams, String.Empty) != 0)
            {
                string[] ParamParts = PageParams.Split(new char[] { ',' });
                PageModId = ParamParts[0].Split(new char[] { '=' })[1].ToString();
            }*/

            hdnPageModID.Value = Request.QueryString["PageModId"].ToString();
            hdnPageName.Value = Request.QueryString["PageName"].ToString();

            SqlServer sqlServer = new SqlServer(Util.SqlConnectionString());
            DataTable dt;
            dt = sqlServer.JMD_MOD_HTML_Select(hdnPageModID.Value);

            if (dt.Rows.Count > 0)
            {
                //Literal1.Text = String.Format("<Div id=\"{0}\">", DivMod[0].ToString());
                Html_Text.Text += Server.HtmlDecode(dt.Rows[0]["HTML_TEXT"].ToString().Replace("&#39;", "'"));
                //Literal1.Text += "</Div>";
                FCKeditor1.Value = Server.HtmlDecode(dt.Rows[0]["HTML_TEXT"].ToString().Replace("&#39;", "'"));
            }
            dt.Dispose();
            sqlServer = null;
        }

        private void SetCookies()
        {
            HttpCookie cookie = Request.Cookies["HTMLEditor"];

            if (rbEditorSelection.SelectedIndex == 0)
            {
                if (cookie == null)
                {
                    cookie = new HttpCookie("HTMLEditor", "HTML");
                    cookie.Expires = DateTime.MaxValue;
                    Response.AppendCookie(cookie);
                }
                else
                {
                    cookie.Value = "HTML";
                    cookie.Expires = DateTime.MaxValue;
                    Response.AppendCookie(cookie);

                }
            }
            else
            {
                if (cookie == null)
                {
                    cookie = new HttpCookie("HTMLEditor");
                    cookie.Expires = DateTime.MaxValue;
                    Response.AppendCookie(cookie);
                }
                else
                {
                    cookie.Value = "TEXT";
                    cookie.Expires = DateTime.MaxValue;
                    Response.AppendCookie(cookie);
                }
            }
        }


        private void GetCookies()
        {
            HttpCookie cookie = Request.Cookies["HTMLEditor"];

            if (cookie == null)
            {
                SetCookies();
            }
            else
            {
                if (cookie.Value == "HTML")
                {
                    rbEditorSelection.SelectedIndex = 0;
                    MultiView1.SetActiveView(View1);
                }
                else
                {
                    rbEditorSelection.SelectedIndex = 1;
                    MultiView1.SetActiveView(View2);
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (rbEditorSelection.SelectedIndex == 0)
            {
                Html_Text.Text = FCKeditor1.Value;
            }
            else
            {
                FCKeditor1.Value = Html_Text.Text;
            } 

            SqlServer sqlServer = new SqlServer(Util.SqlConnectionString());
            sqlServer.JMD_MOD_HTML_SAVE(hdnPageModID.Value, string.Empty,
                Server.HtmlEncode(Html_Text.Text).Replace("'", "&#39;"));
            lblMessage.Text = "Successfully saved the content";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (hdnOutlineName.Value == "")
                Response.Redirect("../CMS/CMS_Additional_Pages.aspx?companyName=" + hdnCompanyName.Value + "&siteName=" + hdnSiteName.Value + "&siteID=" + hdnSiteID.Value, false);
            else
                Response.Redirect("../CMS/CMS_Pages.aspx?companyName=" + hdnCompanyName.Value + "&siteName=" + hdnSiteName.Value + "&outlineName=" + hdnOutlineName.Value + "&siteID=" + hdnSiteID.Value + "&pageID=" + hdnPageID.Value, false);
        }

    }
}
