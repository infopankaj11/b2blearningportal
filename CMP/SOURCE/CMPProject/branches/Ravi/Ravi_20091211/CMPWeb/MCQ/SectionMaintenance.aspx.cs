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

public partial class SectionMaintenance : System.Web.UI.Page
{
    MCQBL mcqBL;
  
    public SectionMaintenance()
    {
        mcqBL = new MCQBL();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigurationManager.AppSettings["CurrentMenu"] = "Exams";

        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["ExamId"]))
            {                
                lblSectionID.Text = Request.QueryString["SID"];
                lblExamID2.Text = Request.QueryString["ExamId"];
            }
           
            lblAction.Text = Request.QueryString["Action"];
            if (lblAction.Text == "Update")
            {
                btnAddUpdate.Text = "Update";
                //PopulateObjectInfo();
            }
            if (lblAction.Text == "Add")
                btnAddUpdate.Text = "Add";

            PopulateObjectInfo();

            lblOperation.Text = btnAddUpdate.Text + " Section";
        }         
     }

    protected void btnAddUpdate_Click(object sender, EventArgs e)
    {
        if  (!checkParam())  return;

        if (lblAction.Text == "Add") //Add new FAP
        {
            mcqBL.InsertSection(int.Parse(lblExamID2.Text), txtSectionName.Text, txtSectionAbbr.Text,
                int.Parse(ddlSeq.SelectedItem.Value), int.Parse(txtSectionWeigth.Text), int.Parse(txtEasy.Text),
                int.Parse(txtEasyWgt.Text), int.Parse(txtMed.Text), int.Parse(txtMedWgt.Text),
                int.Parse(txtHard.Text), int.Parse(txtHrdWgt.Text), "May", ""); 
                
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully added the new Section.";
        }

        if (lblAction.Text == "Update") //Update Existing FAP
        {
            mcqBL.UpdateSection(int.Parse(lblSectionID.Text), txtSectionName.Text, txtSectionAbbr.Text,
                int.Parse(ddlSeq.SelectedItem.Value), int.Parse(txtSectionWeigth.Text), int.Parse(txtEasy.Text),
                int.Parse(txtEasyWgt.Text), int.Parse(txtMed.Text), int.Parse(txtMedWgt.Text),
                int.Parse(txtHard.Text), int.Parse(txtHrdWgt.Text), "May"); 

            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Successfully updated the Exam.";
        }
    }

    protected void PopulateObjectInfo()
    {
        DataTable dtExam = mcqBL.GetExam(int.Parse(lblExamID2.Text));
        lblExamName.Text = dtExam.Rows[0]["exam_name"] + " (" + dtExam.Rows[0]["exam_abbr"] + ")";

        if (lblAction.Text == "Update") //Update Existing FAP
        {
            DataTable dtSection = mcqBL.GetSection(int.Parse(lblSectionID.Text));

            txtSectionName.Text = dtSection.Rows[0]["section_name"].ToString();
            txtSectionAbbr.Text = dtSection.Rows[0]["section_abbr"].ToString();
            //ddlSeq.SelectedIndex  = ddlSeq.Items.IndexOf(dtExam.Rows[0]["section_seq"].ToString()); 
            txtSectionWeigth.Text = dtSection.Rows[0]["section_weight"].ToString();
            txtEasy.Text = dtSection.Rows[0]["total_simple_qns"].ToString();
            txtEasyWgt.Text = dtSection.Rows[0]["simple_qn_weight"].ToString();
            txtMed.Text = dtSection.Rows[0]["total_moderate_qns"].ToString();
            txtMedWgt.Text = dtSection.Rows[0]["moderate_qn_weight"].ToString();
            txtHard.Text = dtSection.Rows[0]["total_complex_qns"].ToString();
            txtHrdWgt.Text = dtSection.Rows[0]["complex_qn_weight"].ToString();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sections.aspx?ExamId=" + lblExamID2.Text + "&SID=" + lblSectionID.Text);
    }


    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtSectionName.Text = "";
        txtSectionAbbr.Text = "";
        //ddlSeq.SelectedIndex  = ddlSeq.Items.IndexOf(dtExam.Rows[0]["section_seq"].ToString()); 
        txtSectionWeigth.Text = "";
        txtEasy.Text = "";
        txtEasyWgt.Text = "";
        txtMed.Text = "";
        txtMedWgt.Text = "";
        txtHard.Text = "";
        txtHrdWgt.Text = "";

    }

    protected bool checkParam()
    {

        if (String.IsNullOrEmpty(txtSectionName.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give Section name before proceeding.";
            return false;
        }
        else if (String.IsNullOrEmpty(txtSectionAbbr.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give Section abbreviation  before proceeding.";
            return false;
        }
        else if (!mcqBL.checkEmptyInteger(txtSectionWeigth.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give Section weight (numeric) before proceeding.";
            return false;
        }
        else if (!mcqBL.checkEmptyInteger(txtEasy.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give number of EASY QUESTION (numeric) before proceeding.";
            return false;
        }
        else if (!mcqBL.checkEmptyInteger(txtEasyWgt.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give EASY QUESTION WEIGHT (numeric) before proceeding.";
            return false;
        }
        else if (!mcqBL.checkEmptyInteger(txtMed.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give number of MEDIUM QUESTION (numeric) before proceeding.";
            return false;
        }
        else if (!mcqBL.checkEmptyInteger(txtMedWgt.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give MEDIUM QUESTION WEIGHT (numeric) before proceeding.";
            return false;
        }
        else if (!mcqBL.checkEmptyInteger(txtHard.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give number of HARD QUESTION (numeric) before proceeding.";
            return false;
        }
        else if (!mcqBL.checkEmptyInteger(txtHrdWgt.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please give HARD QUESTION WEIGHT (numeric) before proceeding.";
            return false;
        }

                
        return true;
    } 


}
