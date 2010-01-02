using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserID"] != null)
        {
            if (Session["UserName"].ToString().Length > 0 && Session["UserID"].ToString().Length > 0)
            {
                
            }
            else
                Response.Redirect("/Home/Login.aspx");
        }
        else
            Response.Redirect("/Home/Login.aspx");
    }


}
