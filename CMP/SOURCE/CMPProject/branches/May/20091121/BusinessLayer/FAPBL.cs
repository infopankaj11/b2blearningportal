using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WorkLayers.DataLayer;
using System.Data;

namespace WorkLayers.BusinessLayer
{
    public class FAPBL
    {
        private FAPDL fapDL;

        public FAPBL()
        {
            fapDL = new FAPDL();
        }

        public DataTable GetAllFAPs()
        {
            return fapDL.GetAllFAPs();
        }

        public DataTable GetFunctionsByFAPID(String FAPID)
        {
            return fapDL.GetFunctionsByFAPID(FAPID);
        }

        public DataTable GetFAPInfoByFAPID(String FAPID)
        {
            return fapDL.GetFAPInfoByFAPID(FAPID);
        }

        public void InsertFAPInfo(String FAPName, String Created_By, String FAP_Remark, int[] FunctionIDs)
        {
            int FAPID = fapDL.InsertFAPGetFAPID(FAPName, Created_By, FAP_Remark);
            fapDL.UpdateFAPFunctions(FAPID, FunctionIDs);
        }

        public void UpdateFAPInfoNFunctions(int FAPID, String FAPName, String FAP_Remark, int[] FunctionIDs)
        {
            fapDL.UpdateFAPInfo(FAPID, FAPName, FAP_Remark);
            fapDL.UpdateFAPFunctions(FAPID, FunctionIDs);
        }

        public void DeleteFAPs(int[] FAPIDs)
        {
            fapDL.DeleteFAPs(FAPIDs);
        }

    }
}
