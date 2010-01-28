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


public partial class UserSurveyPage : System.Web.UI.Page
{
    SurveyBL  surveyBL;
    String userName;
    public String sControltype = "";
 
    public UserSurveyPage()
    {
       surveyBL = new SurveyBL();
       userName = "May";//Session["UserName"].ToString() ; //set USER ID here
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "SurveyPageQuestion";
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["QID"]))
            {
                lblQID.Text = Request.QueryString["QID"];
            }
            else
            {
                lblQID.Text = "0";
            }

            if (!String.IsNullOrEmpty(Request.QueryString["SurveyID"]))
            {
                lblSurveyID2.Text = Request.QueryString["SurveyID"];
            }
            else
            {
                lblSurveyID2.Text = "0";
            }

            
            lblAction.Text = Request.QueryString["Action"];
            PopulateQuestion();

        }

    }

    private void PopulateQuestion()
    {

        DataTable dtQuestion;

        if (lblAction.Text == "Previous")
        {
           dtQuestion = surveyBL.GetPreviousQuestion(int.Parse(lblQID.Text), int.Parse(lblSurveyID2.Text), userName); 
        }
        else if (lblAction.Text == "Next")
        {
            dtQuestion = surveyBL.GetNextQuestion(int.Parse(lblQID.Text), int.Parse(lblSurveyID2.Text), userName);
            //btnConfirm.Enabled = true;
            //btnNext.Enabled = false;
        }
        else //FIRST or from section
        {
            dtQuestion = surveyBL.GetNextQuestion(0, int.Parse(lblSurveyID2.Text), userName);
            //btnConfirm.Enabled = true;
            btnPrevious.Enabled = false;

        }

        if (dtQuestion.Rows.Count > 0)
        {
            lblQID.Text = dtQuestion.Rows[0]["squestion_id"].ToString();
            lblQuestion.Text = dtQuestion.Rows[0]["question"].ToString();
            lblUserSurveyId.Text = dtQuestion.Rows[0]["survey_id"].ToString();
            lblControltype.Text = dtQuestion.Rows[0]["qn_type"].ToString();
            if (lblAction.Text == "Previous")
            {
                String sMINQn = dtQuestion.Rows[0]["firstQN"].ToString();
                if (lblQID.Text == sMINQn)
                    btnPrevious.Enabled = false;
            }
            sControltype = lblControltype.Text;
            PopulateQuestionOptions();
        }
        else {
            lblQuestion.Text = "Finished with this survey. Go back to <h3><a href='UserSurveyList.aspx'>Surveys.</a></h3>";
            btnConfirm.Visible = false;
            btnNext.Visible = false;
            btnPrevious.Visible  = false;
        }
        
        DataTable dtSurvey = surveyBL.GetSurvey (int.Parse(lblSurveyID2.Text));
        lblSurveyName.Text = dtSurvey.Rows[0]["survey_name"] + " (" + dtSurvey.Rows[0]["survey_abbr"] + ")";

    }

    protected void PopulateQuestionOptions()
    {
        DataTable dtObject = surveyBL.GetUserAnswer(int.Parse(lblQID.Text), userName);
        if (dtObject.Rows.Count > 0)
        {   
            gv_Object.DataSource = dtObject;
            gv_Object.DataBind();
        }
    }

    protected void rbSelectedAnswer_CheckedChanged(object sender, EventArgs e)
    {        
        RadioButton rBselected = (RadioButton)sender;
        RadioButton rbSelectedSurvey;

        foreach (GridViewRow myRow in gv_Object.Rows)
        {
            rbSelectedSurvey = (RadioButton)(myRow.FindControl("rbSelectedAnswer"));
            if (rbSelectedSurvey.NamingContainer != rBselected.NamingContainer)
                rbSelectedSurvey.Checked = false;
        }

    
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        int[] aAnsOpt = GetSelectedSurveyAnswers();

        if (aAnsOpt.Length > 0)
        {
            surveyBL.DeleteAnswerQuestion(userName, int.Parse(lblQID.Text));
            for (int i = 0; i < aAnsOpt.Length; i++)
            {
                surveyBL.InsertAnswerQuestion(int.Parse(lblUserSurveyId.Text), int.Parse(lblQID.Text), aAnsOpt[i], userName);
            }

            btnConfirm.Text = "Change Answer";
        }
        else
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Confirm needs an answer. To skip answering this, click Next button instead.";
        }
        sControltype = lblControltype.Text;

    }
    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserSurveyPage.aspx?Action=Previous&" + "SurveyID=" + lblSurveyID2.Text + "&QID=" + lblQID.Text);   
    }



    protected void btnNext_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserSurveyPage.aspx?Action=Next&SurveyID=" + lblSurveyID2.Text +"&QID=" + lblQID.Text );
    }

    protected int[] GetSelectedSurveyAnswers()
    {
        ArrayList AnswerOptionsIDs = new ArrayList();
        CheckBox chkSelectedSurvey;
        RadioButton rbSelectedSurvey;


        if (lblControltype.Text == "Multiple")
        {
            foreach (GridViewRow myRow in gv_Object.Rows)
            {
                chkSelectedSurvey = (CheckBox)(myRow.FindControl("chkSelectedAnswer"));
                if (chkSelectedSurvey.Checked)
                    AnswerOptionsIDs.Add(gv_Object.DataKeys[myRow.RowIndex].Value);
            }
        }
        else
        {
            foreach (GridViewRow myRow in gv_Object.Rows)
            {
                rbSelectedSurvey = (RadioButton)(myRow.FindControl("rbSelectedAnswer"));
                if (rbSelectedSurvey.Checked)
                    AnswerOptionsIDs.Add(gv_Object.DataKeys[myRow.RowIndex].Value);
            }
        }

        return (int[])AnswerOptionsIDs.ToArray(typeof(int));
    }


}

