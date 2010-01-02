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


public partial class UserExamQuestion : System.Web.UI.Page
{
    MCQBL mcqBL;
    int userID;

    public UserExamQuestion()
    {
       mcqBL = new MCQBL();
       userID = 1; //set USER ID here
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "ExamPageQuestion";
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

            if (!String.IsNullOrEmpty(Request.QueryString["EXAMID"]))
            {
                lblExamID2.Text = Request.QueryString["EXAMID"];
            }
            else
            {
                lblExamID2.Text = "0";
            }

            if (!String.IsNullOrEmpty(Request.QueryString["SID"]))
            {
                lblSectionID2.Text = Request.QueryString["SID"];
            }
            else
            {
                lblSectionID2.Text = "0";
            }

            lblAction.Text = Request.QueryString["Action"];
            PopulateQuestion();

        }

    }

    private void PopulateQuestion()
    {

        DataTable dtQuestion;

        btnPrevious.Visible = false; //is previous really required?

        if (lblAction.Text == "Previous")
        {
            dtQuestion = mcqBL.GetPreviousQuestion(int.Parse(lblQID.Text), int.Parse(lblExamID2.Text), int.Parse(lblSectionID2.Text), userID); 
        }
        else if (lblAction.Text == "Next")
        {
            dtQuestion = mcqBL.GetNextQuestion(int.Parse(lblQID.Text), int.Parse(lblExamID2.Text), int.Parse(lblSectionID2.Text), userID);
            btnConfirm.Enabled = true;
            btnNext.Enabled = false;
        }
        else //FIRST or from section
        {
            dtQuestion = mcqBL.GetNextQuestion(0, int.Parse(lblExamID2.Text), int.Parse(lblSectionID2.Text), userID);
            btnConfirm.Enabled = true;
            btnNext.Enabled = false;
        }

        if (dtQuestion.Rows.Count > 0)
        {
            lblQID.Text = dtQuestion.Rows[0]["qn_id"].ToString();
            lblQuestion.Text = dtQuestion.Rows[0]["question_text"].ToString();
            lblUserExamId.Text = dtQuestion.Rows[0]["user_exam_id"].ToString(); 
            PopulateQuestionOptions();
        }
        else
        {
            lblQuestion.Text = "Finished with this section.";
            btnConfirm.Enabled = false; 
        }
        
        DataTable dtExam = mcqBL.GetExam(int.Parse(lblExamID2.Text));
        lblExamName.Text = dtExam.Rows[0]["exam_name"] + " (" + dtExam.Rows[0]["exam_abbr"] + ")";

        DataTable dtSection = mcqBL.GetSection(int.Parse(lblSectionID2.Text));
        lblSectionName.Text = dtSection.Rows[0]["section_name"] + " (" + dtSection.Rows[0]["section_abbr"] + ")";
        
        
    }

    protected void PopulateQuestionOptions()
    {
        DataTable dtObject = mcqBL.GetQuestionOptions(int.Parse(lblQID.Text));
        if (dtObject.Rows.Count > 0)
        {           
            gv_Object.DataSource = dtObject;
            gv_Object.DataBind();
        }
        
    }


    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        // Response.Redirect("ExamMaintenance.aspx?Action=Add");
        int[] aAnsOpt = GetSelectedExamsIDs();
        if (aAnsOpt.Length  == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please answer the question.";
            return;
        }
        else
        {
            mcqBL.DeleteAnswerQuestion(int.Parse(lblUserExamId.Text));

            for (int i = 0; i < aAnsOpt.Length; i++)
            {
                mcqBL.InsertAnswerQuestion(int.Parse(lblUserExamId.Text), aAnsOpt[i]);
            }

            String sResult = mcqBL.isCorrect(int.Parse(lblUserExamId.Text));
            btnConfirm.Enabled = false;
            lblMsg.Text = "Your answer is " + sResult;
            if (sResult.Equals("Correct"))  
                lblMsg.ForeColor = System.Drawing.Color.Green;
            else
                lblMsg.ForeColor = System.Drawing.Color.Red;

            btnConfirm.Enabled = false;
            btnNext.Enabled = true;

        }
    }
    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        int[] aAnsOpt = GetSelectedExamsIDs();
        if (aAnsOpt.Length == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please answer the question first.";
            return;
        }
        else
        {
            Response.Redirect("UserExamQuestion.aspx?Action=Previous&SID=" + lblSectionID2.Text + "&ExamID=" + lblExamID2.Text + "&QID=" + lblQID.Text);
        }
    }



    protected void btnNext_Click(object sender, EventArgs e)
    {

        Response.Redirect("UserExamQuestion.aspx?Action=Next&SID=" + lblSectionID2.Text  + "&ExamID=" + lblExamID2.Text +"&QID=" + lblQID.Text );
    }

    protected int[] GetSelectedExamsIDs()
    {
        ArrayList AnswerOptionsIDs = new ArrayList();
        CheckBox chkSelectedExam;
        foreach (GridViewRow myRow in gv_Object.Rows)
        {
            chkSelectedExam = (CheckBox)(myRow.FindControl("chkSelectedAnswer"));
            if (chkSelectedExam.Checked)
                AnswerOptionsIDs.Add(gv_Object.DataKeys[myRow.RowIndex].Value);
        }
        return (int[])AnswerOptionsIDs.ToArray(typeof(int));
    }


    }

