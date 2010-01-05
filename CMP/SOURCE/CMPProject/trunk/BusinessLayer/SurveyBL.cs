using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;
using WorkLayers.DataLayer;

namespace WorkLayers.BusinessLayer
{
    public class SurveyBL
    {

       private SurveyDL surveyDL;

       public SurveyBL()
        {
            surveyDL = new SurveyDL();
        }
        
        public bool checkEmptyInteger(string sString)
        {
            bool bCheck = false;
            int i=0;

            if (!String.IsNullOrEmpty(sString)) 
            {
                 Regex objNotWholePattern = new Regex("[^0-9]");
                 bCheck = !objNotWholePattern.IsMatch(sString);
            }

            return bCheck;

        }


        public DataTable GetSurvey(int SurveyId)
        {
            return surveyDL.GetSurvey (SurveyId);
        }

        public DataTable GetAllSurveys() 
        {
            return surveyDL.getAllSurveys();
        }

        public void InsertSurvey(String exName, String exAbbr, String createdBy, string modifiedBy)
        {
            int SurveyID = surveyDL.InsertSurvey(exName, exAbbr, createdBy, modifiedBy);            
        }

        public void UpdateSurvey(int SurveyID, String exName, String exAbbr, String modifiedBy)
        {
            surveyDL.UpdateSurvey(SurveyID, exName, exAbbr, modifiedBy);   
        }

        public void DeleteSurvey(int SurveyId)
        {
            surveyDL.DeleteSurvey(SurveyId);   
        }

        public void DeleteSurvey(int[] SurveyIds)
        {
            surveyDL.DeleteSurvey(SurveyIds);
        }

        public DataTable GetSurveyQuestions(int survey_id)
        {
            return surveyDL.GetSurveyQuestions(survey_id);  
        }
       
        public DataTable GetQuestion(int question_id)
        {
            return surveyDL.GetQuestion(question_id);
        }



        public int InsertQuestion(int Survey_id, String question_text, String question_type, String createdBy, String modifiedBy)
        {
           return surveyDL.InsertQuestion(Survey_id, question_text, question_type, createdBy); 
        }

        public void UpdateQuestion(int question_id, String question_text, String question_type, String modifiedBy)
        {
            surveyDL.UpdateQuestion ( question_id, question_text,  question_type,modifiedBy); 
        }

        //This function will mark the Delete_Flag=1
        public void DeleteQuestion(int[] QIDs)
        {
            surveyDL.DeleteQuestion(QIDs);  
        }

        public DataTable GetQuestionOptions(int question_id)
        {
            return surveyDL.GetQuestionOptions(question_id);
        }

        public void DeleteQuestionOptions(int question_id)
        {
            surveyDL.DeleteQuestionOptions(question_id);   
        }

        public void DeleteQuestionOption(int option_id)
        {
            surveyDL.DeleteQuestionOption(option_id);
        }

        public void InsertQuestionOptions(int question_id, String OptText)
        {
            surveyDL.InsertQuestionOptions(question_id, OptText);   
        }
    }
}
