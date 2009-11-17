using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Data;

namespace WorkLayers.DataLayer
{
    public class UserAdminDL
    {
        private DBAccessManager dbAccessManager;
        private String strSQL;

        public UserAdminDL()
        {
            dbAccessManager = new DBAccessManager();
        }

        //This function will get all the User Admin.
        public DataTable GetAllUserAdmins()
        {
            strSQL = "SELECT * FROM UserAdmin_List WHERE Delete_Flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will get all the User Admins, as well marks which roles does the User Admin has, according to the UserAdminID. 
        public DataTable GetRolesByUserAdminID(String UserAdminID)
        {
            if (String.IsNullOrEmpty(UserAdminID)) //means no User Admin is selected, we will show all the Roles.
            {
                strSQL = "";
                strSQL += "SELECT RoleListID, RoleName, Role_Remark, 'No' as 'HasRole' FROM Role_List WHERE Delete_Flag=0 ORDER BY RoleName;";
            }
            else
            {
                strSQL = "";
                strSQL += " SELECT r.RoleListID, r.RoleName, r.Role_Remark, ";
                strSQL += " CASE ISNULL(TempTB.UserAdminListID,0) WHEN 0 THEN 'No' ELSE 'Yes' END AS 'HasRole'";
                strSQL += " FROM Role_List r";
                strSQL += " LEFT OUTER JOIN (SELECT * FROM UserAdmin_Master WHERE UserAdminListID=" + UserAdminID + ") AS TempTB";
                strSQL += " ON r.RoleListID=TempTB.RoleListID WHERE r.Delete_Flag=0";
                strSQL += " ORDER BY HasRole DESC, r.RoleName";
            }
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will retrieve the User Admin information via UserAdminID
        public DataTable GetUserAdminInfoByUserAdminID(String UserAdminID)
        {
            strSQL = "";
            strSQL += "SELECT * FROM UserAdmin_List WHERE UserAdminListID=" + UserAdminID;
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will insert new User Admin and get ID of this User Admin.
        public int InsertUserAdminGetUserAdminID(String UserAdminName, String Created_By, String UserAdmin_Remark, String UserAdminPass)
        {
            strSQL = "INSERT INTO UserAdmin_List(UserAdminName, Created_By, Created_Date, Modified_By, Modified_Date, Delete_Flag, UserAdmin_Remark, UserAdminPass) VALUES (";
            strSQL += "'" + UserAdminName + "','" + Created_By + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "','" + Created_By + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0,'" + UserAdmin_Remark + "','" + CryptoDL.Encrypt(UserAdminPass) + "');";
            strSQL += "SELECT UserAdminListID FROM UserAdmin_List WHERE UserAdminListID=@@IDENTITY; ";
            return (int)dbAccessManager.GetScalar(strSQL);
        }

        //This function will update the existing User Admin.
        public void UpdateUserAdminInfo(int UserAdminID, String UserAdminName, String UserAdmin_Remark, String UserAdminPass)
        {
            strSQL = "UPDATE UserAdmin_List SET UserAdminName='" + UserAdminName + "', UserAdmin_Remark='" + UserAdmin_Remark + "', UserAdminPass='" + CryptoDL.Encrypt(UserAdminPass) + "' WHERE UserAdminListID=" + UserAdminID.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will update the existing User Admin, except the password
        public void UpdateUserAdminInfo(int UserAdminID, String UserAdminName, String UserAdmin_Remark)
        {
            strSQL = "UPDATE UserAdmin_List SET UserAdminName='" + UserAdminName + "', UserAdmin_Remark='" + UserAdmin_Remark + "' WHERE UserAdminListID=" + UserAdminID.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will delete all the old roles a User Admin has, then add in new roles. 
        public void UpdateUserAdminRoles(int UserAdminID, int[] RoleIDs)
        {
            ArrayList strSQLs = new ArrayList();
            strSQL = "DELETE UserAdmin_Master WHERE UserAdminListID=" + UserAdminID.ToString();
            strSQLs.Add(strSQL);
            for (int i = 0; i < RoleIDs.Length; i++)
            {
                strSQL = "INSERT INTO UserAdmin_Master(UserAdminListID, RoleListID) VALUES (" + UserAdminID.ToString() + "," + RoleIDs [i].ToString() + ");";
                strSQLs.Add(strSQL);
            }
            dbAccessManager.ExecuteCommands((String[])strSQLs.ToArray(typeof(string)));
        }

        //This function will mark the Delete_Flag=1
        public void DeleteUserAdmins(int[] UserAdminIDs)
        {
            String strUserAdminIDs = "";
            for (int i = 0; i < UserAdminIDs.Length; i++)
                strUserAdminIDs += UserAdminIDs[i].ToString() + ",";
            strUserAdminIDs += "-1"; //-1 is a dummy value, it's used to avoid the trouble to remove the last comma.
            strSQL = "UPDATE UserAdmin_List SET Delete_Flag=1 WHERE UserAdminListID IN (" + strUserAdminIDs + ");";
            dbAccessManager.GetCommand(strSQL);
        }

    }
}
