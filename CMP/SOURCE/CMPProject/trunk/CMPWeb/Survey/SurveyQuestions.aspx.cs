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
using WorkLayers.BusinessLayer;


public partial class SurveyQuestions : System.Web.UI.Page
{
      
    SurveyBL surveyBL;
    int surveyID;

    public SurveyQuestions()
    {
        surveyBL = new SurveyBL();
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "Survey";

        if (surveyBL.checkEmptyInteger(Request.QueryString["SURVEYID"]))
        {
            lblSurveyID2.Text = Request.QueryString["SURVEYID"];
            surveyID = int.Parse(lblSurveyID2.Text);
        }
        else
            lblSurveyName.Text = "Invalid Survey. Go <a href='Survey.aspx'>back</a> to Surveys page.";

              
        if (!Page.IsPostBack)
            PopulateObjectList();
           
    }
    
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("SurveyQuestionMaintenance.aspx?Action=Add&SurveyId=" + lblSurveyID2.Text );
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Survey.aspx?SurveyId=" + lblSurveyID2.Text );    
    }

    private void PopulateObjectList()
    {
        DataTable dtSurvey = surveyBL.GetSurvey(surveyID);
        if (dtSurvey.Rows.Count > 0)
            lblSurveyName.Text = dtSurvey.Rows[0]["survey_name"] + " (" + dtSurvey.Rows[0]["survey_abbr"] + ")";
        else
            lblSurveyName.Text = "No Question";


        DataTable dtObject = surveyBL.GetSurveyQuestions(surveyID);
        gv_Object.DataSource = dtObject;
        gv_Object.DataBind();
    }
    
    protected void btnClear_Click(object sender, EventArgs e)
    {
        CheckBox chkSelectedObject;
        CheckBox chkSelectAll;
        foreach (GridViewRow myRow in gv_Object.Rows)
        {
            chkSelectedObject = (CheckBox)(myRow.FindControl("chkSelectedObject"));
            chkSelectedObject.Checked = false;
        }

        chkSelectAll = (CheckBox)(gv_Object.HeaderRow.FindControl("cbSelectAll"));
        if (chkSelectAll != null)
            chkSelectAll.Checked = false; 
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int[] ObjectIDs = GetSelectedObjectIDs();
        if (ObjectIDs.Length == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select a question before proceeding.";
            return;
        }
        else
        {
            surveyBL.DeleteQuestion(ObjectIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully deleted selected question(s).";
            PopulateObjectList();
        }
    }


    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Survey.aspx");
    }

   
    protected int[] GetSelectedObjectIDs()
    {
        ArrayList SelectedObjectIDs = new ArrayList();
        CheckBox chkSelectedObject;
        foreach (GridViewRow myRow in gv_Object.Rows)
        {
            chkSelectedObject = (CheckBox)(myRow.FindControl("chkSelectedObject"));
            if (chkSelectedObject.Checked)
                SelectedObjectIDs.Add(gv_Object.DataKeys[myRow.RowIndex].Value);
        }
        return (int[])SelectedObjectIDs.ToArray(typeof(int));
    }

    protected void cbSelectAll_OnCheckedChanged(object sender, EventArgs e)
    {

        CheckBox chkSelectedObject;
        CheckBox chkSelectAll = (CheckBox)(gv_Object.HeaderRow.FindControl("cbSelectAll"));
        foreach (GridViewRow myRow in gv_Object.Rows)
        {
            chkSelectedObject = (CheckBox)(myRow.FindControl("chkSelectedObject"));
            chkSelectedObject.Checked = chkSelectAll.Checked;
          
        }
    }

       
}
