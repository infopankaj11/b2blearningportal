using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WorkLayers.DataLayer;
using System.Data;

namespace WorkLayers.BusinessLayer
{
    public class DAPBL
    {
        private DAPDL dapDL;

        public DAPBL()
        {
            dapDL = new DAPDL();
        }

        public DataTable GetAllDAPs()
        {
            return dapDL.GetAllDAPs();
        }

        public DataTable GetModulesByDAPID(String DAPID)
        {
            return dapDL.GetModulesByDAPID(DAPID);
        }

        public DataTable GetDAPInfoByDAPID(String DAPID)
        {
            return dapDL.GetDAPInfoByDAPID(DAPID);
        }

        public void InsertDAPInfo(String DAPName, String Created_By, String DAP_Remark, int[] ModuleIDs)
        {
            int DAPID = dapDL.InsertDAPGetDAPID(DAPName, Created_By, DAP_Remark);
            dapDL.UpdateDAPModules(DAPID, ModuleIDs);
        }

        public void UpdateDAPInfoNModules(int DAPID, String DAPName, String DAP_Remark, int[] ModuleIDs)
        {
            dapDL.UpdateDAPInfo(DAPID, DAPName, DAP_Remark);
            dapDL.UpdateDAPModules(DAPID, ModuleIDs);
        }

        public void DeleteDAPs(int[] DAPIDs)
        {
            dapDL.DeleteDAPs(DAPIDs);
        }
    }
}
