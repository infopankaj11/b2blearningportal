using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WorkLayers.DataLayer;
using System.Data;

namespace WorkLayers.BusinessLayer
{
    public class CompanyBL
    {
        private CompanyDL companyDL;

        public CompanyBL()
        {
            companyDL = new CompanyDL();
        }

        public DataTable GetAllCompanies()
        {
            return companyDL.GetAllCompanies();
        }

        public DataTable GetCompanyInfoByCompanyID(String CompanyID)
        {
            return companyDL.GetCompanyInfoByCompanyID(CompanyID);
        }

        public void InsertCompanyInfo(String CompanyName, String CompanyAddress1, String CompanyAddress2, String CompanyAddress3,
            String PostalCode, String ContactPerson, String ContactEmail, String ContactNo, String SubscribeDate, String CommMode, 
            String Created_By, String Created_Date, String ValidPeriod_From, String ValidPeriod_To, String Modified_By, 
            String Modified_Date, String Company_Remark)
        {
            companyDL.InsertCompanyInfo(CompanyName, CompanyAddress1, CompanyAddress2, CompanyAddress3,
            PostalCode, ContactPerson, ContactEmail, ContactNo, SubscribeDate, CommMode,
            Created_By, Created_Date, ValidPeriod_From, ValidPeriod_To, Modified_By,
            Modified_Date, Company_Remark);
        }

        public void UpdateCompanyInfo(String CompanyID, String CompanyName, String CompanyAddress1, String CompanyAddress2, String CompanyAddress3,
            String PostalCode, String ContactPerson, String ContactEmail, String ContactNo, String ValidPeriod_From, String ValidPeriod_To,
            String Modified_By, String Modified_Date, String Company_Remark)
        {
            companyDL.UpdateCompanyInfo(CompanyID, CompanyName, CompanyAddress1, CompanyAddress2, CompanyAddress3,
            PostalCode, ContactPerson, ContactEmail, ContactNo, ValidPeriod_From, ValidPeriod_To,
            Modified_By, Modified_Date, Company_Remark);
        }

        public void DeleteCompanies(int[] CompanyIDs)
        {
            companyDL.DeleteCompanies(CompanyIDs);
        }
    }
}
