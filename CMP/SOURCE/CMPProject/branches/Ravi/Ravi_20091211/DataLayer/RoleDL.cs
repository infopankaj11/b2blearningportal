using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections;

namespace WorkLayers.DataLayer
{
    public class RoleDL
    {
        private DBAccessManager dbAccessManager;
        private String strSQL;

        public RoleDL()
        {
            dbAccessManager = new DBAccessManager();
        }

        //This function will get all the Roles.
        public DataTable GetAllRoles()
        {
            strSQL = "SELECT * FROM Role_List WHERE Delete_Flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will get all the FAPs, as well marks which FAPs does the Role has, according to the RoleID.
        public DataTable GetFAPsByRoleID(String RoleID)
        {
            if(String.IsNullOrEmpty(RoleID))
            {
                strSQL = "SELECT FAPListID, FAPName, FAP_Remark , 'No' as 'HasFAP' ";
                strSQL += "FROM FAP_List WHERE Delete_Flag=0 ORDER BY FAPName;";
            }
            else
            {
                strSQL = "";
                strSQL+=" SELECT f.FAPListID, f.FAPName, f.FAP_Remark, ";
                strSQL+=" CASE ISNULL(TempTB.RoleListID, 0) ";
                strSQL+=" WHEN 0 THEN 'No' ELSE 'Yes' END AS 'HasFAP'";
                strSQL+=" FROM FAP_List f";
                strSQL+=" LEFT OUTER JOIN (SELECT * FROM Role_FAP WHERE RoleListID=" + RoleID + ") as TempTB";
                strSQL+=" ON TempTB.FAPListID = f.FAPListID";
                strSQL+=" WHERE f.Delete_Flag=0";
                strSQL+=" ORDER BY HasFAP DESC, FAPName";
            }
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will get all the DAPs, as well marks which DAPs does the Role has, according to the RoleID.
        public DataTable GetDAPsByRoleID(String RoleID)
        {
            if (String.IsNullOrEmpty(RoleID))
            {
                strSQL = "SELECT DAPListID, DAPName, DAP_Remark , 'No' as 'HasDAP' ";
                strSQL += "FROM DAP_List WHERE Delete_Flag=0 ORDER BY DAPName;";
            }
            else
            {
                strSQL = "";
                strSQL += " SELECT d.DAPListID, d.DAPName, d.DAP_Remark, ";
                strSQL += " CASE ISNULL(TempTB.RoleListID, 0) ";
                strSQL += " WHEN 0 THEN 'No' ELSE 'Yes' END AS 'HasDAP'";
                strSQL += " from DAP_List d";
                strSQL += " LEFT OUTER JOIN (SELECT * FROM Role_DAP WHERE RoleListID=1) as TempTB";
                strSQL += " ON TempTB.DAPListID = d.DAPListID";
                strSQL += " WHERE d.Delete_Flag=0";
                strSQL += " ORDER BY HasDAP DESC, DAPName";
            }
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will retrieve the Role information via RoleID
        public DataTable GetRoleInfoByRoleID(String RoleID)
        {
            strSQL = "";
            strSQL += "SELECT * FROM Role_List WHERE RoleListID=" + RoleID;
            return dbAccessManager.GetDataTable(strSQL);
        }

        public void UpdateRoleInfo(int RoleID, String RoleName, String Role_Remark)
        {
            strSQL = "UPDATE Role_List SET RoleName='" + RoleName + "', Role_Remark='" + Role_Remark + "' WHERE RoleListID=" + RoleID.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will delete all the old FAPs a Role has, then add in new FAPs. 
        public void UpdateRoleFAPs(int RoleID, int[] FAPIDs)
        {
            ArrayList strSQLs = new ArrayList();
            strSQL = "DELETE Role_FAP WHERE RoleListID=" + RoleID.ToString();
            strSQLs.Add(strSQL);
            for (int i = 0; i < FAPIDs.Length; i++)
            {
                strSQL = "INSERT INTO Role_FAP(RoleListID, FAPListID) VALUES (" + RoleID.ToString() + "," + FAPIDs[i].ToString() + ");";
                strSQLs.Add(strSQL);
            }
            dbAccessManager.ExecuteCommands((String[])strSQLs.ToArray(typeof(string)));
        }

        //This function will delete all the old DAPs a Role has, then add in new DAPs. 
        public void UpdateRoleDAPs(int RoleID, int[] DAPIDs)
        {
            ArrayList strSQLs = new ArrayList();
            strSQL = "DELETE Role_DAP WHERE RoleListID=" + RoleID.ToString();
            strSQLs.Add(strSQL);
            for (int i = 0; i < DAPIDs.Length; i++)
            {
                strSQL = "INSERT INTO Role_DAP(RoleListID, DAPListID) VALUES (" + RoleID.ToString() + "," + DAPIDs[i].ToString() + ");";
                strSQLs.Add(strSQL);
            }
            dbAccessManager.ExecuteCommands((String[])strSQLs.ToArray(typeof(string)));
        }

        //This function will mark the Delete_Flag=1
        public void DeleteRoles(int[] RoleIDs)
        {
            String strRoleIDs = "";
            for (int i = 0; i < RoleIDs.Length; i++)
                strRoleIDs += RoleIDs[i].ToString() + ",";
            strRoleIDs += "-1"; //-1 is a dummy value, it's used to avoid the trouble to remove the last comma.
            strSQL = "UPDATE Role_List SET Delete_Flag=1 WHERE RoleListID IN (" + strRoleIDs + ");";
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will insert new Role and get ID of this Role.
        public int InsertRoleGetRoleID(String RoleName, String Created_By, String Role_Remark)
        {
            strSQL = "INSERT INTO Role_List(RoleName, Created_By, Created_Date, Modified_By, Modified_Date, Delete_Flag, Role_Remark) VALUES (";
            strSQL += "'" + RoleName + "','" + Created_By + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "','" + Created_By + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0,'" + Role_Remark + "');";
            strSQL += "SELECT RoleListID FROM Role_List WHERE RoleListID=@@IDENTITY; ";
            return (int)dbAccessManager.GetScalar(strSQL);
        }
    }
}
