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

public partial class SurveyMaintenance : System.Web.UI.Page
{
    
    SurveyBL surveyBL;
    String userName = "";

    public SurveyMaintenance()
    {
        surveyBL = new SurveyBL();
        userName = "May";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "Survey";
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["SurveyID"]))
                lblSurveyID2.Text = Request.QueryString["SurveyID"];

            lblAction.Text = Request.QueryString["Action"];
            if (lblAction.Text == "Update")
            {
                btnAddUpdate.Text = "Update";
                PopulateSurveyInfo();
            }
            if (lblAction.Text == "Add")
                btnAddUpdate.Text = "Add";                
        }
         
     }

    protected void btnAddUpdate_Click(object sender, EventArgs e)
    {
        if  (!checkParam())  return;

        if (lblAction.Text == "Add") //Add new FAP
        {
            surveyBL.InsertSurvey(txtSurveyName.Text, txtAbbr.Text, userName , ""); 
                
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully added the new Survey.";
        }

        if (lblAction.Text == "Update") //Update Existing FAP
        {
            surveyBL.UpdateSurvey(int.Parse(lblSurveyID2.Text), txtSurveyName.Text, txtAbbr.Text, userName);  
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully updated the Survey.";
        }
    }

    protected void PopulateSurveyInfo()
    {
        DataTable dtSurveyInfo = surveyBL.GetSurvey(int.Parse(lblSurveyID2.Text));
        txtSurveyName.Text = dtSurveyInfo.Rows[0]["Survey_name"].ToString();
        txtAbbr.Text = dtSurveyInfo.Rows[0]["Survey_abbr"].ToString();
  
   }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtSurveyName.Text = "";
        txtAbbr.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Survey.aspx");
    }

    protected bool checkParam()
    {

        if (String.IsNullOrEmpty(txtSurveyName.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give Survey name before proceeding.";
            return false;
        }
        else if (String.IsNullOrEmpty(txtAbbr.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give Survey abbreviation  before proceeding.";
            return false;
        }
                
        return true;
    } 



}
