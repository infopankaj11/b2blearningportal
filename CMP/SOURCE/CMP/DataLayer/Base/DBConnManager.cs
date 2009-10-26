/*
 * Author: Thiyagarajan Ravikumar
 * Version: 1.0
 * Remarks: The Connection manager class. This class will create the connection based on the authentication
 * Close the opened connection
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace WorkLayers.DataLayer
{
    public class DBConnManager
    {

        public System.Data.SqlClient.SqlConnection GetDbConnection()
        {
            System.Data.SqlClient.SqlConnection DBConn = null;

            try
            {
                string dbString = ConfigurationManager.ConnectionStrings["CMPConnString"].ToString();
                DBConn  = new System.Data.SqlClient.SqlConnection(dbString);
                DBConn.Open();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
            return DBConn;
        }

        public void CloseDBConnection(System.Data.SqlClient.SqlConnection DBConn)
        {
            try
            {
                if (DBConn != null)
                    DBConn.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
