using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using WorkLayers.DataLayer;

namespace WorkLayers.BusinessLayer
{
    public class RoleBL
    {
        private RoleDL roleDL;

        public RoleBL()
        {
            roleDL = new RoleDL();
        }

        public DataTable GetAllRoles()
        {
            return roleDL.GetAllRoles();
        }

        public DataTable GetDAPsByRoleID(String RoleID)
        {
            return roleDL.GetDAPsByRoleID(RoleID);
        }

        public DataTable GetFAPsByRoleID(String RoleID)
        {
            return roleDL.GetFAPsByRoleID(RoleID);
        }

        public DataTable GetRoleInfoByRoleID(String RoleID)
        {
            return roleDL.GetRoleInfoByRoleID(RoleID);
        }

        public void UpdateRoleInfoNFAPsNDAPs(int RoleID, String RoleName, String Role_Remark, int[] FAPIDs, int[] DAPIDs)
        {
            roleDL.UpdateRoleInfo(RoleID, RoleName, Role_Remark);
            roleDL.UpdateRoleFAPs(RoleID,FAPIDs);
            roleDL.UpdateRoleDAPs(RoleID, DAPIDs);
        }

        public void DeleteRoles(int[] RoleIDs)
        {
            roleDL.DeleteRoles(RoleIDs);
        }

        public void InsertRoleInfo(String RoleName, String Created_By, String Role_Remark, int[] FAPIDs, int[] DAPIDs)
        {
            int RoleID = roleDL.InsertRoleGetRoleID (RoleName, Created_By, Role_Remark);
            roleDL.UpdateRoleDAPs(RoleID, DAPIDs);
            roleDL.UpdateRoleFAPs(RoleID, FAPIDs);
        }
    }
}
