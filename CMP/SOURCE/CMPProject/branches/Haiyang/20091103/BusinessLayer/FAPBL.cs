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

    }
}
