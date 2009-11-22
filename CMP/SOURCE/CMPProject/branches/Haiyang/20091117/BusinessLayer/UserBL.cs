﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections;
using WorkLayers.DataLayer;

namespace WorkLayers.BusinessLayer
{
    public class UserBL
    {
        private UserDL userDL;

        public UserBL()
        {
            userDL = new UserDL();
        }

        public DataTable GetAllUsers()
        {
            return userDL.GetAllUsers();
        }

        public DataTable GetRolesByUserID(String UserID, String UserAdminID)
        {
            return userDL.GetRolesByUserID(UserID, UserAdminID);
        }

        public DataTable GetUserInfoByUserID(String UserID)
        {
            return userDL.GetUserInfoByUserID(UserID);
        }

        public void InsertUserInfo(String UserName, String Created_By, String User_Remark, int[] RoleIDs, String UserPass)
        {
            int UserID = userDL.InsertUserGetUserID(UserName, Created_By, User_Remark, UserPass);
            userDL.UpdateUserRoles(UserID, RoleIDs);
        }

        public void UpdateUserInfoNRoles(int UserID, String UserName, String User_Remark, int[] RoleIDs, String UserPass)
        {
            userDL.UpdateUserInfo(UserID, UserName, User_Remark, UserPass);
            userDL.UpdateUserRoles(UserID, RoleIDs);
        }

        public void UpdateUserInfoNRoles(int UserID, String UserName, String User_Remark, int[] RoleIDs)
        {
            userDL.UpdateUserInfo(UserID, UserName, User_Remark);
            userDL.UpdateUserRoles(UserID, RoleIDs);
        }

        public void DeleteUsers(int[] UserIDs)
        {
            userDL.DeleteUsers(UserIDs);
        }
    }
}