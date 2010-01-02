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

public partial class ExamMaintenance : System.Web.UI.Page
{
    MCQBL mcqBL;
  
    public ExamMaintenance()
    {
        mcqBL = new MCQBL();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "Exams";
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["EXAMID"]))
                lblExamID2.Text = Request.QueryString["EXAMID"];

            lblAction.Text = Request.QueryString["Action"];
            if (lblAction.Text == "Update")
            {
                btnAddUpdate.Text = "Update";
                PopulateExamInfo();
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
            mcqBL.InsertExam(txtExamName.Text, txtAbbr.Text, int.Parse(txtTotQns.Text), int.Parse(txtTotMarks.Text), int.Parse(txtPassMark.Text), int.Parse(txtDuration.Text), "May", ""); 
                
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully added the new Exam.";
        }

        if (lblAction.Text == "Update") //Update Existing FAP
        {
            mcqBL.UpdateExam(int.Parse(lblExamID2.Text), txtExamName.Text, txtAbbr.Text, int.Parse(txtTotQns.Text), int.Parse(txtTotMarks.Text), int.Parse(txtPassMark.Text), int.Parse(txtDuration.Text), "May");  
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully updated the Exam.";
        }
    }

    protected void PopulateExamInfo()
    {
        DataTable dtExamInfo = mcqBL.GetExam(int.Parse(lblExamID2.Text));
        txtExamName.Text = dtExamInfo.Rows[0]["exam_name"].ToString();
        txtAbbr.Text = dtExamInfo.Rows[0]["exam_abbr"].ToString();
        txtTotQns.Text = dtExamInfo.Rows[0]["total_qns"].ToString();
        txtTotMarks.Text = dtExamInfo.Rows[0]["total_marks"].ToString();
        txtPassMark.Text = dtExamInfo.Rows[0]["pass_mark"].ToString();
        txtDuration.Text = dtExamInfo.Rows[0]["exam_duration"].ToString();  
   }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Exams.aspx");
    }

    protected bool checkParam()
    {

        if (String.IsNullOrEmpty(txtExamName.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give Exam name before proceeding.";
            return false;
        }
        else if (String.IsNullOrEmpty(txtAbbr.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give Exam abbreviation  before proceeding.";
            return false;
        }
        else if (!mcqBL.checkEmptyInteger(txtTotQns.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give total questions (numeric) before proceeding.";
            return false;
        }
        else if (!mcqBL.checkEmptyInteger(txtTotMarks.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give Total Marks (numeric) before proceeding.";
            return false;
        }
        else if (!mcqBL.checkEmptyInteger(txtPassMark.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give Passing mark (numeric) before proceeding.";
            return false;
        }
        else if (!mcqBL.checkEmptyInteger(txtDuration.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give Exam duration in minutes (numeric) name before proceeding.";
            return false;
        }

        //check for validity 
        int totMarks = int.Parse( txtTotMarks.Text);
        int passMark = int.Parse(txtPassMark.Text);

        if (passMark > totMarks)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Passing mark cannot be more than the total marks.";
            return false;
        }
                
        return true;
    } 


}
