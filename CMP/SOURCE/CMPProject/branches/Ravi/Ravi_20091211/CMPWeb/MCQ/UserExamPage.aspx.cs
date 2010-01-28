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

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["SectionID"] != null)
            {
                lblSectionID.Text = Request.QueryString["SectionID"].ToString();
            }
            else
                lblSectionID.Text = "0";

            if (lblSectionID.Text == "0")
                mcqBL.GenerateExam(userName, examID);        
        

            GetExamDetails();
        }
            //GenerateExam();
    }

    private void GetExamDetails()
    {
        DataSet dsExamDetails = mcqBL.GetExamDetails(examID, Convert.ToInt32(lblSectionID.Text));
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
    }

    private void PopulateObjectList(DataTable dtSection)
    {

        if (dtSection.Rows.Count > 0)
        {
            lblSectionID.Text = dtSection.Rows[0]["section_id"].ToString();
            hdnQnCnt.Value = (Convert.ToInt32(dtSection.Rows[0]["total_simple_qns"].ToString()) +
                     Convert.ToInt32(dtSection.Rows[0]["total_moderate_qns"].ToString()) +
                     Convert.ToInt32(dtSection.Rows[0]["total_complex_qns"].ToString())).ToString();
        }
        
        gv_Object.DataSource = dtSection;
        gv_Object.DataBind();
    }

    protected void btnStart_Click(object sender, EventArgs e)
    {        
        Response.Redirect("/MCQ/UserExam.aspx?sectionId=" + lblSectionID.Text + "&examId=" + examID + "&totalQn=" + hdnQnCnt.Value);
    }

}
