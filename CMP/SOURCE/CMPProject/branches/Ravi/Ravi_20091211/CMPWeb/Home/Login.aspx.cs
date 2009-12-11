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

namespace CMPWeb.Home
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string userName = Login1.UserName;
            string password = Login1.Password;
            bool loginStatus = false;

            UserBL userBL = new UserBL();

            loginStatus = userBL.Login(userName, password);
            
            if (loginStatus)
            {
                Session["userName"] = userName;
                Session["password"] = password;

                Response.Redirect("../Admin/Company.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}
