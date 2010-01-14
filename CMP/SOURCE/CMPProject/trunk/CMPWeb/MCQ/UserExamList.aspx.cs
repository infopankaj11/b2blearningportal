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

public partial class UserExamList : System.Web.UI.Page
{
    MCQBL mcqBL;
    int userID;

    public UserExamList()
    {
        mcqBL = new MCQBL();
        userID = 1; //set USER ID here
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "ExamList";
        if (!Page.IsPostBack)
            PopulateExamList();
    }

    private void PopulateExamList()
    {
        DataTable dtExams= mcqBL.GetAllUserExams("");
        gv_Exams.DataSource = dtExams;
        gv_Exams.DataBind();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        CheckBox chkSelectedExam;
        foreach (GridViewRow myRow in gv_Exams.Rows)
        {
            chkSelectedExam = (CheckBox)(myRow.FindControl("chkSelectedExam"));
            chkSelectedExam.Checked = false;
        }
    }

}
