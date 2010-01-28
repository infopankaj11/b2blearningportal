using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections;

namespace WorkLayers.DataLayer
{
    public class MCQDL
    {
        private DBAccessManager dbAccessManager;
        private String strSQL;

        public MCQDL()
        {
            dbAccessManager = new DBAccessManager();
        }

  
        public DataTable GetAllExams()
        {
            strSQL = "select * from dbo.mcq_exam_master where delete_flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public DataTable GetExam(int examId)
        {
            strSQL = "select * from dbo.mcq_exam_master where exam_id=" + examId + ";";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public DataTable GetExamDetail(int examId)
        {
            strSQL = "select * from dbo.mcq_exam_master where exam_id=" + examId + " and delete_flag=0";
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will get all the functions, as well marks which functions does the FAP has, according to the FAPID. 
        public DataTable getAllExams(int ModId)
        {
            strSQL = "";
            strSQL += " SELECT * from mcq_examp_master where delete_flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        /*        public int InsertExam(String exName, String exAbbr, int total_qns, int total_mark, int pass_mark, int exam_duration, String createdBy, String modifiedBy)
        {
            strSQL = "INSERT INTO MCQ_EXAM_MASTER(Exam_name,Exam_abbr, total_qns, total_marks, pass_mark, exam_duration, Created_By, Created_Date, Modified_By, Modified_Date, Delete_Flag) VALUES (";
            strSQL += "'" + exName + "','" + exAbbr + "'," + total_qns + "," + total_mark + "," + pass_mark + "," + exam_duration + ",'" + createdBy + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "','" + modifiedBy + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0" + ");";
            strSQL += "INSERT INTO module_master(module_name, module_type, Created_By, Created_Date,Modified_By, Modified_Date, Delete_Flag) VALUES ( ";
            strSQL += "'" + exName + "','MCQ','" + createdBy + "','" + DateTime.Today.ToString("dd-MMM-yyyy") +"','" + modifiedBy + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0" + ");";
            strSQL += "SELECT exam_id FROM MCQ_EXAM_MASTER WHERE exam_id=@@IDENTITY; ";
            return (int)dbAccessManager.GetScalar(strSQL);

        }*/

        public int InsertExam(String exName, String exAbbr, int total_qns, int total_mark, int pass_mark, int exam_duration, String createdBy, String modifiedBy)
        {
            strSQL = "INSERT INTO MCQ_EXAM_MASTER(Exam_name,Exam_abbr, total_qns, total_marks, pass_mark, exam_duration, Created_By, Created_Date, Modified_By, Modified_Date, Delete_Flag) VALUES (";
            strSQL += "'" + exName + "','" + exAbbr + "'," + total_qns + "," + total_mark + "," + pass_mark + "," + exam_duration + ",'" + createdBy + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "','" + modifiedBy + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0" + ");";
            strSQL += "SELECT exam_id FROM MCQ_EXAM_MASTER WHERE exam_id=@@IDENTITY; ";

            int id = (int)dbAccessManager.GetScalar(strSQL);

            strSQL = "INSERT INTO module_master(module_id, module_name, module_type, module_remarks, Created_By, Created_Date,Modified_By, Modified_Date, Delete_Flag) VALUES ( ";
            strSQL += id + ",'" + exName + "','MCQ','','" + createdBy + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "','" + modifiedBy + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0" + ");";
            dbAccessManager.GetScalar(strSQL);
            return id;

        }

        public void UpdateExam(int examID, String exName, String exAbbr, int total_qns, int total_mark, int pass_mark, int exam_duration, String modifiedBy)
        {
            strSQL = "UPDATE MCQ_EXAM_MASTER SET Exam_name='" + exName + "', Exam_abbr='" + exAbbr + "',total_qns=" + total_qns + ", total_marks=" + total_mark + ",pass_mark=" + pass_mark + ", exam_duration=" + exam_duration + ",Modified_By='" + modifiedBy + "', Modified_Date='" + DateTime.Today.ToString("dd-MMM-yyyy") + "' WHERE exam_id=" + examID.ToString();
            dbAccessManager.GetCommand(strSQL);
        }


        public void DeleteExam(int ExamId)
        {
            strSQL = "UPDATE MCQ_EXAM_MASTER SET delete_flag=1 WHERE exam_id=" + ExamId.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will mark the Delete_Flag=1
        public void DeleteExam(int[] ExamIds)
        {
            String sExamIDs = "";
            for (int i = 0; i < ExamIds.Length; i++)
                sExamIDs += ExamIds[i].ToString() + ",";
            sExamIDs += "-1"; //-1 is a dummy value, it's used to avoid the trouble to remove the last comma.
            strSQL = "UPDATE MCQ_EXAM_MASTER SET Delete_Flag=1 WHERE exam_id IN (" + sExamIDs + ");";
            dbAccessManager.GetCommand(strSQL);
        }

        public DataTable GetAllExamSections(int ExamId)
        {
            strSQL = "select * from dbo.mcq_section_master where  exam_id = " + ExamId.ToString() + " and delete_flag=0 order by section_seq asc;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public DataTable GetAllExamSections(int ExamId, int SectionId)
        {
            //if (SectionId == 0)
                strSQL = "select top(1) * from dbo.mcq_section_master where  exam_id = " + ExamId.ToString() + " and section_id>" + SectionId + " and delete_flag=0 order by section_seq asc;";
            //else
                //strSQL = "select top(1) * from dbo.mcq_section_master where  exam_id = " + ExamId.ToString() + " and section_id=" + SectionId + " and delete_flag=0 order by section_seq asc;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public void DeleteExams()
        {
            strSQL = "delete from mcq_user_exam;delete from mcq_user_answer;";
            dbAccessManager.GetCommand(strSQL);
        }

        public DataTable GetAllSections()
        {
            strSQL = "select * from dbo.mcq_section_master where  delete_flag=0 order by exam_id asc;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public DataTable GetSection(int section_id)
        {
            strSQL = "select * from dbo.mcq_section_master where  section_id = " + section_id.ToString() + " and delete_flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }


        public int InsertSection(int exam_id, String section_name, String section_abbr, int section_seq, int section_weight, int total_simple_qns, int simple_qn_weight, int total_moderate_qns, int moderate_qn_weight, int total_complex_qns, int complex_qn_weight, String createdBy, String modifiedBy)
        {
            strSQL = "INSERT INTO mcq_section_master(exam_id,section_name, section_abbr, section_seq, section_weight, total_simple_qns,simple_qn_weight, total_moderate_qns, moderate_qn_weight,total_complex_qns, complex_qn_weight, Created_By, Created_Date, Modified_By, Modified_Date, Delete_Flag) VALUES (";
            strSQL += "'" + exam_id + "','" + section_name + "','" + section_abbr + "'," + section_seq + "," + section_weight + "," + total_simple_qns + "," + simple_qn_weight + "," + total_moderate_qns + "," + moderate_qn_weight + "," + total_complex_qns + "," + complex_qn_weight + ",'" + createdBy + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "','" + modifiedBy + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0" + ");";
            strSQL += "SELECT section_id FROM mcq_section_master WHERE section_id=@@IDENTITY; ";
            return (int)dbAccessManager.GetScalar(strSQL);
        }

        public void UpdateSection(int section_id, String section_name, String section_abbr, int section_seq, int section_weight, int total_simple_qns, int simple_qn_weight, int total_moderate_qns, int moderate_qn_weight, int total_complex_qns, int complex_qn_weight, String modifiedBy)
        {
            strSQL = "UPDATE mcq_section_master SET section_name='" + section_name + "', section_abbr='" + section_abbr + "',section_seq=" + section_seq + ", section_weight=" + section_weight + ",total_simple_qns=" + total_simple_qns + ", simple_qn_weight=" + simple_qn_weight + ", total_moderate_qns=" + total_moderate_qns + ", moderate_qn_weight=" + moderate_qn_weight + ", total_complex_qns=" + total_complex_qns + ", complex_qn_weight=" + complex_qn_weight + ",Modified_By='" + modifiedBy + "', Modified_Date='" + DateTime.Today.ToString("dd-MMM-yyyy") + "' WHERE section_id=" + section_id.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will mark the Delete_Flag=1
        public void DeleteSection(int[] SectionIDs)
        {
            String sSectionIDs = "";
            for (int i = 0; i < SectionIDs.Length; i++)
                sSectionIDs += SectionIDs[i].ToString() + ",";
            sSectionIDs += "-1"; //-1 is a dummy value, it's used to avoid the trouble to remove the last comma.
            strSQL = "UPDATE mcq_section_master SET Delete_Flag=1 WHERE section_id IN (" + sSectionIDs + ");";
            dbAccessManager.GetCommand(strSQL);
        }


        //questions
        public DataTable GetSectionQuestions(int SectionId)
        {
            strSQL = "select * from dbo.mcq_question_master where  section_id = " + SectionId.ToString() + " and delete_flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public DataTable GetQuestion(int question_id)
        {
            strSQL = "select * from dbo.mcq_question_master where  question_id = " + question_id.ToString() + " and delete_flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }
     

        public int InsertQuestion(int exam_id, int section_id, String question_text, String exam_type, String question_level, String question_type, String createdBy, String modifiedBy)
        {
            strSQL = "INSERT INTO mcq_question_master(exam_id,section_id,question_text,exam_type,question_level,question_type, Created_By, Created_Date, Modified_By, Modified_Date, Delete_Flag) VALUES (";
            strSQL += exam_id + "," + section_id + ",'" + question_text + "','" + exam_type + "','" + question_level + "','" + question_type + "','" + createdBy + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "','" + modifiedBy + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0" + ");";
            strSQL += "SELECT question_id FROM mcq_question_master WHERE question_id=@@IDENTITY; ";
            return (int)dbAccessManager.GetScalar(strSQL);
        }

        public void UpdateQuestion(int exam_id, int section_id, int question_id, String question_text, String exam_type, String question_level, String question_type, String modifiedBy)
        {
            strSQL = "UPDATE mcq_question_master SET question_text='" + question_text + "', exam_type='" + exam_type + "',question_level='" + question_level + "', question_type='" + question_type + "',Modified_By='" + modifiedBy + "', Modified_Date='" + DateTime.Today.ToString("dd-MMM-yyyy") + "' WHERE question_id=" + question_id.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will mark the Delete_Flag=1
        public void DeleteQuestion(int[] QIDs)
        {
            String sQIDs = "";
            for (int i = 0; i < QIDs.Length; i++)
                sQIDs += QIDs[i].ToString() + ",";
            sQIDs += "-1"; //-1 is a dummy value, it's used to avoid the trouble to remove the last comma.
            strSQL = "UPDATE mcq_question_master SET Delete_Flag=1 WHERE question_id IN (" + sQIDs + ");";
            dbAccessManager.GetCommand(strSQL);
        }

        //choices
        public DataTable GetQuestionOptions(int question_id)
        {
            strSQL = "select * from dbo.mcq_question_options where question_id = " + question_id.ToString() + ";";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public void DeleteQuestionOptions(int question_id)
        {
            //strSQL = "UPDATE mcq_question_options SET Delete_Flag=1 WHERE option_id=" + option_id.ToString;
            strSQL = "DELETE mcq_question_options WHERE question_id=" + question_id.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        public void DeleteQuestionOption(int option_id)
        {
            //strSQL = "UPDATE mcq_question_options SET Delete_Flag=1 WHERE option_id=" + option_id.ToString;
            strSQL = "DELETE mcq_question_options WHERE option_id=" + option_id.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        public void InsertQuestionOptions(int question_id, String OptText, int isAnswer)
        {
            strSQL = "INSERT INTO mcq_question_options(question_id, OptText, isAnswer) VALUES (" + question_id + ",'" + OptText + "'," + isAnswer + ");";
            dbAccessManager.GetCommand(strSQL);
        }
        //this select statement has to be changed to reflect the user rights
        public DataTable GetAllUserExams(string userName)
        {
            strSQL = "select a.*, (Select count(b.exam_id) from mcq_exam_result b where a.exam_id = b.exam_id ) as Taken from dbo.mcq_exam_master a where  a.delete_flag=0; ";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public int getUserExam(string userName, int exam_id)
        {
            strSQL = "Select count(user_exam_id) bHasMCQ from mcq_user_exam where exam_id =" + exam_id + " and username='" + userName + "';";
            return (int)dbAccessManager.GetScalar(strSQL);
 
        }

        public void GenerateQuestionLevel(String stype, String sLevel, int iQCount, int exam_id, int section_id, string userName )
        {
            strSQL = "INSERT INTO mcq_user_exam (exam_id, section_id, username, qn_id, exam_date, created_by, created_date, delete_flag)";
            strSQL += "SELECT top " + iQCount + " exam_id, " + section_id + ",'" + userName + "' , question_id, '" + DateTime.Now.ToString("dd-MMM-yyyy") + "', '" + userName + "', '" + DateTime.Today.ToString("dd-MMM-yyyy") + "', 0 ";
            strSQL += " from mcq_question_master where exam_type='" + stype + "' and question_level='" + sLevel + "' and section_id=" + section_id + " order by NEWID();";
            dbAccessManager.GetCommand(strSQL);
        }

        public DataSet GetQuestion(int exam_id, int section_id, int user_exam_id, string userName)
        {
            if (user_exam_id == 0)
                strSQL = "select top(1) user_exam_id, qn_id,question_text,question_type from mcq_question_master a, mcq_user_exam b where b.exam_id=" + exam_id + " and b.section_id=" + section_id + " and username='" + userName + "' and exam_date='" + DateTime.Now.ToString("dd-MMM-yyyy") + "'  and b.qn_id=a.question_id";
            else
                strSQL = "select user_exam_id, qn_id,question_text,question_type from mcq_question_master a, mcq_user_exam b where b.exam_id=" + exam_id + " and b.section_id=" + section_id + " and user_exam_id=" + user_exam_id + " and qn_id=question_id";

            DataTable dtQn = dbAccessManager.GetDataTable(strSQL);
            DataTable dtOption = new DataTable();
            if (dtQn.Rows.Count > 0)
            {
                string qn_id = dtQn.Rows[0]["qn_id"].ToString();
                strSQL = "select * from mcq_question_options where question_id=" + qn_id;
                dtOption = dbAccessManager.GetDataTable(strSQL);
            }

            DataSet dsQuestion = new DataSet();
            dsQuestion.Tables.Add(dtQn);
            dsQuestion.Tables.Add(dtOption);

            return dsQuestion;
        }

        public bool GetSectionValue(int exam_id, int section_id, string username)
        {
            strSQL = "select * from mcq_user_exam where exam_id=" + exam_id + " and section_id=" + section_id + " and username='" + username + "' and exam_date='" + DateTime.Now.ToString("dd-MMM-yyyy") + "'";
            DataTable dtSection = dbAccessManager.GetDataTable(strSQL);
            if (dtSection.Rows.Count > 0)
                return true;
            else
                return false;
        }

        public void UserReadQuestion(int exam_id, int section_id, string userName, int qn_id)
        {
            strSQL = "delete from mcq_user_questions where qn_id=" + qn_id + " and user_exam_id=" + exam_id + " and user_section_id=" + section_id + " and username='" + userName + "' and exam_date='" + DateTime.Now.ToString("dd-MMM-yyyy") + "';";
            strSQL += "insert into mcq_user_questions values(" + exam_id + "," + section_id + ",'" + userName + "','" + DateTime.Now.ToString("dd-MMM-yyyy") + "'," + qn_id + ")";
            dbAccessManager.GetCommand(strSQL);
        }

        public DataSet GetReadAnsQuestion(int exam_id, int section_id, string userName)
        {
            DataSet dsRdAnsQn = new DataSet();
            strSQL = "select qn_id from mcq_user_questions where user_exam_id=" + exam_id + " and user_section_id=" + section_id + " and username='" + userName + "' and exam_date='" + DateTime.Now.ToString("dd-MMM-yyyy") + "'";
            DataTable dtQns = dbAccessManager.GetDataTable(strSQL);
            strSQL = "select b.user_exam_id as uei from dbo.mcq_user_exam a, mcq_user_answer b where exam_id=" + exam_id + " and section_id=" + section_id + " and username='" + userName + "' and exam_date='" + DateTime.Now.ToString("dd-MMM-yyyy") + "' and a.user_exam_id=b.user_exam_id";
            DataTable dtAns = dbAccessManager.GetDataTable(strSQL);
            dsRdAnsQn.Tables.Add(dtQns);
            dsRdAnsQn.Tables.Add(dtAns);
            return dsRdAnsQn;
        }

        public DataTable GetAllQuestions(int exam_id, int section_id, string userName)
        {
            strSQL = "select row_number() over (order by user_exam_id) as 'rownum',user_exam_id, qn_id,question_text,question_type from mcq_question_master a, mcq_user_exam b ";
            strSQL += "where b.exam_id=" + exam_id + " and b.section_id=" + section_id + " and username='" + userName + "' and qn_id=question_id order by user_exam_id";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public DataTable GetSectionsForUser(string userName, int ExamId, int sectionId)
        {
            strSQL = "select distinct b.*  from dbo.mcq_user_exam a inner join mcq_section_master b on a.section_id=b.section_id  where  a.userName = " + userName + "and b.exam_id=" + ExamId + " and b.delete_flag=0 order by section_seq;";
            return dbAccessManager.GetDataTable(strSQL);
        }
        public DataTable GetPreviousQuestion(int curQuestioId, int exam_id, int section_id, string userName)
        {
            strSQL = "select * from mcq_user_exam a inner join mcq_question_master b on a.qn_id = b.question_id where a.exam_id=2 and a.section_id=5 and a.userName='" + userName + "' and a.user_exam_id not in (select user_exam_id from mcq_user_answer) and a.delete_flag=0 and b.delete_flag=0 order by a.user_exam_id";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public DataTable GetAnswerQuestion(int curQuestioId, int exam_id, int section_id, string userName)
        {
            strSQL = "select * from mcq_user_exam a inner join mcq_question_master b on a.qn_id = b.question_id where a.exam_id=2 and a.section_id=5 and a.username='" + userName + "' and a.user_exam_id not in (select user_exam_id from mcq_user_answer) and a.delete_flag=0 and b.delete_flag=0 order by a.user_exam_id";
            return dbAccessManager.GetDataTable(strSQL);
        }
        
        public DataTable GetNextQuestion(int curQuestioId, int exam_id, int section_id, string userName, String stype)
        {
            strSQL = "select top 1 * from mcq_user_exam a inner join mcq_question_master b on a.qn_id = b.question_id and b.exam_type='" + stype + "' where a.exam_id=" + exam_id + " and a.section_id=" + section_id + " and a.username=" + userName + " and a.user_exam_id not in (select user_exam_id from mcq_user_answer) and a.delete_flag=0 and b.delete_flag=0 order by a.user_exam_id";
            return dbAccessManager.GetDataTable(strSQL);
        }
                
        public void InsertAnswerQuestion(int user_exam_id, int choice_id)
        {            
            strSQL = "INSERT INTO mcq_user_answer(user_exam_id, choice_id) VALUES (" + user_exam_id + "," + choice_id + ");";
            strSQL += "UPDATE mcq_user_exam set exam_date ='" + DateTime.Today.ToString("dd-MMM-yyyy") + "' where user_exam_id=" + user_exam_id + ";";
            strSQL += "UPDATE mcq_user_answer set Correct=(Select top 1 isAnswer from mcq_question_options a "; 
            strSQL += "inner join mcq_user_exam b on a.question_id=b.qn_id ";
            strSQL += "inner join dbo.mcq_user_answer c on b.user_exam_id=c.user_exam_id  and c.choice_id=a.option_id where b.user_exam_id=" + user_exam_id + " and choice_id=" + choice_id + ") where user_exam_id=" + user_exam_id + " and choice_id=" + choice_id + ";";
            dbAccessManager.GetCommand(strSQL);

        }

        public String isCorrect(int user_exam_id)
        {
            //see if there is any wrong answer that will make the answer wrong.
            strSQL += "SELECT count(*) FROM mcq_user_answer where correct=0 and user_exam_id=" + user_exam_id + ";";
            if ((int)dbAccessManager.GetScalar(strSQL) == 0)
                return "Correct";
            else
                return "Wrong";
        }

        public void DeleteAnswerQuestion(int user_exam_id)
        {
            strSQL = "DELETE mcq_user_answer where user_exam_id = " + user_exam_id;
            dbAccessManager.GetCommand(strSQL);
        }

        public void updateAnswerHistory(int exam_id, string userName)
        {
            strSQL = "insert into mcq_user_answer_history select exam_id, section_id, username, exam_date, mcq_user_answer_id,qn_id, choice_id, correct,created_by,getdate()";
            strSQL += "from mcq_user_exam a, mcq_user_answer b where exam_id=" + exam_id + " and username='" + userName + "' and exam_date='" + DateTime.Now.ToString("dd-MMM-yyyy") + "' and a.user_exam_id=b.user_exam_id";
            dbAccessManager.GetCommand(strSQL);
        }

        public string[] GetResult(int exam_id, string userName)
        {
            strSQL = "select * from mcq_section_master where exam_id=" + exam_id;
            DataTable dtSection = dbAccessManager.GetDataTable(strSQL);

            strSQL = "select * from mcq_exam_master where exam_id=" + exam_id;
            DataTable dtExam = dbAccessManager.GetDataTable(strSQL);

            strSQL = "select a.user_exam_id,a.section_id,qn_id,correct,question_level from mcq_user_exam a, mcq_user_answer b, mcq_question_master c ";
            strSQL += "where a.exam_id=" + exam_id + " and username='" + userName + "' and exam_date='" + DateTime.Now.ToString("dd-MMM-yyyy");
            strSQL += "' and a.user_exam_id=b.user_exam_id and c.question_id=a.qn_id;";
            DataTable dtUserAns = dbAccessManager.GetDataTable(strSQL);
            ArrayList qNos = new ArrayList();
            int markCount = 0;
            
            foreach (DataRow drUserAns in dtUserAns.Rows)
            {
                DataRow[] drWrong = dtUserAns.Select("correct=0 and qn_id=" + drUserAns["qn_id"].ToString());
                int qExist = qNos.IndexOf(drUserAns["qn_id"].ToString());

                if (drWrong.Length == 0 && qExist == -1)
                {
                    qNos.Add(drUserAns["qn_id"].ToString());

                    string level = drUserAns["question_level"].ToString();
                    string weight = "";                   

                    switch(level)
                    {
                        case "Simple":
                            weight = "simple_qn_weight";
                            break;
                        case "Moderate":
                            weight = "moderate_qn_weight";
                            break;
                        case "Complex":
                            weight = "complex_qn_weight";
                            break;
                    }

                    DataRow[] drSection = dtSection.Select("section_id=" + drUserAns["section_id"].ToString());
                    if (drSection.Length > 0)
                    {
                        markCount += Convert.ToInt32(drSection[0][weight].ToString());
                    }

                }
            }

            int passMark = Convert.ToInt32(dtExam.Rows[0]["pass_mark"].ToString());
            string result = "FAIL";
            if (markCount > passMark)
            {
                result = "PASS";
            }

            string[] totalResult = new string[2];
            totalResult[0] = result;
            totalResult[1] = markCount.ToString();
            return totalResult;
        }
    }
}
