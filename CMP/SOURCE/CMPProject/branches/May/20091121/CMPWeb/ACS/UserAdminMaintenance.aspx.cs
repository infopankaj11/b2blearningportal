using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Collections;
using WorkLayers.BusinessLayer;
using System.Data;

namespace CMPWeb.ACS
{
    public partial class UserAdminMaintenance : System.Web.UI.Page
    {
        UserAdminBL userAdminBL;
        HiddenField hfHasRole;
        CheckBox chkRoleSelected;
        DataTable dtRoles, dtUserAdminInfo;

        public UserAdminMaintenance()
        {
            userAdminBL = new UserAdminBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";
            if (!Page.IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["UserAdminID"]))
                    lblUserAdminID.Text = Request.QueryString["UserAdminID"];
                lblAction.Text = Request.QueryString["Action"];
                if (lblAction.Text == "Update")
                {
                    btnAddUpdate.Text = "Update";
                    PopulateUserAdminInfo();
                    tr_Password.Visible = false;
                    tr_ConfirmPassword.Visible = false;
                }
                if (lblAction.Text == "Add")
                    btnAddUpdate.Text = "Add";
                PopulateRoles();
            }
        }
            
        protected void PopulateUserAdminInfo()
        {
            dtUserAdminInfo = userAdminBL.GetUserAdminInfoByUserAdminID(lblUserAdminID.Text);
            txtUserAdminName.Text = dtUserAdminInfo.Rows[0]["UserAdminName"].ToString();
            txtUserAdminRemark.Text = dtUserAdminInfo.Rows[0]["UserAdmin_Remark"].ToString();
            txtPassword.Text = dtUserAdminInfo.Rows[0]["UserAdminPass"].ToString();
            txtConfirmPassword.Text = dtUserAdminInfo.Rows[0]["UserAdminPass"].ToString();
        }

        protected void PopulateRoles()
        {
            dtRoles = userAdminBL.GetRolesByUserAdminID(lblUserAdminID.Text);
            gv_Roles.DataSource = dtRoles;
            gv_Roles.DataBind();
        }

        protected void gv_Roles_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                hfHasRole = (HiddenField)e.Row.FindControl("hfdHasRole");
                chkRoleSelected = (CheckBox)e.Row.FindControl("chkRoleSelected");
                if (hfHasRole.Value == "Yes")
                {
                    chkRoleSelected.Checked = true;
                }
            }
        }

        protected void btnAddUpdate_Click(object sender, EventArgs e)
        {
            int[] RoleIDs = GetSelectedRoleIDs();

            if (String.IsNullOrEmpty(txtPassword.Text.Trim()))
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please input password before proceeding.";
                return;
            }

            if (txtPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please confirm password before proceeding.";
                return;
            }

            if (RoleIDs.Length == 0) //means no Roles selected, which is not allowed. 
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please select User Admins before proceeding.";
                return;
            }
            else
            {
                if (String.IsNullOrEmpty(txtUserAdminName.Text))
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Please give User Admin name before proceeding.";
                }
            }

            if (lblAction.Text == "Add") //Add new User Admin
            {
                userAdminBL.InsertUserAdminInfo(txtUserAdminName.Text, "Haiyang", txtUserAdminRemark.Text, RoleIDs, txtPassword.Text);
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Successfully added the new User Admin.";
            }

            if (lblAction.Text == "Update") //Update Existing User Admin
            {
                if (chkChangePass.Checked) //if choose to change password, then will update the password, otherwise not.
                {
                    userAdminBL.UpdateUserAdminInfoNRoles(int.Parse(lblUserAdminID.Text), txtUserAdminName.Text, txtUserAdminRemark.Text, RoleIDs, txtPassword.Text);
                }
                else
                {
                    userAdminBL.UpdateUserAdminInfoNRoles(int.Parse(lblUserAdminID.Text), txtUserAdminName.Text, txtUserAdminRemark.Text, RoleIDs);
                }
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Successfully updated the User Admin.";

            }
        }

        protected int[] GetSelectedRoleIDs()
        {
            ArrayList SelectedRoleIDs = new ArrayList();
            foreach (GridViewRow myRow in gv_Roles.Rows)
            {
                chkRoleSelected = (CheckBox)(myRow.FindControl("chkRoleSelected"));
                if (chkRoleSelected.Checked)
                    SelectedRoleIDs.Add(gv_Roles.DataKeys[myRow.RowIndex].Value);
            }
            return (int[])SelectedRoleIDs.ToArray(typeof(int));
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserAdmin.aspx");
        }

        protected void chkChangePass_OnCheckedChanged(object sender, EventArgs e)
        {
            if (chkChangePass.Checked)
            {
                tr_Password.Visible = true;
                tr_ConfirmPassword.Visible = true;
            }
            else
            {
                tr_Password.Visible = false;
                tr_ConfirmPassword.Visible = false;
                txtPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
        }
    }
}
