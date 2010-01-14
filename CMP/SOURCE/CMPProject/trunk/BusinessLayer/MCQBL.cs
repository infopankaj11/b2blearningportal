using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;
using WorkLayers.DataLayer;


namespace WorkLayers.BusinessLayer
{
    public class MCQBL
    {
        private MCQDL mcqDL;

        public MCQBL()
        {
            mcqDL = new MCQDL();
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

        public DataTable GetAllExams()
        {
            return mcqDL.GetAllExams();
        }

        public DataTable GetExam(int ExamId)
        {
            return mcqDL.GetExam(ExamId);
        }

        public DataTable getAllExamsOnModule(int ModuleId) 
        {
            return mcqDL.getAllExams(ModuleId);
        }

        public void InsertExam(String exName, String exAbbr, int total_qns, int total_mark,int pass_mark, int exam_duration, String createdBy, String modifiedBy)
        {
            int ExamID = mcqDL.InsertExam(exName, exAbbr, total_qns, total_mark, pass_mark, exam_duration, createdBy, modifiedBy);            
        }

        public void UpdateExam(int examID, String exName, String exAbbr, int total_qns, int total_mark, int pass_mark, int exam_duration, String modifiedBy)
        {
            mcqDL.UpdateExam(examID, exName, exAbbr, total_qns, total_mark, pass_mark, exam_duration, modifiedBy);   
        }

        public void DeleteExam(int ExamId)
        {
            mcqDL.DeleteExam(ExamId);   
        }

        public void DeleteExam(int[] ExamIds)
        {
            mcqDL.DeleteExam(ExamIds);
        }

        public DataTable GetAllExamSections(int ExamId) 
        {
            return mcqDL.GetAllExamSections(ExamId);   
        }

        public DataTable GetAllSections() 
        {
            return mcqDL.GetAllSections();
        }

        public DataTable GetSection(int SectionID)
        {
            return mcqDL.GetSection(SectionID);  
        }

        public void InsertSection(int exam_id, String section_name, String section_abbr, int section_seq, int section_weight, int total_simple_qns, int simple_qn_weight, int total_moderate_qn, int moderate_qn_weight, int total_complex_qns, int complex_qn_weight, String createdBy, String modifiedBy)
        {
            mcqDL.InsertSection (exam_id, section_name, section_abbr, section_seq, section_weight, total_simple_qns, simple_qn_weight, total_moderate_qn,moderate_qn_weight,  total_complex_qns,  complex_qn_weight,  createdBy,  modifiedBy);
        }
        
        public void UpdateSection(int section_id , String section_name, String section_abbr, int section_seq, int section_weight, int total_simple_qns, int simple_qn_weight, int total_moderate_qn, int moderate_qn_weight, int total_complex_qns, int complex_qn_weight,  String modifiedBy)
        {
            mcqDL.UpdateSection(section_id, section_name, section_abbr, section_seq, section_weight, total_simple_qns, simple_qn_weight, total_moderate_qn, moderate_qn_weight, total_complex_qns, complex_qn_weight,  modifiedBy);
        }
        
        public void DeleteSection(int[] SectionIDs)
        {
            mcqDL.DeleteSection (SectionIDs); 
        }

        //questions
        public DataTable GetSectionQuestions(int SectionId)
        {
            return mcqDL.GetSectionQuestions(SectionId);             
        }
             

        public DataTable GetQuestion(int question_id)
        {
            return mcqDL.GetQuestion(question_id);
        }

       

        public int InsertQuestion(int exam_id, int section_id, String question_text, String exam_type, String question_level, String question_type, String createdBy, String modifiedBy)
        {
           return mcqDL.InsertQuestion(exam_id, section_id, question_text, exam_type, question_level, question_type, createdBy, modifiedBy); 
        }

        public void UpdateQuestion(int exam_id, int section_id, int question_id, String question_text, String exam_type, String question_level, String question_type, String modifiedBy)
        {
            mcqDL.UpdateQuestion( exam_id,  section_id,  question_id,  question_text,  exam_type,  question_level, question_type,modifiedBy); 
        }

        //This function will mark the Delete_Flag=1
        public void DeleteQuestion(int[] QIDs)
        {
            mcqDL.DeleteQuestion(QIDs);  
        }

        public DataTable GetQuestionOptions(int question_id)
        {
            return mcqDL.GetQuestionOptions(question_id);
        }

        public void DeleteQuestionOptions(int question_id)
        {
            mcqDL.DeleteQuestionOptions(question_id);   
        }

        public void DeleteQuestionOption(int option_id)
        {
            mcqDL.DeleteQuestionOption(option_id);
        }

        public void InsertQuestionOptions(int question_id, String OptText, int isAnswer)
        {
            mcqDL.InsertQuestionOptions(question_id, OptText, isAnswer);   
        }

        public DataTable GetAllUserExams(string userName)
        {
            return mcqDL.GetAllUserExams(userName);  
        }

        public DataSet GetExamDetails(int examID)
        {
            DataSet dsExamDetail = new DataSet();
            DataTable dtExam = null; //mcqDL.GetExamDetail(examID);
            DataTable dtSection = mcqDL.GetAllExamSections(examID);
            dsExamDetail.Tables.Add(dtExam);
            dsExamDetail.Tables.Add(dtSection);
            return dsExamDetail;
        }

        public DataTable GenerateExam(string userName, int examId)
        {
            DataTable dtSections = null;
            if (mcqDL.getUserExam(userName, examId) == 0)
            {
                dtSections = mcqDL.GetAllExamSections(examId);

                foreach (DataRow dr in dtSections.Rows )
                {
                    mcqDL.GenerateQuestionLevel("Exam", "Simple", int.Parse(dr["total_simple_qns"].ToString()), examId, int.Parse(dr["section_id"].ToString()), userName);
                    mcqDL.GenerateQuestionLevel("Exam", "Moderate", int.Parse(dr["total_moderate_qns"].ToString()), examId, int.Parse(dr["section_id"].ToString()), userName);
                    mcqDL.GenerateQuestionLevel("Exam", "Complex", int.Parse(dr["total_complex_qns"].ToString()), examId, int.Parse(dr["section_id"].ToString()), userName);
                }
             }

            return dtSections;
        }

        public DataTable GetSectionsForUser(string userName, int examId, int sectionId)
        {
            return mcqDL.GetSectionsForUser(userName, examId, sectionId);
        }

        public DataTable GetPreviousQuestion(int curQuestioId, int exam_id, int section_id, string userName)
        {
            return mcqDL.GetPreviousQuestion(curQuestioId, exam_id, section_id, userName);
        }

        public DataTable GetAnswerQuestion(int curQuestioId, int exam_id, int section_id, string userName)
        {
            return mcqDL.GetAnswerQuestion(curQuestioId, exam_id, section_id, userName);
        }

        public DataTable GetNextQuestion(int curQuestioId, int exam_id, int section_id, string userName, string stype)
        {
            return mcqDL.GetNextQuestion(curQuestioId, exam_id, section_id, userName, stype);
        }

        public void InsertAnswerQuestion(int user_exam_id, int choice_id)
        {            
             mcqDL.InsertAnswerQuestion(user_exam_id, choice_id);
        }

        public void DeleteAnswerQuestion(int user_exam_id)
        {
            mcqDL.DeleteAnswerQuestion(user_exam_id);
        }

        public String isCorrect(int user_exam_id)
        {
            return mcqDL.isCorrect( user_exam_id);
        }

    }
}
