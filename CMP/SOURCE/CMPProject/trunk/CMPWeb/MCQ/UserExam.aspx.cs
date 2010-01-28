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

    public partial class UserExam : System.Web.UI.Page
    {

        MCQBL mcqBL;

        public UserExam()
        {
            mcqBL = new MCQBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                hdnExamId.Value = Request.Params["examId"];
                hdnSectionId.Value = Request.Params["sectionId"];
                hdnTotQn.Value = Request.Params["totalQn"];
                
                if (Request.Params["qnCnt"] == null)
                    hdnQnCnt.Value = "1";
                else
                    hdnQnCnt.Value = (Convert.ToInt32(Request.Params["qnCnt"]) + 1).ToString();

                if (Request.Params["user_exam_id"] == null)
                    hdnUserExamID.Value = "0";
                else
                    hdnUserExamID.Value = Convert.ToInt32(Request.Params["user_exam_id"]).ToString();

                /*if (Convert.ToInt32(hdnQnCnt.Value) > Convert.ToInt32(hdnTotQn.Value))
                {
                    DataSet ds = new DataSet();
                    ds = mcqBL.GetQuestion(Convert.ToInt32(hdnExamId.Value), Convert.ToInt32(hdnSectionId.Value), Convert.ToInt32(hdnUserExamID.Value), Session["UserName"].ToString());
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Redirect("/MCQ/UserExamPage.aspx?sectionId=" + hdnSectionId.Value + "&examId=" + hdnExamId.Value);
                    }
                    else
                    {
                        Response.Redirect("/MCQ/UserResult.aspx?EXAMID=" + hdnExamId.Value);
                    }
                }
                else
                {*/
                    getQuestion();
                    getAllQuestion();
                    changeSign();
                //}
            }
        }

        private void getAllQuestion()
        {
            DataTable dtAllQns = mcqBL.GetAllQuestions(Convert.ToInt32(hdnExamId.Value), Convert.ToInt32(hdnSectionId.Value), Session["UserName"].ToString());
            dgQns.DataSource = dtAllQns;
            dgQns.DataBind();
        }

        //Get next question based on the level
        private void getQuestion()
        {
            DataSet ds = new DataSet();
            ds = mcqBL.GetQuestion(Convert.ToInt32(hdnExamId.Value), Convert.ToInt32(hdnSectionId.Value), Convert.ToInt32(hdnUserExamID.Value), Session["UserName"].ToString());

            if (ds.Tables[0].Rows.Count > 0)
            {
                //Get whether Checkbox or RadioButton
                string type = ds.Tables[0].Rows[0]["question_type"].ToString();
                lblQuestion.Text = hdnQnCnt.Value + ". " + ds.Tables[0].Rows[0]["question_text"].ToString();
                hdnUserExamID.Value = ds.Tables[0].Rows[0]["user_exam_id"].ToString();

                mcqBL.UserReadQuestion(Convert.ToInt32(hdnExamId.Value), Convert.ToInt32(hdnSectionId.Value), Session["UserName"].ToString(), Convert.ToInt32(hdnUserExamID.Value));

                //Question for RadioButton
                if (type == "Exclusive")
                {
                    foreach (DataRow drOption in ds.Tables[1].Rows)
                    {
                        rbChoiceList.Items.Add(new ListItem(drOption["OptText"].ToString(), drOption["option_id"].ToString()));
                    }
                    rbChoiceList.Visible = true;
                    chkChoiceList.Visible = false;
                }
                //For CheckBox
                else
                {
                    foreach (DataRow drOption in ds.Tables[1].Rows)
                    {
                        chkChoiceList.Items.Add(new ListItem(drOption["OptText"].ToString(), drOption["option_id"].ToString()));
                    }

                    chkChoiceList.Visible = true;
                    rbChoiceList.Visible = false;
                }             
            }
            else
            {
                bool sectionExist = mcqBL.GetSectionValue(Convert.ToInt32(hdnExamId.Value), Convert.ToInt32(hdnSectionId.Value) + 1, Session["UserName"].ToString());
                if (sectionExist)
                {
                    Response.Redirect("/MCQ/UserExamPage.aspx?sectionId=" + hdnSectionId.Value + "&examId=" + hdnExamId.Value);
                }
                else
                {
                    mcqBL.updateAnswerHistory(Convert.ToInt32(hdnExamId.Value), Session["UserName"].ToString());
                    Response.Redirect("/MCQ/UserResult.aspx?EXAMID=" + hdnExamId.Value);
                }
            }

        }

        private void changeSign()
        {
            DataSet dsQnRdAns = mcqBL.GetReadAnsQuestion(Convert.ToInt32(hdnExamId.Value), Convert.ToInt32(hdnSectionId.Value), Session["UserName"].ToString());

            if (dgQns.Items.Count > 0)
            {
                for (int i = 0; i < dgQns.Items.Count; i++)
                {
                    string user_exam_id = dgQns.Items[i].Cells[0].Text;
                    DataRow[] drRead = dsQnRdAns.Tables[0].Select("qn_id=" + user_exam_id);

                    if (drRead.Length > 0)
                    {
                        Label lblRead;
                        lblRead = (Label)dgQns.Items[i].Cells[1].FindControl("lblRead");
                        lblRead.Text = "+";
                    }

                    DataRow[] drAns = dsQnRdAns.Tables[1].Select("uei=" + user_exam_id);

                    if (drAns.Length > 0)
                    {
                        Label lblAns;
                        lblAns = (Label)dgQns.Items[i].Cells[2].FindControl("lblAns");
                        lblAns.Text = "+";
                    }
                }
            }
        }

        public void NextQuestion(object sender, System.EventArgs e)
        {
            LinkButton chkTemp = (LinkButton)sender;
            DataGridItem dgi;
            dgi = (DataGridItem)chkTemp.Parent.Parent;
            dgQns.SelectedIndex = dgi.ItemIndex;
            string user_exam_id = dgQns.Items[dgQns.SelectedIndex].Cells[0].Text;
            string clickedQNo = dgQns.Items[dgQns.SelectedIndex].Cells[1].Text;
            Response.Redirect("/MCQ/UserExam.aspx?sectionId=" + hdnSectionId.Value + "&examId=" + hdnExamId.Value + "&totalQn=" + hdnTotQn.Value
                                                              + "&qnCnt=" + (Convert.ToInt32(clickedQNo) - 1).ToString() + "&user_exam_id=" + (Convert.ToInt32(user_exam_id)));
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            int[] aAnsOpt = GetSelectedExamsIDs();
            if (aAnsOpt.Length == 0)
            {                
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please answer the question.";
                return;
            }
            else
            {                
                for (int i = 0; i < aAnsOpt.Length; i++)
                {
                    mcqBL.InsertAnswerQuestion(Convert.ToInt32(hdnUserExamID.Value), aAnsOpt[i]);
                }

                changeSign();

            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("/MCQ/UserExam.aspx?sectionId=" + hdnSectionId.Value + "&examId=" + hdnExamId.Value + "&totalQn=" + hdnTotQn.Value
                                                              + "&qnCnt=" + hdnQnCnt.Value + "&user_exam_id=" + (Convert.ToInt32(hdnUserExamID.Value) + 1));
        }

        protected int[] GetSelectedExamsIDs()
        {
            ArrayList AnswerOptionsIDs = new ArrayList();
            
            //For RadioButton
            if (rbChoiceList.SelectedIndex > -1)
            {
                AnswerOptionsIDs.Add(Convert.ToInt32(rbChoiceList.SelectedItem.Value));
            }

            //For Checkbox
            if (chkChoiceList.SelectedIndex > -1)
            {
                for (int i = 0; i < chkChoiceList.Items.Count; i++)
                {
                    if (chkChoiceList.Items[i].Selected)
                    {
                        AnswerOptionsIDs.Add(Convert.ToInt32(chkChoiceList.Items[i].Value));
                    }
                }                
            }
            
            return (int[])AnswerOptionsIDs.ToArray(typeof(int));
        }

    }