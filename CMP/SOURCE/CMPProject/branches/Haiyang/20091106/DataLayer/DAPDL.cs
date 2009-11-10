/*
 * Author: Haiyang
 * Version: 1.0
 * Remarks: This class handles all the transactions regarding DAP.
 */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Data;

namespace WorkLayers.DataLayer
{
    public class DAPDL
    {
        private DBAccessManager dbAccessManager;
        private String strSQL;

        public DAPDL()
        {
            dbAccessManager = new DBAccessManager();
        }

        //This function will get all the DAPs.
        public DataTable GetAllDAPs()
        {
            strSQL = "SELECT * FROM DAP_List WHERE Delete_Flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will get all the modules, as well marks which modules does the DAP has, according to the DAPID. 
        public DataTable GetModulesByDAPID(String DAPID)
        {
            if (String.IsNullOrEmpty(DAPID)) //means no DAP is selected, we will show all the functions
            {
                strSQL = "";
                strSQL += "SELECT m.module_id, m.module_name, m.module_type, m.module_remarks, 'No' as 'HasModule' FROM Module_Master m ORDER BY module_name; ";
            }
            else
            {
                strSQL = "";
                strSQL += " SELECT m.module_id, m.module_name, m.module_type, m.module_remarks, ";
                strSQL += " CASE ISNULL(TempTB.DAPModuleID,0) ";
                strSQL += " WHEN 0 THEN 'No' ELSE 'Yes' END AS 'HasModule'";
                strSQL += " FROM Module_Master m";
                strSQL += " LEFT OUTER JOIN (SELECT * FROM DAP_Master WHERE DAPListID = " + DAPID + ") AS TempTB";
                strSQL += " ON m.module_id = TempTB.DAPModuleID";
                strSQL += " ORDER BY HasModule DESC, module_name";
            }
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will retrieve the DAP information via DAPID
        public DataTable GetDAPInfoByDAPID(String DAPID)
        {
            strSQL = "";
            strSQL += "SELECT * FROM DAP_List WHERE DAPListID=" + DAPID;
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will insert new DAP and get ID of this DAP.
        public int InsertDAPGetDAPID(String DAPName, String Created_By, String DAP_Remark)
        {
            strSQL = "INSERT INTO DAP_List(DAPName, Created_By, Created_Date, Modified_By, Modified_Date, Delete_Flag, DAP_Remark) VALUES (";
            strSQL += "'" + DAPName + "','" + Created_By + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "','" + Created_By + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0,'" + DAP_Remark + "');";
            strSQL += "SELECT DAPListID FROM DAP_List WHERE DAPListID=@@IDENTITY; ";
            return (int)dbAccessManager.GetScalar(strSQL);
        }

        //This function will update the existing DAP.
        public void UpdateDAPInfo(int DAPID, String DAPName, String DAP_Remark)
        {
            strSQL = "UPDATE DAP_List SET DAPName='" + DAPName + "', DAP_Remark='" + DAP_Remark + "' WHERE DAPListID=" + DAPID.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will delete all the old modules a DAP has, then add in new modules. 
        public void UpdateDAPModules(int DAPID, int[] ModuleIDs)
        {
            ArrayList strSQLs = new ArrayList();
            strSQL = "DELETE DAP_Master WHERE DAPListID=" + DAPID.ToString();
            strSQLs.Add(strSQL);
            for (int i = 0; i < ModuleIDs.Length; i++)
            {
                strSQL = "INSERT INTO DAP_Master(DAPListID, DAPModuleID) VALUES (" + DAPID.ToString() + "," + ModuleIDs[i].ToString() + ");";
                strSQLs.Add(strSQL);
            }
            dbAccessManager.ExecuteCommands((String[])strSQLs.ToArray(typeof(string)));
        }

        //This function will mark the Delete_Flag=1
        public void DeleteDAPs(int[] DAPIDs)
        {
            String strDAPIDs = "";
            for (int i=0; i<DAPIDs.Length; i++)
                strDAPIDs += DAPIDs[i].ToString() + ",";
            strDAPIDs += "-1"; //-1 is a dummy value, it's used to avoid the trouble to remove the last comma.
            strSQL = "UPDATE DAP_List SET Delete_Flag=1 WHERE DAPListID IN (" + strDAPIDs + ");";
            dbAccessManager.GetCommand(strSQL);
        }
    }
}
