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

public partial class QuestionMaintenance : System.Web.UI.Page
{

    MCQBL mcqBL;
    //DataTable dtObject;

    public QuestionMaintenance()
    {
        mcqBL = new MCQBL();
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "Exams";

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
            if (lblAction.Text == "Update")
            {
                btnAddUpdate.Text = "Update";
                PopulateObjectInfo();
            }
            if (lblAction.Text == "Add")
            {
                lblQID.Text = "0";
                btnAddUpdate.Text = "Add";
                AddOption();
              
            }
        }         
     }
    
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Questions.aspx?ExamId=" + lblExamID2.Text + "&SID=" + lblSectionID2.Text);
    }
    
    protected void btnDeleteOpt_Click(object sender, EventArgs e)
    {
     //
    }
    
    protected void btnOptions_Click(object sender, EventArgs e)
    {        
        ////int iNoOptions, iCnt;

        ////if (!mcqBL.checkEmptyInteger(txtTotalOption.Text))
        ////{
        ////     lblMsg.Text = "Invalid number of options.";
        ////}
        ////else {
        ////    iNoOptions = int.Parse(txtTotalOption.Text);


        ////}
  
        
    }

    protected void btnAddUpdate_Click(object sender, EventArgs e)
    {
        if  (!checkParam())  return;

        if (lblAction.Text == "Add") //Add new question
        {
            lblQID.Text = mcqBL.InsertQuestion(int.Parse(lblExamID2.Text), int.Parse(lblSectionID2.Text), txtQuestion.Text, ddlExamType.Text,
                ddlQLevel.Text, ddlQnType.Text, "May", "").ToString();

        }

        if (lblAction.Text == "Update") //Update Existing question
        {
            mcqBL.UpdateQuestion(int.Parse(lblExamID2.Text), int.Parse(lblSectionID2.Text), int.Parse(lblQID.Text), txtQuestion.Text, ddlExamType.Text,
                ddlQLevel.Text, ddlQnType.Text, "May"); 

           
        }
        //process options
        if (!String.IsNullOrEmpty(lblQID.Text))
          mcqBL.DeleteQuestionOptions(int.Parse(lblQID.Text));

        foreach (GridViewRow myRow in gv_Object.Rows)
        {
            CheckBox chkSelectedObject = (CheckBox)(myRow.FindControl("chkSelectedAnswer"));
            TextBox optTxt = (TextBox)(myRow.FindControl("txtOptiontxt"));

            if (optTxt.Text.Trim()  != "")
            {
                if (chkSelectedObject.Checked)
                    mcqBL.InsertQuestionOptions(int.Parse(lblQID.Text), optTxt.Text, 1);
                else
                    mcqBL.InsertQuestionOptions(int.Parse(lblQID.Text), optTxt.Text, 0);
            }
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

    protected void PopulateObjectInfo()
    {

        DataTable dtQuestion = mcqBL.GetQuestion(int.Parse(lblQID.Text));
        
        DataTable dtExam = mcqBL.GetExam(int.Parse(lblExamID2.Text));
        lblExamName.Text = dtExam.Rows[0]["exam_name"] + " (" + dtExam.Rows[0]["exam_abbr"] + ")";

        DataTable dtSection = mcqBL.GetSection(int.Parse(lblSectionID2.Text));
        lblSectionName.Text = dtSection.Rows[0]["section_name"] + " (" + dtSection.Rows[0]["section_abbr"] + ")";


        txtQuestion.Text = dtQuestion.Rows[0]["question_text"].ToString();
        ddlExamType.Text = dtQuestion.Rows[0]["exam_type"].ToString();
        ddlQLevel.Text = dtQuestion.Rows[0]["question_level"].ToString();
        ddlQnType.Text = dtQuestion.Rows[0]["question_type"].ToString();

        PopulateQuestionOptions();
    }

    protected void PopulateQuestionOptions()
    {
        DataTable  dtObject = mcqBL.GetQuestionOptions(int.Parse(lblQID.Text));
        if (dtObject.Rows.Count > 0)
        {
            gv_Object.DataSource = dtObject;
            gv_Object.DataBind();
        }
        else
        {
            dtObject = mcqBL.GetQuestionOptions(0);

            DataRow emptyRow = dtObject.NewRow();
            emptyRow["isAnswer"] = false;
            emptyRow["OptText"] = "";
            dtObject.Rows.Add(emptyRow);

            gv_Object.DataSource = dtObject;
            gv_Object.DataBind();   
        }
    }

    protected void AddOption()
    {

        int iRow = 0;
        DataTable dtObject = mcqBL.GetQuestionOptions(int.Parse(lblQID.Text));

        if (dtObject.Rows.Count > 0)
            iRow = gv_Object.Rows.Count - dtObject.Rows.Count;
        else
            iRow = 1;

        for (int i = 0; i < iRow + 1; i++)
        {
            DataRow emptyRow = dtObject.NewRow();
            emptyRow["isAnswer"] = false;
            emptyRow["OptText"] = "";         
            dtObject.Rows.Add(emptyRow);
        }

        gv_Object.DataSource = dtObject;
        gv_Object.DataBind();   

    }

    protected void DeleteOption(int  optionID)
    {    
        mcqBL.DeleteQuestionOption(optionID);
        PopulateQuestionOptions();

    }
    protected void btnAddOpt_Click(object sender, EventArgs e)
    {
        //AddOption();
        mcqBL.InsertQuestionOptions(int.Parse(lblQID.Text), "", 0);
        PopulateQuestionOptions();
    

     }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtQuestion.Text = "";
        ddlExamType.Text = "";
        ddlQLevel.Text = "";
        ddlQnType.Text = "";

    }
    
    

    protected bool checkParam()
    {

        //if (String.IsNullOrEmpty(txtExamName.Text))
        //{
        //    lblMsg.ForeColor = System.Drawing.Color.Red;
        //    lblMsg.Text = "Please give Exam name before proceeding.";
        //    return false;
        //}
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
