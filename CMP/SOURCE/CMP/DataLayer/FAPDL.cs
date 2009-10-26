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

        public DataTable testit()
        {
            return dbAccessManager.GetDataTable("SELECT * FROM FAP_List;");
        }
    }
}
