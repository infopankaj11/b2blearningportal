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


        //Created by Haiyang on 03-Nov-09
        //This will run all the commands in one transaction, which means, if one of the commands fails, 
        //the whole transaction will be rollback. 
        public void ExecuteCommands(String[] strSQLs)
        {
            SqlTransaction sqlTran;
            SqlConnection dbCon = null;
            dbCon = db.GetDBConnection();
            sqlTran = dbCon.BeginTransaction();

            try
            {
                SqlCommand sCmd = new SqlCommand();
                sCmd.Connection = dbCon;
                for (int i = 0; i < strSQLs.Length; i++)
                {
                    sCmd.CommandText = strSQLs[i];
                    sCmd.Transaction = sqlTran;
                    sCmd.ExecuteNonQuery();
                }
                sqlTran.Commit();
            }
            catch (Exception ex)
            {
                sqlTran.Rollback();
                throw ex;
            }
            finally
            {
                db.CloseDBConnection(dbCon);
            }
        }


        //Created by Haiyang on 03-Nov-09
        //This will run SQL query and return the scalar. 
        public Object GetScalar(String strSQL)
        {
            Object rtnObj = new Object();
            SqlConnection dbCon = null;
            dbCon = db.GetDBConnection();

            try
            {
                SqlCommand sCmd = new SqlCommand();
                sCmd.Connection = dbCon;
                sCmd.CommandText = strSQL;
                rtnObj = sCmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                db.CloseDBConnection(dbCon);
            }
            return rtnObj;
        }

    }
}
