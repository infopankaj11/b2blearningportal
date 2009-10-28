/*
 * Author: Thiyagarajan Ravikumar
 * Version: 1.0
 * Remarks: The Access Manager Class. This class will get dataset, datatable, datareader, getcommand for 
 * all the front-end forms
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace WorkLayers.DataLayer
{
    public class DBAccessManager
    {
        DBConnManager db = new DBConnManager();

        //getCommand method is used to insert records to a table
        //Returns no of columns affected
        //0 is No update/insert/delete, 1 is one record updated/inserted/deleted
        //Parameters Query & Database Connection
        public int GetCommand(String sQuery)
        {
            int iRes = 0;
            SqlConnection dbCon = null;
            try
            {
                dbCon = db.GetDBConnection();
                SqlCommand sCmd = new SqlCommand(sQuery);
                sCmd.CommandText = sQuery;
                sCmd.Connection = dbCon;
                iRes = sCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                iRes = -1;
                throw ex;
            }
            finally
            {
                db.CloseDBConnection(dbCon);
            }
            return iRes;
        }

        //getCommand method is used to retrieve records from table and have it in Datareader
        //Parameters Query & Database Connection
        public object GetDataReader(String sQuery)
        {
            SqlDataReader dr = null;
            SqlConnection dbCon = null;
            object[] obj = new object[2];
            try
            {
                dbCon = db.GetDBConnection();

                SqlCommand sCmd = new SqlCommand(sQuery);

                sCmd.CommandText = sQuery;
                sCmd.Connection = dbCon;
                dr = sCmd.ExecuteReader();

                obj[0] = dbCon;
                obj[1] = dr;


            }
            catch (Exception ex)
            {
                throw ex;
            }

            return obj;
        }

        //getDataSet method is used to retrieve content from table and have it in DataSet
        //Parameters Query & Database Connection
        public DataSet GetDataSet(String sQuery)
        {
            DataSet ds = null;
            SqlConnection dbCon = null;
            try
            {
                dbCon = db.GetDBConnection();
                ds = new DataSet();
                System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(sQuery, dbCon);
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                db.CloseDBConnection(dbCon);
            }
            return ds;
        }

        //getDataTable method is used to retrieve content from table and have it in DataTable
        //Parameters Query & Database Connection
        public DataTable GetDataTable(String sQuery)
        {
            DataTable dt = null;
            SqlConnection dbCon = null;
            try
            {
                dbCon = db.GetDBConnection();
                dt = new DataTable();
                System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(sQuery, dbCon);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                db.CloseDBConnection(dbCon);
            }
            return dt;
        }

    }
}
