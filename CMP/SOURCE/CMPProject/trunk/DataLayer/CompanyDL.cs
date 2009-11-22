using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace WorkLayers.DataLayer
{
    public class CompanyDL
    {
        private DBAccessManager dbAccessManager;
        private String strSQL;

        public CompanyDL()
        {
            dbAccessManager = new DBAccessManager();
        }

        public DataTable GetAllCompanies()
        {
            strSQL = "SELECT * FROM Company_Master WHERE Delete_Flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will retrieve the company information via CompanyID
        public DataTable GetCompanyInfoByCompanyID(String CompanyID)
        {
            strSQL = "";
            strSQL += "SELECT * FROM Company_Master WHERE CompanyID=" + CompanyID;
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will insert new Company
        public void InsertCompanyInfo(String CompanyName, String CompanyAddress1, String CompanyAddress2, String CompanyAddress3,
            String PostalCode, String ContactPerson, String ContactEmail, String ContactNo, String SubscribeDate, String CommMode, 
            String Created_By, String Created_Date, String ValidPeriod_From, String ValidPeriod_To, String Modified_By, 
            String Modified_Date, String Company_Remark)
        {
            strSQL = "INSERT INTO Company_Master(CompanyName, CompanyAddress1, CompanyAddress2, CompanyAddress3, PostalCode, ContactPerson, ContactEmail, ";
            strSQL += "ContactNo, SubscribeDate, CommMode, Created_By, Created_Date, ValidPeriod_From, ValidPeriod_To, Modified_By, ";
            strSQL += "Modified_Date, Delete_Flag, Company_Remark) VALUES (";
            strSQL += "'" + CompanyName + "','" + CompanyAddress1 + "','" + CompanyAddress2 + "','" + CompanyAddress3 + "','";
            strSQL += PostalCode + "','" + ContactPerson + "','" + ContactEmail + "','" + ContactNo + "','" + SubscribeDate + "','Phone','";
            strSQL += Created_By + "','" + Created_Date + "','" + ValidPeriod_From + "','" + ValidPeriod_To + "','" + Modified_By + "','";
            strSQL += Modified_Date + "',0,'" + Company_Remark + "')";
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will update existing Company
        public void UpdateCompanyInfo(String CompanyID, String CompanyName, String CompanyAddress1, String CompanyAddress2, String CompanyAddress3,
            String PostalCode, String ContactPerson, String ContactEmail, String ContactNo, String ValidPeriod_From, String ValidPeriod_To, 
            String Modified_By, String Modified_Date, String Company_Remark)
        {
            strSQL = "UPDATE Company_Master SET CompanyName='" + CompanyName + "', CompanyAddress1='" +
                CompanyAddress1 + "', CompanyAddress2='" + CompanyAddress2 + "', CompanyAddress3='" +
                CompanyAddress3 + "', PostalCode='" + PostalCode + "', ContactPerson='" + ContactPerson + "', ContactEmail='" +
                ContactEmail + "', ContactNo='" + ContactNo + "', ValidPeriod_From='" + ValidPeriod_From + "', ValidPeriod_To='" +
                ValidPeriod_To + "', Modified_By='" + Modified_By + "', Modified_Date='" + Modified_Date + "', Company_Remark='" +
                Company_Remark + "' WHERE CompanyID=" + CompanyID;
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will mark the Delete_Flag=1
        public void DeleteCompanies(int[] CompanyIDs)
        {
            String strCompanyIDs = "";
            for (int i = 0; i < CompanyIDs.Length; i++)
                strCompanyIDs += CompanyIDs[i].ToString() + ",";
            strCompanyIDs += "-1"; //-1 is a dummy value, it's used to avoid the trouble to remove the last comma.
            strSQL = "UPDATE Company_Master SET Delete_Flag=1 WHERE CompanyID IN (" + strCompanyIDs + ");";
            dbAccessManager.GetCommand(strSQL);
        }
    }
}
