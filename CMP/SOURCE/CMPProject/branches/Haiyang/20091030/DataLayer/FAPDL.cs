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
        private String strSQL;

        public FAPDL()
        {
            dbAccessManager = new DBAccessManager();
        }

        //This function will get all the FAPs.
        public DataTable GetAllFAPs()
        {
            strSQL = "SELECT * FROM FAP_List WHERE Delete_Flag=0;";
            return dbAccessManager.GetDataTable(strSQL);
        }

        //This function will get all the functions, as well marks which functions does the FAP has, according to the FAPID. 
        public DataTable GetFunctionsByFAPID(String FAPID)
        {
            strSQL = "";
            strSQL += " SELECT f.FAPFunctionID,    ";
            strSQL += " case ISNULL(TempTB.FAPListID,0)  ";
            strSQL += " when 0 then 'No'    else 'Yes'  end as 'HasFunction' ";
            strSQL += " FROM fap_function f LEFT OUTER JOIN (SELECT * FROM fap_master WHERE FAPListID=1) ";
            strSQL += " as TempTB ON f.FAPFunctionID = TempTB.FAPFunctionID";
            return dbAccessManager.GetDataTable(strSQL);
        }
    }
}



