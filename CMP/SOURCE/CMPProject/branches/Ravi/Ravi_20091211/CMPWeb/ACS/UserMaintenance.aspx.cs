using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;
using WorkLayers.BusinessLayer;

namespace CMPWeb.ACS
{
    public partial class UserMaintenance : System.Web.UI.Page
    {
        UserBL userBL;
        HiddenField hfHasRole;
        CheckBox chkRoleSelected;
        DataTable dtRoles, dtUserInfo;

        public UserMaintenance()
        {
            userBL = new UserBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ConfigurationManager.AppSettings["CurrentMenu"] = "UserAdmin";
            if (!Page.IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["UserID"]))
                    lblUserID.Text = Request.QueryString["UserID"];
                lblAction.Text = Request.QueryString["Action"];
                if (lblAction.Text == "Update")
                {
                    btnAddUpdate.Text = "Update";
                    PopulateUserInfo();
                    tr_Password.Visible = false;
                    tr_ConfirmPassword.Visible = false;
                }
                if (lblAction.Text == "Add")
                    btnAddUpdate.Text = "Add";
                PopulateRoles();
            }
        }

        protected void PopulateUserInfo()
        {
            dtUserInfo = userBL.GetUserInfoByUserID(lblUserID.Text);
            txtUserName.Text = dtUserInfo.Rows[0]["UserName"].ToString();
            txtUserRemark.Text = dtUserInfo.Rows[0]["User_Remark"].ToString();
            txtPassword.Text = dtUserInfo.Rows[0]["UserPass"].ToString();
            txtConfirmPassword.Text = dtUserInfo.Rows[0]["UserPass"].ToString();
        }

        protected void PopulateRoles()
        {
            //user admin can assign roles to user, but only from the roles he owns. 
            dtRoles = userBL.GetRolesByUserID(lblUserID.Text, Session["UserID"].ToString());
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

            if ((chkChangePass.Checked) && (String.IsNullOrEmpty(txtPassword.Text.Trim())))
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
                lblMsg.Text = "Please select User before proceeding.";
                return;
            }
            else
            {
                if (String.IsNullOrEmpty(txtUserName.Text))
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Please give User name before proceeding.";
                }
            }

            if (lblAction.Text == "Add") //Add new User
            {
                userBL.InsertUserInfo(txtUserName.Text, Session["UserName"].ToString(), txtUserRemark.Text, RoleIDs, txtPassword.Text);
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Successfully added the new User.";
            }

            if (lblAction.Text == "Update") //Update Existing User
            {
                if (chkChangePass.Checked) //if choose to change password, then will update the password, otherwise not.
                {
                    userBL.UpdateUserInfoNRoles(int.Parse(lblUserID.Text), txtUserName.Text, txtUserRemark.Text, RoleIDs, txtPassword.Text);
                }
                else
                {
                    userBL.UpdateUserInfoNRoles(int.Parse(lblUserID.Text), txtUserName.Text, txtUserRemark.Text, RoleIDs);
                }
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Successfully updated the User.";

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
            Response.Redirect("User.aspx");
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
