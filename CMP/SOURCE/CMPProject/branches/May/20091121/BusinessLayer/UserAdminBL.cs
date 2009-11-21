using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WorkLayers.DataLayer;
using System.Collections;
using System.Data;

namespace WorkLayers.BusinessLayer
{
    public class UserAdminBL
    {
        private UserAdminDL userAdminDL;

        public UserAdminBL()
        {
            userAdminDL = new UserAdminDL();
        }

        public DataTable GetAllUserAdmins()
        {
            return userAdminDL.GetAllUserAdmins();
        }

        public DataTable GetRolesByUserAdminID(String UserAdminID)
        {
            return userAdminDL.GetRolesByUserAdminID(UserAdminID);
        }

        public DataTable GetUserAdminInfoByUserAdminID(String UserAdminID)
        {
            return userAdminDL.GetUserAdminInfoByUserAdminID(UserAdminID);
        }

        public void InsertUserAdminInfo(String UserAdminName, String Created_By, String UserAdmin_Remark, int[] RoleIDs, String UserAdminPass)
        {
            int UserAdminID = userAdminDL.InsertUserAdminGetUserAdminID(UserAdminName, Created_By, UserAdmin_Remark, UserAdminPass);
            userAdminDL.UpdateUserAdminRoles(UserAdminID, RoleIDs);
        }

        public void UpdateUserAdminInfoNRoles(int UserAdminID, String UserAdminName, String UserAdmin_Remark, int[] RoleIDs, String UserAdminPass)
        {
            userAdminDL.UpdateUserAdminInfo(UserAdminID, UserAdminName, UserAdmin_Remark, UserAdminPass);
            userAdminDL.UpdateUserAdminRoles(UserAdminID, RoleIDs);
        }

        public void UpdateUserAdminInfoNRoles(int UserAdminID, String UserAdminName, String UserAdmin_Remark, int[] RoleIDs)
        {
            userAdminDL.UpdateUserAdminInfo(UserAdminID, UserAdminName, UserAdmin_Remark);
            userAdminDL.UpdateUserAdminRoles(UserAdminID, RoleIDs);
        }

        public void DeleteUserAdmins(int[] UserAdminIDs)
        {
            userAdminDL.DeleteUserAdmins(UserAdminIDs);
        }
    }
}
