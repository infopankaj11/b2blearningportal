using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using WorkLayers.BusinessLayer;
using System.Configuration;

namespace CMPWeb.ACS
{
    public partial class User : System.Web.UI.Page
    {
        UserBL userBL;
        public User()
        {
            userBL = new UserBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ConfigurationManager.AppSettings["CurrentMenu"] = "User";
            if (!Page.IsPostBack)
                PopulateUserList();
        }

        private void PopulateUserList()
        {
            DataTable dtUser = userBL.GetAllUsers();
            gv_Users.DataSource = dtUser;
            gv_Users.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserMaintenance.aspx?Action=Add");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int[] UserIDs = GetSelectedUserIDs();
            if (UserIDs.Length == 0)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please select User before proceeding.";
                return;
            }
            else
            {
                userBL.DeleteUsers(UserIDs);
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Successfully deleted selected User(s).";
                PopulateUserList();
            }
        }

        protected int[] GetSelectedUserIDs()
        {
            ArrayList SelectedUserIDs = new ArrayList();
            CheckBox chkSelectedUser;
            foreach (GridViewRow myRow in gv_Users.Rows)
            {
                chkSelectedUser = (CheckBox)(myRow.FindControl("chkSelectedUser"));
                if (chkSelectedUser.Checked)
                    SelectedUserIDs.Add(gv_Users.DataKeys[myRow.RowIndex].Value);
            }
            return (int[])SelectedUserIDs.ToArray(typeof(int));
        }
    }
}
