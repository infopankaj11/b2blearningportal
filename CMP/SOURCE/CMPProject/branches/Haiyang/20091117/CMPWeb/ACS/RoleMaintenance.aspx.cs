using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WorkLayers.BusinessLayer;
using System.Data;
using System.Configuration;
using System.Collections;

namespace CMPWeb.ACS
{
    public partial class RoleMaintenance : System.Web.UI.Page
    {
        RoleBL roleBL;
        HiddenField hfHasFAP, hfHasDAP;
        CheckBox chkFAPSelected, chkDAPSelected;
        DataTable dtFAPs, dtDAPs, dtRoleInfo;

        public RoleMaintenance()
        {
            roleBL = new RoleBL();
            hfHasDAP = new HiddenField();
            hfHasFAP = new HiddenField();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ConfigurationManager.AppSettings["CurrentMenu"] = "PortalAdmin";
            if (!Page.IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["RoleID"]))
                    lblRoleID.Text = Request.QueryString["RoleID"];
                lblAction.Text = Request.QueryString["Action"];
                if (lblAction.Text == "Update")
                {
                    btnAddUpdate.Text = "Update";
                    PopulateRoleInfo();
                }
                if (lblAction.Text == "Add")
                    btnAddUpdate.Text = "Add";
                PopulateFAPs();
                PopulateDAPs();
            }
        }

        protected void PopulateRoleInfo()
        {
            dtRoleInfo = roleBL.GetRoleInfoByRoleID(lblRoleID.Text);
            txtRoleName.Text = dtRoleInfo.Rows[0]["RoleName"].ToString();
            txtRoleRemark.Text = dtRoleInfo.Rows[0]["Role_Remark"].ToString();
        }

        protected void PopulateFAPs()
        {
            dtFAPs = roleBL.GetFAPsByRoleID(lblRoleID.Text);
            gv_FAPs.DataSource = dtFAPs;
            gv_FAPs.DataBind();
        }

        protected void PopulateDAPs()
        {
            dtDAPs = roleBL.GetDAPsByRoleID(lblRoleID.Text);
            gv_DAPs.DataSource = dtDAPs;
            gv_DAPs.DataBind();
        }

        protected void gv_FAPs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                hfHasFAP = (HiddenField)e.Row.FindControl("hfdHasFAP");
                chkFAPSelected = (CheckBox)e.Row.FindControl("chkFAPSelected");
                if (hfHasFAP.Value == "Yes")
                {
                    chkFAPSelected.Checked = true;
                }
            }
        }

        protected void gv_DAPs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                hfHasDAP = (HiddenField)e.Row.FindControl("hfdHasDAP");
                chkDAPSelected = (CheckBox)e.Row.FindControl("chkDAPSelected");
                if (hfHasDAP.Value == "Yes")
                {
                    chkDAPSelected.Checked = true;
                }
            }
        }

        protected void btnAddUpdate_Click(object sender, EventArgs e)
        {
            int[] FAPIDs = GetSelectedFAPIDs();
            int[] DAPIDs = GetSelectedDAPIDs();
            if (FAPIDs.Length == 0) //means no FAP selected, which is not allowed. 
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please select FAP before proceeding.";
                return;
            }

            if (DAPIDs.Length == 0)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please select DAP before proceeding.";
                return;
            }
            
            if (String.IsNullOrEmpty(txtRoleName.Text))
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please give Role name before proceeding.";
            }

            if (lblAction.Text == "Add") //Add new Role
            {
                roleBL.InsertRoleInfo(txtRoleName.Text, Session["UserName"].ToString(), txtRoleRemark.Text, FAPIDs, DAPIDs);
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Successfully added the new Role.";
            }

            if (lblAction.Text == "Update") //Update Existing FAP
            {
                roleBL.UpdateRoleInfoNFAPsNDAPs(int.Parse(lblRoleID.Text), txtRoleName.Text, txtRoleRemark.Text, FAPIDs, DAPIDs);
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Successfully updated the Role.";

            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Roles.aspx");
        }

        protected int[] GetSelectedFAPIDs()
        {
            ArrayList SelectedFAPIDs = new ArrayList();
            foreach (GridViewRow myRow in gv_FAPs.Rows)
            {
                chkFAPSelected = (CheckBox)(myRow.FindControl("chkFAPSelected"));
                if (chkFAPSelected.Checked)
                    SelectedFAPIDs.Add(gv_FAPs.DataKeys[myRow.RowIndex].Value);
            }
            return (int[])SelectedFAPIDs.ToArray(typeof(int));
        }

        protected int[] GetSelectedDAPIDs()
        {
            ArrayList SelectedDAPIDs = new ArrayList();
            foreach (GridViewRow myRow in gv_DAPs.Rows)
            {
                chkDAPSelected = (CheckBox)(myRow.FindControl("chkDAPSelected"));
                if (chkDAPSelected.Checked)
                    SelectedDAPIDs.Add(gv_DAPs.DataKeys[myRow.RowIndex].Value);
            }
            return (int[])SelectedDAPIDs.ToArray(typeof(int));
        }
    }
}
