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
    //DataTable dtObject;

    public SurveyQuestionMaintenance()
    {
        surveyBL = new SurveyBL();
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
     //
    }
    
    protected void btnOptions_Click(object sender, EventArgs e)
    {        
        int iNoOptions, iCnt;

        //if (!surveyBL.checkEmptyInteger(txtTotalOption.Text))
        //{
        //     lblMsg.Text = "Invalid number of options.";
        //}
        //else {
        //    iNoOptions = int.Parse(txtTotalOption.Text);

            //CheckBoxList chkAns = new CheckBoxList ();

            //for (iCnt = 0; iCnt < iNoOptions; iCnt = iCnt + 1)
            //{
            //    TextBox txtOption = new TextBox();
            //    CheckBox chkOAns = new CheckBox();
              
            //    pnlOptions.Controls.Add(chkOAns);
            //    pnlOptions.Controls.Add(txtOption);
                
            //}
        //}
  
        
    }

    protected void btnAddUpdate_Click(object sender, EventArgs e)
    {
        if  (!checkParam())  return;

        if (lblAction.Text == "Add") //Add new question
        {
            lblQID.Text = surveyBL.InsertQuestion(int.Parse(lblSurveyID2.Text), txtQuestion.Text, ddlQnType.Text,"May", "").ToString();
        }

        if (lblAction.Text == "Update") //Update Existing question
        {
            surveyBL.UpdateQuestion(int.Parse(lblQID.Text), txtQuestion.Text, ddlQnType.Text, "May"); 

           
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

    protected void DeleteOption(int  optionID)
    {    
        surveyBL.DeleteQuestionOption(optionID);
        PopulateQuestionOptions();

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
            lblMsg.Text = "Please give QUESTION TEXT before proceeding.";
            return false;
        }
        //else if (String.IsNullOrEmpty(txtAbbr.Text))
        //{
        //    lblMsg.ForeColor = System.Drawing.Color.Red;
        //    lblMsg.Text = "Please give Exam abbreviation  before proceeding.";
        //    return false;
        //}
        //else if (!mcqBL.checkEmptyInteger(txtTotQns.Text))
        //{
        //    lblMsg.ForeColor = System.Drawing.Color.Red;
        //    lblMsg.Text = "Please give total questions (numeric) before proceeding.";
        //    return false;
        //}
        //else if (!mcqBL.checkEmptyInteger(txtTotMarks.Text))
        //{
        //    lblMsg.ForeColor = System.Drawing.Color.Red;
        //    lblMsg.Text = "Please give Total Marks (numeric) before proceeding.";
        //    return false;
        //}
        //else if (!mcqBL.checkEmptyInteger(txtPassMark.Text))
        //{
        //    lblMsg.ForeColor = System.Drawing.Color.Red;
        //    lblMsg.Text = "Please give Passing mark (numeric) before proceeding.";
        //    return false;
        //}
        //else if (!mcqBL.checkEmptyInteger(txtDuration.Text))
        //{
        //    lblMsg.ForeColor = System.Drawing.Color.Red;
        //    lblMsg.Text = "Please give Exam duration in minutes (numeric) name before proceeding.";
        //    return false;
        //}

        ////check for validity 
        //int totMarks = int.Parse( txtTotMarks.Text);
        //int passMark = int.Parse(txtPassMark.Text);

        //if (passMark > totMarks)
        //{
        //    lblMsg.ForeColor = System.Drawing.Color.Red;
        //    lblMsg.Text = "Passing mark cannot be more than the total marks.";
        //    return false;
        //}
                
        return true;
    } 
}
