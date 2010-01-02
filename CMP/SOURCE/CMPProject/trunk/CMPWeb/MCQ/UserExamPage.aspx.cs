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
    int userID;

    public UserExamPage()
    {
        mcqBL = new MCQBL();
        userID = 1; //set USER ID here

    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "ExamPage";
        if (mcqBL.checkEmptyInteger(Request.QueryString["EXAMID"]))
        {
            lblExamID2.Text = Request.QueryString["EXAMID"];
            examID = int.Parse(lblExamID2.Text);
        }
        else
            lblExamName.Text = "Invalid Exam. Go <a href='Exams.aspx'>back</a> to Exams page.";
        
        if (!Page.IsPostBack)
            PopulateObjectList();
    }


    private void PopulateObjectList()
    {
        DataTable dtExam = mcqBL.GetExam(examID);
        DataTable dtObject = mcqBL.GenerateExam(1, examID);  //may
        if (examID != 0)
            lblExamName.Text = dtExam.Rows[0]["exam_name"] + " (" + dtExam.Rows[0]["exam_abbr"] + ")";
            
        
   
        if (dtObject.Rows.Count == 0)
            lblInfo.Text = "Error retrieving Exams.";

        gv_Object.DataSource = dtObject;
        gv_Object.DataBind();
    }

}
