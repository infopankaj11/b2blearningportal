/*
 * Author: Haiyang
 * Version: 1.0
 * Remarks: This class handles all the transactions regarding FAP.
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace WorkLayers.DataLayer
{
    public class FAPDL 
    {
        private DBAccessManager dbAccessManager;

        public FAPDL()
        {
            dbAccessManager = new DBAccessManager();
        }

        //This 
        public DataTable GetAllFAPs()
        {
            return dbAccessManager.GetDataTable("SELECT * FROM FAP_List WHERE Delete_Flag=0;");
        }
    }
}



