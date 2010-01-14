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


public partial class UserExamPage : System.Web.UI.Page
{
       
    MCQBL mcqBL;
    int examID;
    string userName;

    public UserExamPage()
    {
        mcqBL = new MCQBL();        

    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        userName = Session["UserName"].ToString(); //set USER ID here
        ConfigurationManager.AppSettings["CurrentMenu"] = "ExamPage";
        if (mcqBL.checkEmptyInteger(Request.QueryString["EXAMID"]))
        {
            lblExamID2.Text = Request.QueryString["EXAMID"];
            examID = int.Parse(lblExamID2.Text);
        }
        else
            lblExamName.Text = "Invalid Exam. Go <a href='Exams.aspx'>back</a> to Exams page.";

        if (Request.QueryString["SectionID"] != null)
        {
            lblSectionID.Text = Request.QueryString["SectionID"].ToString();
        }
        else
            lblSectionID.Text = "0";

        if (!Page.IsPostBack)
            GetExamDetails();
            //GenerateExam();
    }

    private void GetExamDetails()
    {
        DataSet dsExamDetails = mcqBL.GetExamDetails(examID);
        FillExamDetails(dsExamDetails.Tables[0]);
        PopulateObjectList(dsExamDetails.Tables[1]);
    }

    private void FillExamDetails(DataTable dtExam)
    {
        if (dtExam.Rows.Count > 0)
        {
            lblExamName.Text = dtExam.Rows[0]["exam_name"].ToString() + " (" + dtExam.Rows[0]["exam_abbr"] + ")";            
            lblTotalQns.Text = dtExam.Rows[0]["total_qns"].ToString();
            lblTotalMarks.Text = dtExam.Rows[0]["total_marks"].ToString();
            lblPassMarks.Text = dtExam.Rows[0]["pass_mark"].ToString();
            lblExamDuration.Text = dtExam.Rows[0]["exam_duration"].ToString();
        }
    }

    private void GenerateExam()
    {
        //DataTable dtExam = mcqBL.GetExam(examID);
        mcqBL.GenerateExam(userName, examID);  //may
        //if (examID != 0)
            //lblExamName.Text = dtExam.Rows[0]["exam_name"] + " (" + dtExam.Rows[0]["exam_abbr"] + ")";            
    }

    private void PopulateObjectList(DataTable dtSection)
    {
        /*DataTable dtExam = mcqBL.GetExam(examID);
        DataTable dtObject = mcqBL.GenerateExam(userName, examID);  //may
        if (examID != 0)
            lblExamName.Text = dtExam.Rows[0]["exam_name"] + " (" + dtExam.Rows[0]["exam_abbr"] + ")";        
   
        if (dtObject.Rows.Count == 0)
            lblInfo.Text = "Error retrieving Exams.";
        DataTable dtObject =  mcqBL.GetSectionsForUser(userName, examID, Convert.ToInt32(lblSectionID.Text));
        if (dtObject.Rows.Count > 0)
            lblSectionID.Text = dtObject.Rows[0]["section_id"].ToString();
        gv_Object.DataSource = dtObject;
        gv_Object.DataBind();*/

        if (dtSection.Rows.Count > 0)
            lblSectionID.Text = dtSection.Rows[0]["section_id"].ToString();

        gv_Object.DataSource = dtSection;
        gv_Object.DataBind();
    }

    protected void btnStart_Click(object sender, EventArgs e)
    {
        GenerateExam();
        Response.Redirect("/MCQ/UserExamQuestion.aspx?SID=" + lblSectionID.Text + "&ExamID=" + examID);
    }

}
