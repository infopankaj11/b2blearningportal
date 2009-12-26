using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections;

namespace WorkLayers.DataLayer
{
    public class UserDL
    {
        private DBAccessManager dbAccessManager;
        private String strSQL;

        public UserDL()
        {
            dbAccessManager = new DBAccessManager();
        }

        //This function will get all the Users.
        public DataTable GetAllUsers()
        {
            strSQL = "SELECT * FROM User_List WHERE Delete_Flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will get all the Users, as well marks which roles does the User has, according to the UserID. 
        public DataTable GetRolesByUserID(String UserID, String UserAdminID)
        {
            if (String.IsNullOrEmpty(UserID)) //means no User is selected, we will show all the Roles. Since the User Admin can only assign
                                              //the roles he owns to user, so must link to UserAdmin Table also.
            {
                UserAdminID = "1";
                strSQL = "";
                strSQL += "SELECT RoleListID, RoleName, Role_Remark, 'No' as 'HasRole' FROM Role_List WHERE Delete_Flag=0 AND RoleListID IN ";
                strSQL += "(SELECT RoleListID FROM UserAdmin_Master WHERE UserAdminListID=" + UserAdminID + ") ORDER BY RoleName;";
            }
            else
            {
                strSQL = "";
                strSQL += " SELECT r.RoleListID, r.RoleName, r.Role_Remark, ";
                strSQL += " CASE ISNULL(TempTB.UserListID,0) WHEN 0 THEN 'No' ELSE 'Yes' END AS 'HasRole'";
                strSQL += " FROM Role_List r";
                strSQL += " LEFT OUTER JOIN (SELECT * FROM User_Master WHERE UserListID=" + UserID + ") AS TempTB";
                strSQL += " ON r.RoleListID=TempTB.RoleListID WHERE r.Delete_Flag=0";
                strSQL += " ORDER BY HasRole DESC, r.RoleName";
            }
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will retrieve the User information via UserID
        public DataTable GetUserInfoByUserID(String UserID)
        {
            strSQL = "";
            strSQL += "SELECT * FROM User_List WHERE UserListID=" + UserID;
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will insert new User and get ID of this User.
        public int InsertUserGetUserID(String UserName, String Created_By, String User_Remark, String UserPass)
        {
            strSQL = "INSERT INTO User_List(UserName, Created_By, Created_Date, Modified_By, Modified_Date, Delete_Flag, User_Remark, UserPass) VALUES (";
            strSQL += "'" + UserName + "','" + Created_By + "','" + DateTime.Today.ToString("dd-MMM-yyyy") + "','" + Created_By + "','";
            strSQL += DateTime.Today.ToString("dd-MMM-yyyy") + "',0,'" + User_Remark + "','" + CryptoDL.Encrypt(UserPass) + "');";
            strSQL += "SELECT UserListID FROM User_List WHERE UserListID=@@IDENTITY; ";
            return (int)dbAccessManager.GetScalar(strSQL);
        }

        //This function will update the existing User.
        public void UpdateUserInfo(int UserID, String UserName, String User_Remark, String UserPass)
        {
            strSQL = "UPDATE User_List SET UserName='" + UserName + "', User_Remark='" + User_Remark + "', UserPass='" + CryptoDL.Encrypt(UserPass) + "' WHERE UserListID=" + UserID.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will update the existing User, except the password
        public void UpdateUserInfo(int UserID, String UserName, String User_Remark)
        {
            strSQL = "UPDATE User_List SET UserName='" + UserName + "', User_Remark='" + User_Remark + "' WHERE UserListID=" + UserID.ToString();
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will delete all the old roles a User has, then add in new roles. 
        public void UpdateUserRoles(int UserID, int[] RoleIDs)
        {
            ArrayList strSQLs = new ArrayList();
            strSQL = "DELETE User_Master WHERE UserListID=" + UserID.ToString();
            strSQLs.Add(strSQL);
            for (int i = 0; i < RoleIDs.Length; i++)
            {
                strSQL = "INSERT INTO User_Master(UserListID, RoleListID) VALUES (" + UserID.ToString() + "," + RoleIDs[i].ToString() + ");";
                strSQLs.Add(strSQL);
            }
            dbAccessManager.ExecuteCommands((String[])strSQLs.ToArray(typeof(string)));
        }

        //This function will mark the Delete_Flag=1
        public void DeleteUsers(int[] UserIDs)
        {
            String strUserIDs = "";
            for (int i = 0; i < UserIDs.Length; i++)
                strUserIDs += UserIDs[i].ToString() + ",";
            strUserIDs += "-1"; //-1 is a dummy value, it's used to avoid the trouble to remove the last comma.
            strSQL = "UPDATE User_List SET Delete_Flag=1 WHERE UserListID IN (" + strUserIDs + ");";
            dbAccessManager.GetCommand(strSQL);
        }

        //This function will check the user login, will return the no. of user matched, if 0 means no such user.
        public Boolean CheckLogin(String UserName, String UserPass, String UserLevel)
        {
            int result = 0;
            switch (UserLevel)
            {
                case "User":
                    strSQL = "SELECT COUNT(*) FROM User_List WHERE UserName='" + UserName + "' AND UserPass='" + CryptoDL.Encrypt(UserPass) + "'";
                    result = (int)dbAccessManager.GetScalar(strSQL);
                    break;
                case "UserAdmin":
                    strSQL = "SELECT COUNT(*) FROM UserAdmin_List WHERE UserAdminName='" + UserName + "' AND UserAdminPass='" + CryptoDL.Encrypt(UserPass) + "'";
                    result = (int)dbAccessManager.GetScalar(strSQL);
                    break;
                case "PortalAdmin":
                    strSQL = "SELECT COUNT(*) FROM PortalAdmin_List WHERE PortalAdminName='" + UserName + "' AND PortalAdminPass='" + CryptoDL.Encrypt(UserPass) + "'";
                    result = (int)dbAccessManager.GetScalar(strSQL);
                    break;
            }
            return  result == 1? true:false;
        }
    }
}
