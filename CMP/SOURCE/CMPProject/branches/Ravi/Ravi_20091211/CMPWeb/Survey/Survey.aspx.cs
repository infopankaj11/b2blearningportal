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


public partial class Survey : System.Web.UI.Page
{
    SurveyBL surveyBL;

    public Survey()
    {
        surveyBL = new SurveyBL();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "Survey";
        if (!Page.IsPostBack)
            PopulatesurveyList();
    }

    private void PopulatesurveyList()
    {
        DataTable dtsurveys= surveyBL.GetAllSurveys();
        gv_surveys.DataSource = dtsurveys;
        gv_surveys.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("surveyMaintenance.aspx?Action=Add");
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        CheckBox chkSelectedsurvey;
        CheckBox chkSelectAll;
        foreach (GridViewRow myRow in gv_surveys.Rows)
        {
            chkSelectedsurvey = (CheckBox)(myRow.FindControl("chkSelectedsurvey"));
            chkSelectedsurvey.Checked = false;
        }

        chkSelectAll = (CheckBox)(gv_surveys.HeaderRow.FindControl("cbSelectAll"));
        if (chkSelectAll != null)
            chkSelectAll.Checked = false; 
    }

     protected void btnDelete_Click(object sender, EventArgs e)
    {
        int[] surveyIDs = GetSelectedsurveysIDs();
        if (surveyIDs.Length == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select survey before proceeding.";
            return;
        }
        else
        {
            surveyBL.DeleteSurvey(surveyIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully deleted selected survey(s).";
            PopulatesurveyList();
        }
    }

     protected void btnManageSection_Click(object sender, EventArgs e)
     {
         int[] surveyIDs = GetSelectedsurveysIDs();
         if (surveyIDs.Length == 0)
         {
             lblMsg.ForeColor = System.Drawing.Color.Red;
             lblMsg.Text = "Please select survey before proceeding.";
             return;
         }
         else
         {
             if (surveyIDs.Length > 1)
             {
                 lblMsg.ForeColor = System.Drawing.Color.Green;
                 lblMsg.Text = "Select only 1 survey to manage.";
             }
             else
             {
                 Response.Redirect("SurveyQuestions.aspx?surveyId=" + surveyIDs[0]);  
             }
         }

     }

     protected int[] GetSelectedsurveysIDs()
     {
         ArrayList SelectedsurveyIDs = new ArrayList();
         CheckBox chkSelectedsurvey;
         foreach (GridViewRow myRow in gv_surveys.Rows)
         {
             chkSelectedsurvey = (CheckBox)(myRow.FindControl("chkSelectedsurvey"));
             if (chkSelectedsurvey.Checked)
                 SelectedsurveyIDs.Add(gv_surveys.DataKeys[myRow.RowIndex].Value);
         }
         return (int[])SelectedsurveyIDs.ToArray(typeof(int));
     }

     protected void cbSelectAll_OnCheckedChanged(object sender, EventArgs e)
     {
        CheckBox chkSelectedObject;
        CheckBox chkSelectAll = (CheckBox)(gv_surveys.HeaderRow.FindControl("cbSelectAll"));
        foreach (GridViewRow myRow in gv_surveys.Rows)
        {
            chkSelectedObject = (CheckBox)(myRow.FindControl("chkSelectedsurvey"));
            chkSelectedObject.Checked = chkSelectAll.Checked;

        }
     }
}
