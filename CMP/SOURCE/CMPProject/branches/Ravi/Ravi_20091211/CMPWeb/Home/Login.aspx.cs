using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using WorkLayers.BusinessLayer;
using System.Data;

    public partial class Login : System.Web.UI.Page
    {
        UserBL userBL;
        public Login()
        {
            userBL = new UserBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["logout"]))
                {
                    Session["UserID"] = "";
                    Session["UserName"] = "";
                    Session["UserLevel"] = "";
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!CheckLogin())
            {
                lblMsg.Text = "Invalid User ID or Password. Please try again.";
            }
            else
            {
                Session["UserID"] = userBL.GetUserID(txtUserName.Text.Trim(), ddl_UserLevel.SelectedValue);                                    
                Session["UserName"] = txtUserName.Text.Trim();
                Session["UserLevel"] = ddl_UserLevel.SelectedValue;

                switch(ddl_UserLevel.SelectedValue)
                {
                    case "User":
                        getModules();
                        Response.Redirect("../CMSClient/ClientHome.aspx");
                        //Response.Redirect("../Admin/PortalAdmin.aspx");
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

        private void getModules()
        {
            UserBL userBL = new UserBL();
            DataTable dtModule = userBL.GetModuleType(Session["UserName"].ToString(), Session["UserID"].ToString());
            string moduleType = "";
            foreach (DataRow drModuleType in dtModule.Rows)
            {
                if (drModuleType["MODULE_TYPE"].ToString().ToUpper() == "CONTENT")
                {
                    moduleType  += "CONTENT,";
                }
                else if (drModuleType["MODULE_TYPE"].ToString().ToUpper() == "MCQ")
                {
                    moduleType += "MCQ,";
                }
                else if (drModuleType["MODULE_TYPE"].ToString().ToUpper() == "EXERCISE")
                {
                    moduleType += "EXERCISE,";
                }
                else if (drModuleType["MODULE_TYPE"].ToString().ToUpper() == "SURVEY")
                {
                    moduleType += "SURVEY,";
                }
            }
            ConfigurationManager.AppSettings["CurrentMenu"] = moduleType;
        }
    }
