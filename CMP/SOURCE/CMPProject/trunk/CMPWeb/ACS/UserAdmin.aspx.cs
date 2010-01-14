using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WorkLayers.BusinessLayer;
using System.Configuration;
using System.Data;
using System.Collections;

namespace CMPWeb.ACS
{
    public partial class UserAdmin : System.Web.UI.Page
    {
        UserAdminBL userAdminBL;

        public UserAdmin()
        {
            userAdminBL = new UserAdminBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ConfigurationManager.AppSettings["CurrentMenu"] = "UserAdmin";
            if (!Page.IsPostBack)
                PopulateUserAdminList();
        }

        private void PopulateUserAdminList()
        {
            DataTable dtUserAdmin = userAdminBL.GetAllUserAdmins();
            gv_UserAdmins.DataSource = dtUserAdmin;
            gv_UserAdmins.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserAdminMaintenance.aspx?Action=Add");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int[] UserAdminIDs = GetSelectedUserAdminIDs();
            if (UserAdminIDs.Length == 0)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please select User Admin before proceeding.";
                return;
            }
            else
            {
                userAdminBL.DeleteUserAdmins(UserAdminIDs);
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Successfully deleted selected User Admin(s).";
                PopulateUserAdminList();
            }
        }

        protected int[] GetSelectedUserAdminIDs()
        {
            ArrayList SelectedUserAdminIDs = new ArrayList();
            CheckBox chkSelectedUserAdmin;
            foreach (GridViewRow myRow in gv_UserAdmins.Rows)
            {
                chkSelectedUserAdmin = (CheckBox)(myRow.FindControl("chkSelectedUserAdmin"));
                if (chkSelectedUserAdmin.Checked)
                    SelectedUserAdminIDs.Add(gv_UserAdmins.DataKeys[myRow.RowIndex].Value);
            }
            return (int[])SelectedUserAdminIDs.ToArray(typeof(int));
        }

    }
}
