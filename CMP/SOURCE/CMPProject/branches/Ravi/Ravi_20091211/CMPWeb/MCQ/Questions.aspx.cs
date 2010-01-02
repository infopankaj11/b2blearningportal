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

public partial class Questions : System.Web.UI.Page
{

    MCQBL mcqBL;
    int examID;
    int sectionID;

    public Questions()
    {
        mcqBL = new MCQBL();
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "Exams";

        if (mcqBL.checkEmptyInteger(Request.QueryString["EXAMID"]))
        {
            lblExamID2.Text = Request.QueryString["EXAMID"];
            examID = int.Parse(lblExamID2.Text);
        }
        else
            lblExamName.Text = "Invalid Exam. Go <a href='Exams.aspx'>back</a> to Exams page.";

        if (mcqBL.checkEmptyInteger(Request.QueryString["SID"]))
        {
            lblSectionID2.Text = Request.QueryString["SID"];
            sectionID=int.Parse(lblSectionID2.Text);
        }
        else
            lblSectionName.Text = "Invalid Section iD. Go <a href='Sections.aspx?ExamID=" + lblExamID2.Text + "'>back</a> to Exams page.";
                       
        if (!Page.IsPostBack)
            PopulateObjectList();
           
    }
    
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("QuestionMaintenance.aspx?Action=Add&ExamId=" + lblExamID2.Text + "&SID=" + lblSectionID2.Text);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sections.aspx?ExamId=" + lblExamID2.Text + "&SID=" + lblSectionID2.Text);    
    }

    private void PopulateObjectList()
    {
        DataTable dtExam = mcqBL.GetExam(examID);
        if (dtExam.Rows.Count > 0)
            lblExamName.Text = dtExam.Rows[0]["exam_name"] + " (" + dtExam.Rows[0]["exam_abbr"] + ")";
     

        DataTable dtObject = mcqBL.GetSectionQuestions(sectionID);
        

        if (dtObject.Rows.Count > 0)
        {
            gv_Object.DataSource = dtObject;
            gv_Object.DataBind();
        }
        else
            lblInfo.Text = "No Question yet.";

    }
    
    protected void btnClear_Click(object sender, EventArgs e)
    {
        CheckBox chkSelectedObject;
        foreach (GridViewRow myRow in gv_Object.Rows)
        {
            chkSelectedObject = (CheckBox)(myRow.FindControl("chkSelectedObject"));
            chkSelectedObject.Checked = false;
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int[] ObjectIDs = GetSelectedObjectIDs();
        if (ObjectIDs.Length == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select a question before proceeding.";
            return;
        }
        else
        {
            mcqBL.DeleteQuestion(ObjectIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully deleted selected question(s).";
            PopulateObjectList();
        }
    }


    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Exams.aspx");
    }

   
    protected int[] GetSelectedObjectIDs()
    {
        ArrayList SelectedObjectIDs = new ArrayList();
        CheckBox chkSelectedObject;
        foreach (GridViewRow myRow in gv_Object.Rows)
        {
            chkSelectedObject = (CheckBox)(myRow.FindControl("chkSelectedObject"));
            if (chkSelectedObject.Checked)
                SelectedObjectIDs.Add(gv_Object.DataKeys[myRow.RowIndex].Value);
        }
        return (int[])SelectedObjectIDs.ToArray(typeof(int));
    }

    protected void cbSelectAll_OnCheckedChanged(object sender, EventArgs e)
    {

        CheckBox chkSelectedObject;
        CheckBox chkSelectAll = (CheckBox)(gv_Object.HeaderRow.FindControl("cbSelectAll"));
        foreach (GridViewRow myRow in gv_Object.Rows)
        {
            chkSelectedObject = (CheckBox)(myRow.FindControl("chkSelectedObject"));
            chkSelectedObject.Checked = chkSelectAll.Checked;
          
        }
    }

       

}
