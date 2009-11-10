/*
 * Author: Haiyang
 * Version: 1.0
 * Remarks: This class handles all the transactions regarding FAP.
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections;

namespace WorkLayers.DataLayer
{
    public class FAPDL
    {
        private DBAccessManager dbAccessManager;
        private String strSQL;

        public FAPDL()
        {
            dbAccessManager = new DBAccessManager();
        }

        //This function will get all the FAPs.
        public DataTable GetAllFAPs()
        {
            strSQL = "SELECT * FROM FAP_List WHERE Delete_Flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will get all the functions, as well marks which functions does the FAP has, according to the FAPID. 
        public DataTable GetFunctionsByFAPID(String FAPID)
        {
            if (String.IsNullOrEmpty(FAPID)) //means no FAP is selected, so we will show all the functions
            {
                strSQL = "";
                strSQL += "SELECT FAPFunctionID, FAP_Function, Function_Remarks, 'No' as 'HasFunction' FROM FAP_Function; ";
            }
            else
            {
                strSQL = "";
                strSQL += " SELECT f.FAPFunctionID, f.FAP_Function, f.Function_Remarks, ";
                strSQL += " case ISNULL(TempTB.FAPListID,0)  ";
                strSQL += " when 0 then 'No'    else 'Yes'  end as 'HasFunction' ";
                strSQL += " FROM fap_function f LEFT OUTER JOIN (SELECT * FROM fap_master WHERE FAPListID=" + FAPID + ") ";
                strSQL += " as TempTB ON f.FAPFunctionID = TempTB.FAPFunctionID";
            }
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will retrieve the FAP information via FAPID
        public DataTable GetFAPInfoByFAPID(String FAPID)
        {
            strSQL = "";
            strSQL += "SELECT * FROM FAP_List WHERE FAPListID=" + FAPID;
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will insert new FAP and get ID of this FAP.
        public int InsertFAPGetFAPID(String FAPName, String Created_By, String FAP_Remark)
        {
            strSQL = "INSERT INTO FAP_List(FAPName, Created_By, Created_Date, Modified_By, Modified_Date, Delete_Flag, FAP_Remark) VALUES (";
            strSQL += "'" + FAPName + "','" + Created_By + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "','" + Created_By + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0,'" + FAP_Remark + "');";
            strSQL += "SELECT FAPListID FROM FAP_List WHERE FAPListID=@@IDENTITY; ";
            return (int)dbAccessManager.GetScalar(strSQL);
        }


        public void UpdateFAPInfo(int FAPID, String FAPName, String FAP_Remark)
        {
            strSQL = "UPDATE FAP_List SET FAPName='" + FAPName + "', FAP_Remark='" + FAP_Remark + "' WHERE FAPListID=" + FAPID.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will delete all the old functions a FAP has, then add in new functions. 
        public void UpdateFAPFunctions(int FAPID, int[] FunctionIDs)
        {
            ArrayList strSQLs = new ArrayList();
            strSQL = "DELETE FAP_Master WHERE FAPListID=" + FAPID.ToString();
            strSQLs.Add(strSQL);
            for (int i = 0; i < FunctionIDs.Length; i++)
            {
                strSQL = "INSERT INTO FAP_Master(FAPListID, FAPFunctionID) VALUES (" + FAPID.ToString() + "," + FunctionIDs[i].ToString() + ");";
                strSQLs.Add(strSQL);
            }
            dbAccessManager.ExecuteCommands((String[])strSQLs.ToArray(typeof(string)));
        }

        //This function will mark the Delete_Flag=1
        public void DeleteFAPs(int[] FAPID)
        {
            String FAPIDs = "";
            for (int i=0; i<FAPID.Length; i++)
                FAPIDs += FAPID[i].ToString() + ",";
            FAPIDs += "-1"; //-1 is a dummy value, it's used to avoid the trouble to remove the last comma.
            strSQL = "UPDATE FAP_List SET Delete_Flag=1 WHERE FAPListID IN (" + FAPIDs + ");";
            dbAccessManager.GetCommand(strSQL);
        }
    }
}



