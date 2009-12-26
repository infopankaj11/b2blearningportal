using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WorkLayers.BusinessLayer;


    public partial class Login : System.Web.UI.Page
    {
        UserBL userBL;
        public Login()
        {
            userBL = new UserBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!CheckLogin())
            {
                lblMsg.Text = "Invalid User ID or Password. Please try again.";
            }
            else
            {
                Session["UserName"] = txtUserName.Text.Trim();
                Session["UserLevel"] = ddl_UserLevel.SelectedValue;

                switch(ddl_UserLevel.SelectedValue)
                {
                    case "User":
                        Response.Redirect("../CMS/Reports.aspx");
                        break;
                    case "UserAdmin":
                        Response.Redirect("../Admin/UserAdmin.aspx");
                        break;
                    case "PortalAdmin":
                        Response.Redirect("../Admin/PortalAdmin.aspx");
                        break;
                }
            }
        }

        protected Boolean CheckLogin()
        {
            Boolean result = false;
            switch (ddl_UserLevel.SelectedValue)
            {
                case "User":
                    result = userBL.CheckLogin(txtUserName.Text.Trim(), txtUserPass.Text.Trim(), "User");
                    break;
                case "UserAdmin":
                    result = userBL.CheckLogin(txtUserName.Text.Trim(), txtUserPass.Text.Trim(), "UserAdmin");
                    break;
                case "PortalAdmin":
                    result = userBL.CheckLogin(txtUserName.Text.Trim(), txtUserPass.Text.Trim(), "PortalAdmin");
                    break;
            }
            return result;
        }
    }
