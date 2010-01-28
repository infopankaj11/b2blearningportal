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

public partial class SurveyQuestionMaintenance : System.Web.UI.Page
{
    
    SurveyBL surveyBL;
    String userName = "";

    public SurveyQuestionMaintenance()
    {
        surveyBL = new SurveyBL();
        userName = "May";
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "Survey";

        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["QID"]))
            {
                lblQID.Text = Request.QueryString["QID"];
            }

            if (!String.IsNullOrEmpty(Request.QueryString["SurveyId"]))
            {
                lblSurveyID2.Text = Request.QueryString["SurveyId"];
            }

           lblAction.Text = Request.QueryString["Action"];
            if (lblAction.Text == "Update")
            {
                PopulateObjectInfo(1);
                btnAddUpdate.Text = "Update";
            }
            if (lblAction.Text == "Add")
            {
                lblQID.Text = "0";
                PopulateObjectInfo(0);
                btnAddUpdate.Text = "Add";
                AddOption();
            }        

        }         
     }

 

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("SurveyQuestions.aspx?SurveyId=" + lblSurveyID2.Text + "&QID=" + lblQID.Text);
    }
    
    protected void btnDeleteOpt_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        String sOId = btn.CommandArgument;
        if (sOId.Length > 0)
        {
            surveyBL.DeleteQuestionOption(int.Parse(sOId));
            PopulateQuestionOptions();
        }        
    }
    
    
    protected void btnAddUpdate_Click(object sender, EventArgs e)
    {
        if  (!checkParam())  return;

        if (lblAction.Text == "Add") //Add new question
        {
            lblQID.Text = surveyBL.InsertQuestion(int.Parse(lblSurveyID2.Text), txtQuestion.Text, ddlQnType.Text, userName, "").ToString();
        }

        if (lblAction.Text == "Update") //Update Existing question
        {
            surveyBL.UpdateQuestion(int.Parse(lblQID.Text), txtQuestion.Text, ddlQnType.Text, userName); 

           
        }
        //process options
        if (!String.IsNullOrEmpty(lblQID.Text))
          surveyBL.DeleteQuestionOptions(int.Parse(lblQID.Text));

        foreach (GridViewRow myRow in gv_Object.Rows)
        {
            TextBox optTxt = (TextBox)(myRow.FindControl("txtOptiontxt"));

             surveyBL.InsertQuestionOptions(int.Parse(lblQID.Text), optTxt.Text);
        }


        //give the status
        if (lblAction.Text == "Add") //Add new question
        {
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully added the new question.";
        }
        if (lblAction.Text == "Update") //Update Existing question
        {
           lblMsg.ForeColor = System.Drawing.Color.Green;
           lblMsg.Text = "Successfully updated the question.";
        }
    }

    protected void PopulateObjectInfo( int opt)
    {        
        DataTable dtQuestion;
        
        DataTable Survey = surveyBL.GetSurvey((int.Parse(lblSurveyID2.Text)));
        lblSurveyName.Text = Survey.Rows[0]["survey_name"] + " (" + Survey.Rows[0]["survey_abbr"] + ")";
        
        if (opt == 1)
        {
            dtQuestion = surveyBL.GetQuestion(int.Parse(lblQID.Text));

            txtQuestion.Text = dtQuestion.Rows[0]["question"].ToString();
            ddlQnType.Text = dtQuestion.Rows[0]["qn_type"].ToString();
            PopulateQuestionOptions();
        }
                 
    }

    protected void PopulateQuestionOptions()
    {
        DataTable  dtObject = surveyBL.GetQuestionOptions(int.Parse(lblQID.Text));
        if (dtObject.Rows.Count > 0)
        {
            gv_Object.DataSource = dtObject;
            gv_Object.DataBind();
        }
        else
        {
            dtObject = surveyBL.GetQuestionOptions(0);

            DataRow emptyRow = dtObject.NewRow();
            emptyRow["Choice"] = "";
            dtObject.Rows.Add(emptyRow);

            gv_Object.DataSource = dtObject;
            gv_Object.DataBind();   
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtQuestion.Text = "";
        ddlQnType.Text = "";

    }

    protected void AddOption()
    {
       int iRow = 0;
       DataTable dtObject = surveyBL.GetQuestionOptions(int.Parse(lblQID.Text));

       if (dtObject.Rows.Count > 0)
           iRow = gv_Object.Rows.Count - dtObject.Rows.Count;
       else
           iRow = 1;
        
       for (int i = 0; i < iRow + 1; i++)
       {
           DataRow emptyRow = dtObject.NewRow();
           emptyRow["Choice"] = "";
           dtObject.Rows.Add(emptyRow);
       }

        gv_Object.DataSource = dtObject;
        gv_Object.DataBind();        
    }

   
    protected void btnAddOpt_Click(object sender, EventArgs e)
    {
        AddOption();   
     }
    

    protected bool checkParam()
    {

        if (String.IsNullOrEmpty(txtQuestion.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give Survey Question text before proceeding.";
            return false;
        }
             
        if (gv_Object.Rows.Count < 2)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Provide atleast two options before proceeding.";
            return false;
        }
       
        Boolean hasOption = false;
        int iValid = 0;
        foreach (GridViewRow myRow in gv_Object.Rows)
        {

            TextBox optTxt = (TextBox)(myRow.FindControl("txtOptiontxt"));

            if (optTxt.Text.Trim() != "" )
            {
                iValid = iValid + 1;
                hasOption = true;
            }           

            if (hasOption && iValid > 1)
                break;
        }

        if (iValid < 2)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Provide atleast two options before proceeding.";
            return false;
        }       

        return true;
        
    } 
}
