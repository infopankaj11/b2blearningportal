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

public partial class Sections : System.Web.UI.Page
{

    MCQBL mcqBL;
    int examID;

    public Sections()
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
        
        if (!Page.IsPostBack)
            PopulateObjectList();
    }


    protected void btnAddUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("SectionMaintenance.aspx?Action=Add&ExamId=" + lblExamID2.Text);
    }

    private void PopulateObjectList()
    {
        DataTable dtExam = mcqBL.GetExam(examID);
        DataTable dtObject;
        if (examID != 0)
        {
            lblExamName.Text = dtExam.Rows[0]["exam_name"] + " (" + dtExam.Rows[0]["exam_abbr"] + ")";
             dtObject = mcqBL.GetAllExamSections(examID);

        }
        else
        {
            lblExamName.Text = "";
            dtObject = mcqBL.GetAllSections();
        }
        if (dtObject.Rows.Count == 0)
            lblInfo.Text = "No Sections yet.";

        gv_Object.DataSource = dtObject;
        gv_Object.DataBind();
    }

   
    protected void btnClear_Click(object sender, EventArgs e)
    {
        CheckBox chkSelectedObject;
        CheckBox chkSelectAll;
        foreach (GridViewRow myRow in gv_Object.Rows)
        {
            chkSelectedObject = (CheckBox)(myRow.FindControl("chkSelectedObject"));
            chkSelectedObject.Checked = false;
        }
        chkSelectAll = (CheckBox)(gv_Object.HeaderRow.FindControl("cbSelectAll"));
        if (chkSelectAll != null)
            chkSelectAll.Checked = false; 
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int[] ObjectIDs = GetSelectedObjectIDs();
        if (ObjectIDs.Length == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select a section before proceeding.";
            return;
        }
        else
        {
            mcqBL.DeleteSection(ObjectIDs);
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully deleted selected Section(s).";
            PopulateObjectList();
        }
    }


    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Exams.aspx");
    }

    protected void btnManage_Click(object sender, EventArgs e)
    {
        int[] ObjectIDs = GetSelectedObjectIDs();
        if (ObjectIDs.Length == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select section before proceeding.";
            return;
        }
        else
        {
            if (ObjectIDs.Length > 1)
            {
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Only 1 section can be managed at a time.";
            }
            else
            {
                Response.Redirect("Questions.aspx?SID=" + ObjectIDs[0] + "&ExamId=" + examID);
            }
        }

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
