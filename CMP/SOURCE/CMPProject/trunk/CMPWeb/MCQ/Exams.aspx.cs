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

public partial class Exams : System.Web.UI.Page
{
   MCQBL mcqBL;

    public Exams()
    {
        mcqBL = new MCQBL();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "Exams";
        if (!Page.IsPostBack)
            PopulateExamList();
    }

    private void PopulateExamList()
    {
        DataTable dtExams= mcqBL.GetAllExams();
        gv_Exams.DataSource = dtExams;
        gv_Exams.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("ExamMaintenance.aspx?Action=Add");
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
       
        CheckBox chkSelectedExam;
        CheckBox chkSelectAll;
        foreach (GridViewRow myRow in gv_Exams.Rows)
        {
            chkSelectedExam = (CheckBox)(myRow.FindControl("chkSelectedExam"));
            chkSelectedExam.Checked = false;
         
        }
        chkSelectAll = (CheckBox)(gv_Exams.HeaderRow.FindControl("cbSelectAll"));
        if (chkSelectAll != null)
            chkSelectAll.Checked = false; 
    }

     protected void btnDelete_Click(object sender, EventArgs e)
    {
        int[] ExamIDs = GetSelectedExamsIDs();
        if (ExamIDs.Length == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select Exam before proceeding.";
            return;
        }
        else
        {
            mcqBL.DeleteExam(ExamIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully deleted selected Exam(s).";
            PopulateExamList();
        }
    }

     protected void btnManageSection_Click(object sender, EventArgs e)
     {
         int[] ExamIDs = GetSelectedExamsIDs();
         if (ExamIDs.Length == 0)
         {
             lblMsg.ForeColor = System.Drawing.Color.Red;
             lblMsg.Text = "Please select Exam before proceeding.";
             return;
         }
         else
         {
             if (ExamIDs.Length > 1)
             {
                 lblMsg.ForeColor = System.Drawing.Color.Green;
                 lblMsg.Text = "Select only 1 Exam section to manage.";
             }
             else
             {
                 Response.Redirect("Sections.aspx?ExamId=" + ExamIDs[0]);  
             }
         }

     }

     protected int[] GetSelectedExamsIDs()
     {
         ArrayList SelectedExamIDs = new ArrayList();
         CheckBox chkSelectedExam;
         foreach (GridViewRow myRow in gv_Exams.Rows)
         {
             chkSelectedExam = (CheckBox)(myRow.FindControl("chkSelectedExam"));
             if (chkSelectedExam.Checked)
                 SelectedExamIDs.Add(gv_Exams.DataKeys[myRow.RowIndex].Value);
         }
         return (int[])SelectedExamIDs.ToArray(typeof(int));
     }

     protected void cbSelectAll_OnCheckedChanged(object sender, EventArgs e)
     {
        CheckBox chkSelectedObject;
        CheckBox chkSelectAll = (CheckBox)(gv_Exams.HeaderRow.FindControl("cbSelectAll"));
        foreach (GridViewRow myRow in gv_Exams.Rows)
        {
            chkSelectedObject = (CheckBox)(myRow.FindControl("chkSelectedExam"));
            chkSelectedObject.Checked = chkSelectAll.Checked;

        }
     }
}
