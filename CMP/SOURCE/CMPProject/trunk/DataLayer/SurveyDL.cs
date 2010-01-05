using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace WorkLayers.DataLayer
{
    public class SurveyDL
    {
        private DBAccessManager dbAccessManager;
        private String strSQL;

        public SurveyDL()
        {
            dbAccessManager = new DBAccessManager();
        }

        public DataTable GetAllSurveys()
        {
            strSQL = "select * from dbo.survey_master where delete_flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public DataTable GetSurvey(int SurveyId)
        {
            strSQL = "select * from dbo.survey_master where Survey_id=" + SurveyId + ";";
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will get all the functions, as well marks which functions does the FAP has, according to the FAPID. 
        public DataTable getAllSurveys()
        {
            strSQL = "";
            strSQL += " SELECT * from survey_master where delete_flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public int InsertSurvey(String exName, String exAbbr, String createdBy, String modifiedBy)
        {
            strSQL = "INSERT INTO survey_MASTER(Survey_name,Survey_abbr, Created_By, Created_Date,  Delete_Flag) VALUES (";
            strSQL += "'" + exName + "','" + exAbbr + "','" + createdBy + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + ",0);";
            strSQL += "INSERT INTO module_master(module_name, module_type, Created_By, Created_Date,Modified_By, Modified_Date, Delete_Flag) VALUES ( ";
            strSQL += "'" + exName + "','Survey','" + createdBy + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "','" + modifiedBy + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0" + ");";
            strSQL += "SELECT Survey_id FROM survey_MASTER WHERE Survey_id=@@IDENTITY; ";
            return (int)dbAccessManager.GetScalar(strSQL);

        }

        public void UpdateSurvey(int SurveyID, String exName, String exAbbr, String modifiedBy)
        {
            strSQL = "UPDATE survey_master SET Survey_name='" + exName + "', Survey_abbr='" + exAbbr + "',Modified_By='" + modifiedBy + "', Modified_Date='" + DateTime.Today.ToString("dd-MMM-yyyy") + "' WHERE Survey_id=" + SurveyID.ToString();
            dbAccessManager.GetCommand(strSQL);
        }


        public void DeleteSurvey(int SurveyId)
        {
            strSQL = "UPDATE survey_master SET delete_flag=1 WHERE Survey_id=" + SurveyId.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will mark the Delete_Flag=1
        public void DeleteSurvey(int[] SurveyIds)
        {
            String sSurveyIDs = "";
            for (int i = 0; i < SurveyIds.Length; i++)
                sSurveyIDs += SurveyIds[i].ToString() + ",";
            sSurveyIDs += "-1"; //-1 is a dummy value, it's used to avoid the trouble to remove the last comma.
            strSQL = "UPDATE survey_MASTER SET Delete_Flag=1 WHERE Survey_id IN (" + sSurveyIDs + ");";
            dbAccessManager.GetCommand(strSQL);
        }

       //questions
        public DataTable GetSurveyQuestions(int SurveyId)
        {
            strSQL = "select * from dbo.survey_qn_master where  Survey_id = " + SurveyId.ToString() + " and delete_flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public DataTable GetQuestion(int question_id)
        {
            strSQL = "select * from dbo.survey_qn_master where squestion_id = " + question_id.ToString() + " and delete_flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public int InsertQuestion(int Survey_id, String question, String qn_type, String createdBy)
        {
            strSQL = "INSERT INTO survey_qn_master(Survey_id, question, qn_type, Created_By, Created_Date, Delete_Flag) VALUES (";
            strSQL += Survey_id + ",'" + question + "','" + qn_type + "','" + createdBy + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "', 0);";
            strSQL += "SELECT squestion_id FROM survey_qn_master WHERE squestion_id=@@IDENTITY; ";
            return (int)dbAccessManager.GetScalar(strSQL);
        }

        public void UpdateQuestion(int squestion_id, String question, String qn_type, String modifiedBy)
        {
            strSQL = "UPDATE survey_qn_master SET question='" + question + "', qn_type='" + qn_type + "',Modified_By='" + modifiedBy + "', Modified_Date='" + DateTime.Today.ToString("dd-MMM-yyyy") + "' WHERE squestion_id=" + squestion_id.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will mark the Delete_Flag=1
        public void DeleteQuestion(int[] QIDs)
        {
            String sQIDs = "";
            for (int i = 0; i < QIDs.Length; i++)
                sQIDs += QIDs[i].ToString() + ",";
            sQIDs += "-1"; //-1 is a dummy value, it's used to avoid the trouble to remove the last comma.
            strSQL = "UPDATE Survey_qn_master SET Delete_Flag=1 WHERE squestion_id IN (" + sQIDs + ");";
            dbAccessManager.GetCommand(strSQL);
        }

        //choices
        public DataTable GetQuestionOptions(int question_id)
        {
            strSQL = "select * from dbo.survey_qn_options where question_id = " + question_id.ToString() + ";";
            return dbAccessManager.GetDataTable(strSQL);
        }

        public void DeleteQuestionOptions(int question_id)
        {
            //strSQL = "UPDATE Survey_question_options SET Delete_Flag=1 WHERE option_id=" + option_id.ToString;
            strSQL = "DELETE survey_qn_options WHERE question_id=" + question_id.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        public void DeleteQuestionOption(int option_id)
        {
            //strSQL = "UPDATE Survey_question_options SET Delete_Flag=1 WHERE option_id=" + option_id.ToString;
            strSQL = "DELETE survey_qn_options WHERE opt_id=" + option_id.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        public void InsertQuestionOptions(int question_id, String OptText)
        {
            strSQL = "INSERT INTO survey_qn_options(question_id, choice) VALUES (" + question_id + ",'" + OptText + "');";
            dbAccessManager.GetCommand(strSQL);
        }

        public DataTable getUserSurveys() 
        {
            return null; 
        }


    }
}
